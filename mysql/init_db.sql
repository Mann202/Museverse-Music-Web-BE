-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Dec 20, 2023 at 06:04 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `museverse1`
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
(39, 'Nguyên Nguyễn', 'nbnguyen1100@gmail.com', '0123456', 'Xã Tô Mậu, Huyện Lục Yên, Tỉnh Yên Bái', 3, NULL, 0, 0, '2023-12-12 03:32:10', '2023-12-12 03:32:27', 300000),
(40, 'Nguyên Nguyễn', 'nbnguyen1100@gmail.com', '0987657', 'Xã Phú Xá, Huyện Cao Lộc, Tỉnh Lạng Sơn', 3, NULL, 0, 0, '2023-12-12 03:32:27', '2023-12-12 03:33:01', 1150000),
(70, 'Nguyen00 Binh', 'nguyen00@gmail.com', '0123456789', 'Xã Xương Thịnh, Huyện Cẩm Khê, Tỉnh Phú Thọ', 8, NULL, 0, 0, '2023-12-12 14:02:23', '2023-12-12 14:04:42', 450000),
(71, NULL, NULL, NULL, NULL, 8, NULL, 1, 0, '2023-12-12 14:04:42', '2023-12-12 14:04:42', NULL),
(75, 'Nguyên Nguyễn', 'nbnguyen1100@gmail.com', '0123456789', 'Xã Quảng Thành, Huyện Hải Hà, Tỉnh Quảng Ninh', 3, NULL, 0, 0, '2023-12-17 05:13:38', '2023-12-17 05:13:51', 2300000),
(76, 'Nguyên Nguyễn', 'nbnguyen1100@gmail.com', '0123456789', 'Xã Lệ Viễn, Huyện Sơn Động, Tỉnh Bắc Giang', 3, NULL, 0, 300000, '2023-12-17 05:13:51', '2023-12-17 05:14:56', 1150000),
(77, NULL, NULL, NULL, NULL, 3, NULL, 1, 300000, '2023-12-17 05:14:56', '2023-12-17 05:14:56', NULL),
(79, NULL, NULL, NULL, NULL, 2, NULL, 1, 5782000, '2023-12-17 12:02:53', '2023-12-18 08:31:51', NULL);

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
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `album_order_details`
--

