import express from "express";
import orderController from "../controllers/orders.controller.js";
import {authProtect} from "./authProtect.middleware.js";
const ordersRouter = express.Router();

ordersRouter.get("/", orderController.getOrders);
ordersRouter.post("/", authProtect,orderController.createOrder);

export default ordersRouter;