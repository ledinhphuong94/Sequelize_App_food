import {prisma} from "../common/prisma/prisma.connect.js";
import {BadRequest} from "../common/helper/exception.helper.js";
const ratesService = {
    async addrate(req) {
        let {res_id, amount} = req.body;
        let user_id = req.user_id;
        
        if (!Number.isInteger(+res_id) || isNaN(amount)) {
            throw new BadRequest("Request parameters is in wrong format!");
        };
        
        if (+amount > 5 || +amount < 1) {
            throw new BadRequest("Amount must within 1 to 5!");
        };
        const rateExist = await prisma.rate_res.findFirst({
            where: {
                user_id: +user_id,
                res_id: +res_id, 
            }
        });

        if (rateExist) throw new BadRequest("Already rated this restaurant!")
        const data = await prisma.rate_res.create({
            data: {
                user_id: +user_id,
                res_id: +res_id,
                amount: Math.round(+amount),
            }
        })
        return data.id;
    },

    async ratesByRes(req) {
        const {id} = req.params;
        const data = await prisma.rate_res.findMany({
            where: {
                res_id: +id,
                isDeleted: false,
            }
        });
        return data
    },

    async ratesByUser(req) {
        const {id} = req.params;
        const data = await prisma.rate_res.findMany({
            where: {
                user_id: +id,
                isDeleted: false,
            }
        });
        return data
    },
}

export default ratesService;