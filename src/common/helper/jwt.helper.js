import jwt from "jsonwebtoken";
import {ACCESS_TOKEN_KEY, REFRESH_TOKEN_KEY} from "../constant/app.constant.js";
// import {BadRequest} from "../helper/exception.helper.js";
export default {
    sign(payload) {
        const accessToken = jwt.sign({...payload}, ACCESS_TOKEN_KEY, { expiresIn: '5s' })
        const refreshToken = jwt.sign({...payload}, REFRESH_TOKEN_KEY, { expiresIn: '1d' })

        return {accessToken, refreshToken};
    },
}