import Sequelize from "sequelize";
const sequelize = new Sequelize('mysql://root:12345@localhost:3308/bai_tap_buoi_4_restaurant')

try {
  await sequelize.authenticate();
  console.log('Connection has been established successfully.');
} catch (error) {
  console.error('Unable to connect to the database:', error);
}
export default sequelize;