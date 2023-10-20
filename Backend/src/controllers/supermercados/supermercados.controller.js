import { pool } from "../../db.js";

export const getSupermercadosWithSucursales = async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM supermercados");
    const [supermercados] = result;

    for (const supermercado of supermercados) {
      const resultSucursal = await pool.query(
        "SELECT * FROM supermercado_sucursales WHERE idSupMer = ?",
        [supermercado.id]
      );
      const [sucursales] = resultSucursal;
      supermercado.sucursales = sucursales;
    }
    res.json(supermercados);
  } catch (error) {
    res.status(500).json({ error: "Ocurrió un error al obtener los datos." });
  }
};
