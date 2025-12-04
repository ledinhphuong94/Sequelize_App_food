import express from "express";
import userController from "../controllers/users.controller.js";
const usersRouter = express.Router();

usersRouter.get("/", userController.findAll)
usersRouter.get("/:id", userController.findOne);
usersRouter.delete("/:id", userController.softDelete);
usersRouter.post("/", userController.addUser);
export default usersRouter;