import {prisma} from "../common/prisma/prisma.connect.js";
import {BadRequest, NotFound, Unauthorized} from "../common/helper/exception.helper.js";
import helper from "../common/helper/common.helper.js";
import bcryptHelper from "../common/helper/bcrypt.helper.js";
import JWT from "../common/helper/jwt.helper.js";
import jwt from "jsonwebtoken";
import {ACCESS_TOKEN_KEY, REFRESH_TOKEN_KEY} from "../common/constant/app.constant.js";
import { color } from "chart.js/helpers";

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
        
        const token =  JWT.sign({...payload});
        
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

    async refreshToken(req) {
        const {accessToken, refreshToken} = req.body;
        if (!accessToken || !refreshToken) {
            throw new BadRequest("Token not exist!")
        };

        const at = jwt.verify(accessToken, ACCESS_TOKEN_KEY, {ignoreExpiration: true});
        const ft = jwt.verify(refreshToken, REFRESH_TOKEN_KEY);
        
        if (at.user_id !== ft.user_id) {
            throw new Unauthorized("Invalud user_id!")
        };

        const existUser = prisma.user.findUnique({
            where: {
                user_id: at.user_id
            }
        });

        if (!existUser) {
            throw new Unauthorized("User not found!")
        };

        const token = JWT.sign({user_id: existUser.user_id})
        return token
    },

    async signinGoogleCallback(req) {
        const googleUser = req.user;
        console.dir(googleUser, {colors: true, depth: null})
        const token = JWT.sign({user_id: googleUser.user_id});
        const {accessToken, refreshToken} = token;
        return `http://localhost:3001?accessToken=${accessToken}&refreshToken=${refreshToken}`

    }
}

export default authService;