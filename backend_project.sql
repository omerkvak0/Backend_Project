-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 16 Mar 2024, 18:44:08
-- Sunucu sürümü: 8.0.31
-- PHP Sürümü: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `backend_project`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `branches`
--

DROP TABLE IF EXISTS `branches`;
CREATE TABLE IF NOT EXISTS `branches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `address` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Tablo döküm verisi `branches`
--

INSERT INTO `branches` (`id`, `title`, `address`, `created_at`) VALUES
(2, 'Şube 2', 'Şube 2 adresi falan filan.', '2024-03-16 12:32:52'),
(1, 'Şube 1', 'Şube 1 adresi falan filan.', '2024-03-16 12:33:05');

--
-- Tetikleyiciler `branches`
--
DROP TRIGGER IF EXISTS `branches_delete`;
DELIMITER $$
CREATE TRIGGER `branches_delete` BEFORE DELETE ON `branches` FOR EACH ROW INSERT INTO branches_log (created_at, log_type, user_id, old_title, old_address)
VALUES (NOW(), "Branches Delete", "1", OLD.title, OLD.address)
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `branches_update`;
DELIMITER $$
CREATE TRIGGER `branches_update` BEFORE UPDATE ON `branches` FOR EACH ROW INSERT INTO branches_log (created_at, log_type, user_id, old_title, old_address)
VALUES (NOW(), "Branches Update", "1", OLD.title, OLD.address)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `branches_log`
--

DROP TABLE IF EXISTS `branches_log`;
CREATE TABLE IF NOT EXISTS `branches_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `log_type` varchar(20) NOT NULL,
  `user_id` int DEFAULT NULL,
  `old_title` varchar(250) NOT NULL,
  `old_adress` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

--
-- Tablo döküm verisi `branches_log`
--

INSERT INTO `branches_log` (`id`, `created_at`, `log_type`, `user_id`, `old_title`, `old_adress`) VALUES
(1, '2024-03-16 12:18:14', 'Branches Update', 1, 'Deneme title girdim.', 'Aydın Adnan Menderes Üniversitesi'),
(2, '2024-03-16 12:19:51', 'Branches Update', 1, 'Herhangi bir Yazı.', 'Herhangi bir adres.'),
(4, '2024-03-16 12:21:36', 'Branches Delete', 1, 'Herhangi bir Yazı yazdım..', 'Herhangi bir adres.'),
(5, '2024-03-16 12:33:05', 'Branches Update', 1, 'Şube 1', 'Şube adresi falan filan.');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rank` tinyint NOT NULL,
  `is_active` tinyint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `brands`
--

INSERT INTO `brands` (`id`, `img_url`, `title`, `rank`, `is_active`, `created_at`) VALUES
(1, 'img', 'Adidas', 1, 1, '2024-03-16 10:41:27'),
(2, 'img1', 'Nike', 2, 1, '2024-03-16 10:41:48');

--
-- Tetikleyiciler `brands`
--
DROP TRIGGER IF EXISTS `brands_delete`;
DELIMITER $$
CREATE TRIGGER `brands_delete` BEFORE DELETE ON `brands` FOR EACH ROW INSERT INTO brands_log (created_at, log_type, user_id, old_id, old_img_url, old_title, old_rank, old_is_active) 
VALUES (NOW(), "Brands Delete", "1", OLD.id, OLD.img_url, OLD.title, OLD.rank, OLD.is_active)
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `brands_update`;
DELIMITER $$
CREATE TRIGGER `brands_update` BEFORE UPDATE ON `brands` FOR EACH ROW INSERT INTO brands_log (created_at, log_type, user_id, old_id, old_img_url, old_title, old_rank, old_is_active)
VALUES (NOW(), "Brands Update", "1", OLD.id, OLD.img_url, OLD.title, OLD.rank, OLD.is_active)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `brands_log`
--

DROP TABLE IF EXISTS `brands_log`;
CREATE TABLE IF NOT EXISTS `brands_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `old_id` int NOT NULL,
  `old_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_rank` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_is_active` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `brands_log`
--

INSERT INTO `brands_log` (`id`, `created_at`, `log_type`, `user_id`, `old_id`, `old_img_url`, `old_title`, `old_rank`, `old_is_active`) VALUES
(1, '2024-03-16 10:41:05', 'BRANDS DELETE', 1, 1, 'img', 'Herhangi bir şey deneme. İkinci deneme.', '12', 0),
(2, '2024-03-16 10:41:58', 'BRANDS UPDATE', 1, 2, 'img', 'Niki', '2', 1),
(3, '2024-03-16 12:20:27', 'BRANDS UPDATE', 1, 2, 'img', 'Nike', '2', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rank` tinyint NOT NULL,
  `is_active` tinyint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `products`
