import express from "express";
import orderController from "../controllers/orders.controller.js";
const ordersRouter = express.Router();

ordersRouter.get("/", orderController.getOrders);
ordersRouter.post("/", orderController.createOrder);

export default ordersRouter;