import express from "express";
import rootRouter from './src/routers/root.router.js';
import cors from "cors";
const app = express();

const PORT = 3333;
app.use(cors({
    origin: "http://localhost:5173"
}));
app.use("/api", rootRouter);
app.listen(PORT, () => {
    console.log(`Example app listening on port ${PORT}`)
})