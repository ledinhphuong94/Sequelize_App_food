import express from "express";
import ratesController from "../controllers/rates.controller.js";

const ratesRoute = express.Router();
ratesRoute.post("/", ratesController.addRate)
ratesRoute.get("/restaurant/:id", ratesController.findManyRatesByRes)
ratesRoute.get("/user/:id", ratesController.findManyRatesByUser)

export default ratesRoute;