--

INSERT INTO `products` (`id`, `img_url`, `title`, `description`, `rank`, `is_active`, `created_at`) VALUES
(1, 'img', 'Spor takım elbise', 'spor rahat takım elbise', 10, 1, '2024-03-16 17:21:18');

--
-- Tetikleyiciler `products`
--
DROP TRIGGER IF EXISTS `products_delete`;
DELIMITER $$
CREATE TRIGGER `products_delete` BEFORE DELETE ON `products` FOR EACH ROW INSERT INTO products_log (created_at, log_type, user_id, old_id, old_img_url, old_title, old_description, old_rank, old_is_active)
VALUES (NOW(), "Products Delete", "1", OLD.id, OLD.img_url, OLD.title, OLD.description, OLD.rank, OLD.is_active)
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `products_update`;
DELIMITER $$
CREATE TRIGGER `products_update` BEFORE UPDATE ON `products` FOR EACH ROW INSERT INTO products_log (created_at, log_type, user_id, old_id, old_img_url, old_title, old_description, old_rank, old_is_active)
VALUES (NOW(), "Products Update", "1", OLD.id, OLD.img_url, OLD.title, OLD.description, OLD.rank, OLD.is_active)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products_log`
--

DROP TABLE IF EXISTS `products_log`;
CREATE TABLE IF NOT EXISTS `products_log` (
  `id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `old_id` int NOT NULL,
  `old_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_rank` tinyint NOT NULL,
  `old_is_active` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `products_log`
--

