import ratesService from "../services/rates.service.js";
import helper from "../common/helper/common.helper.js";
const ratesController = {
    async addRate(req, res, next) {
        const data = await ratesService.addrate(req);
        const reponse = helper.handleSucessRes(data);
        res.status(reponse.statusCode).json(reponse);
    },

    async findManyRatesByRes (req, res, next) {
        const data = await ratesService.ratesByRes(req);
        const reponse = helper.handleSucessRes(data);
        res.status(reponse.statusCode).json(reponse);
    },

    async findManyRatesByUser (req, res, next) {
        const data = await ratesService.ratesByUser(req);
        const reponse = helper.handleSucessRes(data);
        res.status(reponse.statusCode).json(reponse);
    }
}

export default ratesController;