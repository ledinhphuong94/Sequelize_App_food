import { PrismaMariaDb } from '@prisma/adapter-mariadb';
import "dotenv/config";
import { DATABASE_URL } from "../constant/app.constant.js";
import { PrismaClient } from './generated/prisma/client.js';

const url = new URL(DATABASE_URL);
console.log('URL', url)
const adapter = new PrismaMariaDb({
  host: url.hostname,
  user: url.username,
  password: url.password,
  database: url.pathname.substring(1),
  connectionLimit: 5,
  port: url.port,
});
const prisma = new PrismaClient({ adapter });

export { prisma };
