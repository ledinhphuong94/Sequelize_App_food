import passport from 'passport';
import {Strategy as GoogleStrategy} from "passport-google-oauth20";
import {GOOGLE_CLIENT_ID, GOOGLE_CLIENT_SECRET} from "../constant/app.constant.js";
import {prisma} from "../prisma/prisma.connect.js";
import {Unauthorized} from "../helper/exception.helper.js";

function initGoogleStrategy () {
    passport.use(new GoogleStrategy({
        clientID: GOOGLE_CLIENT_ID,
        clientSecret: GOOGLE_CLIENT_SECRET,
        callbackURL: "http://localhost:3333/api/auth/signin-google-callback"
        },
        async function(accessToken, refreshToken, profile, cb) {
          
            if (!profile) cb(new Unauthorized("Profile not exist!"), null);
            let google_id = profile.id;
            let name = profile.displayName;
            let email = profile.emails[0].value;
            let isVerified = profile.emails[0].verified;
            let img = profile.photos[0].value;

            if (!isVerified) cb(new Unauthorized("Email is not verified"), null);

            let userExist = await prisma.user.findUnique({
                where: {
                    email: email
                }
            });

            if (!userExist) {
                userExist = await prisma.user.create({
                    data: {
                        full_name: name,
                        email: email,
                        google_id: google_id,
                        avatar: img
                    }
                })
            };
            return cb(null, userExist);
        }
    ));
};

export default initGoogleStrategy;