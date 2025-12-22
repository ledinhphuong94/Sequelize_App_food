import express from "express";
import userController from "../controllers/users.controller.js";
import upload from "../common/helper/multer.helper.js";
const usersRouter = express.Router();

usersRouter.get("/", userController.findAll)
usersRouter.post("/", userController.addUser);
usersRouter.post("/upload-avatar-local", upload.single('avatar'), userController.upAvatarLocal)

usersRouter.delete("/:id", userController.softDelete);
usersRouter.get("/:id", userController.findOne);
export default usersRouter;