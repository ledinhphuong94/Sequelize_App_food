-- -------------------------------------------------------------
-- TablePlus 6.7.8(650)
--
-- https://tableplus.com/
--
-- Database: bai_tap_buoi_4_restaurant
-- Generation Time: 2025-12-22 21:51:28.0930
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `food_type`;
CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `like_res`;
CREATE TABLE `like_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `date_like` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `rate_res`;
CREATE TABLE `rate_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT CURRENT_TIMESTAMP,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `sub_food`;
CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `google_id` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`, `createdAt`, `isDeleted`, `updatedAt`) VALUES
(1, 'Phở Bò Đặc Biệt', 'food/pho_bo.jpg', 65000, 'Phở bò tái nạm gầu, nước dùng đậm đà.', 1, '2025-11-29 13:17:31', 0, '2025-11-29 13:17:31'),
(2, 'Bún Chả Hà Nội', 'food/bun_cha.jpg', 55000, 'Bún chả nem cua bể và thịt nướng than hoa.', 1, '2025-11-29 13:17:31', 0, '2025-11-29 13:17:31'),
(3, 'Gỏi Cuốn Tôm Thịt', 'food/goi_cuon.jpg', 40000, 'Gỏi cuốn tươi mát, chấm tương đậu phộng.', 1, '2025-11-29 13:17:31', 0, '2025-11-29 13:17:31'),
(4, 'Pizza Margherita', 'food/pizza_margherita.jpg', 180000, 'Pizza truyền thống với sốt cà chua, phô mai Mozzarella và húng quế.', 2, '2025-11-29 13:17:31', 0, '2025-11-29 13:17:31'),
(5, 'Spaghetti Carbonara', 'food/carbonara.jpg', 125000, 'Mì ý sốt kem, trứng và thịt xông khói kiểu Ý.', 2, '2025-11-29 13:17:31', 0, '2025-11-29 13:17:31'),
(6, 'Lasagna Bò', 'food/lasagna_bo.jpg', 140000, 'Món Lasagna nhiều lớp, sốt thịt bò và phô mai Bechamel.', 2, '2025-11-29 13:17:31', 0, '2025-11-29 13:17:31'),
(7, 'Sushi Combo Deluxe', 'food/sushi_combo.jpg', 250000, 'Combo 12 miếng sushi và sashimi tươi ngon.', 3, '2025-11-29 13:17:31', 0, '2025-11-29 13:17:31'),
(8, 'Ramen Tonkotsu', 'food/ramen_tonkotsu.jpg', 135000, 'Mì Ramen nước hầm xương heo đậm đà, trứng lòng đào.', 3, '2025-11-29 13:17:31', 0, '2025-11-29 13:17:31'),
(9, 'Tempura Tôm', 'food/tempura_tom.jpg', 90000, 'Tôm và rau củ chiên giòn kiểu Nhật.', 3, '2025-11-29 13:17:31', 0, '2025-11-29 13:17:31'),
(10, 'Classic Beef Burger', 'food/classic_burger.jpg', 85000, 'Burger bò nướng, phô mai Cheddar và rau tươi.', 4, '2025-11-29 13:17:31', 0, '2025-11-29 13:17:31'),
(11, 'Combo Gà Rán', 'food/combo_ga.jpg', 110000, '3 miếng gà rán giòn tan và khoai tây chiên.', 4, '2025-11-29 13:17:31', 0, '2025-11-29 13:17:31'),
(12, 'Khoai Tây Chiên Phô Mai', 'food/khoai_tay_pho_mai.jpg', 45000, 'Khoai tây chiên phủ sốt phô mai béo ngậy.', 4, '2025-11-29 13:17:31', 0, '2025-11-29 13:17:31'),
(13, 'Phở Chay Sen Vàng', 'food/pho_chay.jpg', 60000, 'Phở chay, nước dùng rau củ thanh đạm.', 5, '2025-11-29 13:17:31', 0, '2025-11-29 13:17:31'),
(14, 'Bánh Mì Chả Lụa Chay', 'food/banh_mi_chay.jpg', 35000, 'Bánh mì kẹp chả lụa nấm và rau thơm.', 5, '2025-11-29 13:17:31', 0, '2025-11-29 13:17:31'),
(15, 'Cơm Chiên Rau Củ', 'food/com_chien_rau_cu.jpg', 70000, 'Cơm chiên với nhiều loại rau củ theo mùa.', 5, '2025-11-29 13:17:31', 0, '2025-11-29 13:17:31');

INSERT INTO `food_type` (`type_id`, `type_name`, `createdAt`, `isDeleted`, `updatedAt`) VALUES
(1, 'Món Việt Nam', '2025-11-29 13:05:01', 0, '2025-11-29 13:05:01'),
(2, 'Món Ý', '2025-11-29 13:05:01', 0, '2025-11-29 13:05:01'),
(3, 'Món Nhật Bản', '2025-11-29 13:05:01', 0, '2025-11-29 13:05:01'),
(4, 'Ăn nhanh (Fast Food)', '2025-11-29 13:05:01', 0, '2025-11-29 13:05:01'),
(5, 'Món Chay/Thuần chay', '2025-11-29 13:05:01', 0, '2025-11-29 13:05:01');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`, `createdAt`, `isDeleted`, `updatedAt`, `id`) VALUES
(1, 1, '2025-09-30 13:14:48', '2025-11-29 13:14:48', 1, '2025-12-04 03:48:03', 1),
(1, 2, '2025-10-02 13:14:48', '2025-11-29 13:14:48', 1, '2025-12-04 03:50:05', 2),
(1, 3, '2025-10-05 13:14:48', '2025-11-29 13:14:48', 1, '2025-12-04 04:08:20', 3),
(1, 5, '2025-10-10 13:14:48', '2025-11-29 13:14:48', 0, '2025-11-29 13:14:48', 4),
(2, 6, '2025-10-15 13:14:48', '2025-11-29 13:14:48', 0, '2025-11-29 13:14:48', 5),
(2, 7, '2025-10-20 13:14:48', '2025-11-29 13:14:48', 0, '2025-11-29 13:14:48', 6),
(2, 8, '2025-10-25 13:14:48', '2025-11-29 13:14:48', 0, '2025-11-29 13:14:48', 7),
(2, 9, '2025-10-30 13:14:48', '2025-11-29 13:14:48', 0, '2025-11-29 13:14:48', 8),
(3, 2, '2025-11-01 13:14:48', '2025-11-29 13:14:48', 0, '2025-11-29 13:14:48', 9),
(3, 9, '2025-11-04 13:14:48', '2025-11-29 13:14:48', 0, '2025-11-29 13:14:48', 10),
(3, 10, '2025-11-06 13:14:48', '2025-11-29 13:14:48', 0, '2025-11-29 13:14:48', 11),
(4, 1, '2025-11-09 13:14:48', '2025-11-29 13:14:48', 0, '2025-11-29 13:14:48', 12),
(4, 5, '2025-11-11 13:14:48', '2025-11-29 13:14:48', 0, '2025-11-29 13:14:48', 13),
(4, 7, '2025-11-14 13:14:48', '2025-11-29 13:14:48', 0, '2025-11-29 13:14:48', 14),
(5, 3, '2025-11-15 13:14:48', '2025-11-29 13:14:48', 0, '2025-11-29 13:14:48', 15),
(5, 6, '2025-11-17 13:14:48', '2025-11-29 13:14:48', 0, '2025-11-29 13:14:48', 16),
(6, 8, '2025-11-19 13:14:48', '2025-11-29 13:14:48', 0, '2025-11-29 13:14:48', 17),
(6, 1, '2025-11-21 13:14:48', '2025-11-29 13:14:48', 0, '2025-11-29 13:14:48', 18),
(7, 2, '2025-11-22 13:14:48', '2025-11-29 13:14:48', 0, '2025-11-29 13:14:48', 19),
(7, 3, '2025-11-23 13:14:48', '2025-11-29 13:14:48', 0, '2025-11-29 13:14:48', 20),
(8, 5, '2025-11-24 13:14:48', '2025-11-29 13:14:48', 0, '2025-11-29 13:14:48', 21),
(8, 9, '2025-11-25 13:14:48', '2025-11-29 13:14:48', 0, '2025-11-29 13:14:48', 22),
(9, 10, '2025-11-26 13:14:48', '2025-11-29 13:14:48', 0, '2025-11-29 13:14:48', 23),
(9, 6, '2025-11-27 13:14:48', '2025-11-29 13:14:48', 0, '2025-11-29 13:14:48', 24),
(9, 8, '2025-11-29 13:14:48', '2025-11-29 13:14:48', 0, '2025-11-29 13:14:48', 25),
(2, 3, '2025-12-04 02:25:12', '2025-12-04 02:25:12', 0, '2025-12-04 02:25:12', 26),
(2, 3, '2025-12-04 02:36:05', '2025-12-04 02:36:05', 0, '2025-12-04 02:36:05', 27),
(1, 3, '2025-12-04 02:36:32', '2025-12-04 02:36:32', 0, '2025-12-04 02:37:09', 28),
(8, 3, '2025-12-04 02:38:53', '2025-12-04 02:38:53', 0, '2025-12-04 03:03:29', 29),
(6, 3, '2025-12-04 02:45:21', '2025-12-04 02:45:21', 0, '2025-12-04 03:03:29', 30),
(7, 3, '2025-12-04 03:04:07', '2025-12-04 03:04:07', 0, '2025-12-04 03:04:07', 31),
(7, 3, '2025-12-04 03:23:58', '2025-12-04 03:23:58', 0, '2025-12-04 03:23:58', 39),
(1, 3, '2025-12-04 03:48:51', '2025-12-04 03:48:51', 0, '2025-12-04 03:48:51', 40),
(19, 3, '2025-12-13 09:04:16', '2025-12-13 09:04:16', 1, '2025-12-13 09:49:11', 42),
(19, 6, '2025-12-13 09:49:20', '2025-12-13 09:49:20', 0, '2025-12-13 09:53:13', 43);

