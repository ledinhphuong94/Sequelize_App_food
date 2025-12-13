import express from "express";
import authController from "../controllers/auth.controller.js";
import {authProtect} from "./authProtect.middleware.js";

const authRouter = express.Router();
authRouter.post("/register", authController.register)
authRouter.post("/signin", authController.signIn)
authRouter.get("/get-user-info", authProtect, authController.getUserInfo)

export default authRouter;