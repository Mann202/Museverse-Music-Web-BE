-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2023 at 04:26 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `museverse`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_status`
--

CREATE TABLE `account_status` (
  `account_status_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_status`
--

INSERT INTO `account_status` (`account_status_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Active', '2023-11-23 07:22:58', '2023-11-23 07:22:58'),
(2, 'Inactive', '2023-11-23 07:24:54', '2023-11-23 07:24:54'),
(3, 'Closed', '2023-11-23 07:25:22', '2023-11-23 07:25:22'),
(4, 'Banned', '2023-11-23 07:25:42', '2023-11-23 07:25:42');

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `account_type_id` int(255) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_types`
--

INSERT INTO `account_types` (`account_type_id`, `type_name`, `created_at`, `updated_at`) VALUES
(1, 'Personal ', '2023-11-23 07:26:35', '2023-11-23 07:26:35'),
(2, 'Premium ', '2023-11-23 07:26:42', '2023-11-23 07:26:42'),
(3, 'Administrator', '2023-11-23 07:27:14', '2023-11-23 07:27:14'),
(4, 'Distributor', '2023-11-23 07:27:40', '2023-11-23 07:27:40');

-- --------------------------------------------------------

--
-- Table structure for table `album_digital`
--

CREATE TABLE `album_digital` (
  `album_digi_id` varchar(100) NOT NULL,
  `artirst_id` varchar(100) NOT NULL,
  `number_of_songs` int(11) NOT NULL,
  `album_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `album_orders`
--