INSERT INTO `album_order_details` (`detail_id`, `order_id`, `album_physi_id`, `price`, `num`, `total_money`, `created_at`, `updated_at`, `order_status`) VALUES
(97, 39, 77, 300000, 1, 300000, '2023-12-12 03:32:10', '2023-12-12 03:32:27', 0),
(98, 40, 76, 1150000, 1, 1150000, '2023-12-12 03:32:42', '2023-12-12 03:33:01', 0),
(144, 70, 107, 350000, 1, 450000, '2023-12-12 14:04:39', '2023-12-12 14:04:42', 0),
(151, 75, 76, 1150000, 2, 2300000, '2023-12-17 05:13:38', '2023-12-17 05:13:51', 0),
(152, 77, 77, 300000, 1, 300000, '2023-12-17 05:14:27', '2023-12-17 05:14:56', 1),
(153, 76, 107, 450000, 1, 450000, '2023-12-17 05:14:38', '2023-12-17 05:14:56', 0),
(154, 76, 107, 350000, 2, 700000, '2023-12-17 05:14:41', '2023-12-17 05:14:56', 0),
(155, 79, 76, 1150000, 5, 5750000, '2023-12-17 12:02:53', '2023-12-17 12:02:55', 1),
(156, 79, 78, 2000, 1, 2000, '2023-12-17 12:30:18', '2023-12-17 12:30:18', 1),
(157, 79, 78, 10000, 3, 30000, '2023-12-17 12:54:57', '2023-12-18 08:31:51', 1);

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
  SET total_m = (SELECT SUM(total_money) FROM album_order_details WHERE order_id = NEW.order_id and order_status=1);
  UPDATE album_orders SET total = total_m WHERE order_id = NEW.order_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_total` AFTER UPDATE ON `album_order_details` FOR EACH ROW BEGIN
  DECLARE total_m INT;
  SET total_m = (SELECT SUM(total_money) FROM album_order_details WHERE order_id = NEW.order_id and order_status=1);
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
(76, 'PRINCE - THE HITS 1', 'Đĩa CD', 1, '2023-11-27 12:03:37', '2023-12-17 05:13:51', '5a2EaR3hamoenG9rDuVn8j\r\n', 116, 1150000, 1150000, 'Prince - The Hits 1 (Vinyl 2LP) - Đĩa Than - Băng Đĩa Nhạc Quốc Tế - Hãng Đĩa Thời Đại (Times Records) ⭕️ LP Store / Record Store in Saigon - Ho Chi Minh City Vietnam ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/prince-the-hits-1-vinyl-2lp-dia-than_1c763c2830c34684bc365089f83e3e68_grande.jpg'),
(77, 'MÈOW LẠC - SUGAR RUSH (THE 2ND ALBUM) ', 'Đĩa CD', 1, '2023-11-27 12:03:37', '2023-12-12 03:32:27', '1984OVQ0KnJW80MiZYOrFF\r\n', 117, 300000, 300000, 'Mèow Lạc - Sugar Rush (The 2nd Album) - Đĩa CD - Hãng Đĩa Thời Đại (Times Records)  ⭕️ CD Store in Saigon - Ho Chi Minh City Vietnam ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/20231119_meow-lac_sugar_rush-mock_up_29c31a8e2c8d47b1a3329d6f1e29d19a_grande.png'),
(78, 'GIÁNG SON - SING MY SOL', 'Đĩa CD', 1, '2023-11-27 12:03:37', '2023-12-17 12:54:23', '15YEEmU7WkJL0FYMIBXUbd\r\n', 297, 10000, 10000, 'Giáng Son - Sing My Sol - Đĩa CD - Hãng Đĩa Thời Đại (Times Records)  ⭕️ CD Store in Saigon - Ho Chi Minh City Vietnam ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/mockup_db143848b3fb4636a748d1eb3aacab9a_grande.jpeg'),
(79, 'PHẠM HOÀI NAM - NGƯỜI GIỮ KÝ ỨC ', 'Đĩa CD', 1, '2023-11-27 12:03:37', '2023-11-27 13:03:23', '1E6UYLIV5yRqnF1FFM97g3\r\n', 111, 300000, 300000, 'Phạm Hoài Nam - Người Giữ Ký Ức - Đĩa CD - Hãng Đĩa Thời Đại (Times Records)  ⭕️ CD Store in Saigon - Ho Chi Minh City Vietnam ⭕️ Hotline: 0903.088.038. Dự kiến sẽ phát hành vào 14/11/2023.', 'https://product.hstatic.net/1000304920/product/nguoigiukyuc_bd73ab0ce8634f75affa319c2185b569_grande.jpeg'),
(80, 'THE KILLERS - WONDERFUL WONDERFUL  ', 'Đĩa than', 1, '2023-11-27 12:03:37', '2023-12-12 13:41:00', '0C0XlULifJtAgn6ZNCW2eu\r\n', 93, 750000, 750000, 'The Killers - Wonderful Wonderful (Vinyl LP) - Đĩa than - Đĩa Than Nhạc US-UK - Hãng Đĩa Thời Đại (Times Records) ⭕️ Saigon Vinyl Records Store in Vietnam / LP Store  ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/the-killers-wonderful-wonderful-lp_1024x1024_b1207d92521a4b788e2f8ab5eff99cf5_grande.jpg'),
(81, 'ARCA - KICK IIII ', 'Đĩa than', 1, '2023-11-27 12:03:37', '2023-12-12 13:22:09', '4SQdUpG4f7UbkJG3cJ2Iyj\r\n', 120, 750000, 750000, 'Arca - kick iiii (Vinyl LP) - Đĩa Than - Băng Đĩa Nhạc Quốc Tế - Hãng Đĩa Thời Đại (Times Records) ⭕️ LP Store / Record Store in Saigon - Ho Chi Minh City Vietnam ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/arca-kick-iiii-vinyl-lp-dia-than_b7d3e54a13874173bbddd413f3b4e9df_grande.jpg'),
(82, 'MAC MILLER - CIRCLES ', 'Đĩa than', 1, '2023-11-27 12:03:37', '2023-12-12 13:59:59', '3e7awlrlDSwF3iM0WBjGMp\r\n', 247, 1250000, 1250000, 'Mac Miller - Circles (Vinyl 2LP) - Đĩa Than - Băng Đĩa Nhạc Quốc Tế - Hãng Đĩa Thời Đại (Times Records) ⭕️ LP Store / Record Store in Saigon - Ho Chi Minh City Vietnam ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/mac-miller-circles-vinyl-2lp-dia-than_ed6c462f3024466b90fcb04761df4ce0_grande.jpg'),
(83, 'LITTLE MIX - LM5 ', 'Đĩa CD', 1, '2023-11-27 12:03:37', '2023-12-12 13:48:36', '3e7awlrlDSwF3iM0WBjGMp\r\n', 198, 350000, 350000, 'Little Mix - LM5 - Đĩa CD - Hãng Đĩa Thời Đại (Times Records) - Cửa hàng băng đĩa gốc nhạc quốc tế ⭕️ CD Store in Saigon  ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/little-mix-lm5-dia-cd_353685b38bd04d7f98f3282c5f9ee001_grande.jpeg'),
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
(107, 'HOÀNG THUỲ LINH - LINK ', 'Băng Cassette', 1, '2023-11-27 12:03:39', '2023-12-17 05:14:56', '0r63ReVRjxrS4ATbLrdcrL\r\n', 778, 350000, 450000, 'Hoàng Thuỳ Linh - LINK (A Side B Side Colored Gatefold Vinyl LP) - Đĩa Than Nhạc Việt - Hãng Đĩa Thời Đại (Times Records) ⭕️ Saigon Vinyl Records Store in Vietnam / LP Store  ⭕️ Hotline: 0903.088.038', 'https://product.hstatic.net/1000304920/product/hoang-thuy-linh-link-a-side-b-side-colored-gatefold-vinyl-lp-dia-than_ea3addf35b364b3aabde812c2a4c17e7_grande.jpg');

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
(5, 107, 'Platinum Silver Version', 178, 450000, '2023-12-17 05:14:56', '2023-12-17 05:14:56'),
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
(5, '1xoadYaxtOp9gHDwgmPDuz', '1', '2023-11-20 10:35:35', '2023-11-20 05:39:59'),
(6, '1MiJk3dXC5jzhvLFP0dUM7', '1', '2023-11-19 23:23:44', '2023-11-20 05:39:59'),
(77, '2N0SPREDYqILVEFSsWF5N5', '1', '2023-11-20 14:39:13', '2023-11-19 23:30:11'),
(78, '3Ua0m0YmEjrMi9XErKcNiR', '1', '2023-11-20 15:10:43', '2023-11-19 23:35:13'),
(79, '3un8UkiPHJjlsrTHQnisXH', '2', '2023-12-18 04:13:07', '2023-11-20 06:38:29'),
(80, '0lizgQ7Qw35od7CYaoMBZb', '1', '2023-11-21 10:22:03', '2023-11-20 08:01:43'),
(81, '6KgZf5gZgF1KLNxq1qZgHP', '1', '2023-11-20 15:08:08', '2023-11-20 18:07:03'),
(82, '3rUGC1vUpkDG9CZFHMur1t', '1', '2023-11-20 11:18:31', '2023-11-20 18:18:31'),
(83, '4xhsWYTOGcal8zt0J161CU', '1', '2023-11-20 11:20:43', '2023-11-20 18:20:43'),
(84, '4CljUDO1I5hpKjwSNK6RWY', '1', '2023-11-20 11:23:02', '2023-11-20 18:23:02'),
(85, '5J3m0taZ0W1E9HTE0MwcSv', '1', '2023-11-21 21:15:16', '2023-11-20 20:32:28'),
(86, '4W4fNrZYkobj539TOWsLO2', '1', '2023-11-20 13:43:21', '2023-11-20 20:43:21'),
(87, '2JuHIbFudHwDqQssgqsH3i', '1', '2023-11-20 15:13:51', '2023-11-20 20:44:13'),
(88, '5cF0dROlMOK5uNZtivgu50', '1', '2023-11-22 06:47:38', '2023-11-20 20:46:16'),
(89, '5Odq8ohlgIbQKMZivbWkEo', '1', '2023-11-20 13:50:32', '2023-11-20 20:49:45'),
(90, '2doGmsaPLdot51o80juiYU', '1', '2023-11-20 13:50:54', '2023-11-20 20:50:54'),
(91, '7D9tiidrBDQRgCENeIhko0', '1', '2023-11-20 13:51:41', '2023-11-20 20:51:41'),
(92, '4jWmhzf53Q0ZvZMuGdiR9x', '1', '2023-11-20 15:09:13', '2023-11-20 20:52:04'),
(93, '7mA9oPfWSMXKOdPZqyow55', '1', '2023-11-20 13:52:14', '2023-11-20 20:52:14'),
(94, '45Mswno1F7FoZkcmQkp7fi', '1', '2023-11-20 13:54:30', '2023-11-20 20:54:30'),
(95, '29WxJqIfDRMo9isV07kbJP', '1', '2023-11-20 14:09:42', '2023-11-20 21:05:23'),
(96, '210JJAa9nJOgNa0YNrsT5g', '1', '2023-11-20 14:10:04', '2023-11-20 21:06:43'),
(97, '2KslE17cAJNHTsI2MI0jb2', '1', '2023-11-21 22:45:27', '2023-11-20 21:29:02'),
(98, '2HRgqmZQC0MC7GeNuDIXHN', '1', '2023-11-20 14:30:04', '2023-11-20 21:30:01'),
(99, '0kHgteR4TV4LO80wrasDSR', '1', '2023-11-20 15:12:18', '2023-11-20 21:57:52'),
(100, '4CUvVaAYuXtvYURLFz7EIL', '1', '2023-11-20 15:08:59', '2023-11-20 22:08:56'),
(101, '4acXEYw7ayyJnm9GXDrqiL', '1', '2023-11-20 15:15:13', '2023-11-20 22:09:27'),
(102, '1BxfuPKGuaTgP7aM0Bbdwr', '1', '2023-11-21 10:20:49', '2023-11-20 22:09:55'),
(103, '5odlY52u43F5BjByhxg7wg', '1', '2023-11-20 23:02:16', '2023-11-21 06:02:15'),
(104, '0SLhB9JLM4Ksz1XdwK3aQD', '1', '2023-11-21 01:24:05', '2023-11-21 08:22:35'),
(105, '0ZP4bO2ywAv44HiEzzHaq5', '1', '2023-11-21 08:01:33', '2023-11-21 15:01:34'),
(106, '3ZbZtdEw9U0uZW4tZItIwq', '0', '2023-12-18 03:55:08', '2023-12-18 03:52:28'),
(107, '0LVCuBsPmGaYvGV3IOMXFy', '2', '2023-12-18 04:05:07', '2023-12-18 04:04:09'),
(108, '180AbZduI6bYQIzwCHRwu9', '2', '2023-12-18 04:13:07', '2023-12-18 04:10:50'),
(109, '1rO9az1C7u2RXUK0E9YfUi', '2', '2023-12-18 04:15:21', '2023-12-18 04:15:21'),
(110, '6hShO2ZZ0bFO1SNfpfkHOD', '0', '2023-12-18 04:18:25', '2023-12-18 04:17:33');

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
(10, '5J3m0taZ0W1E9HTE0MwcSv', '1', '2023-11-20 13:39:10', '2023-11-20 13:39:10');

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
  `song_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `playlists`