INSERT INTO `order` (`id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`, `createdAt`, `isDeleted`, `updatedAt`) VALUES
(1, 1, 1, 2, 'ORD001', '1,2', '2025-11-29 13:22:32', 0, '2025-11-29 13:22:32'),
(2, 1, 10, 1, 'ORD002', '10,12,13', '2025-11-29 13:22:32', 0, '2025-11-29 13:22:32'),
(3, 1, 4, 1, 'ORD003', '4', '2025-11-29 13:22:32', 0, '2025-11-29 13:22:32'),
(4, 2, 5, 2, 'ORD004', '5,6', '2025-11-29 13:22:32', 0, '2025-11-29 13:22:32'),
(5, 2, 8, 1, 'ORD005', '7,8', '2025-11-29 13:22:32', 0, '2025-11-29 13:22:32'),
(6, 2, 11, 1, 'ORD006', '14', '2025-11-29 13:22:32', 0, '2025-11-29 13:22:32'),
(7, 3, 1, 1, 'ORD007', '1', '2025-11-29 13:22:32', 0, '2025-11-29 13:22:32'),
(8, 3, 13, 2, 'ORD008', '17,18', '2025-11-29 13:22:32', 0, '2025-11-29 13:22:32'),
(9, 4, 10, 3, 'ORD009', '12', '2025-11-29 13:22:32', 0, '2025-11-29 13:22:32'),
(10, 4, 12, 1, 'ORD010', NULL, '2025-11-29 13:22:32', 0, '2025-11-29 13:22:32'),
(11, 5, 7, 1, 'ORD011', NULL, '2025-11-29 13:22:32', 0, '2025-11-29 13:22:32'),
(12, 5, 14, 1, 'ORD012', NULL, '2025-11-29 13:22:32', 0, '2025-11-29 13:22:32'),
(13, 6, 2, 2, 'ORD013', '3', '2025-11-29 13:22:32', 0, '2025-11-29 13:22:32'),
(14, 6, 11, 1, 'ORD014', '14', '2025-11-29 13:22:32', 0, '2025-11-29 13:22:32'),
(15, 7, 8, 1, 'ORD015', '7,9', '2025-11-29 13:22:32', 0, '2025-11-29 13:22:32'),
(16, 7, 9, 1, 'ORD016', '10', '2025-11-29 13:22:32', 0, '2025-11-29 13:22:32'),
(17, 8, 1, 1, 'ORD017', '2', '2025-11-29 13:22:32', 0, '2025-11-29 13:22:32'),
(18, 8, 13, 1, 'ORD018', '18', '2025-11-29 13:22:32', 0, '2025-11-29 13:22:32'),
(21, 1, 2, 1, 'ORD019', '2,3,4', '2025-12-04 10:01:01', 0, '2025-12-04 10:01:01'),
(22, 3, 5, 3, 'ORD020', '1', '2025-12-04 10:01:38', 0, '2025-12-04 10:01:38'),
(23, 20, 5, 2, 'ORD021', '1', '2025-12-13 05:48:51', 0, '2025-12-13 05:48:51'),
(24, 19, 5, 2, 'ORD022', '1', '2025-12-13 10:24:09', 0, '2025-12-13 10:24:09'),
(25, 19, 3, 1, 'ORD023', '1,3', '2025-12-13 10:26:22', 0, '2025-12-13 10:26:22');

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`, `createdAt`, `isDeleted`, `updatedAt`, `id`) VALUES
(1, 1, 5, '2025-10-10 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 1),
(1, 2, 4, '2025-10-15 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 2),
(1, 3, 5, '2025-10-20 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 3),
(1, 4, 4, '2025-10-25 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 4),
(1, 5, 5, '2025-10-30 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 5),
(2, 6, 3, '2025-11-01 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 6),
(2, 7, 5, '2025-11-03 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 7),
(2, 8, 4, '2025-11-05 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 8),
(2, 9, 5, '2025-11-07 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 9),
(2, 1, 4, '2025-11-09 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 10),
(3, 2, 3, '2025-11-11 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 11),
(3, 3, 4, '2025-11-13 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 12),
(3, 9, 5, '2025-11-15 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 13),
(3, 10, 4, '2025-11-17 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 14),
(4, 1, 5, '2025-11-19 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 15),
(4, 5, 4, '2025-11-20 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 16),
(4, 8, 3, '2025-11-21 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 17),
(4, 10, 5, '2025-11-22 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 18),
(5, 2, 4, '2025-11-23 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 19),
(5, 7, 5, '2025-11-24 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 20),
(5, 6, 4, '2025-11-25 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 21),
(6, 3, 5, '2025-11-26 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 22),
(6, 4, 4, '2025-11-27 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 23),
(6, 5, 5, '2025-11-28 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 24),
(7, 1, 4, '2025-11-29 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 25),
(7, 6, 3, '2025-11-28 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 26),
(8, 7, 5, '2025-11-27 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 27),
(8, 9, 4, '2025-11-26 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 28),
(9, 10, 5, '2025-11-25 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 29),
(9, 2, 5, '2025-11-24 13:11:13', '2025-11-29 13:11:13', 0, '2025-11-29 13:11:13', 30),
(1, 3, 5, '2025-11-24 13:11:13', '2025-12-04 08:17:46', 0, '2025-12-04 08:31:11', 31),
(1, 3, 5, '2025-11-24 13:11:13', '2025-12-04 08:17:58', 0, '2025-12-04 08:31:11', 35),
(1, 3, 4, '2025-11-24 13:11:13', '2025-12-04 08:19:19', 0, '2025-12-04 08:31:11', 36),
(1, 3, 5, '2025-11-24 13:11:13', '2025-12-04 08:20:08', 0, '2025-12-04 08:31:11', 37),
(5, 2, 4, '2025-11-24 13:11:13', '2025-12-04 08:20:16', 0, '2025-12-04 08:31:11', 38),
(5, 2, 4, '2025-11-24 13:11:13', '2025-12-04 08:20:27', 0, '2025-12-04 08:31:11', 39),
(4, 2, 2, '2025-11-24 13:11:13', '2025-12-04 08:25:09', 0, '2025-12-04 08:31:11', 40),
(6, 2, 1, '2025-11-24 13:11:13', '2025-12-04 08:30:29', 0, '2025-12-04 08:31:17', 41),
(19, 2, 1, '2025-12-13 10:11:33', '2025-12-13 10:11:33', 0, '2025-12-13 10:11:33', 42),
(19, 3, 1, '2025-12-13 10:16:32', '2025-12-13 10:16:32', 0, '2025-12-13 10:16:32', 43);

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`, `createdAt`, `isDeleted`, `updatedAt`) VALUES
(1, 'Phở Gia Truyền 45', 'img/pho_gia_truyen.jpg', 'Chuyên các món phở bò tái, nạm, gầu đậm vị truyền thống Hà Nội.', '2025-11-29 13:03:17', 0, '2025-11-29 13:03:17'),
(2, 'The French Touch', 'img/french_touch.png', 'Nhà hàng fine-dining Pháp, phục vụ rượu vang và món bò nướng kiểu Âu.', '2025-11-29 13:03:17', 0, '2025-11-29 13:03:17'),
(3, 'Sushi Koi', 'img/sushi_koi.png', 'Sushi, sashimi tươi ngon và các món nướng Teppanyaki đặc trưng Nhật Bản.', '2025-11-29 13:03:17', 0, '2025-11-29 13:03:17'),
(4, 'Burger Express', 'img/burger_express.jpg', 'Cung cấp các loại burger, khoai tây chiên và đồ uống có gas nhanh chóng.', '2025-11-29 13:03:17', 0, '2025-11-29 13:03:17'),
(5, 'Thiên An Vegetarian', 'img/thien_an_chay.png', 'Thực đơn chay đa dạng, tốt cho sức khỏe, không gian yên tĩnh và thanh tịnh.', '2025-11-29 13:03:17', 0, '2025-11-29 13:03:17'),
(6, 'Hải Sản Vịnh Xanh', 'img/hai_san_vinh_xanh.jpg', 'Hải sản tươi sống, chế biến tại chỗ, thích hợp cho tiệc gia đình.', '2025-11-29 13:03:17', 0, '2025-11-29 13:03:17'),
(7, 'Coffee & Dessert Corner', 'img/coffee_corner.jpg', 'Phục vụ cà phê, trà sữa, bánh ngọt và các món ăn nhẹ.', '2025-11-29 13:03:17', 0, '2025-11-29 13:03:17'),
(8, 'K-BBQ Delight', 'img/k_bbq_delight.jpg', 'Thịt nướng Hàn Quốc tại bàn, nhiều loại panchan kèm theo.', '2025-11-29 13:03:17', 0, '2025-11-29 13:03:17'),
(9, 'Bella Italia Pizza', 'img/bella_italia.png', 'Pizza nướng củi và các loại pasta thủ công, hương vị Ý đích thực.', '2025-11-29 13:03:17', 0, '2025-11-29 13:03:17'),
(10, 'Bangkok Street Food', 'img/bangkok_street.jpg', 'Các món ăn đường phố Thái Lan cay nồng, lẩu Thái Tom Yum hấp dẫn.', '2025-11-29 13:03:17', 0, '2025-11-29 13:03:17');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`, `createdAt`, `isDeleted`, `updatedAt`) VALUES
(1, 'Quẩy giòn', 10000, 1, '2025-11-29 13:20:16', 0, '2025-11-29 13:20:16'),
(2, 'Trứng gà chần', 12000, 1, '2025-11-29 13:20:16', 0, '2025-11-29 13:20:16'),
(3, 'Chả giò (2 cuốn)', 35000, 2, '2025-11-29 13:20:16', 0, '2025-11-29 13:20:16'),
(4, 'Sốt cà chua phụ', 20000, 4, '2025-11-29 13:20:16', 0, '2025-11-29 13:20:16'),
(5, 'Phô mai Parmesan phụ', 15000, 5, '2025-11-29 13:20:16', 0, '2025-11-29 13:20:16'),
(6, 'Bánh mì bơ tỏi', 30000, 5, '2025-11-29 13:20:16', 0, '2025-11-29 13:20:16'),
(7, 'Trứng lòng đào phụ', 18000, 8, '2025-11-29 13:20:16', 0, '2025-11-29 13:20:16'),
(8, 'Thịt heo Char Siu phụ', 45000, 8, '2025-11-29 13:20:16', 0, '2025-11-29 13:20:16'),
(9, 'Kim chi cải thảo', 25000, 8, '2025-11-29 13:20:16', 0, '2025-11-29 13:20:16'),
(10, 'Sốt chấm Tempura', 10000, 9, '2025-11-29 13:20:16', 0, '2025-11-29 13:20:16'),
(11, 'Phô mai lát', 15000, 10, '2025-11-29 13:20:16', 0, '2025-11-29 13:20:16'),
(12, 'Thịt xông khói', 25000, 10, '2025-11-29 13:20:16', 0, '2025-11-29 13:20:16'),
(13, 'Nước ngọt size L', 25000, 10, '2025-11-29 13:20:16', 0, '2025-11-29 13:20:16'),
(14, 'Rau trộn phụ', 20000, 11, '2025-11-29 13:20:16', 0, '2025-11-29 13:20:16'),
(15, 'Nước tương đặc biệt', 5000, 3, '2025-11-29 13:20:16', 0, '2025-11-29 13:20:16'),
(16, 'Nước chanh tươi', 35000, 6, '2025-11-29 13:20:16', 0, '2025-11-29 13:20:16'),
(17, 'Thịt bò chay phụ', 30000, 13, '2025-11-29 13:20:16', 0, '2025-11-29 13:20:16'),
(18, 'Ớt tươi & chanh', 5000, 13, '2025-11-29 13:20:16', 0, '2025-11-29 13:20:16'),
(19, 'Đậu hũ chiên giòn', 20000, 15, '2025-11-29 13:20:16', 0, '2025-11-29 13:20:16'),
(20, 'Trà đá', 5000, 15, '2025-11-29 13:20:16', 0, '2025-11-29 13:20:16');

INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`, `createdAt`, `isDeleted`, `updatedAt`, `google_id`, `avatar`) VALUES
(1, 'Nguyễn Văn An', 'an.nguyen@company.com', '20f3f30337628cabd7ebaa31c26779599b49290cc9e4ef84cd397b7a27274208', '2025-11-29 13:01:28', 1, '2025-12-03 07:04:33', NULL, NULL),
(2, 'Trần Thị Bình', 'binh.tran@company.com', 'b9459542c3a845be22cc1335e664e167125921063a736ef82651c4cd44ed864b', '2025-11-29 13:01:28', 0, '2025-11-29 13:01:28', NULL, NULL),
(3, 'Lê Hoàng Chung', 'chung.le@company.com', 'd7b7db491025a8f4d00f9e2e323e6d854a8c040ca91819c6d5d2c002460bfe69', '2025-11-29 13:01:28', 0, '2025-11-29 13:01:28', NULL, NULL),
(4, 'Phạm Quang Dũng', 'dung.pham@company.com', '3cf465ea8437eacd35f86aa830d629f4d006dcb9706133d57ae29f61206f00f3', '2025-11-29 13:01:28', 0, '2025-11-29 13:01:28', NULL, NULL),
(5, 'Võ Thị Ánh', 'anh.vo@company.com', '044a304ddc518ee26168d2eacbe235d30bd3764acce32eef296310f6d12718b2', '2025-11-29 13:01:28', 0, '2025-11-29 13:01:28', NULL, NULL),
(6, 'Hoàng Minh Phát', 'phat.hoang@company.com', 'e8919e954494f5aae52a34646d1452a475aa4fc5684d7bc03a2a626b8a621779', '2025-11-29 13:01:28', 0, '2025-11-29 13:01:28', NULL, NULL),
(7, 'Đặng Thanh Tú', 'tu.dang@company.com', 'd491a86179de96ae207a699a6f5cddcf4432c6f308cf5ebe8f11d82478f327e5', '2025-11-29 13:01:28', 0, '2025-11-29 13:01:28', NULL, NULL),
(8, 'Bùi Thúy Hằng', 'hang.bui@company.com', '21209e3722e1603bc75582f91ed9353cb87fd2436c244cbbbf3db253237a2b5b', '2025-11-29 13:01:28', 0, '2025-11-29 13:01:28', NULL, NULL),
(9, 'Mai Văn Khoa', 'khoa.mai@company.com', 'a7e34a381d15013c81bd7f3c92cb882ac241f5da2d3b2dba167461239ce26fd4', '2025-11-29 13:01:28', 0, '2025-11-29 13:01:28', NULL, NULL),
(10, 'Ngô Thanh Loan', 'loan.ngo@company.com', '42054a001a0705278598eacc7e0c3e98bb0675a1ff7230655625c0e1f8fd221a', '2025-11-29 13:01:28', 0, '2025-11-29 13:01:28', NULL, NULL),
(11, 'Bé Heo con', 'heocon@gmail.com', '42054a001a0705278598eacc7e0c3e98bb0675a1ff7230655625c0e1f8fd221a', '2025-12-03 07:24:26', 0, '2025-12-03 07:36:53', NULL, NULL),
(12, 'Bé Trâu già', 'traugia@gmail.com', '42054a001a0705278598eacc7e0c3e98bb0675a1ff7230655625c0e1f8fd221a', '2025-12-03 07:30:59', 0, '2025-12-03 07:37:12', NULL, NULL),
(13, 'Ông Nghé Trẻ', 'nghetrau@nghe.com', '21209e3722e1603bc75582f91ed9353cb87fd2436c244cbbbf3db253237a2b5b', '2025-12-03 07:31:54', 0, '2025-12-03 07:37:33', NULL, NULL),
(14, 'Jogny Dang', 'johm@gamil.com', '123123123', '2025-12-03 07:42:56', 0, '2025-12-03 07:42:56', NULL, NULL),
(18, 'Mộ Dung Phục', 'modungphuc@nghe.com', '12345', '2025-12-12 08:08:51', 0, '2025-12-12 08:08:51', NULL, NULL),
(19, 'Loc Kinh Ky', 'locdinhky@nghe.com', '$2b$10$WMcQI6BNodDvODELYwSBAuKsdnsQRKi6x73p6Dpy.AelVlwQcz5ym', '2025-12-12 08:19:49', 0, '2025-12-12 08:19:49', NULL, NULL),
(20, 'Truong Vo Ky', 'truongvoky@gmail.com', '$2b$10$F3vNBkvScJ/PIy6X7fOj3erAx8Gcd5m/4Hmnd2X6FYBG9/.DBctQO', '2025-12-12 16:55:47', 0, '2025-12-12 16:55:47', NULL, NULL),
(21, 'Lê Định Phương', 'ledinhphuong94@gmail.com', NULL, '2025-12-20 19:05:44', 0, '2025-12-20 19:05:44', '104313240613652476138', 'https://lh3.googleusercontent.com/a/ACg8ocJugNy1PrUefVtPCiRn94uqYebg0fxz4WlYvoZO-wmLy4p2c2zo=s96-c'),
(22, 'Phuong Le', 'ledinhphuong100@gmail.com', NULL, '2025-12-20 19:19:31', 0, '2025-12-20 19:19:31', '106724491156780796034', 'https://lh3.googleusercontent.com/a/ACg8ocKDHlM-LKWAQnz68HKRk5yMLL1ghyZi1GOXZXpwb7_3CVfOrQ=s96-c'),
(23, 'Bản Đồ Ánh Sáng', 'bandoanhsang@gmail.com', NULL, '2025-12-20 19:20:49', 0, '2025-12-20 19:20:49', '101908353492214255966', 'https://lh3.googleusercontent.com/a/ACg8ocKODlIOcHPhsftm-8bM88pZcjYqIGGjUr_EyolPT6Jqrpgvmyg=s96-c');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;