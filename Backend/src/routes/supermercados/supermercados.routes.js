import { Router } from "express";
import { getSupermercadosWithSucursales } from "../../controllers/supermercados/supermercados.controller.js";

const router = Router();

router.get("/getSupermercadosWithSucursales", getSupermercadosWithSucursales);

export default router;
