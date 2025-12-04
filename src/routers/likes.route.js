import express from "express";
import likesController from "../controllers/likes.controller.js";

const likesRouter = express.Router();
likesRouter.post("/", likesController.addLike);
likesRouter.delete("/:id", likesController.unLike);
likesRouter.get("/restaurant/:id", likesController.findLikesByRes);
likesRouter.get("/user/:id", likesController.findLikesByUser);

export default likesRouter;