import express from "express";
import likesController from "../controllers/likes.controller.js";
import { authProtect } from "./authProtect.middleware.js";

const likesRouter = express.Router();
likesRouter.post("/", authProtect, likesController.toggleLike);
likesRouter.get("/restaurant/:id", likesController.findLikesByRes);
likesRouter.get("/user/:id", likesController.findLikesByUser);

export default likesRouter;