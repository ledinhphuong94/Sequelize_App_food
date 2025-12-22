import userService from "../services/users.service.js";
import helper from "../common/helper/common.helper.js";

const userController = {
    
    async findAll(red, res, next) {
        console.log('findAll');
        const data = await userService.findAll(red);
        const response = helper.handleSucessRes(data)
        res.status(response.statusCode).json(response)
    },

    async findOne(req, res, next) {
        console.log('findOne');
        const data = await userService.findOne(req);
        const response = helper.handleSucessRes(data, "Find user success");
        res.status(response.statusCode).json(response);
    },

    async softDelete(req, res, next) {
        const data = await userService.softDelete(req);
        const response = helper.handleSucessRes(data, "Delete success");
        res.status(response.statusCode).json(response);
    },

    async addUser(req, res, next) {
        const data = await userService.addUser(req);
        const response = helper.handleSucessRes(data, "Add user success");
        res.status(response.statusCode).json(response);
    },

    async upAvatarLocal(req, res, next) {
        const data = await userService.upAvatarLocal(req);
        const response = helper.handleSucessRes(data, "Upload avatar Local success");
        res.status(response.statusCode).json(response);
    }

}
export default userController;