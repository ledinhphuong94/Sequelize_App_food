import jwt from "jsonwebtoken";
import {JWT_SIGN} from "../constant/app.constant.js";
import {BadRequest} from "../helper/exception.helper.js";
export default {
    encode(payload) {
        const token = jwt.sign({...payload,  exp: Math.floor(Date.now() / 1000) + (24 * 60 * 60)}, JWT_SIGN)
        return token;
    },

    decodeee(webToken) {
        try {
            return jwt.verify(webToken, JWT_SIGN)
        } catch (err) {
            throw new BadRequest(err.message)
        }
    }
}