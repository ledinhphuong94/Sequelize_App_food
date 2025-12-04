import express from "express";
import usersRouter from "./user.router.js";
import ordersRouter from "./order.route.js";
import likesRouter from "./likes.route.js";
import ratesRoute from "./rates.route.js";

const rootRouter = express.Router();

rootRouter.use(express.json());
rootRouter.use("/users", usersRouter);
rootRouter.use("/orders", ordersRouter);
rootRouter.use("/likes", likesRouter);
rootRouter.use("/rates", ratesRoute);
export default rootRouter;