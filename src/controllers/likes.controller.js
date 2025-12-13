import likesService from "../services/likes.service.js";
import helper from "../common/helper/common.helper.js";
const likesController = {
    async toggleLike(req, res, next) {
        const data = await likesService.toggleLike(req);
        const response = helper.handleSucessRes(data);
        res.status(response.statusCode).json(response);
    },

    async findLikesByRes(req, res, next) {
        const data = await likesService.findLikesByRes(req);
        const response = helper.handleSucessRes(data);
        res.status(response.statusCode).json(response);
    },

    async findLikesByUser(req, res, next) {
        const data = await likesService.findLikesByUser(req);
        const response = helper.handleSucessRes(data);
        res.status(response.statusCode).json(response);
    }
}

export default likesController;