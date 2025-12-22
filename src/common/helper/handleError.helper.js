import helper from "./common.helper.js";
import jwt from "jsonwebtoken";
import StatusCode from "../constant/app.statusCode.js";
import multer from "multer";

const handleErrorMiddleWare = {
    finalMiddleWare(err, req, res, next) {
        console.log('final middleware', err)
        
        if (err instanceof jwt.TokenExpiredError) {
            err.code = StatusCode.UNAUTHORIZED
            console.log('❌ expired')
        } else if (err instanceof jwt.JsonWebTokenError) {
            err.code = StatusCode.BAD_REQUEST
            console.log('🥊 bad request')
        };

        if (err instanceof multer.MulterError) {
            err.code = StatusCode.BAD_REQUEST
        };
        const response = helper.handleFailRes(err.message, err.code)
        res.status(response.statusCode).json(response)
    }
};

export default handleErrorMiddleWare;