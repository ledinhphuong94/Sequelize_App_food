import {prisma} from "../common/prisma/prisma.connect.js";
const ratesService = {
    async addrate(req) {
        let {user_id, res_id, amount} = req.body;
        try {
            for (let key in req.body) {
                if (!Number.isInteger(+req.body[key])) {
                    throw new Error("Wrong format!");
                };
            };
            if (!Number.isInteger(+user_id) || !Number.isInteger(+res_id) || isNaN(amount)) {
                throw new Error("Wrong format!");
            };
            if (+amount > 5 || amount < 1) {
                throw new Error("Amount must within 1 to 5!");
            };

            const data = await prisma.rate_res.create({
                data: {
                    user_id: +user_id,
                    res_id: +res_id,
                    amount: Math.round(+amount),
                }
            })
            return {data: data}

        } catch(err) {
            return {data: -1, message: err.message}
        }
    },

    async ratesByRes(req) {
        const {id} = req.params;
        try {
            const data = await prisma.rate_res.findMany({
                where: {
                    res_id: +id,
                    isDeleted: false,
                }
            });
            return {data: data}
        } catch (err) {
            return {data: -1, message: err.message}
        }
    },

    async ratesByUser(req) {
        const {id} = req.params;
        try {
            const data = await prisma.rate_res.findMany({
                where: {
                    user_id: +id,
                    isDeleted: false,
                }
            });
            return {data: data}
        } catch (err) {
            return {data: -1, message: err.message}
        }
    },
}

export default ratesService;