CREATE TABLE `album_orders` (
  `order_id` int(11) NOT NULL,
  `cust_name` varchar(255) DEFAULT NULL,
  `cust_email` varchar(255) DEFAULT NULL,
  `cust_contact_number` varchar(10) DEFAULT NULL,
  `cust_address` varchar(255) DEFAULT NULL,
  `cust_id` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `status` int(11) NOT NULL,
  `total` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `total_final` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `album_orders`
--

INSERT INTO `album_orders` (`order_id`, `cust_name`, `cust_email`, `cust_contact_number`, `cust_address`, `cust_id`, `note`, `status`, `total`, `created_at`, `updated_at`, `total_final`) VALUES
(3, 'Lê Xuân Quỳnh', 'xuanquynh@example.com', '0123456789', '264C Pasteur, phường Võ Thị Sáu, quận 3, Thành phố Hồ Chí Minh', 5, 'Giao giờ hành chính', 0, 7650000, '2023-12-03 01:40:29', '2023-12-06 13:15:59', 7650000),
(5, 'Anh Thư', 'nguyenvana@example.com', '0123456789', '26 Điện Biên Phủ, hẻm 2, Khu phố Ninh Phước, phường Ninh Thạnh, tỉnh Tây Ninh', 7, '', 0, 2400000, '2022-12-31 20:00:00', '2023-12-06 13:15:59', 2400000),
(6, 'Phạm Mến', 'phammen@example.com', '0936764625', 'Khu Phú Tảo, phường Thạch Khôi, TP. Hải Dương', 8, '', 0, 5500000, '2022-12-31 20:00:00', '2023-12-06 13:15:59', 5500000),
(7, 'Nguyễn Thị Thắm', 'nguyenthitham@example.com', '0966318670', 'Nhà số 3, xóm 4, Yên Thái, Tiền Yên, Hoài Đức, Hà Nội', 9, '', 0, 1450000, '2022-12-31 20:00:00', '2023-12-06 13:15:59', 1450000),
(8, 'Dương Vương Hy', 'duongvuonghy@example.com', '0907322823', 'Ấp Tân Bảnh, xã Tân Phước, huyện Tân Hồng, Đồng Tháp', 10, '', 0, 1000000, '2022-12-31 20:00:00', '2023-12-06 13:15:59', 1000000),
(9, 'Giang Nghi', 'giangnghi@example.com', '0343980618', '40/5 đường số 27, Sơn Kỳ, Tân Phú, TP.HCM', 11, '', 0, 1200000, '2022-12-31 20:00:00', '2023-12-03 02:08:22', 1200000),
(10, 'Ngọc Trâm', 'ngoctram@example.com', '0925490736', '158/37 Lãnh Binh Thái, Thị trấn Cần Giuộc, Huyện Cần Giuộc, Tỉnh Long An', 12, '', 0, 1990000, '2022-12-31 20:00:00', '2023-12-06 13:15:59', 1990000),
(11, 'Minh Tuyền', 'minhtuyen@example.com', '0949899419', '336 Nguyễn Tri Phương p4 Q10 TPHCM', 13, '', 0, 300000, '2022-12-31 20:00:00', '2023-12-03 02:08:22', 300000),
(12, 'Nguyễn Đoàn Kim Ngân', 'nguyendoankimngan@example.com', '0971263308', '125 đường cày, tổ 20, ấp 2, Xuân Hòa, Xuân Lộc, Đồng Nai', 11, '', 0, 2200000, '2022-12-31 20:00:00', '2023-12-06 13:15:59', 2200000),
(13, 'Quỳnh Như', 'quynhnhu@example.com', '0868752758', '45/1, tổ 1, khu A, đường Nguyễn Thị Minh Khai, hẻm 818, kp Tân Thắng, phường Tân Bình, thành phố Dĩ An, Bình Dương', 15, '', 0, 2600000, '2022-12-31 20:00:00', '2023-12-06 13:15:59', 2600000),
(14, 'Mon Mon', 'monmon@example.com', '0938491705', '59 Võ Như Hưng, quận Ngũ Hành Sơn, TP Đà Nẵng', 17, '', 0, 4480000, '2022-12-31 20:00:00', '2023-12-06 13:15:59', 4480000),
(3, 'Lê Xuân Quỳnh', 'xuanquynh@example.com', '0123456789', '264C Pasteur, phường Võ Thị Sáu, quận 3, Thành phố Hồ Chí Minh', 5, 'Giao giờ hành chính', 0, 7650000, '2023-12-03 08:40:29', '2023-12-06 13:15:59', 7650000),
(5, 'Anh Thư', 'nguyenvana@example.com', '0123456789', '26 Điện Biên Phủ, hẻm 2, Khu phố Ninh Phước, phường Ninh Thạnh, tỉnh Tây Ninh', 7, '', 0, 2400000, '2023-01-01 03:00:00', '2023-12-06 13:15:59', 2400000),
(6, 'Phạm Mến', 'phammen@example.com', '0936764625', 'Khu Phú Tảo, phường Thạch Khôi, TP. Hải Dương', 8, '', 0, 5500000, '2023-01-01 03:00:00', '2023-12-06 13:15:59', 5500000),
(7, 'Nguyễn Thị Thắm', 'nguyenthitham@example.com', '0966318670', 'Nhà số 3, xóm 4, Yên Thái, Tiền Yên, Hoài Đức, Hà Nội', 9, '', 0, 1450000, '2023-01-01 03:00:00', '2023-12-06 13:15:59', 1450000),
(8, 'Dương Vương Hy', 'duongvuonghy@example.com', '0907322823', 'Ấp Tân Bảnh, xã Tân Phước, huyện Tân Hồng, Đồng Tháp', 10, '', 0, 1000000, '2023-01-01 03:00:00', '2023-12-06 13:15:59', 1000000),
(9, 'Giang Nghi', 'giangnghi@example.com', '0343980618', '40/5 đường số 27, Sơn Kỳ, Tân Phú, TP.HCM', 11, '', 0, 1200000, '2023-01-01 03:00:00', '2023-12-03 09:08:22', 1200000),
(10, 'Ngọc Trâm', 'ngoctram@example.com', '0925490736', '158/37 Lãnh Binh Thái, Thị trấn Cần Giuộc, Huyện Cần Giuộc, Tỉnh Long An', 12, '', 0, 1990000, '2023-01-01 03:00:00', '2023-12-06 13:15:59', 1990000),
(11, 'Minh Tuyền', 'minhtuyen@example.com', '0949899419', '336 Nguyễn Tri Phương p4 Q10 TPHCM', 13, '', 0, 300000, '2023-01-01 03:00:00', '2023-12-03 09:08:22', 300000),
(12, 'Nguyễn Đoàn Kim Ngân', 'nguyendoankimngan@example.com', '0971263308', '125 đường cày, tổ 20, ấp 2, Xuân Hòa, Xuân Lộc, Đồng Nai', 11, '', 0, 2200000, '2023-01-01 03:00:00', '2023-12-06 13:15:59', 2200000),
(13, 'Quỳnh Như', 'quynhnhu@example.com', '0868752758', '45/1, tổ 1, khu A, đường Nguyễn Thị Minh Khai, hẻm 818, kp Tân Thắng, phường Tân Bình, thành phố Dĩ An, Bình Dương', 15, '', 0, 2600000, '2023-01-01 03:00:00', '2023-12-06 13:15:59', 2600000),
(14, 'Mon Mon', 'monmon@example.com', '0938491705', '59 Võ Như Hưng, quận Ngũ Hành Sơn, TP Đà Nẵng', 17, '', 0, 4480000, '2023-01-01 03:00:00', '2023-12-06 13:15:59', 4480000);

-- --------------------------------------------------------

--
-- Table structure for table `album_order_details`
--

CREATE TABLE `album_order_details` (
  `detail_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `album_physi_id` int(11) NOT NULL,
  `price` double NOT NULL,
  `num` int(11) NOT NULL,
  `total_money` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `album_order_details`
--

INSERT INTO `album_order_details` (`detail_id`, `order_id`, `album_physi_id`, `price`, `num`, `total_money`, `created_at`, `updated_at`) VALUES
(1, 3, 76, 1150000, 2, 2300000, '2023-12-02 19:08:22', '2023-12-02 19:08:22'),
(2, 3, 76, 1150000, 2, 2300000, '2023-12-02 19:08:22', '2023-12-02 19:08:22'),
(3, 3, 77, 300000, 1, 300000, '2023-12-02 19:08:22', '2023-12-02 19:08:22'),
(4, 5, 78, 350000, 3, 1050000, '2023-12-02 19:08:22', '2023-12-02 19:08:22'),
(5, 5, 79, 300000, 2, 600000, '2023-12-02 19:08:22', '2023-12-02 19:08:22'),
(6, 5, 80, 750000, 1, 750000, '2023-12-02 19:08:22', '2023-12-02 19:08:22'),
(7, 6, 81, 750000, 4, 3000000, '2023-12-02 19:08:22', '2023-12-02 19:08:22'),
(8, 6, 82, 1250000, 2, 2500000, '2023-12-02 19:08:22', '2023-12-02 19:08:22'),
(9, 7, 83, 350000, 1, 350000, '2023-12-02 19:08:22', '2023-12-02 19:08:22'),
(10, 7, 84, 350000, 1, 350000, '2023-12-02 19:08:22', '2023-12-02 19:08:22'),
(11, 7, 85, 250000, 3, 750000, '2023-12-02 19:08:22', '2023-12-02 19:08:22'),
(12, 8, 86, 350000, 2, 700000, '2023-12-02 19:08:22', '2023-12-02 19:08:22'),
(13, 8, 87, 300000, 1, 300000, '2023-12-02 19:08:22', '2023-12-02 19:08:22'),
(14, 9, 88, 300000, 4, 1200000, '2023-12-02 19:08:22', '2023-12-02 19:08:22'),
(15, 10, 89, 370000, 2, 740000, '2023-12-02 19:08:22', '2023-12-02 19:08:22'),
(16, 10, 90, 350000, 1, 350000, '2023-12-02 19:08:22', '2023-12-02 19:08:22'),
(17, 10, 91, 300000, 3, 900000, '2023-12-02 19:08:22', '2023-12-02 19:08:22'),
(18, 11, 92, 300000, 1, 300000, '2023-12-02 19:08:22', '2023-12-02 19:08:22'),
(19, 12, 93, 500000, 2, 1000000, '2023-12-02 19:08:22', '2023-12-02 19:08:22'),
(20, 12, 94, 480000, 1, 480000, '2023-12-02 19:08:22', '2023-12-02 19:08:22'),
(21, 12, 95, 240000, 3, 720000, '2023-12-02 19:08:22', '2023-12-02 19:08:22'),
(22, 13, 96, 300000, 4, 1200000, '2023-12-02 19:08:22', '2023-12-02 19:08:22'),
(23, 13, 97, 700000, 2, 1400000, '2023-12-02 19:08:22', '2023-12-02 19:08:22'),
(24, 14, 98, 800000, 1, 800000, '2023-12-02 19:08:22', '2023-12-02 19:08:22'),
(25, 14, 99, 680000, 1, 680000, '2023-12-02 19:08:22', '2023-12-02 19:08:22'),
(26, 14, 100, 1000000, 3, 3000000, '2023-12-02 19:08:22', '2023-12-02 19:08:22'),
(27, 3, 107, 450000, 2, 900000, '2023-12-02 19:09:35', '2023-12-02 19:09:35'),
(28, 3, 107, 450000, 1, 450000, '2023-12-02 19:09:35', '2023-12-02 19:09:35'),
(29, 3, 107, 350000, 1, 350000, '2023-12-02 19:09:35', '2023-12-02 19:09:35'),
(30, 3, 107, 350000, 3, 1050000, '2023-12-02 19:09:35', '2023-12-02 19:09:35');

--
-- Triggers `album_order_details`
--
DELIMITER $$
CREATE TRIGGER `delete_total` BEFORE DELETE ON `album_order_details` FOR EACH ROW BEGIN
  UPDATE album_orders SET total = total - OLD.total_money WHERE order_id = OLD.order_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_total` AFTER INSERT ON `album_order_details` FOR EACH ROW BEGIN
  DECLARE total_m INT;
  SET total_m = (SELECT SUM(total_money) FROM album_order_details WHERE order_id = NEW.order_id);
  UPDATE album_orders SET total = total_m WHERE order_id = NEW.order_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_total` AFTER UPDATE ON `album_order_details` FOR EACH ROW BEGIN
  DECLARE total_m INT;
  SET total_m = (SELECT SUM(total_money) FROM album_order_details WHERE order_id = NEW.order_id);
  UPDATE album_orders SET total = total_m WHERE order_id = NEW.order_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `album_physicals`
--

CREATE TABLE `album_physicals` (
  `album_physi_id` int(11) NOT NULL,
  `album_name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `artist_id` varchar(100) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `min_price` int(11) NOT NULL,
  `max_price` int(11) NOT NULL,
  `description` text NOT NULL,
  `url_poster` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `album_physicals`
--

INSERT INTO `album_physicals` (`album_physi_id`, `album_name`, `type`, `user_id`, `created_at`, `updated_at`, `artist_id`, `quantity`, `min_price`, `max_price`, `description`, `url_poster`) VALUES
(76, 'PRINCE - THE HITS 1 ', 'Đĩa than', 1, '2023-11-27 12:03:37', '2023-12-03 01:13:15', '5a2EaR3hamoenG9rDuVn8j\r\n', 147, 1150000, 1150000, 'Prince - The Hits 1 (Vinyl 2LP) - Đĩa Than - Băng Đĩa Nhạc Quốc Tế - Hãng Đĩa Thời Đại (Times Records) ⭕️ LP Store / Record Store in Saigon - Ho Chi Minh City Vietnam ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/prince-the-hits-1-vinyl-2lp-dia-than_1c763c2830c34684bc365089f83e3e68_grande.jpg'),
(77, 'MÈOW LẠC - SUGAR RUSH (THE 2ND ALBUM) ', 'Đĩa CD', 1, '2023-11-27 12:03:37', '2023-11-27 13:05:19', '1984OVQ0KnJW80MiZYOrFF\r\n', 123, 300000, 300000, 'Mèow Lạc - Sugar Rush (The 2nd Album) - Đĩa CD - Hãng Đĩa Thời Đại (Times Records)  ⭕️ CD Store in Saigon - Ho Chi Minh City Vietnam ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/20231119_meow-lac_sugar_rush-mock_up_29c31a8e2c8d47b1a3329d6f1e29d19a_grande.png'),
(78, 'GIÁNG SON - SING MY SOL ', 'Đĩa CD', 1, '2023-11-27 12:03:37', '2023-11-27 13:03:36', '15YEEmU7WkJL0FYMIBXUbd\r\n', 300, 350000, 350000, 'Giáng Son - Sing My Sol - Đĩa CD - Hãng Đĩa Thời Đại (Times Records)  ⭕️ CD Store in Saigon - Ho Chi Minh City Vietnam ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/mockup_db143848b3fb4636a748d1eb3aacab9a_grande.jpeg'),
(79, 'PHẠM HOÀI NAM - NGƯỜI GIỮ KÝ ỨC ', 'Đĩa CD', 1, '2023-11-27 12:03:37', '2023-11-27 13:03:23', '1E6UYLIV5yRqnF1FFM97g3\r\n', 111, 300000, 300000, 'Phạm Hoài Nam - Người Giữ Ký Ức - Đĩa CD - Hãng Đĩa Thời Đại (Times Records)  ⭕️ CD Store in Saigon - Ho Chi Minh City Vietnam ⭕️ Hotline: 0903.088.038. Dự kiến sẽ phát hành vào 14/11/2023.', 'https://product.hstatic.net/1000304920/product/nguoigiukyuc_bd73ab0ce8634f75affa319c2185b569_grande.jpeg'),
(80, 'THE KILLERS - WONDERFUL WONDERFUL  ', 'Đĩa than', 1, '2023-11-27 12:03:37', '2023-11-27 13:03:12', '0C0XlULifJtAgn6ZNCW2eu\r\n', 100, 750000, 750000, 'The Killers - Wonderful Wonderful (Vinyl LP) - Đĩa than - Đĩa Than Nhạc US-UK - Hãng Đĩa Thời Đại (Times Records) ⭕️ Saigon Vinyl Records Store in Vietnam / LP Store  ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/the-killers-wonderful-wonderful-lp_1024x1024_b1207d92521a4b788e2f8ab5eff99cf5_grande.jpg'),
(81, 'ARCA - KICK IIII ', 'Đĩa than', 1, '2023-11-27 12:03:37', '2023-11-27 13:02:57', '4SQdUpG4f7UbkJG3cJ2Iyj\r\n', 123, 750000, 750000, 'Arca - kick iiii (Vinyl LP) - Đĩa Than - Băng Đĩa Nhạc Quốc Tế - Hãng Đĩa Thời Đại (Times Records) ⭕️ LP Store / Record Store in Saigon - Ho Chi Minh City Vietnam ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/arca-kick-iiii-vinyl-lp-dia-than_b7d3e54a13874173bbddd413f3b4e9df_grande.jpg'),
(82, 'MAC MILLER - CIRCLES ', 'Đĩa than', 1, '2023-11-27 12:03:37', '2023-11-27 13:02:43', '3e7awlrlDSwF3iM0WBjGMp\r\n', 250, 1250000, 1250000, 'Mac Miller - Circles (Vinyl 2LP) - Đĩa Than - Băng Đĩa Nhạc Quốc Tế - Hãng Đĩa Thời Đại (Times Records) ⭕️ LP Store / Record Store in Saigon - Ho Chi Minh City Vietnam ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/mac-miller-circles-vinyl-2lp-dia-than_ed6c462f3024466b90fcb04761df4ce0_grande.jpg'),
(83, 'LITTLE MIX - LM5 ', 'Đĩa CD', 1, '2023-11-27 12:03:37', '2023-11-27 13:02:05', '3e7awlrlDSwF3iM0WBjGMp\r\n', 200, 350000, 350000, 'Little Mix - LM5 - Đĩa CD - Hãng Đĩa Thời Đại (Times Records) - Cửa hàng băng đĩa gốc nhạc quốc tế ⭕️ CD Store in Saigon  ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/little-mix-lm5-dia-cd_353685b38bd04d7f98f3282c5f9ee001_grande.jpeg'),
(84, 'THE LUMINEERS - THE LUMINEERS ', 'Đĩa CD', 1, '2023-11-27 12:03:37', '2023-11-27 13:01:46', '16oZKvXb6WkQlVAjwo2Wbg\r\n', 120, 350000, 350000, 'The Lumineers - The Lumineers - Đĩa CD - Hãng Đĩa Thời Đại (Times Records) - Cửa hàng băng đĩa gốc nhạc quốc tế ⭕️ CD Store in Saigon  ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/the-lumineers-the-lumineers-dia-cd_0e6ff3a43c0240cd9904c666a7bc4ba5_grande.jpeg'),
(85, 'PHẠM QUỲNH ANH - LỜI HỒI ĐÁP 2008 (E.P) ', 'Đĩa CD', 1, '2023-11-27 12:03:37', '2023-11-27 13:01:35', '033tY0EKEVdDtzoeEMMCJC\r\n', 545, 250000, 250000, 'Phạm Quỳnh Anh - Lời Hồi Đáp 2008 (E.P) - Đĩa CD - Hãng Đĩa Thời Đại (Times Records)  ⭕️ CD Store in Saigon - Ho Chi Minh City Vietnam ⭕️ Hotline: 0903.088.038. Dự kiến sẽ phát hành vào 14/11/2023.', 'https://product.hstatic.net/1000304920/product/pham-quynh-anh-loi-hoi-dap-2008-e-p-dia-cd_3dca9a5d31d94f6e89e27fc9adeb2597_grande.jpg'),
(86, 'THE LUKA PROJECT - THE LUKA PROJECT ', 'Đĩa CD', 1, '2023-11-27 12:03:37', '2023-11-27 13:01:24', '3rSWgrxSPaAF9em4VEe8GD\r\n', 300, 350000, 350000, 'The Luka Project - The Luka Project - Đĩa CD: Ấn bản vật lý của album phòng thu đầu tay cùng tên của The Luka Project (một nghệ danh của Thành Luke)', 'https://product.hstatic.net/1000304920/product/20231110_the-luka-project_poster_cd_02_b99029f3c7224ef78cc6013b411d141c_grande.jpg'),
(87, 'MESS. - SUMMER DAISY ', 'Đĩa CD', 1, '2023-11-27 12:03:37', '2023-11-27 13:00:45', '6kRuMeWznsiXAIF2GriqkF\r\n', 800, 300000, 300000, 'mess. - Summer Daisy - Đĩa CD: Ấn bản vật lý của album phòng thu đầu tay mess.', 'https://product.hstatic.net/1000304920/product/img_0679_e899d247cd1c4d6c891b47f6a66bb1e2_grande.jpg'),
(88, 'SA HUỲNH - ĐA NHÂN CÁCH ', 'Đĩa CD', 1, '2023-11-27 12:03:37', '2023-11-27 13:00:32', '5fMBv0NR3WPKUWCgJKopZk\r\n', 700, 300000, 300000, 'Sa Huỳnh - Đa Nhân Cách - Đĩa CD: Ấn bản vật lý của album phòng thu đầu tay của nhạc sĩ Sa Huỳnh, nhạc sĩ từng được đề cử Nhạc sĩ của năm tại Giải thưởng Cống Hiến 2020. Album Đa Nhân Cách với 12 bài hát do cô trình bày.', 'https://product.hstatic.net/1000304920/product/20231103_sa-huynh_da-nhan-cach_dia-cd_48916e7e389a4c9283e9eda52b0f0c7e_grande.jpg'),
(89, 'SLOWTHAI - UGLY ', 'Đĩa CD', 1, '2023-11-27 12:03:38', '2023-11-27 13:00:16', '3r1XkJ7vCs8kHBSzGvPLdP\r\n', 350, 370000, 370000, 'slowthai - UGLY - Đĩa CD - Hãng Đĩa Thời Đại (Times Records)  ⭕️ CD Store in Saigon - Ho Chi Minh City Vietnam ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/slowthai-ugly-dia-cd_70a667202e294c489e9bd47e1bcda710_grande.jpg'),
(90, 'MADONNA - THE IMMACULATE COLLECTION ', 'Đĩa CD', 1, '2023-11-27 12:03:38', '2023-11-27 12:59:56', '6tbjWDEIzxoDsBA1FuhfPW\r\n', 456, 350000, 350000, 'Madonna - The Immaculate Collection - Đĩa CD - Hãng Đĩa Thời Đại (Times Records)  ⭕️ CD Store in Saigon - Ho Chi Minh City Vietnam ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/madonna-the-immaculate-collection-dia-cd_7f955c0eb8ba4db891cb5c16fe6c3599_grande.jpg'),
(91, 'PHẠM HOÀI NAM - TRỊNH JAZZ ', 'Đĩa CD', 1, '2023-11-27 12:03:38', '2023-11-27 12:58:13', '1E6UYLIV5yRqnF1FFM97g3\r\n', 200, 300000, 300000, 'Phạm Hoài Nam - Trịnh Jazz - Đĩa CD - Hãng Đĩa Thời Đại (Times Records)  ⭕️ CD Store in Saigon - Ho Chi Minh City Vietnam ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/pham_hoai_nam-trinh_jazz-cd_93f777ec838b4bb087cdff6e64780901_grande.jpg'),
(92, 'HIEUTHUHAI - AI CŨNG PHẢI BẮT ĐẦU TỪ ĐÂU ĐÓ (STANDARD VER.) ', 'Đĩa CD', 1, '2023-11-27 12:03:38', '2023-11-27 12:57:52', '5HZtdKfC4xU0wvhEyYDWiY\r\n', 970, 300000, 300000, 'Album phòng thu đầu tay của HIEUTHUHAI mang tên \"Ai Cũng Phải Bắt Đầu Từ Đâu Đó\" - phiên bản tiêu chuẩn jewelcase có 2 version RED VER. và BLUE VER.  - Đĩa CD - Hãng Đĩa Thời Đại (Times Records)  ⭕️ CD Store in Saigon - Ho Chi Minh City Vietnam ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/hieuthuhai-ai_cung_bat_dau_tu_dau_do-blue_standard_cd_4a5e4e30018a495baf59a8134502dff1_grande.jpg'),
(93, 'VĂN MAI HƯƠNG - MINH TINH (LIMITED BOXSET) ', 'Đĩa CD', 1, '2023-11-27 12:03:38', '2023-11-27 12:57:37', '63SNH9m8M034lCGELVC1dm\r\n', 50, 500000, 500000, 'Album phòng thu thứ 4 của Văn Mai Hương \"Minh Tinh\" (Limited Boxset) - Đĩa CD - Hãng Đĩa Thời Đại (Times Records)  ⭕️ CD Store in Saigon - Ho Chi Minh City Vietnam ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/img_0370_d2ad1d962af64c1abe85cd11c944e693_grande.jpg'),
(94, 'OLIVIA RODRIGO - GUTS (PHIÊN BẢN CÓ CHỮ KÝ) ', 'Băng Cassette', 1, '2023-11-27 12:03:38', '2023-11-27 12:57:17', '1McMsnEElThX1knmY4oliG\r\n', 500, 480000, 480000, 'Olivia Rodrigo - Guts - Băng Cassette - Hãng Đĩa Thời Đại (Times Records) ⭕️ Cassette Store in Saigon - Ho Chi Minh City Vietnam ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/olivia-rodrigo-guts-bang-cassette_alter_a594e3b225ef410684265ee838f09d49_grande.jpg'),
(95, 'OLIVIA RODRIGO - VAMPIRE (SINGLE) ', 'Băng Cassette', 1, '2023-11-27 12:03:38', '2023-11-27 12:57:03', '1McMsnEElThX1knmY4oliG\r\n', 120, 240000, 240000, 'Olivia Rodrigo - Vampire (Single) - Băng Cassette - Hãng Đĩa Thời Đại (Times Records) ⭕️ Cửa hàng băng đĩa nhạc gốc tại Saigon. CD Store in Saigon - Ho Chi Minh City Vietnam ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/olivia-rodrigo_vampire_blood_red_uk_cassette_tape_623ff19d8cab4886ad7427a4a0278464_grande.jpg'),
(96, 'LÂN NHÃ - NHIÊN ', 'Đĩa CD', 1, '2023-11-27 12:03:38', '2023-11-27 12:56:50', '5CGYEvANR5mmYEuQwTYC93\r\n', 320, 300000, 300000, 'Lân Nhã - Nhiên - Đĩa CD - Hãng Đĩa Thời Đại (Times Records)  ⭕️ CD Store in Saigon - Ho Chi Minh City Vietnam ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/lan-nha-nhien-dia-cd_a902efbb617e40b087660afee6e79dda_grande.jpg'),
(97, 'SIMPLE PLAN - HARDER THAN IT LOOKS ', 'Đĩa than', 1, '2023-11-27 12:03:38', '2023-11-27 12:56:35', '2p4FqHnazRucYQHyDCdBrJ\r\n', 200, 700000, 700000, 'Simple Plan - Harder Than It Looks (Vinyl LP) - Đĩa than - Đĩa Than Nhạc US-UK - Hãng Đĩa Thời Đại (Times Records) ⭕️ Saigon Vinyl Records Store in Vietnam / LP Store  ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/simple-plan-harder-than-it-looks-vinyl-lp-dia-than_ba300e87d89f444a9a6757a43d1d141b_grande.jpg'),
(98, 'VAMPIRE WEEKEND - VAMPIRE WEEKEND ', 'Đĩa than', 1, '2023-11-27 12:03:38', '2023-11-27 12:56:18', '5BvJzeQpmsdsFp4HGUYUEx\r\n', 300, 800000, 800000, 'Vampire Weekend - Vampire Weekend (Vinyl LP) - Đĩa Than - Băng Đĩa Nhạc Quốc Tế - Hãng Đĩa Thời Đại (Times Records) ⭕️ LP Store / Record Store in Saigon - Ho Chi Minh City Vietnam ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/vampire-weekend-vampire-weekend-vinyl-lp-dia-than_16d29f75fb0344cb8ffe396db5f8130e_grande.jpg'),
(99, 'ARETHA FRANKLIN - ARETHA WITH THE RAY BRYANT COMBO ', 'Đĩa than', 1, '2023-11-27 12:03:38', '2023-11-27 12:56:04', '7nwUJBm0HE4ZxD3f5cy5ok\r\n', 120, 680000, 680000, 'Aretha Franklin - Aretha with The Ray Bryant Combo (Vinyl LP) - Đĩa Than -  Đĩa Than Nhạc US-UK - Hãng Đĩa Thời Đại (Times Records) ⭕️ Saigon Vinyl Records Store in Vietnam / LP Store  ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/aretha-franklin-aretha-with-the-ray-bryant-combo-vinyl-lp-dia-than_0fdfcd071381402c981541645ed6602c_grande.jpg'),
(100, 'MOMOKO KIKUCHI - ADVENTURE ', 'Đĩa than', 1, '2023-11-27 12:03:38', '2023-11-27 12:55:46', '0gT302jqzDIhNWY8YpzDCs\r\n', 400, 1000000, 1000000, 'Momoko Kikuchi - Adventure (Vinyl LP) - Đĩa Than -  Đĩa Than Nhạc US-UK - Hãng Đĩa Thời Đại (Times Records) ⭕️ Saigon Vinyl Records Store in Vietnam / LP Store  ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/momoko-kikuchi-adventure-vinyl-lp-dia-than_550efe7656584f4496c5ce916c92aa32_grande.jpg'),
(101, 'HOÀNG THUỲ LINH - LINK ', 'Đĩa than', 1, '2023-11-27 12:03:38', '2023-11-27 12:55:33', '0r63ReVRjxrS4ATbLrdcrL\r\n', 450, 1200000, 1200000, 'Hoàng Thuỳ Linh - LINK (A Side B Side Colored Gatefold Vinyl LP) - Đĩa Than Nhạc Việt - Hãng Đĩa Thời Đại (Times Records) ⭕️ Saigon Vinyl Records Store in Vietnam / LP Store  ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/hoang-thuy-linh-link-a-side-b-side-colored-gatefold-vinyl-lp-dia-than_ea3addf35b364b3aabde812c2a4c17e7_grande.jpg'),
(102, 'JETHRO TULL - LIVING WITH THE PAST ', 'Đĩa than', 1, '2023-11-27 12:03:38', '2023-11-27 12:55:19', '6w6z8m4WXX7Tub4Rb6Lu7R\r\n', 240, 950000, 950000, 'Jethro Tull - Living With The Past (Vinyl 2LP) - Đĩa Than -  Đĩa Than Nhạc US-UK - Hãng Đĩa Thời Đại (Times Records) ⭕️ Saigon Vinyl Records Store in Vietnam / LP Store  ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/jethro-tull-living-with-the-past-vinyl-2lp-dia-than_ccbb954c48cf4344891ab50e7a3c9a65_grande.jpg'),
(103, 'TAYLOR SWIFT - 1989 (TAYLOR VERSION) (TARGET EXCLUSIVE) ', 'Đĩa CD', 1, '2023-11-27 12:03:38', '2023-11-27 12:55:01', '06HL4z0CvFAxyc27GXpf02\r\n', 300, 450000, 450000, 'Taylor Swift - 1989 (Taylor Version) (Target Exclusive) - Đĩa CD - Hãng Đĩa Thời Đại (Times Records)  ⭕️ CD Store in Saigon - Ho Chi Minh City Vietnam ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/taylor-swift-1989-taylor-s-version-target-exclusive-dia-cd-pink_ebf6d60943804fa4b3a148cb978669e4_grande.jpeg'),
(104, 'BONEY M. - RIVERS OF BABYLON ', 'Đĩa CD', 1, '2023-11-27 12:03:38', '2023-11-27 12:54:47', '54R6Y0I7jGUCveDTtI21nb\r\n', 250, 290000, 290000, 'Boney M. - Rivers of Babylon - Đĩa CD - Hãng Đĩa Thời Đại (Times Records)  ⭕️ CD Store in Saigon - Ho Chi Minh City Vietnam ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/boney-m-rivers-of-babylon-dia-cd_98addb0b820645dd815c1733622f87dd_grande.jpg'),
(105, 'TLINH - \"ÁI\" ALBUM (STANDARD VER.) ', 'Đĩa CD', 1, '2023-11-27 12:03:38', '2023-11-27 12:54:32', '3diftVOq7aEIebXKkC34oR\r\n', 550, 300000, 300000, 'tlinh - \"ái\" album (Standard Ver.): Ấn bản vật lý của album phòng thu đầu tay của tlinh do Ais Label & Hãng Đĩa Thời Đại sản xuất dự kiến sẽ phát hành vào trung tuần tháng 09/2023.', 'https://product.hstatic.net/1000304920/product/1_7ab514a9f6a34536890cc20fe7aa4327_grande.jpg'),
(106, 'THIỀU BẢO TRÂM - CHẮC ANH CÓ NỖI KHỔ TÂM (SINGLE) -', 'Đĩa CD', 1, '2023-11-27 12:03:38', '2023-11-27 12:54:19', '6RUfMGubOnHT1p3nfeXpBl\r\n', 333, 180000, 180000, 'THIỀU BẢO TRÂM <CHẮC ANH CÓ NỖI KHỔ TÂM> CD SINGLE\r\n📍 Audio & MV: 20.08.2023  |  19:00\r\n💿 CD Single: 26.08.2023', 'https://product.hstatic.net/1000304920/product/thieu-bao-tram_chac-anh-co-noi-kho-tam-cd-single_fadd37c4ff75431eafdefd9fea91b0da_grande.jpg'),
(107, 'HOÀNG THUỲ LINH - LINK ', 'Băng Cassette', 1, '2023-11-27 12:03:39', '2023-12-03 08:08:23', '0r63ReVRjxrS4ATbLrdcrL\r\n', 798, 350000, 450000, 'Hoàng Thuỳ Linh - LINK (A Side B Side Colored Gatefold Vinyl LP) - Đĩa Than Nhạc Việt - Hãng Đĩa Thời Đại (Times Records) ⭕️ Saigon Vinyl Records Store in Vietnam / LP Store  ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/hoang-thuy-linh-link-a-side-b-side-colored-gatefold-vinyl-lp-dia-than_ea3addf35b364b3aabde812c2a4c17e7_grande.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `album_physical_details`
--

CREATE TABLE `album_physical_details` (
  `id` int(11) NOT NULL,
  `album_physi_id` int(11) NOT NULL,
  `variant_name` varchar(255) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `variant_price` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `album_physical_details`
--

INSERT INTO `album_physical_details` (`id`, `album_physi_id`, `variant_name`, `stock_quantity`, `variant_price`, `created_at`, `updated_at`) VALUES
(5, 107, 'Platinum Silver Version', 198, 450000, '2023-12-03 08:08:23', '2023-12-03 01:08:23'),
(6, 107, 'Special Gold Version', 200, 450000, '2023-11-27 12:24:58', '2023-11-27 12:24:58'),
(7, 107, 'Burnt Orange', 200, 350000, '2023-11-27 12:24:58', '2023-11-27 12:24:58'),
(8, 107, 'Rufous Red', 200, 350000, '2023-11-27 12:24:58', '2023-11-27 12:24:58');

--
-- Triggers `album_physical_details`
--
DELIMITER $$
CREATE TRIGGER `update_max_price` AFTER INSERT ON `album_physical_details` FOR EACH ROW BEGIN
  DECLARE max_variant_price DECIMAL(10,2);
  SET max_variant_price = (SELECT MAX(variant_price) FROM album_physical_details WHERE album_physi_id = NEW.album_physi_id);
  UPDATE album_physical SET max_price = max_variant_price WHERE album_physi_id = NEW.album_physi_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_min_price` AFTER INSERT ON `album_physical_details` FOR EACH ROW BEGIN
  DECLARE min_variant_price DECIMAL(10,2);
  SET min_variant_price = (SELECT MIN(variant_price) FROM album_physical_details WHERE album_physi_id = NEW.album_physi_id);
  UPDATE album_physicals SET min_price = min_variant_price WHERE album_physi_id = NEW.album_physi_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_quantity` AFTER INSERT ON `album_physical_details` FOR EACH ROW BEGIN
  DECLARE total_stock_quantity INT;
  SET total_stock_quantity = (SELECT SUM(stock_quantity) FROM album_physical_details WHERE album_physi_id = NEW.album_physi_id);
  UPDATE album_physicals SET quantity = total_stock_quantity WHERE album_physi_id = NEW.album_physi_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_quantity2` AFTER UPDATE ON `album_physical_details` FOR EACH ROW BEGIN
  DECLARE total_stock_quantity INT;
  SET total_stock_quantity = (SELECT SUM(stock_quantity) FROM album_physical_details WHERE album_physi_id = NEW.album_physi_id);
  UPDATE album_physicals SET quantity = total_stock_quantity WHERE album_physi_id = NEW.album_physi_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `artirsts`
--

CREATE TABLE `artirsts` (
  `artirst_id` varchar(100) NOT NULL,
  `artirst_name` varchar(255) NOT NULL,
  `gerne` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `public_year` date NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `favorite_id` int(11) NOT NULL,
  `song_id` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `followed_artists`
--

CREATE TABLE `followed_artists` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `artist_id` varchar(255) DEFAULT NULL,
  `follow_at` date NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `followed_artists`
--

INSERT INTO `followed_artists` (`id`, `user_id`, `artist_id`, `follow_at`, `updated_at`, `created_at`) VALUES
(1, '1', '7yquVKfxBuNFJbG9cy2R8A', '2023-11-19', '2023-11-20 09:22:47', '2023-11-20 09:23:43'),
(2, '1', '6NF9Oa4ThQWCj6mogFSrVD', '2023-11-19', '2023-11-20 09:22:47', '2023-11-20 09:23:43'),
(3, '1', '0ZbgKh0FgPYeFP38nVaEGp', '2023-10-19', '2023-11-20 09:22:47', '2023-11-20 09:23:43'),
(4, '1', '23xCr75lKvnFvKi8ImHE7S', '2023-10-20', '2023-11-20 09:22:47', '2023-11-20 09:23:43'),
(6, '1', '30eFAXoU2kTjJPf2cq80B8', '2023-11-20', '2023-11-20 02:26:14', '2023-11-20 02:26:14'),
(13, '1', '0hy8mfXxfD8kQ6MRQkDVrn', '2023-11-20', '2023-11-20 02:56:41', '2023-11-20 02:56:41'),
(15, '1', '5M3ffmRiOX9Q8Y4jNeR5wu', '2023-11-20', '2023-11-20 03:02:01', '2023-11-20 03:02:01'),
(17, '1', '3rU7fyuGPizGdpioF5FSzC', '2023-11-20', '2023-11-20 03:17:07', '2023-11-20 03:17:07'),
(18, '1', '3JsHnjpbhX4SnySpvpa9DK', '2023-11-20', '2023-11-20 04:51:27', '2023-11-20 04:51:27'),
(19, '1', '66CXWjxzNUsdJxJ2JdwvnR', '2023-11-20', '2023-11-20 04:51:41', '2023-11-20 04:51:41'),
(20, '1', '1Xyo4u8uXC1ZmMpatF05PJ', '2023-11-20', '2023-11-20 04:51:47', '2023-11-20 04:51:47');

-- --------------------------------------------------------

--
-- Table structure for table `histories`
--

CREATE TABLE `histories` (
  `id` int(11) NOT NULL,
  `song_id` varchar(100) DEFAULT NULL,
  `user_id` varchar(100) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `histories`
--

INSERT INTO `histories` (`id`, `song_id`, `user_id`, `updated_at`, `created_at`) VALUES
(1, '53zusvCJkyGYjEZ6bnLIjh', '1', '2023-11-19 23:39:28', '2023-11-20 05:39:59'),
(2, '5106KTen3ogiqKTYXnPbsW', '1', '2023-11-19 17:00:00', '2023-11-20 05:39:59'),
(3, '2KN0NNlxStccgt4GGtOmxk', '1', '2023-11-18 17:00:00', '2023-11-20 05:39:59'),
(4, '3QD2NfLEIvMRbzv2uTu4B7', '1', '2023-11-20 23:04:55', '2023-11-20 05:39:59'),
(5, '1xoadYaxtOp9gHDwgmPDuz', '1', '2023-11-23 07:35:37', '2023-11-20 05:39:59'),
(6, '1MiJk3dXC5jzhvLFP0dUM7', '1', '2023-11-23 10:24:49', '2023-11-20 05:39:59'),
(77, '2N0SPREDYqILVEFSsWF5N5', '1', '2023-11-20 14:39:13', '2023-11-19 23:30:11'),
(78, '3Ua0m0YmEjrMi9XErKcNiR', '1', '2023-11-20 15:10:43', '2023-11-19 23:35:13'),
(79, '3un8UkiPHJjlsrTHQnisXH', '1', '2023-11-23 23:57:46', '2023-11-20 06:38:29'),
(80, '0lizgQ7Qw35od7CYaoMBZb', '1', '2023-11-21 10:22:03', '2023-11-20 08:01:43'),
(81, '6KgZf5gZgF1KLNxq1qZgHP', '1', '2023-11-23 10:24:55', '2023-11-20 18:07:03'),
(82, '3rUGC1vUpkDG9CZFHMur1t', '1', '2023-11-23 02:43:35', '2023-11-20 18:18:31'),
(83, '4xhsWYTOGcal8zt0J161CU', '1', '2023-11-23 02:42:06', '2023-11-20 18:20:43'),
(84, '4CljUDO1I5hpKjwSNK6RWY', '1', '2023-11-23 02:04:55', '2023-11-20 18:23:02'),
(85, '5J3m0taZ0W1E9HTE0MwcSv', '1', '2023-11-23 10:29:50', '2023-11-20 20:32:28'),
(86, '4W4fNrZYkobj539TOWsLO2', '1', '2023-11-24 01:27:19', '2023-11-20 20:43:21'),
(87, '2JuHIbFudHwDqQssgqsH3i', '1', '2023-11-23 23:57:53', '2023-11-20 20:44:13'),
(88, '5cF0dROlMOK5uNZtivgu50', '1', '2023-11-22 06:47:38', '2023-11-20 20:46:16'),
(89, '5Odq8ohlgIbQKMZivbWkEo', '1', '2023-11-20 13:50:32', '2023-11-20 20:49:45'),
(90, '2doGmsaPLdot51o80juiYU', '1', '2023-11-23 10:29:38', '2023-11-20 20:50:54'),
(91, '7D9tiidrBDQRgCENeIhko0', '1', '2023-11-23 10:35:03', '2023-11-20 20:51:41'),
(92, '4jWmhzf53Q0ZvZMuGdiR9x', '1', '2023-11-23 10:29:49', '2023-11-20 20:52:04'),
(93, '7mA9oPfWSMXKOdPZqyow55', '1', '2023-11-20 13:52:14', '2023-11-20 20:52:14'),
(94, '45Mswno1F7FoZkcmQkp7fi', '1', '2023-11-20 13:54:30', '2023-11-20 20:54:30'),
(95, '29WxJqIfDRMo9isV07kbJP', '1', '2023-11-20 14:09:42', '2023-11-20 21:05:23'),
(96, '210JJAa9nJOgNa0YNrsT5g', '2', '2023-11-23 11:25:16', '2023-11-20 21:06:43'),
(97, '2KslE17cAJNHTsI2MI0jb2', '1', '2023-11-21 22:45:27', '2023-11-20 21:29:02'),
(98, '2HRgqmZQC0MC7GeNuDIXHN', '1', '2023-11-20 14:30:04', '2023-11-20 21:30:01'),
(99, '0kHgteR4TV4LO80wrasDSR', '1', '2023-11-23 10:29:25', '2023-11-20 21:57:52'),
(100, '4CUvVaAYuXtvYURLFz7EIL', '1', '2023-11-23 07:40:30', '2023-11-20 22:08:56'),
(101, '4acXEYw7ayyJnm9GXDrqiL', '1', '2023-11-23 23:58:20', '2023-11-20 22:09:27'),
(102, '1BxfuPKGuaTgP7aM0Bbdwr', '1', '2023-11-23 05:44:29', '2023-11-20 22:09:55'),
(103, '5odlY52u43F5BjByhxg7wg', '1', '2023-11-20 23:02:16', '2023-11-21 06:02:15'),
(104, '0SLhB9JLM4Ksz1XdwK3aQD', '1', '2023-11-21 01:24:05', '2023-11-21 08:22:35'),
(105, '0ZP4bO2ywAv44HiEzzHaq5', '1', '2023-11-21 08:01:33', '2023-11-21 15:01:34'),
(106, '3i6VNcn9dFpU1K2ZaMFHTC', '1', '2023-11-23 10:29:29', '2023-11-23 07:53:18'),
(107, '07tiPBhMqiKqHowwqDBtfK', '1', '2023-11-23 10:30:00', '2023-11-23 07:53:22'),
(108, '6xXCn7H2Yl8SDD6jxo5SpN', '1', '2023-11-23 10:29:50', '2023-11-23 07:56:06'),
(109, '4OMJGnvZfDvsePyCwRGO7X', '1', '2023-11-23 01:03:55', '2023-11-23 08:03:55'),
(110, '7dJYggqjKo71KI9sLzqCs8', '1', '2023-11-23 01:47:24', '2023-11-23 08:03:57'),
(111, '5Se32hEA9raeboZerywxka', '1', '2023-11-23 02:42:01', '2023-11-23 08:06:07'),
(112, '5SFCEkybGYmmzKqewtDEaN', '1', '2023-11-23 02:43:45', '2023-11-23 08:07:26'),
(113, '5qbjUmVV1yOOjcMOInNPYD', '1', '2023-11-23 07:40:20', '2023-11-23 08:27:11'),
(114, '0gzpqwLf1jhNjnSJEyweAX', '1', '2023-11-23 23:57:54', '2023-11-23 08:30:49'),
(115, '05X3a0YGmS1rbH50aL8lGF', '1', '2023-11-23 10:24:50', '2023-11-23 08:34:39'),
(116, '7tFwBnuaGXqiiONukPRaCo', '1', '2023-11-23 23:57:57', '2023-11-23 08:36:21'),
(117, '5mjYQaktjmjcMKcUIcqz4s', '1', '2023-11-23 01:47:42', '2023-11-23 08:47:21'),
(118, '1Iq8oo9XkmmvCQiGOfORiz', '1', '2023-11-23 01:48:04', '2023-11-23 08:48:04'),
(119, '7uoFMmxln0GPXQ0AcCBXRq', '1', '2023-11-23 10:22:24', '2023-11-23 09:14:33'),
(120, '45bE4HXI0AwGZXfZtMp8JR', '1', '2023-11-23 07:43:38', '2023-11-23 09:15:17'),
(121, '5gzEL5O1ubbtIHUhLkSMTz', '1', '2023-11-23 02:42:16', '2023-11-23 09:22:42'),
(122, '5FDc4ljIWyW8wClzt54dhs', '1', '2023-11-23 02:42:25', '2023-11-23 09:22:48'),
(123, '6wsqVwoiVH2kde4k4KKAFU', '1', '2023-11-23 02:43:45', '2023-11-23 09:27:25'),
(124, '2YSzYUF3jWqb9YP9VXmpjE', '1', '2023-11-23 02:27:32', '2023-11-23 09:27:31'),
(125, '7aqfrAY2p9BUSiupwk3svU', '1', '2023-11-23 02:42:30', '2023-11-23 09:28:06'),
(126, '0eO8MW9YSTK3CjdaTYKlhF', '1', '2023-11-23 02:43:20', '2023-11-23 09:28:11'),
(127, '0zbGWzQkLY5wn4xyiLYEi0', '1', '2023-11-23 02:42:26', '2023-11-23 09:42:25'),
(128, '2Gk6fi0dqt91NKvlzGsmm7', '1', '2023-11-23 02:43:08', '2023-11-23 09:43:08'),
(129, '4367dXCt02KMgELPisJ2D4', '1', '2023-11-23 02:43:34', '2023-11-23 09:43:22'),
(130, '0Qs29ApstkrU5T8S5Hxazw', '1', '2023-11-23 10:24:14', '2023-11-23 09:44:29'),
(131, '6jcLKVmEKAQIXIVHJZ8vzS', '1', '2023-11-23 10:24:38', '2023-11-23 09:45:22'),
(132, '5Um995yUx3GSJ6uNOMaaP4', '1', '2023-11-23 07:41:00', '2023-11-23 09:45:26'),
(133, '6dRV27RhoSZxfLju2nKw3R', '1', '2023-11-23 10:22:24', '2023-11-23 09:48:28'),
(134, '4pVdTj38qEwfPNjv1LYbu0', '1', '2023-11-23 02:48:46', '2023-11-23 09:48:46'),
(135, '4YUiJ6Av2Hp1hiWE9eeAjO', '1', '2023-11-23 02:55:22', '2023-11-23 09:48:54'),
(136, '0T5iIrXA4p5GsubkhuBIKV', '1', '2023-11-23 06:40:17', '2023-11-23 09:51:13'),
(137, '3W4U7TEgILGpq0EmquurtH', '1', '2023-11-23 02:51:25', '2023-11-23 09:51:25'),
(138, '0lx2cLdOt3piJbcaXIV74f', '1', '2023-11-23 07:44:00', '2023-11-23 09:51:26'),
(139, '3FAJ6O0NOHQV8Mc5Ri6ENp', '1', '2023-11-23 05:55:14', '2023-11-23 09:51:31'),
(140, '27Z9T0mSWHYWSj9SNOGvyt', '1', '2023-11-23 02:51:33', '2023-11-23 09:51:33'),
(141, '3CyGK8BeJ5iCunpzvHyINs', '1', '2023-11-23 10:33:16', '2023-11-23 09:55:07'),
(142, '1fh5Sf3fFESFOS8D82RQiI', '1', '2023-11-23 07:43:06', '2023-11-23 12:42:36'),
(143, '25h0TqC9H3BcMA7KjK5nHK', '1', '2023-11-23 07:35:08', '2023-11-23 12:44:25'),
(144, '5J90ah0ppUSev1uahqQiN6', '1', '2023-11-23 10:24:38', '2023-11-23 12:49:10'),
(145, '4vKDkAtjNPvD3nSizQdyTk', '1', '2023-11-23 10:29:38', '2023-11-23 12:53:56'),
(146, '6oBB4HhlDGK4TtCvb6iclJ', '1', '2023-11-23 06:04:51', '2023-11-23 12:55:01'),
(147, '2bdVgAQgosGUJoViVDNeOV', '1', '2023-11-23 05:55:08', '2023-11-23 12:55:08'),
(148, '4pvb0WLRcMtbPGmtejJJ6y', '1', '2023-11-23 05:55:38', '2023-11-23 12:55:39'),
(149, '18uwL0vNUanqZH0ro2QcOP', '1', '2023-11-23 05:56:27', '2023-11-23 12:55:39'),
(150, '3YctJXK6kznnWl68TnYobN', '1', '2023-11-23 07:35:19', '2023-11-23 12:56:42'),
(151, '2cy0YoKwF55W5jL3VIzgm2', '1', '2023-11-23 07:35:30', '2023-11-23 12:56:48'),
(152, '7bFFUPBiF15n8m8RziqS4o', '1', '2023-11-23 05:56:52', '2023-11-23 12:56:52'),
(153, '4AgFXIVT7hVhBZ5DEOaLu3', '1', '2023-11-23 07:36:00', '2023-11-23 12:56:55'),
(154, '0xi7bCx9m2rgPbCN6Xhlel', '1', '2023-11-23 07:35:43', '2023-11-23 12:57:03'),
(155, '3kxFvcB92qQg9wl52CQ7aV', '1', '2023-11-23 07:13:14', '2023-11-23 14:13:14'),
(156, '4ZOCzRRThD32cGu8aeqOBb', '1', '2023-11-23 07:16:34', '2023-11-23 14:16:32'),
(157, '4Iz5EWPCAT8jYNk4IpLoll', '1', '2023-11-23 10:24:14', '2023-11-23 14:30:46'),
(158, '5iZHnufFUgATzrpGgH1K0W', '1', '2023-11-23 10:24:45', '2023-11-23 14:30:52'),
(159, '7AD5F85waSb3yZxZxEXhJM', '1', '2023-11-23 07:35:34', '2023-11-23 14:35:34'),
(160, '11hcyWq7qSwBE3bvv5Ialn', '1', '2023-11-23 07:35:41', '2023-11-23 14:35:41'),
(161, '3LfiZlWffAqGOAQ6sKjoJP', '1', '2023-11-23 07:35:44', '2023-11-23 14:35:44'),
(162, '76dD9BdSOzsRJSGGBjOcUf', '1', '2023-11-23 07:35:47', '2023-11-23 14:35:47'),
(163, '5BTzf3doGTigDIYUFtbkI9', '1', '2023-11-23 07:35:52', '2023-11-23 14:35:52'),
(164, '6iXGivPFpsqKmrINhIbPvx', '1', '2023-11-23 07:38:06', '2023-11-23 14:36:07'),
(165, '4Dvkj6JhhA12EX05fT7y2e', '1', '2023-11-23 07:50:21', '2023-11-23 14:50:20'),
(166, '7wj9sGlHGTMQ28liyi48hz', '1', '2023-11-23 10:24:49', '2023-11-23 17:24:49'),
(167, '7uMWQeSrwyvaSzFIme9iCG', '1', '2023-11-23 23:58:21', '2023-11-24 06:58:21'),
(168, '048dxNqgKzQGMcyojw7zyp', '1', '2023-11-24 00:01:12', '2023-11-24 06:59:25'),
(169, '1D9QWphMtRcxYybdzM6JUa', '1', '2023-11-24 00:01:12', '2023-11-24 07:01:12'),
(170, '6TOI8hhlfebwsTYRCVpRMn', '1', '2023-11-24 00:01:14', '2023-11-24 07:01:14'),
(171, '5TK00jepsIqLJbnnOrtjv1', '1', '2023-11-24 00:04:01', '2023-11-24 07:04:01'),
(172, '2nFXaYb2fWOoUJXMPb6y4C', '1', '2023-11-24 01:10:58', '2023-11-24 07:04:06');

-- --------------------------------------------------------

--
-- Table structure for table `liked_songs`
--

CREATE TABLE `liked_songs` (
  `id` int(11) NOT NULL,
  `song_id` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `liked_songs`
--

INSERT INTO `liked_songs` (`id`, `song_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '3un8UkiPHJjlsrTHQnisXH', '1', '2023-11-20 19:46:03', '2023-11-20 19:46:03'),
(2, '2KslE17cAJNHTsI2MI0jb2', '1', '2023-11-19 19:59:41', '2023-10-20 19:59:41'),
(9, '4W4fNrZYkobj539TOWsLO2', '1', '2023-11-20 13:38:30', '2023-11-20 13:38:30'),
(10, '5J3m0taZ0W1E9HTE0MwcSv', '1', '2023-11-20 13:39:10', '2023-11-20 13:39:10'),
(11, '210JJAa9nJOgNa0YNrsT5g', '1', '2023-11-23 11:04:37', '2023-11-23 11:04:37'),
(12, '210JJAa9nJOgNa0YNrsT5g', '2', '2023-11-23 11:05:30', '2023-11-23 11:05:30');

-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

CREATE TABLE `playlists` (
  `id` int(11) NOT NULL,
  `title_playlist` varchar(255) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `song_id` varchar(255) DEFAULT NULL,
  `picture` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `playlists`
--

INSERT INTO `playlists` (`id`, `title_playlist`, `user_id`, `created_at`, `updated_at`, `song_id`, `picture`) VALUES
(13, 'Your playlist', '1', '2023-11-23 20:26:02', '2023-11-26 13:20:34', NULL, 0x75706c6f6164732f37653337383766306463316132396337393363363532373661326665653562382e6a7067),
(14, 'Christmas', '1', '2023-11-23 20:32:45', '2023-11-28 17:52:55', '4W4fNrZYkobj539TOWsLO2,6TOI8hhlfebwsTYRCVpRMn,5J3m0taZ0W1E9HTE0MwcSv', 0x7075626c69632f75706c6f6164732f37653337383766306463316132396337393363363532373661326665653562382e6a7067);

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `song_id` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `artirst_id` varchar(100) NOT NULL,
  `album_id` varchar(100) DEFAULT NULL,
  `genre` varchar(20) NOT NULL,
  `release_year` date NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `duration` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `email_confirmed` int(11) DEFAULT NULL,
  `accountTypeID` int(11) DEFAULT NULL,
  `accountStatusID` int(11) DEFAULT NULL,
  `username` varchar(10) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `date_of_birth`, `contact_number`, `email_address`, `email_confirmed`, `accountTypeID`, `accountStatusID`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Nguyen', 'Binh', '2016-11-23', '0123456789', 'nguyen@gmail.com', 1, 4, 2, 'nguyen', '123456', '2023-11-23 06:56:37', '2023-12-05 03:21:57'),
(2, 'John', 'Smith', '2000-11-12', '01943752', 'john@gmail.com', 1, 3, 2, 'test', '123456', '2023-11-23 06:56:37', '2023-12-04 05:15:51'),
(3, 'Man', 'Gia', '2002-11-12', '012345678', '21521115@gm.uit.edu.vn', 1, 3, 2, 'mann312', '123456', '2023-11-23 21:17:12', '2023-12-04 05:15:55'),
(5, 'Lê', 'Quỳnh', '1990-01-01', '0987654321', 'quynhlx@gmail.com', 1, 1, 3, 'quynhlx', 'userpasswo', '2023-12-02 10:00:00', '2023-12-04 05:15:57'),
(6, 'Nguyễn', 'Hằng', '1992-02-02', '0123456789', 'hangnt@gmail.com', 1, 1, 4, 'hangnt', 'userpasswo', '2023-12-02 10:00:00', '2023-12-04 05:16:02'),
(7, 'Trần', 'Đức', '1994-03-03', '0987654321', 'ducvt@gmail.com', 1, 1, 1, 'ducvt', 'userpasswo', '2023-12-02 10:00:00', '2023-12-03 01:10:02'),
(8, 'Nguyễn', 'Hương', '1990-01-01', '0901234567', 'nguyenvana@gmail.com', 1, 1, 4, 'nguyenvana', 'password12', '2023-11-30 19:30:00', '2023-12-04 05:19:37'),
(9, 'Lê', 'Xuân Quỳnh', '1991-02-02', '0912345678', 'nguyenvanb@gmail.com', 1, 1, 2, 'nguyenvanb', 'password45', '2023-12-02 00:45:00', '2023-12-04 05:20:03'),
(10, 'Vương', 'Văn', '1992-03-03', '0923456789', 'nguyenvanc@gmail.com', 1, 1, 1, 'nguyenvanc', 'password78', '2023-12-03 06:15:00', '2023-12-03 06:15:00'),
(11, 'Nguyễn', 'Hà', '1993-04-04', '0934567890', 'nguyenvand@gmail.com', 1, 1, 1, 'nguyenvand', 'passwordab', '2023-12-03 22:00:00', '2023-12-03 22:00:00'),
(12, 'Nguyễn', 'Bình', '1994-05-05', '0945678901', 'nguyenvane@gmail.com', 1, 1, 1, 'nguyenvane', 'passwordde', '2023-12-05 04:20:00', '2023-12-05 04:20:00'),
(13, 'Nguyễn', 'Thắng', '1995-06-06', '0956789012', 'nguyenvanf@gmail.com', 1, 1, 1, 'nguyenvanf', 'passwordgh', '2023-12-05 17:10:00', '2023-12-05 17:10:00'),
(14, 'Nguyễn', 'Hữu Thắng', '1996-07-07', '0967890123', 'nguyenvang@gmail.com', 1, 1, 1, 'nguyenvang', 'passwordjk', '2023-12-07 01:50:00', '2023-12-07 01:50:00'),
(15, 'Nguyễn', 'Nguyên Hà', '1997-08-08', '0978901234', 'nguyenvanh@gmail.com', 1, 1, 1, 'nguyenvanh', 'passwordmn', '2023-12-07 20:25:00', '2023-12-07 20:25:00'),
(16, 'Nguyễn', 'Mỹ Linh', '1998-09-09', '0989012345', 'nguyenvani@gmail.com', 1, 1, 1, 'nguyenvani', 'passwordpq', '2023-12-09 02:40:00', '2023-12-09 02:40:00'),
(17, 'Ninh', 'Dương Lan Ngọc', '1999-10-10', '0990123456', 'nguyenvanj@gmail.com', 1, 1, 1, 'nguyenvanj', 'passwordst', '2023-12-09 21:55:00', '2023-12-09 21:55:00'),
(18, 'Man', 'Gia', '0000-00-00', '902999472', 'manlun0902@gmail.com', 1, 2, 1, 'mannn', '123456', '2023-12-04 04:23:57', '2023-12-04 04:23:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_status`
--
ALTER TABLE `account_status`
  ADD PRIMARY KEY (`account_status_id`);

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`account_type_id`);

--
-- Indexes for table `album_order_details`
--
ALTER TABLE `album_order_details`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `FK_Order_Album` (`album_physi_id`),
  ADD KEY `PK_Order_Detail` (`order_id`);

--
-- Indexes for table `album_physicals`
--
ALTER TABLE `album_physicals`
  ADD PRIMARY KEY (`album_physi_id`),
  ADD KEY `FK_User_Album` (`user_id`);

--
-- Indexes for table `album_physical_details`
--
ALTER TABLE `album_physical_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Album` (`album_physi_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`favorite_id`);

--
-- Indexes for table `followed_artists`
--
ALTER TABLE `followed_artists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `histories`
--
ALTER TABLE `histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `liked_songs`
--
ALTER TABLE `liked_songs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `PK_Account_Type` (`accountTypeID`),
  ADD KEY `PK_Account_Status` (`accountStatusID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album_order_details`
--
ALTER TABLE `album_order_details`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
