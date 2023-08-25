-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.33 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para tesoreria
CREATE DATABASE IF NOT EXISTS `tesoreria` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `tesoreria`;

-- Volcando estructura para tabla tesoreria.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tesoreria.failed_jobs: ~0 rows (aproximadamente)
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Volcando estructura para tabla tesoreria.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tesoreria.migrations: ~6 rows (aproximadamente)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2023_08_22_000938_create_students_table', 1),
	(6, '2023_08_22_005231_create_months_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Volcando estructura para tabla tesoreria.months
CREATE TABLE IF NOT EXISTS `months` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tesoreria.months: ~12 rows (aproximadamente)
DELETE FROM `months`;
/*!40000 ALTER TABLE `months` DISABLE KEYS */;
INSERT INTO `months` (`id`, `name`, `active`, `created_at`, `updated_at`) VALUES
	(1, 'Enero', 0, '2023-08-21 20:57:23', NULL),
	(2, 'Febrero', 0, '2023-08-21 20:58:21', NULL),
	(3, 'Marzo', 1, '2023-08-21 20:58:24', NULL),
	(4, 'Abril', 1, '2023-08-21 21:00:20', NULL),
	(5, 'Mayo', 1, '2023-08-21 21:00:22', NULL),
	(6, 'Junio', 1, '2023-08-21 21:00:23', NULL),
	(7, 'Julio', 1, '2023-08-21 21:00:25', NULL),
	(8, 'Agosto', 1, '2023-08-21 21:00:27', NULL),
	(9, 'Septiembre', 1, '2023-08-21 21:00:29', NULL),
	(10, 'Octubre', 1, '2023-08-21 21:00:30', NULL),
	(11, 'Noviembre', 1, '2023-08-21 21:00:32', NULL),
	(12, 'Diciembre', 1, '2023-08-21 21:00:34', NULL);
/*!40000 ALTER TABLE `months` ENABLE KEYS */;

-- Volcando estructura para tabla tesoreria.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tesoreria.password_resets: ~0 rows (aproximadamente)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Volcando estructura para tabla tesoreria.payments
CREATE TABLE IF NOT EXISTS `payments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL DEFAULT '0',
  `month_id` int(11) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tesoreria.payments: ~3 rows (aproximadamente)
DELETE FROM `payments`;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` (`id`, `student_id`, `month_id`, `amount`, `created_at`, `updated_at`) VALUES
	(1, 1, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(2, 1, 4, 5000, '2023-08-21 21:06:02', '2023-08-21 21:06:04'),
	(3, 1, 5, 5000, '2023-08-21 21:06:21', '2023-08-21 21:06:23'),
	(4, 1, 6, 5000, '2023-08-21 21:07:12', '2023-08-21 21:07:14'),
	(5, 2, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(6, 2, 4, 5000, '2023-08-21 21:06:02', '2023-08-21 21:06:04'),
	(7, 2, 5, 5000, '2023-08-21 21:06:21', '2023-08-21 21:06:23'),
	(8, 2, 6, 5000, '2023-08-21 21:07:12', '2023-08-21 21:07:14'),
	(9, 2, 7, 5000, '2023-08-21 21:07:12', '2023-08-21 21:07:14'),
	(10, 2, 8, 5000, '2023-08-21 21:07:12', '2023-08-21 21:07:14'),
	(11, 3, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(12, 3, 4, 5000, '2023-08-21 21:06:02', '2023-08-21 21:06:04'),
	(13, 3, 5, 5000, '2023-08-21 21:06:21', '2023-08-21 21:06:23'),
	(14, 3, 6, 5000, '2023-08-21 21:07:12', '2023-08-21 21:07:14'),
	(15, 3, 7, 5000, '2023-08-21 21:07:12', '2023-08-21 21:07:14'),
	(16, 4, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(17, 4, 4, 5000, '2023-08-21 21:06:02', '2023-08-21 21:06:04'),
	(18, 4, 5, 5000, '2023-08-21 21:06:21', '2023-08-21 21:06:23'),
	(19, 4, 6, 5000, '2023-08-21 21:07:12', '2023-08-21 21:07:14'),
	(20, 4, 7, 5000, '2023-08-21 21:07:12', '2023-08-21 21:07:14'),
	(21, 4, 8, 5000, '2023-08-21 21:07:12', '2023-08-21 21:07:14'),
	(22, 4, 9, 5000, '2023-08-21 21:07:12', '2023-08-21 21:07:14'),
	(23, 4, 10, 5000, '2023-08-21 21:07:12', '2023-08-21 21:07:14'),
	(24, 4, 11, 5000, '2023-08-21 21:07:12', '2023-08-21 21:07:14'),
	(25, 4, 12, 5000, '2023-08-21 21:07:12', '2023-08-21 21:07:14'),
	(26, 5, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(27, 5, 4, 5000, '2023-08-21 21:06:02', '2023-08-21 21:06:04'),
	(28, 5, 5, 5000, '2023-08-21 21:06:21', '2023-08-21 21:06:23'),
	(29, 7, 3, 2000, '2023-08-21 21:05:46', '2023-08-24 06:54:55'),
	(30, 8, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(31, 8, 4, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(32, 8, 5, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(33, 8, 6, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(34, 8, 7, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(35, 9, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(36, 9, 4, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(37, 9, 5, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(38, 9, 6, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(39, 9, 7, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(40, 9, 8, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(41, 9, 9, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(42, 9, 10, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(43, 9, 11, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(44, 9, 12, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(45, 10, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(46, 10, 4, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(47, 10, 5, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(48, 10, 6, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(49, 10, 7, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(50, 11, 8, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(51, 11, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(52, 11, 4, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(53, 12, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(54, 12, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(55, 12, 4, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(56, 12, 5, 2000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(57, 13, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(58, 13, 4, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(59, 13, 5, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(60, 13, 6, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(61, 14, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(62, 14, 4, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(63, 14, 5, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(64, 14, 6, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(65, 15, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(67, 16, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(68, 16, 4, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(69, 16, 5, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(70, 16, 6, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(71, 17, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(72, 17, 4, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(73, 17, 5, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(74, 17, 6, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(75, 18, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(76, 18, 4, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(77, 18, 5, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(78, 18, 6, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(79, 18, 7, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(80, 18, 8, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(81, 18, 9, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(82, 18, 10, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(83, 18, 11, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(84, 18, 12, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(85, 19, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(86, 19, 4, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(87, 19, 5, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(88, 19, 6, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(89, 19, 7, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(90, 19, 8, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(91, 19, 9, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(92, 19, 10, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(93, 19, 11, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(94, 19, 12, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(95, 21, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(96, 21, 4, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(97, 21, 5, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(98, 21, 6, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(99, 21, 7, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(100, 22, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(101, 22, 4, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(102, 22, 5, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(103, 22, 6, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(104, 22, 7, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(105, 23, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(106, 24, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(107, 24, 4, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(108, 24, 5, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(109, 24, 6, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(110, 25, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(111, 25, 4, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(112, 25, 5, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(113, 25, 6, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(114, 25, 7, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(115, 25, 8, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(116, 25, 9, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(117, 25, 10, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(118, 25, 11, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(119, 25, 12, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(120, 26, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(121, 26, 4, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(122, 27, 3, 2000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(123, 28, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(124, 28, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(125, 28, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(126, 28, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(127, 28, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(128, 29, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48'),
	(129, 30, 3, 5000, '2023-08-21 21:05:46', '2023-08-21 21:05:48');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;

-- Volcando estructura para tabla tesoreria.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tesoreria.personal_access_tokens: ~0 rows (aproximadamente)
DELETE FROM `personal_access_tokens`;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Volcando estructura para tabla tesoreria.students
CREATE TABLE IF NOT EXISTS `students` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `second_last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tesoreria.students: ~30 rows (aproximadamente)
DELETE FROM `students`;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` (`id`, `name`, `last_name`, `second_last_name`, `phone`, `email`, `created_at`, `updated_at`) VALUES
	(1, 'vicente', 'aguilera', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(2, 'magdalena', 'avilés', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(3, 'ema', 'escobar', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(4, 'alonso', 'canales', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(5, 'juan', 'cañas', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(6, 'vicente', 'castillo', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(7, 'mateo', 'cortés', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(8, 'jesús', 'farías', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(9, 'bruno', 'garcía', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(10, 'dante', 'gómez', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(11, 'tomas', 'ibáñez', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(12, 'monserrat', 'leiva', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(13, 'ana sofía', 'morales', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(14, 'rodolfo', 'muñoz', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(15, 'facundo', 'odger', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(16, 'josefa', 'orrego', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(17, 'leonor', 'peralta', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(18, 'luciano', 'piñones', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(19, 'maite', 'rivera', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(20, 'leticia', 'rivera', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(21, 'bruno', 'rodríguez', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(22, 'florencia', 'rodríguez', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(23, 'benjamín', 'rodríguez', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(24, 'baltazar', 'sáez', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(25, 'amelia', 'salazar', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(26, 'naím', 'sapiaín', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(27, 'vicente', 'sandoval', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(28, 'nicolás', 'thompson', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(29, 'maría jesús', 'valencia', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50'),
	(30, 'felipe', 'villanueva', NULL, NULL, NULL, '2023-08-22 00:31:50', '2023-08-22 00:31:50');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;

-- Volcando estructura para tabla tesoreria.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla tesoreria.users: ~0 rows (aproximadamente)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
