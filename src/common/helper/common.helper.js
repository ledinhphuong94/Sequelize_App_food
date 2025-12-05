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

    handleFailRes(data, message="fail", statusCode=400) {
        return {
            status: "fail",
            statusCode,
            message,
            data,
            doc: "example.com"
        };
    },

    handleResponse(resData, res) {
        let response;
        const {data, message} = resData;
        if (data === -1) {
            response = this.handleFailRes( data, message);
        } else {
            response = this.handleSucessRes(data, message);
        }
        res.status(response.statusCode).json(response);
    },

    handlePagination(page, pageSize) {
        const minPage = 1;
        const minPageSize = 5;
        let formatPage = Math.max(+page || minPage, minPage);
        let formatPageSize = Math.max(+pageSize || minPageSize, minPageSize);
        let from = (page -1) * pageSize;
        return {from, page: formatPage, pageSize: formatPageSize};
    }
}

export default helper;