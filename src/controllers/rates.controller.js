import ratesService from "../services/rates.service.js";
import helper from "../common/helper/common.helper.js";
const ratesController = {
    async addRate(req, res, next) {
        const data = await ratesService.addrate(req);
        helper.handleResponse(data, res);
    },

    async findManyRatesByRes (req, res, next) {
        const data = await ratesService.ratesByRes(req);
        helper.handleResponse(data, res);
    },

    async findManyRatesByUser (req, res, next) {
        const data = await ratesService.ratesByUser(req);
        helper.handleResponse(data, res);
    }
}

export default ratesController;