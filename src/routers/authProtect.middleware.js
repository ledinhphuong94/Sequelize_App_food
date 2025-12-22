import {Unauthorized} from "../common/helper/exception.helper.js";
import {ACCESS_TOKEN_KEY} from "../common/constant/app.constant.js";
import jwt from "jsonwebtoken";
export function authProtect (req, res, next) {
    const {authorization} = req.headers;
    if (!authorization) throw new Unauthorized("Authorization not found");
    const [bearer, token] = authorization.split(" ");

    if (bearer !== "Bearer") throw new Unauthorized("Bearer not found");
    if (!token) throw new Unauthorized("Token not found");
    const tkPayload = jwt.verify(token, ACCESS_TOKEN_KEY)
    const {user_id, type, exp, iat} = tkPayload;
    
    if (!user_id) throw new Unauthorized("User ID not found");

    req.user_id = user_id;
    next();
}