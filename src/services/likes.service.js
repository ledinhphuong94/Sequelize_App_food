import {prisma} from "../common/prisma/prisma.connect.js";
import {BadRequest} from "../common/helper/exception.helper.js";

const likesService = {
    async toggleLike(req) {
        let {res_id} = req.body;
        let data;
        if (isNaN(res_id)) {
            throw new BadRequest("Res_id is in wrong format!");
        };
        const isLikeExist = await prisma.like_res.findFirst({
            where: {
                user_id: +req.user_id,
                res_id: +res_id
            }
        });

        if (isLikeExist) {
            data = await prisma.like_res.update({
                where: {
                    id: isLikeExist.id
                },
                data: {
                    isDeleted: !isLikeExist.isDeleted,
                }
            });
            data.action = data.isDeleted ? 'Unliked' : 'Liked'
        } else {
            // Chưa từng like bao giờ -> sẽ Like
            data = await prisma.like_res.create({
                data: {
                    user_id: +req.user_id,
                    res_id:+res_id,
                }
            });
            data.action = 'Liked'
        }
        const {id, action} = data;
        return {id, action};
    },

    async findLikesByRes (req) {
        const {id} = req.params;
        const data = await prisma.like_res.findMany({
            where: {
                res_id: +id,
                isDeleted: false,
            }
        })
        return data ;
    },

    async findLikesByUser (req) {
        const {id} = req.params;
        const data = await prisma.like_res.findMany({
            where: {
                user_id: +id,
                isDeleted: false,
            }
        })
        return data;
    },
}
export default likesService;