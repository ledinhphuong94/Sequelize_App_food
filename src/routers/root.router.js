import express from "express";
import usersRouter from "./user.router.js";
import ordersRouter from "./order.route.js";
import likesRouter from "./likes.route.js";
import ratesRoute from "./rates.route.js";
import authRouter from "./auth.router.js";

const rootRouter = express.Router();
rootRouter.use("/users", usersRouter);
rootRouter.use("/orders", ordersRouter);
rootRouter.use("/likes", likesRouter);
rootRouter.use("/rates", ratesRoute);
rootRouter.use("/auth", authRouter);
export default rootRouter;