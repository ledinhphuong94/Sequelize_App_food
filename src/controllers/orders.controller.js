
import ordersService from "../services/orders.service.js";
import helper from "../common/helper/common.helper.js";

const orderController = {
    async getOrders(req, res, next) {
        const data = await ordersService.getOrders(req);
        helper.handleResponse(data, res);
    },

    async createOrder(req, res, next) {
        const data = await ordersService.createOrder(req);
        helper.handleResponse(data, res);
    }
}

export default orderController;