--

INSERT INTO `playlists` (`id`, `title_playlist`, `user_id`, `created_at`, `updated_at`, `song_id`) VALUES
(1, 'Christmas', '2', '2023-12-18 05:34:26', '2023-12-18 08:34:46', '180AbZduI6bYQIzwCHRwu9'),
(2, 'Your playlist', '2', '2023-12-20 03:16:26', '2023-12-20 03:16:26', NULL),
(3, 'Your playlist', '2', '2023-12-20 03:17:58', '2023-12-20 03:17:58', NULL),
(4, 'Your playlist', '2', '2023-12-20 03:20:14', '2023-12-20 03:20:14', NULL),
(5, 'Your playlist', '2', '2023-12-20 03:21:35', '2023-12-20 03:21:35', NULL);

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
  `contact_number` varchar(30) DEFAULT NULL,
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
(1, 'Nguyen', 'Binh', '2016-11-23', '0123456789', 'nguyen@gmail.com', 1, 4, 1, 'nguyen', '123456', '2023-11-23 06:56:37', '2023-12-11 11:21:22'),
(2, 'John', 'Smith', '2000-11-12', '01943752', 'john@gmail.com', 1, 1, 1, 'test', '123456', '2023-11-23 06:56:37', '2023-11-23 07:22:33'),
(3, 'Nguyên', 'Nguyễn', '2002-11-11', '0123456789', 'nbnguyen1100@gmail.com', 1, 1, 1, 'Nguyên', 'google', '2023-12-07 18:16:10', '2023-12-16 13:39:11'),
(8, NULL, NULL, NULL, NULL, 'nguyen00@gmail.com', NULL, 1, 1, NULL, NULL, '2023-12-12 14:02:03', '2023-12-12 14:02:03'),
(9, NULL, NULL, NULL, NULL, 'manlun0902@gmail.com', NULL, 1, 1, 'mannn', '123456', '2023-12-19 10:16:32', '2023-12-19 10:16:32'),
(10, NULL, NULL, NULL, NULL, 'manlun090245@gmail.com', NULL, 1, 1, 'mann111', 'ascvb', '2023-12-19 10:20:03', '2023-12-19 10:20:03');

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
-- Indexes for table `album_orders`
--
ALTER TABLE `album_orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `FK_User_Order` (`cust_id`);

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
-- AUTO_INCREMENT for table `account_status`
--
ALTER TABLE `account_status`
  MODIFY `account_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `account_type_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `album_orders`
--
ALTER TABLE `album_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `album_order_details`
--
ALTER TABLE `album_order_details`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `album_physicals`
--
ALTER TABLE `album_physicals`
  MODIFY `album_physi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `album_physical_details`
--
ALTER TABLE `album_physical_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `followed_artists`
--
ALTER TABLE `followed_artists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `histories`
--
ALTER TABLE `histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `liked_songs`
--
ALTER TABLE `liked_songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `playlists`
--
ALTER TABLE `playlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `album_orders`
--
ALTER TABLE `album_orders`
  ADD CONSTRAINT `FK_User_Order` FOREIGN KEY (`cust_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `album_order_details`
--
ALTER TABLE `album_order_details`
  ADD CONSTRAINT `FK_Order_Album` FOREIGN KEY (`album_physi_id`) REFERENCES `album_physicals` (`album_physi_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PK_Order_Detail` FOREIGN KEY (`order_id`) REFERENCES `album_orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `album_physicals`
--
ALTER TABLE `album_physicals`
  ADD CONSTRAINT `FK_User_Album` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `album_physical_details`
--
ALTER TABLE `album_physical_details`
  ADD CONSTRAINT `FK_Album` FOREIGN KEY (`album_physi_id`) REFERENCES `album_physicals` (`album_physi_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `PK_Account_Status` FOREIGN KEY (`accountStatusID`) REFERENCES `account_status` (`account_status_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PK_Account_Type` FOREIGN KEY (`accountTypeID`) REFERENCES `account_types` (`account_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
