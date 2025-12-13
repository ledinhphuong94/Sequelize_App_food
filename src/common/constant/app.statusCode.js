export default {
    /**
     * The request is OK (this is the standard response for successful HTTP requests)
     */
    OK: 200,

    /**
     * The request has been fulfilled, and a new resource is created 
     */
    CREATED: 201,

    /**
     * The request cannot be fulfilled due to bad syntax
     */
    BAD_REQUEST: 400,

    /**
     * The request was a legal request, but the server is refusing to respond to it. For use when authentication is possible but has failed or not yet been provided
     */
    UNAUTHORIZED: 401,

    /**
     * The request was a legal request, but the server is refusing to respond to it
     */
    FORBIDDENT: 403,

    /**
     * The requested page could not be found but may be available again in the future
     */
    NOT_FOUND: 404,

    /**
     * A generic error message, given when no more specific message is suitable
     */
    INTERNAL_SERVER_ERROR: 500
}