import express from "express";
import userController from "../controllers/users.controller.js";
const usersRouter = express.Router();

usersRouter.get("/", 
    (req, res, next) => {
        console.log("middle 1")
        next()
    }, 
    (req, res, next) => {
        console.log("middle 2")
        throw new Error("This is big error")
        next()
    }, 
    userController.findAll
)
usersRouter.post("/", userController.addUser);
usersRouter.delete("/:id", userController.softDelete);
usersRouter.get("/:id", userController.findOne);
export default usersRouter;