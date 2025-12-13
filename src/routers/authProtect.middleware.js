import {Unauthorized} from "../common/helper/exception.helper.js";
import JWT from "../common/helper/jwt.helper.js";
export function authProtect (req, res, next) {
    const {authorization} = req.headers;
    if (!authorization) throw new Unauthorized("Authorization not found");
    const [bearer, token] = authorization.split(" ");

    if (bearer !== "Bearer") throw new Unauthorized("Bearer not found");
    if (!token) throw new Unauthorized("Token not found");
    const tkPayload = JWT.decodeee(token);
    const {user_id, type, exp, iat} = tkPayload;
    
    if (!user_id) throw new Unauthorized("User ID not found");
    if (type !== 'access_token') throw new Unauthorized("Wrong Token type");
    if (exp < Date.now() / 1000) throw new Unauthorized("Token expired!");

    req.user_id = user_id;
    next();
}