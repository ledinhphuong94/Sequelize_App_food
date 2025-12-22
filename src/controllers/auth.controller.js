import authService from "../services/auth.service.js";
import helper from "../common/helper/common.helper.js";
import passport from "passport";

const authController = {
    async register (req, res, next) {
        const data = await authService.register(req);
        const response = helper.handleSucessRes(data)
        res.status(response.statusCode).json(response)
    },

    async signIn (req, res, next) {
        const data = await authService.signIn(req);
        const response = helper.handleSucessRes(data)
        res.status(response.statusCode).json(response)
    },
    
    async getUserInfo (req, res, next) {
        const data = await authService.getUserInfo(req);
        const response = helper.handleSucessRes(data)
        res.status(response.statusCode).json(response)
    },

    async refreshToken (req, res, next) {
        const data = await authService.refreshToken(req);
        const response = helper.handleSucessRes(data)
        res.status(response.statusCode).json(response)
    },

    async signinGoogleCallback (req, res, next) {
        const url = await authService.signinGoogleCallback(req);
        res.redirect(url)
    }
}
export default authController;