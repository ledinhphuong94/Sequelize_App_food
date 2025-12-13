import helper from "./common.helper.js"

const handleErrorMiddleWare = {
    finalMiddleWare(err, req, res, next) {
        console.log('final middleware', err.message)
        const response = helper.handleFailRes(err.message, err.code)
        res.status(response.statusCode).json(response)
    }
};

export default handleErrorMiddleWare;