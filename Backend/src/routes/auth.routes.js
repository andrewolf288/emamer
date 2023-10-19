import { Router } from "express";
import { logInUser } from "../controllers/auth.controller.js";

const router = Router();

// router para login de usuario
router.post("/login", logInUser);

export default router;
