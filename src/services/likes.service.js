import {prisma} from "../common/prisma/prisma.connect.js";

const likesService = {
    async addLike(req) {       
        let {user_id, res_id} = req.body;
        
        try {
            if (isNaN(user_id) || isNaN(res_id)) {
                throw new Error("Wrong format!");
            };
            const data = await prisma.like_res.create({
                data: {
                    user_id: Number(user_id),
                    res_id: Number(res_id),
                }
            })
            return { data: data.id };
        } catch (err) {
            console.log('>>>>>>',err.message)
            return {data: -1, message: err.message};
        } 
    },

    async unLike(req) {
        const {id} = req.params;
        try {
            const data = await prisma.like_res.update({
                where: {
                    id: +id,
                },
                data: {
                    isDeleted: true,
                }
            });
            return { data: data.id };
        } catch(err) {
            return { data: -1 , message: err.message};
        }
    },

    async findLikesByRes (req) {
        const {id} = req.params;
        try {
            const data = await prisma.like_res.findMany({
                where: {
                    res_id: +id,
                    isDeleted: false,
                }
            })
            return { data: data };
        } catch (err) {
            return { data: -1 , message: err.message};
        }
    },

    async findLikesByUser (req) {
        const {id} = req.params;
        try {
            const data = await prisma.like_res.findMany({
                where: {
                    user_id: +id,
                    isDeleted: false,
                }
            })
            return { data: data };
        } catch (err) {
            return { data: -1 , message: err.message};
        }
    },
}
export default likesService;