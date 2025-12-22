import express from "express";
import rootRouter from './src/routers/root.router.js';
import handleErrorMiddleWare from './src/common/helper/handleError.helper.js'
import cors from "cors";
import initGoogleStrategy from "./src/common/helper/passport.helper.js";

const app = express();

const PORT = 3333;
app.use(express.json());
app.use(cors({
    origin: "http://localhost:3001"
}));

initGoogleStrategy();

app.use("/api", rootRouter);
app.use(handleErrorMiddleWare.finalMiddleWare)
app.listen(PORT, () => {
    console.log(`Example app listening on port ${PORT}`)
})