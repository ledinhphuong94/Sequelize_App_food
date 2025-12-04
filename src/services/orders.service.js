import { prisma } from "../common/prisma/prisma.connect.js";

const ordersService = {
    async getOrders(req) {
        try {
            const data = await prisma.order.findMany({
                where: {
                    isDeleted: false,
                },
                select: {
                    id: true,
                    user_id: true,
                    amount: true,
                    code: true,
                    createdAt: true,
                    updatedAt: true,
                    isDeleted: true,

                    food: {
                        select: {
                            food_id: true,
                            food_name: true,
                            image: true,
                        } 
                    },

                    user: {
                        select: {
                            user_id: true,
                            full_name: true,
                        } 
                    }
                }
            })
            return {data};
        } catch (err) {
            return {data: -1, message: err.message}
        }
    },

    async createOrder(req) {
        console.log('🌞 req', req.body)
        let {user_id, food_id, amount, arr_sub_id} = req.body;
        console.log(">>> arr_sub_id", arr_sub_id)
        const default_amount = 1;
        try {
            if (!Number.isInteger(+user_id) || !Number.isInteger(+food_id) || !Number.isInteger(+amount)) {
                throw new Error("user_id, food_id, amount must be integer!");
            };
            if (!Array.isArray(arr_sub_id)) {
                throw new Error("arr_sub_id must be array!");
            };
            if (arr_sub_id.some((subId) => !Number.isInteger(+subId))) {
                throw new Error("sub_id must be Integer");
            };
            amount = Math.max(+amount, default_amount);

            const total = await prisma.order.count({
                where: {
                    isDeleted: false,
                }
            });
            
            const data = await prisma.order.create({
                data: {
                    user_id: +user_id,
                    food_id: +food_id,
                    amount: amount,
                    code: `ORD${String(total+1).padStart(3, '0')}`,
                    arr_sub_id: arr_sub_id.join(",")
                }
            });   
            return {data}
        } catch (err) {
            return {data: -1, message: err.message}
        }
       
    }
}

export default ordersService;