import {prisma} from "../common/prisma/prisma.connect.js";
import {BadRequest, NotFound} from "../common/helper/exception.helper.js";
import helper from "../common/helper/common.helper.js";
import bcryptHelper from "../common/helper/bcrypt.helper.js";
import JWT from "../common/helper/jwt.helper.js";

const authService = {
    async register(req) {
        const {full_name, email, password} = req.body;
        if (!full_name || !email || !password) throw new BadRequest("Missing information!")
        const isValidEmail = helper.validateEmail(email);
        if (!isValidEmail) throw new BadRequest("Invalid email format!");
        
        const accountExist = await prisma.user.findUnique({
            where: {
                email: email
            }
        });
        
        if (accountExist) throw new BadRequest("Email exist! Please use another account");
        
        const newUser = await prisma.user.create({
            data: {
                full_name,
                email,
                password: bcryptHelper.encode(password),
            }
        });
        console.log('newUser', newUser)

        return `Register success`
    },

    async signIn(req) {
        const {email, password} = req.body;
        if (!email || !password) throw new BadRequest("Missing information");
        const existAcc = await prisma.user.findUnique({
            where: {
                email: email,
            }
        });
        if (!existAcc) throw new BadRequest("Invalid sign in!")
        
        const ligidPass = bcryptHelper.compare(password, existAcc.password);
        if (!ligidPass) throw new BadRequest("Wrong password!");

        const payload = {
            user_id: existAcc.user_id,
        }
        
        const token = {
            accessToken: JWT.encode({...payload, type: "access_token"}),
            refreshToken: JWT.encode({...payload, type: "refresh_token",}),
        }
        
        return token
    },

    async getUserInfo(req) {
        const user_id = req.user_id;
        
        const user = await prisma.user.findUnique({
            where: {
                user_id: user_id
            }
        });
        if (!user) throw new NotFound("User not found");
        delete user.password;
        delete user.isDeleted;

        return user;
    },
}

export default authService;