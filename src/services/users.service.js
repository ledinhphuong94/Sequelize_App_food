// import UsersModel from "../models/users.model.js";
import {prisma} from "../common/prisma/prisma.connect.js";
const userService = {
    async findAll(req) {
         
        // const data = await UsersModel.findAll({
        //     attributes: ['user_id', 'full_name', 'email']
        // });
        try {
            console.log(req.query)
            const {filters} = req.query;
            const {fromDate, toDate} = JSON.parse(filters);
            console.log('fromDate', fromDate)
            console.log('toDate', toDate)
            // return data;
            const firstName = "Lê"
            const users = await prisma.user.findMany({
                where: {
                    isDeleted: false,
                    createdAt: {
                        gte: new Date(fromDate),
                        lt: new Date(toDate)
                    }
                }
            })
            // console.log('>>> users', users)
            return users

        } catch(err) {
            console.log(err)
        }
    },

    async findOne (req) {
        const {id} = req.params;
        const data = await prisma.user.findUnique({
            where: {
                user_id: +id
            }
        });
        return data;
    },

    async softDelete (req) {
        const {id} = req.params;
        const data = await prisma.user.update({
            where: {
                user_id: +id,
            },
            data: {
                isDeleted: true, 
            }
        });
        return data;
    },

    async addUser(req) {
        const mewData = req.body;
        console.log('mewData', mewData)
        const {full_name, email, password} = req.body;
        const data = await prisma.user.create({
            data: {
                full_name,
                email,
                password
            }
        })
        return data
    }
}
export default userService;
