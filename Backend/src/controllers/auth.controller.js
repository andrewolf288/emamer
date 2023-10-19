import jwt from "jsonwebtoken";
import { pool } from "../db.js";

// funcion para logear usuario
export const logInUser = async (req, res) => {
  try {
    const { username, password } = req.body;
    // query para encontrar el usuario segun las credenciales
    const result = await pool.query(
      "SELECT u.id, u.useUsu, u.idRol, r.nomRol, u.nomUsu, u.apeUsu FROM usuario AS u JOIN rol AS r ON r.id = u.idRol WHERE u.useUsu = ? AND u.passUsu = ? AND u.estReg = ?",
      [username, password, "A"]
    );

    const [rows] = result;
    // comprobamos si se encontro un unico valor
    if (rows.length === 1) {
      const { id } = rows[0];
      try {
        // query para traer los permisos correspondientes del usuario
        const [rowsPermisos] = await pool.query(
          "SELECT p.id, p.idMod, m.nomMod, m.urlImgMod, m.icoNomMod, m.typIcoMod, m.refTabMod, p.canView, p.canEdit, p.canDel, p.canCre FROM permisos AS p JOIN modulo AS m ON m.id = p.idMod WHERE p.idRol = ? AND p.estReg = ?",
          [id, "A"]
        );
        rows[0]["permisos"] = rowsPermisos;
        console.log(rows[0]);

        // generamos el token de autenticacion
        jwt.sign({ user: rows[0] }, "secretkey", (err, token) => {
          if (err) {
            throw new Error(err.message);
          }
          res.json({
            token,
            user: rows[0],
          });
        });
      } catch (error) {
        throw new Error(error.message);
      }
    } else {
      res.json({
        status: "ERROR",
        error: "Credenciales incorrectas",
      });
    }
  } catch (error) {
    return res.status(500).json({
      status: "ERROR",
      error: error.message,
    });
  }
};

export function verifyToken(req, res, next) {
  const bearerHeader = req.headers["authorization"];
  if (typeof bearerHeader !== "undefined") {
    const bearerToken = bearerHeader.split(" ")[1];
    req.token = bearerToken;
    next();
  } else {
    res.sendStatus(403);
  }
}