INSERT INTO `products_log` (`id`, `created_at`, `log_type`, `user_id`, `old_id`, `old_img_url`, `old_title`, `old_description`, `old_rank`, `old_is_active`) VALUES
(0, '2024-03-16 17:18:51', 'Products Update', 1, 1, 'img', 'Spor Ayakkabı', '38-46 Numara arası ayakkabbı türü.', 12, 1),
(0, '2024-03-16 17:20:40', 'Products Delete', 1, 1, 'img', 'Spor Ayakkabı', '38-46 Numara arası ayakkabbı türleri', 12, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE IF NOT EXISTS `product_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `is_active` tinyint NOT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Tablo döküm verisi `product_categories`
--

INSERT INTO `product_categories` (`id`, `title`, `is_active`, `created_at`) VALUES
(1, 'Kıyafet', 1, '2024-03-16 11:36:37'),
(2, 'Askılık', 0, '2024-03-16 11:38:42');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_images`
--

DROP TABLE IF EXISTS `product_images`;
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `rank` tinyint NOT NULL,
  `is_cover` tinyint NOT NULL,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` tinyint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `product_images`
--
DROP TRIGGER IF EXISTS `product_images_delete`;
DELIMITER $$
CREATE TRIGGER `product_images_delete` BEFORE DELETE ON `product_images` FOR EACH ROW INSERT INTO product_images_log (created_at, log_type, user_id, old_id, old_product_id, old_rank, old_is_cover, old_img_url, old_is_active)
VALUES (NOW(), "Product Images Delete", "1", OLD.id, OLD.product_id, OLD.rank, OLD.is_cover, OLD.img_url, OLD.is_active)
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `product_images_update`;
DELIMITER $$
CREATE TRIGGER `product_images_update` BEFORE UPDATE ON `product_images` FOR EACH ROW INSERT INTO product_images_log (created_at, log_type, user_id, old_id, old_product_id, old_rank, old_is_cover, old_img_url, old_is_active)
VALUES (NOW(), "Product Images Update", "1", OLD.id, OLD.product_id, OLD.rank, OLD.is_cover, OLD.img_url, OLD.is_active)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_images_log`
--

DROP TABLE IF EXISTS `product_images_log`;
CREATE TABLE IF NOT EXISTS `product_images_log` (
  `id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `old_id` int NOT NULL,
  `old_product_id` int NOT NULL,
  `old_rank` tinyint NOT NULL,
  `old_is_cover` tinyint NOT NULL,
  `old_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_is_active` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `references`
--

DROP TABLE IF EXISTS `references`;
CREATE TABLE IF NOT EXISTS `references` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rank` tinyint NOT NULL,
  `is_active` tinyint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `references`
--
DROP TRIGGER IF EXISTS `references_delete`;
DELIMITER $$
CREATE TRIGGER `references_delete` BEFORE DELETE ON `references` FOR EACH ROW INSERT INTO `references_log` (created_at, log_type, user_id, old_id, old_img_url, old_title, old_description, old_rank, old_is_active)
VALUES (NOW(), "References Delete", "1", OLD.id, OLD.img_url, OLD.title, OLD.description, OLD.rank, OLD.is_active)
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `references_update`;
DELIMITER $$
CREATE TRIGGER `references_update` BEFORE UPDATE ON `references` FOR EACH ROW INSERT INTO `references_log` (created_at, log_type, user_id, old_id, old_img_url, old_title, old_description, old_rank, old_is_active)
VALUES (NOW(), "REFERENCES UPDATE", "1", OLD.id, OLD.img_url, OLD.title, OLD.description, OLD.rank, OLD.is_active)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `references_log`
--

DROP TABLE IF EXISTS `references_log`;
CREATE TABLE IF NOT EXISTS `references_log` (
  `id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `old_id` int NOT NULL,
  `old_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_rank` tinyint NOT NULL,
  `old_is_active` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rank` tinyint NOT NULL,
  `is_active` tinyint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `services`
--
DROP TRIGGER IF EXISTS `services_delete`;
DELIMITER $$
CREATE TRIGGER `services_delete` BEFORE DELETE ON `services` FOR EACH ROW INSERT INTO services_log (created_at, log_type, user_id, old_id, old_img_url, old_title, old_url, old_description, old_rank, old_is_active) 
VALUES (NOW(), "Services Delete", "1", OLD.id, OLD.img_url, OLD.title, OLD.url, OLD.description, OLD.rank, OLD.is_active)
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `services_update`;
DELIMITER $$
CREATE TRIGGER `services_update` BEFORE UPDATE ON `services` FOR EACH ROW INSERT INTO services_log (created_at, log_type, user_id, old_id, old_img_url, old_title, old_url, old_description, old_rank, old_is_active) 
VALUES (NOW(), "Services Update", "1", OLD.id, OLD.img_url, OLD.title, OLD.url, OLD.description, OLD.rank, OLD.is_active)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `services_log`
--

DROP TABLE IF EXISTS `services_log`;
CREATE TABLE IF NOT EXISTS `services_log` (
  `id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `old_id` int NOT NULL,
  `old_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_rank` tinyint NOT NULL,
  `old_is_active` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `about_us` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slogan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mission` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `vision` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mobile_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone1` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone2` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `facebook` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `twitter` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `instagram` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `linkedin` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gsm1` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gsm2` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `settings`
--
DROP TRIGGER IF EXISTS `settings_delete`;
DELIMITER $$
CREATE TRIGGER `settings_delete` BEFORE DELETE ON `settings` FOR EACH ROW INSERT INTO settings_log (created_at, log_type, user_id, old_id, old_company_name, old_address, old_about_us, old_slogan, old_mission, old_vision, old_image_url, old_mobile_image_url, old_favicon, old_phone1, old_phone2, old_email, old_facebook, old_twitter, old_instagram, old_linkedin, old_gsm1, old_gsm2) 
VALUES (NOW(), "Settings Delete", "1", OLD.id, OLD.company_name, OLD.address, OLD.about_us, OLD.slogan, OLD.mission, OLD.vision, OLD.img_url, OLD.mobile_image_url, OLD.favicon, OLD.phone1, OLD.phone2, OLD.email, OLD.facebook, OLD.twitter, OLD.instagram, OLD.linkedin, OLD.gsm1, OLD.gsm2)
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `settings_update`;
DELIMITER $$
CREATE TRIGGER `settings_update` BEFORE UPDATE ON `settings` FOR EACH ROW INSERT INTO settings_log (created_at, log_type, user_id, old_id, old_company_name, old_address, old_about_us, old_slogan, old_mission, old_vision, old_image_url, old_mobile_image_url, old_favicon, old_phone1, old_phone2, old_email, old_facebook, old_twitter, old_instagram, old_linkedin, old_gsm1, old_gsm2) 
VALUES (NOW(), "Settings Update", "1", OLD.id, OLD.company_name, OLD.address, OLD.about_us, OLD.slogan, OLD.mission, OLD.vision, OLD.img_url, OLD.mobile_image_url, OLD.favicon, OLD.phone1, OLD.phone2, OLD.email, OLD.facebook, OLD.twitter, OLD.instagram, OLD.linkedin, OLD.gsm1, OLD.gsm2)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `settings_log`
--

DROP TABLE IF EXISTS `settings_log`;
CREATE TABLE IF NOT EXISTS `settings_log` (
  `id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `old_id` int NOT NULL,
  `old_company_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_about_us` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_slogan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_mission` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_vision` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_mobile_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_phone1` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_phone2` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_facebook` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_twitter` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_instagram` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_linkedin` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_gsm1` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `old_gsm2` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
CREATE TABLE IF NOT EXISTS `testimonials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `full_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `company` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rank` tinyint NOT NULL,
  `is_active` tinyint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `testimonials`
--
DROP TRIGGER IF EXISTS `testimonials_delete`;
DELIMITER $$
CREATE TRIGGER `testimonials_delete` BEFORE DELETE ON `testimonials` FOR EACH ROW INSERT INTO testimonials_log (created_at, log_type, user_id, old_id, old_title, old_description, old_full_name, old_company, old_img_url, old_rank, old_is_active) 
VALUES (NOW(), "Testimonials Delete", "1", OLD.id, OLD.title, OLD.description, OLD.full_name, OLD.company, OLD.img_url, OLD.rank, OLD.is_active)
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `testimonials_update`;
DELIMITER $$
CREATE TRIGGER `testimonials_update` BEFORE UPDATE ON `testimonials` FOR EACH ROW INSERT INTO testimonials_log (created_at, log_type, user_id, old_id, old_title, old_description, old_full_name, old_company, old_img_url, old_rank, old_is_active) 
VALUES (NOW(), "Testimonials Update", "1", OLD.id, OLD.title, OLD.description, OLD.full_name, OLD.company, OLD.img_url, OLD.rank, OLD.is_active)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `testimonials_log`
--

DROP TABLE IF EXISTS `testimonials_log`;
CREATE TABLE IF NOT EXISTS `testimonials_log` (
  `id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `old_id` int NOT NULL,
  `old_title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_full_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_company` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_rank` tinyint NOT NULL,
  `old_is_active` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `surname` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `img_url`, `email`, `name`, `surname`, `password`, `is_active`) VALUES
(1, 'img', 'akjsdkfsjb@gmail.com', 'Ali', 'Kaya', '1234', 1);

--
-- Tetikleyiciler `users`
--
DROP TRIGGER IF EXISTS `users_delete`;
DELIMITER $$
CREATE TRIGGER `users_delete` BEFORE DELETE ON `users` FOR EACH ROW INSERT INTO users_log (created_at, log_type, user_id, old_id, old_img_url, old_email, old_name, old_name, old_surname, old_password, old_is_active) 
VALUES (NOW(), "Users Delete", "1", OLD.id, old.img_url, old.email, old.name, old.surname, old.password, old.is_active)
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `users_update`;
DELIMITER $$
CREATE TRIGGER `users_update` BEFORE UPDATE ON `users` FOR EACH ROW INSERT INTO users_log (created_at, log_type, user_id, old_id, old_img_url, old_email, old_name, old_name, old_surname, old_password, old_is_active) 
VALUES (NOW(), "Users Update", "1", OLD.id, old.img_url, old.email, old.name, old.surname, old.password, old.is_active)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users_log`
--

DROP TABLE IF EXISTS `users_log`;
CREATE TABLE IF NOT EXISTS `users_log` (
  `id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `old_id` int NOT NULL,
  `old_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_surname` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_password` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `old_is_active` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
