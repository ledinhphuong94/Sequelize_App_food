# Sequelize_App_food

## Mô tả
Ứng dụng Food sử dụng Node.js, Express.js, Prisma và Sequelize để quản lý người dùng, đơn hàng, đánh giá và thích.

## Công nghệ sử dụng
- Node.js
- Express.js
- Prisma ORM
- MySQL
- JWT Authentication
- Multer (upload ảnh)
- Passport (OAuth Google)

## Cài đặt
1. Clone repository
2. `npm install`
3. Cấu hình file `.env` với DATABASE_URL, JWT_SECRET, v.v.
4. `npm run prisma`

## Chạy ứng dụng
`npm run dev`

## Cấu trúc dự án
- `user.sql`: database được export từ TablePlus
- `src/controllers/`: Xử lý logic API
- `src/models/`: Định nghĩa models
- `src/routers/`: Định tuyến API
- `src/services/`: Logic nghiệp vụ
- `prisma/schema.prisma`: Schema Prisma
- `uploadImg/`: Thư mục upload ảnh

## API Endpoints
- Auth: `/auth`
- Users: `/users`
- Orders: `/orders`
- Likes: `/likes`
- Rates: `/rates`
