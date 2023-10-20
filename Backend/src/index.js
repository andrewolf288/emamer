import express from "express";
import cors from "cors";
import AuthRoutes from "./routes/auth.routes.js";
import SupermercadoRoutes from "./routes/supermercados/supermercados.routes.js";

const app = express();

const corsOptions = {
  origin: "*",
};

app.use(cors(corsOptions));

app.use(express.json());
// ruta de autenticacion
app.use("/api/auth", AuthRoutes);
// ruta de supermercados
app.use("/api/supermercado", SupermercadoRoutes);

app.listen(3000);
console.log("Server running on port 3000");
