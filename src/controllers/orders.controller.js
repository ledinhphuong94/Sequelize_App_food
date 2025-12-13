
import ordersService from "../services/orders.service.js";
import helper from "../common/helper/common.helper.js";

const orderController = {
    async getOrders(req, res, next) {
        const data = await ordersService.getOrders(req);
        const response = helper.handleSucessRes(data);
        res.status(response.statusCode).json(response);
    },

    async createOrder(req, res, next) {
        const data = await ordersService.createOrder(req);
        const response = helper.handleSucessRes(data);
        res.status(response.statusCode).json(response);
    }
}

export default orderController;