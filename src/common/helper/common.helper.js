import { BadRequest } from "./exception.helper.js";

const helper = {
    handleSucessRes(data, message="ok", statusCode=201) {
        return {
            status: "success",
            statusCode,
            message,
            data,
            doc: "example.com"
        };
    },

    handleFailRes(message="fail", statusCode=500) {
        return {
            status: "fail",
            statusCode,
            message,
            doc: "example.com"
        };
    },

    handlePagination(page, pageSize) {
        if (isNaN(page) || isNaN(pageSize)) throw new BadRequest("page or pageSize must be an integer number!")
        const minPage = 1;
        const minPageSize = 5;
        let formatPage = Math.max(+page || minPage, minPage);
        let formatPageSize = Math.max(+pageSize || minPageSize, minPageSize);
        let from = (page -1) * pageSize;
        return {from, page: formatPage, pageSize: formatPageSize};
    },

    validateEmail(emailString) {
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailPattern.test(emailString);
    }
}

export default helper;