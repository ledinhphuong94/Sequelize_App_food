import STATUS_CODE from "../constant/app.statusCode.js";
/**
 * The request is OK (this is the standard response for successful HTTP requests)
 */
export class Success extends Error {
    constructor (message) {
        super(message)
        this.code = STATUS_CODE.OK;
    }
}

 /**
 * The request cannot be fulfilled due to bad syntax
 */
export class BadRequest extends Error {
    constructor (message) {
        super(message)
        this.code = STATUS_CODE.BAD_REQUEST;
    }
}

/**
 * The request was a legal request, but the server is refusing to respond to it. For use when authentication is possible but has failed or not yet been provided
 */
export class Unauthorized extends Error {
    constructor (message) {
        super(message)
        this.code = STATUS_CODE.UNAUTHORIZED;
    }
}

/**
 * The requested page could not be found but may be available again in the future
 */
export class NotFound extends Error {
    constructor (message) {
        super(message)
        this.code = STATUS_CODE.NOT_FOUND;
    }
}

export class InternalServerError extends Error {
    constructor (message) {
        super(message)
        this.code = STATUS_CODE.INTERNAL_SERVER_ERROR;
    }
}