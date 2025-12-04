import likesService from "../services/likes.service.js";
import helper from "../common/helper/common.helper.js";
const likesController = {
    async addLike(req, res, next) {
        const data = await likesService.addLike(req);
        helper.handleResponse(data, res);
    },

    async unLike(req, res, next) {
        const data = await likesService.unLike(req);
        helper.handleResponse(data, res);
    },

    async findLikesByRes(req, res, next) {
        const data = await likesService.findLikesByRes(req);
        helper.handleResponse(data, res);
    },

    async findLikesByUser(req, res, next) {
        const data = await likesService.findLikesByUser(req);
        helper.handleResponse(data, res);
    }
}

export default likesController;