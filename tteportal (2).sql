-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 12, 2025 at 10:33 AM
-- Server version: 8.0.31
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tteportal`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
CREATE TABLE IF NOT EXISTS `branches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(100) NOT NULL,
  `short` int DEFAULT NULL,
  `is_active` int NOT NULL DEFAULT '1' COMMENT '1:Active,0:De-active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `department_name` (`branch_name`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `branch_name`, `short`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Administration', NULL, 1, NULL, NULL),
(2, 'Fashion Design', NULL, 1, NULL, NULL),
(3, 'Finance', NULL, 1, NULL, NULL),
(4, 'Interior Design', NULL, 1, NULL, NULL),
(5, 'IT', NULL, 1, NULL, NULL),
(6, 'Marketing', NULL, 1, NULL, NULL),
(7, 'Student Support', NULL, 1, NULL, NULL),
(8, 'Operations', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

DROP TABLE IF EXISTS `designations`;
CREATE TABLE IF NOT EXISTS `designations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `designation_name` varchar(100) NOT NULL,
  `short` int DEFAULT NULL,
  `is_active` int NOT NULL DEFAULT '1' COMMENT '1:Active,0:De-active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `designation_name` (`designation_name`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `designation_name`, `short`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Accountant', NULL, 1, NULL, NULL),
(2, 'Administrative In-charge', NULL, 1, NULL, NULL),
(3, 'Assistant Manager', NULL, 1, NULL, NULL),
(4, 'Centre Manager', NULL, 1, NULL, NULL),
(5, 'Counselor', NULL, 1, NULL, NULL),
(6, 'Executive', NULL, 1, NULL, NULL),
(7, 'Faculty', NULL, 1, NULL, NULL),
(8, 'GRE', NULL, 1, NULL, NULL),
(9, 'HOD', NULL, 1, NULL, NULL),
(10, 'Manager', NULL, 1, NULL, NULL),
(11, 'Technical Head', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

DROP TABLE IF EXISTS `divisions`;
CREATE TABLE IF NOT EXISTS `divisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `division_name` varchar(100) DEFAULT NULL,
  `short` int NOT NULL,
  `is_active` int NOT NULL DEFAULT '1' COMMENT '1:Active,0:De-Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `division_name`, `short`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Jalandhar 1', 1, 1, NULL, NULL),
(2, 'Ludhiana', 2, 1, NULL, NULL),
(3, 'Ambala', 3, 1, NULL, NULL),
(4, 'New Delhi', 4, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

DROP TABLE IF EXISTS `leaves`;
CREATE TABLE IF NOT EXISTS `leaves` (
  `id` int NOT NULL AUTO_INCREMENT,
  `leave_purpose` varchar(20) NOT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leaves`
--

INSERT INTO `leaves` (`id`, `leave_purpose`, `from_date`, `to_date`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Rest', '2025-05-11 00:00:00', '2025-05-11 00:00:00', 3, '2025-05-12 07:14:22', '2025-05-12 10:10:47'),
(2, 'CL', '2025-05-09 00:00:00', '2025-05-10 00:00:00', 3, '2025-05-12 07:17:10', '2025-05-12 07:17:10');

-- --------------------------------------------------------

--
-- Table structure for table `list_options`
--

DROP TABLE IF EXISTS `list_options`;
CREATE TABLE IF NOT EXISTS `list_options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `list_id` varchar(31) NOT NULL DEFAULT '',
  `option_id` varchar(31) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `short_name` varchar(60) NOT NULL,
  `is_active` int NOT NULL DEFAULT '1' COMMENT '1 means Active,0 means De-active',
  `permission` enum('0','1','2') NOT NULL,
  `seq` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `list_options`
--

INSERT INTO `list_options` (`id`, `list_id`, `option_id`, `title`, `short_name`, `is_active`, `permission`, `seq`) VALUES
(1, 'name_title', 'Mr.', 'Mr.', 'mr', 0, '0', 1),
(2, 'name_title', 'Mrs.', 'Mrs.', 'mrs', 0, '0', 2),
(3, 'name_title', 'Ms.', 'Ms.', 'ms', 0, '0', 3),
(4, 'name_title', 'Dr.', 'Dr.', 'dr', 0, '0', 4),
(5, 'name_title', 'Prof.', 'Prof.', 'prof', 0, '0', 5),
(6, 'cr', 'neft', 'NEFT', '', 1, '2', 1),
(7, 'cr', 'inw', 'INW', '', 1, '2', 2),
(8, 'cr', 'transfer', 'ONLINE TRANSFER', '', 0, '2', 3),
(9, 'cr', 'upi', 'UPI', '', 0, '2', 4),
(10, 'cr', 'gpay', 'Google Pay', '', 0, '2', 5),
(11, 'dr', 'atm', 'ATM', '', 1, '2', 1),
(12, 'dr', 'gpay', 'Google Pay', '', 0, '2', 2),
(13, 'annexure1', '8', 'Vend opened before/after statuary time limit /Dry Day', '', 0, '1', 8),
(14, 'annexure1', '9', 'Sale and Stock Registers not maintained', '', 0, '1', 9),
(15, 'annexure1', '10', 'Un-approved person conducting sale at vend premises', '', 0, '1', 10),
(16, 'annexure1', '11', 'Age of Sales agent below 25 years.', '', 0, '1', 11),
(17, 'annexure1', '12', 'Genuineness of Holograms affixed is doubtful.', '', 0, '1', 12),
(18, 'annexure1', '13', 'Other', '', 0, '1', 13),
(19, 'meeting_color', '1', '#e6eddd|||#8fa86e', 'meeting_color', 1, '0', 1),
(20, 'meeting_color', '2', '#cfe0d6|||#79a089', 'meeting_color', 1, '0', 2),
(21, 'meeting_color', '3', '#cddaea|||#407895', 'meeting_color', 1, '0', 3),
(22, 'meeting_color', '4', '#d6d4e9|||#261f52', 'meeting_color', 1, '0', 4),
(23, 'meeting_color', '5', '#cddaea|||#0f3258', 'meeting_color', 1, '0', 5),
(24, 'meeting_color', '6', '#d6d4e9|||#783c2d', 'meeting_color', 1, '0', 6),
(25, 'meeting_color', '7', '#d6d4e9|||#8f8bb4', 'meeting_color', 1, '0', 7),
(26, 'meeting_color', '8', '#e7ced1|||#d55161', 'meeting_color', 1, '0', 8),
(27, 'meeting_color', '9', '#cfe0d6|||#556f92', 'meeting_color', 1, '0', 9),
(103, 'annexure2', '4', 'Sale and Stock Registers not produced on demand', '', 0, '1', 4),
(104, 'annexure2', '5', 'Sale of liquor bearing un-approved labels.', '', 0, '1', 5),
(105, 'annexure2', '6', 'Other', '', 0, '1', 6),
(106, 'annexure3', '1', 'Sale and Stock Registers not produced on demand', '', 0, '1', 1),
(107, 'annexure3', '2', 'Sale of liquor to under age buyers.', '', 0, '1', 2),
(108, 'annexure3', '3', 'Sale of liquor bearing un-approved labels.', '', 0, '1', 3),
(109, 'annexure3', '4', 'Licensed premises opened before/after statuary time limit /Dry Day', '', 0, '1', 4),
(110, 'annexure3', '5', 'Other', '', 0, '0', 5),
(111, 'salutation_type', '1', 'S/o', 's/o', 0, '0', 1),
(112, 'salutation_type', '2', 'D/o', 'd/o', 0, '0', 2),
(113, 'salutation_type', '3', 'W/o', 'w/o', 0, '0', 3),
(114, 'marital_status', 'm', 'Married', 'married', 0, '0', 1),
(115, 'marital_status', 'u', 'Unmarried', 'unmarried', 0, '0', 2),
(116, 'marital_status', 's', 'Seperated', 'seperated', 0, '0', 3),
(117, 'marital_status', 'w', 'Widower', 'widower', 0, '0', 4),
(118, 'caste_category', '1', 'GEN', 'gen', 0, '0', 1),
(119, 'caste_category', '2', 'SC/ST', 'sc/st', 0, '0', 2),
(120, 'caste_category', '3', 'OBC', 'obc', 0, '0', 3),
(121, 'account_type', '5', 'Unknown', 'unknown', 0, '2', 5);

-- --------------------------------------------------------

--
-- Table structure for table `log_sessions`
--

DROP TABLE IF EXISTS `log_sessions`;
CREATE TABLE IF NOT EXISTS `log_sessions` (
  `log_session_id` int NOT NULL AUTO_INCREMENT,
  `session_id` varchar(100) NOT NULL,
  `user_id` int NOT NULL,
  `login_time` datetime NOT NULL,
  `logout_time` datetime NOT NULL,
  `IP_address` varchar(15) NOT NULL,
  `log_status` enum('i','o','s') NOT NULL DEFAULT 'i' COMMENT 'i means IN , o Means out, s Means System Logout',
  `login_attempt_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 means Valid, 1 means Time, 2 means IP',
  `user_agent` varchar(120) NOT NULL,
  `shadow` enum('0','1') NOT NULL DEFAULT '0' COMMENT '1 means Admin login, 0 means User login',
  `user_shadow_id` int DEFAULT '0',
  PRIMARY KEY (`log_session_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_sessions`
--

INSERT INTO `log_sessions` (`log_session_id`, `session_id`, `user_id`, `login_time`, `logout_time`, `IP_address`, `log_status`, `login_attempt_status`, `user_agent`, `shadow`, `user_shadow_id`) VALUES
(1, 'cbg4p0qsiujktr2v8f4oa726925nkcmh', 1, '2023-08-10 13:54:20', '2023-08-10 13:54:20', '127.0.0.1', 'i', 0, 'Firefox 116.0', '0', 0),
(2, 'nctca15tc5162js5j2fec6ub4h9tm8hc', 1, '2023-08-11 13:51:45', '2023-08-11 13:51:45', '127.0.0.1', 'i', 0, 'Firefox 116.0', '0', 0),
(3, 'l2d2rthauvrmt3ib46t7p580v2tnb4ca', 1, '2023-11-09 17:00:12', '2023-11-09 17:00:12', '127.0.0.1', 'i', 0, 'Firefox 119.0', '0', 0),
(4, 'r4b44ikhtam9eggicokrt1rv7conki1j', 1, '2023-11-10 12:59:25', '2023-11-10 12:59:25', '127.0.0.1', 'i', 0, 'Firefox 119.0', '0', 0),
(5, 'bai3g9n9lne7dm2uuo3t5vvavd3pmc3i', 3, '2023-11-10 13:46:32', '2023-11-10 13:46:32', '127.0.0.1', 'i', 0, 'Firefox 119.0', '0', 0),
(6, '68osn93s5hkfndskjlb12597r7g28lvb', 3, '2023-11-10 17:15:44', '2023-11-10 17:15:44', '127.0.0.1', 'i', 0, 'Firefox 119.0', '0', 0),
(7, 'nb4r7ainpuimjvosb33ofs9phpvm39mh', 3, '2023-11-11 13:45:58', '2023-11-11 13:45:58', '127.0.0.1', 'i', 0, 'Firefox 119.0', '0', 0),
(8, '5j4id1u8jngi4phfdikg2s0ltbclls86', 3, '2023-11-15 23:36:08', '2023-11-15 23:36:08', '127.0.0.1', 'i', 0, 'Firefox 119.0', '0', 0),
(9, 'djhrprhqjil5crs743tfmnikahkf2f94', 3, '2023-11-16 02:10:49', '2023-11-16 02:10:49', '127.0.0.1', 'i', 0, 'Firefox 119.0', '0', 0),
(10, 'uf3ef410uj74tiiarcpa3urdrbc8nna7', 3, '2023-11-26 09:23:49', '2023-11-26 09:23:49', '127.0.0.1', 'i', 0, 'Firefox 120.0', '0', 0),
(11, 'tshahg1kgmkqd8sbt41gm5l7bds1h3rm', 1, '2023-11-26 09:24:22', '2023-11-26 09:24:22', '127.0.0.1', 'i', 0, 'Firefox 120.0', '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(6, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(7, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(8, '2016_06_01_000004_create_oauth_clients_table', 2),
(9, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('134a1966ba6dedaa6e910d21120ad610fcddbe6d8eac1ead47b15c974b7def41b8b4c873916cad5e', 1, 1, 'tteportal', '[]', 0, '2025-05-07 05:24:11', '2025-05-07 05:24:12', '2026-05-07 10:54:11'),
('159b65a1de33d93591733cddb804bd8ecb04559df8f43dce48f25e8fb94d9967c06f5210e6369519', 1, 1, 'tteportal', '[]', 0, '2025-05-07 07:14:32', '2025-05-07 07:14:32', '2026-05-07 12:44:32'),
('16fa545fd68d1e640d949cec6f38a5593bdfc6efa6ba72a5a608c93c697b367a82ae7f00fbb6074f', 1, 1, 'tteportal', '[]', 0, '2025-05-07 06:38:16', '2025-05-07 06:38:16', '2026-05-07 12:08:16'),
('21873326d70f5141d340c3ee1c1f6ae8a97eb1e3df0e3e1403eb7e13aeaf8228ba7b8bf5dafcae08', 1, 1, 'tteportal', '[]', 0, '2025-05-07 07:43:50', '2025-05-07 07:43:50', '2026-05-07 13:13:50'),
('2886de081dcf73e19c7ef27dcd7f9c7c0e6b08ec82440890e9b1df3e734a4e83348cd7f8ab990ddd', 1, 1, 'tteportal', '[]', 0, '2025-05-07 06:47:11', '2025-05-07 06:47:11', '2026-05-07 12:17:11'),
('2b9c510847debc28c876ba78b1132be46664a6e57239a51360c0eff048e791b2b3bacace0eb4c87f', 3, 1, 'tteportal', '[]', 0, '2025-05-07 07:37:22', '2025-05-07 07:37:22', '2026-05-07 13:07:22'),
('34b932b8460c22730f2f07ee79b0c6aa24038825880a23b6b906f666b62f322764219d2f13fc3c4a', 1, 1, 'tteportal', '[]', 0, '2025-05-07 07:11:45', '2025-05-07 07:11:45', '2026-05-07 12:41:45'),
('4370e2f16929631ab59734cb0e7891fc1c41f316c2a690c75478a80b758692824ac75a2673c98918', 1, 1, 'tteportal', '[]', 0, '2025-05-07 07:45:17', '2025-05-07 07:45:17', '2026-05-07 13:15:17'),
('46db6adf8943f2f3782de4d3d4a43fa7eccdf047c1ee40081c13271fb93327a1d89e07e9b96df9f9', 3, 1, 'tteportal', '[]', 0, '2025-04-25 09:32:01', '2025-04-25 09:32:01', '2026-04-25 15:02:01'),
('472b7bd7820d3a72957c8b0ead418e854261550cd812819e1e487ffe3da70c004ca1e4e6b90971e9', 3, 1, 'tteportal', '[]', 0, '2025-05-07 07:20:40', '2025-05-07 07:20:40', '2026-05-07 12:50:40'),
('4d279bc7b53e106f824cb02a66474236e2faf6a4b36dd7fe6f85f8c844e36a479bcb3b7ab32432cb', 1, 1, 'tteportal', '[]', 0, '2025-05-07 06:19:54', '2025-05-07 06:19:54', '2026-05-07 11:49:54'),
('4d7aff9feaca94cb0898b5962abeebed4e5ecfc33ef87f029093a5afe38b6e9557710cd148f7c8bb', 1, 1, 'tteportal', '[]', 0, '2025-05-07 08:13:46', '2025-05-07 08:13:46', '2026-05-07 13:43:46'),
('511a5c317a3a9b28c380c562a167ed05cbbd9a0f4e57b9746c8f7d09c1f98339e5e5ed70818e6bf4', 1, 1, 'tteportal', '[]', 0, '2025-05-07 06:27:29', '2025-05-07 06:27:29', '2026-05-07 11:57:29'),
('553a67eb3be63e93ca6efb244cf32acb7b09a6189928d688160d5eb81324bdf2522d214cfe58a179', 1, 1, 'tteportal', '[]', 0, '2025-05-07 06:40:39', '2025-05-07 06:40:39', '2026-05-07 12:10:39'),
('5aa46f0b121b6b60565fcfadece3e50966f57098adec71c1a0296766321b8696f7573b5386a7bd5f', 1, 1, 'tteportal', '[]', 0, '2025-04-25 06:08:10', '2025-04-25 06:08:10', '2026-04-25 11:38:10'),
('69e310f8da2c37b7114308945ed954d8c4a30619999b831a1a071f7b54c507ee7dcdbe74a07612ea', 3, 1, 'tteportal', '[]', 0, '2025-05-02 04:50:25', '2025-05-02 04:50:26', '2026-05-02 10:20:25'),
('6a8906c6c8f06f82d149135e31a84f9d0b458c383ef29d44049842196b2496202c77c013188c5543', 3, 1, 'tteportal', '[]', 0, '2025-05-12 06:53:08', '2025-05-12 06:53:09', '2026-05-12 12:23:08'),
('6ad530b690f15fe23acd3d18f1db373927d932bc4ca31ddcad7db16a9b8c32826813cf46ead2c7bb', 1, 1, 'tteportal', '[]', 0, '2025-05-01 07:54:14', '2025-05-01 07:54:14', '2026-05-01 13:24:14'),
('6ce0911385f2f71fac6a5f33dd8c5e99f43a7c6f54dfe12225347b3860022ed32a7a118fb11e65d9', 1, 1, 'tteportal', '[]', 0, '2025-05-05 10:43:34', '2025-05-05 10:43:34', '2026-05-05 16:13:34'),
('73e7ca7abd951049f865ee005642bc58b72cf672c007396aca3df894f34b23e1bb38f8b4f1234cb8', 1, 1, 'tteportal', '[]', 0, '2025-05-07 07:27:35', '2025-05-07 07:27:35', '2026-05-07 12:57:35'),
('76ff92bfce35b3154308042132228ba4d138fc3345a9fdc9437cf6036ffcfb8c4137a788924f8543', 1, 1, 'tteportal', '[]', 0, '2025-05-07 07:12:53', '2025-05-07 07:12:53', '2026-05-07 12:42:53'),
('7de91d18fe87c005ef420ac91ee6a4bcf18cf34838c9c705fc82f2a1f1fd7d317f8c9e9e85fd519e', 1, 1, 'tteportal', '[]', 0, '2025-05-07 06:55:29', '2025-05-07 06:55:29', '2026-05-07 12:25:29'),
('7ec554b4a53867cc6a7011ff74e1b4e72b06a2fd3b96248654f6e7b53fac763a975c5d8845680efa', 1, 1, 'tteportal', '[]', 0, '2025-05-07 07:00:08', '2025-05-07 07:00:08', '2026-05-07 12:30:08'),
('815af60316303a83476cfb0407ce1ecc81f45159ad3b27bc6fd5e88652d16ee27e697320586da1bd', 1, 1, 'tteportal', '[]', 0, '2025-05-07 06:36:30', '2025-05-07 06:36:30', '2026-05-07 12:06:30'),
('843778d826f2021536137c47c3d493634eb24ba0330f4c30cb80cd9bcdbd4fd6480d6d8306e9750a', 3, 1, 'tteportal', '[]', 0, '2025-05-01 11:30:00', '2025-05-01 11:30:00', '2026-05-01 17:00:00'),
('85d7dfdb41b8ca6109a6dfa89f3d891005deea1b84bfe975213c8e9038b35868723e07bc8b6177f9', 1, 1, 'tteportal', '[]', 0, '2025-05-07 07:12:28', '2025-05-07 07:12:28', '2026-05-07 12:42:28'),
('8fac01d8cbb8cc2795689151056a6b1b412def97107e51fafe06848a13b6d6bdb4624cb1e9141334', 1, 1, 'tteportal', '[]', 0, '2025-05-07 07:13:48', '2025-05-07 07:13:48', '2026-05-07 12:43:48'),
('9a063dcb2baf96af18efe1bd05ced4e2ea0932630046ef134b2ca8bc55b96b41249a49d98503a141', 1, 1, 'tteportal', '[]', 0, '2025-05-07 07:41:51', '2025-05-07 07:41:51', '2026-05-07 13:11:51'),
('9c60982232f3f87ddc76b13650b7f0a6e6c6d49bce1341149c590bd918c8c34b2f658768b5274de0', 1, 1, 'tteportal', '[]', 0, '2025-05-07 06:29:57', '2025-05-07 06:29:57', '2026-05-07 11:59:57'),
('9cbda683e1f0daced40f6ac9de411d150c32f13067e39e2d7e5d326d0ecff5c4365bf7de6ae3137f', 1, 1, 'tteportal', '[]', 0, '2025-05-07 07:10:53', '2025-05-07 07:10:53', '2026-05-07 12:40:53'),
('a00d5510835dee8ee1993da3269a822dc1f04db79c0777c44fffde7e3d76b489aed90da682a14743', 1, 1, 'tteportal', '[]', 0, '2025-05-07 07:38:19', '2025-05-07 07:38:19', '2026-05-07 13:08:19'),
('a662eb9fee2e4e75946d45e93d1708a95a2c7fef86a65758b68bc2a495fcd24a4b829ee1f3ca285f', 1, 1, 'tteportal', '[]', 0, '2025-05-07 06:22:10', '2025-05-07 06:22:10', '2026-05-07 11:52:10'),
('a94fd16b80029687e53b8bbf75da8c77b6097ec0778076ae7e0a39d1b64678ef298c3721d5a4f212', 1, 1, 'tteportal', '[]', 0, '2025-05-07 05:30:14', '2025-05-07 05:30:14', '2026-05-07 11:00:14'),
('b56a89e1fa4c148e17fde0879a1ee8a2169332d7eed2e4101df1ee3fc57a4ae3fa77cc5dd95b8138', 1, 1, 'tteportal', '[]', 0, '2025-05-07 06:35:47', '2025-05-07 06:35:47', '2026-05-07 12:05:47'),
('c223b0261b06472c906390e114ed29186b8f3815cc2195166881b996091f5785bd698a3ae50d5448', 1, 1, 'tteportal', '[]', 0, '2025-05-07 07:46:20', '2025-05-07 07:46:20', '2026-05-07 13:16:20'),
('c284e770efc92d2f65c32d3a4b636d9ef5610f326a5739e6a5d12ce74e6ec17a3a4f6c894ddcf1fd', 1, 1, 'tteportal', '[]', 0, '2025-05-07 06:32:17', '2025-05-07 06:32:17', '2026-05-07 12:02:17'),
('cb811cd9e69fda324cb01186f8766596815c3dff5e7d6bc25d15a09b7ec82040f47993832b7d2b09', 1, 1, 'tteportal', '[]', 0, '2025-05-07 06:28:40', '2025-05-07 06:28:40', '2026-05-07 11:58:40'),
('cd13e08006994d7145464af09c4e9911c8a87821b300fbf30185625206bff10296d0e44e14213487', 3, 1, 'tteportal', '[]', 0, '2025-04-28 04:25:03', '2025-04-28 04:25:03', '2026-04-28 09:55:03'),
('d1d2182ffd2be8061cfc5f64ec5c0ecadc8b6cb53255a7288e1a846b13ecc47e41b6eafae107fe0f', 1, 1, 'tteportal', '[]', 0, '2025-05-07 06:45:43', '2025-05-07 06:45:43', '2026-05-07 12:15:43'),
('dfb3e7951dabecefc2ea6d636a4f00f11bf602f4d46296738bfa043cf3be11e120c0452f6b121c5e', 1, 1, 'tteportal', '[]', 0, '2025-05-07 06:33:31', '2025-05-07 06:33:31', '2026-05-07 12:03:31'),
('e7835081b8861556fe26e7c0688f2fa8834a0c8235876416c99df7a8ecccee0c6f16f9e069011d67', 3, 1, 'tteportal', '[]', 0, '2025-04-25 11:54:03', '2025-04-25 11:54:03', '2026-04-25 17:24:03'),
('ea502234993e56036c18b367db1eec9cc22dddc5b5caba59efa6140671d11080eaa4de1baf614728', 1, 1, 'tteportal', '[]', 0, '2025-05-12 09:59:28', '2025-05-12 09:59:28', '2026-05-12 15:29:28');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'oEvVx9g4nyUH6UgDiz6gdrtaGIyZ8G0DbCOfqaTP', NULL, 'http://localhost', 1, 0, 0, '2025-04-19 04:12:55', '2025-04-19 04:12:55'),
(2, NULL, 'Laravel Password Grant Client', 'YOZjqNpW6mFIkTzC1L2hzQNB97eI24XW42792qEZ', 'users', 'http://localhost', 0, 1, 0, '2025-04-19 04:12:55', '2025-04-19 04:12:55');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-04-19 04:12:55', '2025-04-19 04:12:55');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
CREATE TABLE IF NOT EXISTS `stations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `station_name` varchar(255) DEFAULT NULL,
  `station_code` varchar(60) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `station_quarter` int DEFAULT NULL,
  `short` int NOT NULL,
  `is_active` int NOT NULL DEFAULT '1' COMMENT '1:Active,0:De-active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stations`
--

INSERT INTO `stations` (`id`, `station_name`, `station_code`, `location`, `station_quarter`, `short`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'A N Dev Nagar', 'ACND', 'A N Dev Nagar', 0, 1, 1, NULL, NULL),
(2, 'Abhaipur', 'AHA', 'Abhaipur', 0, 2, 1, NULL, NULL),
(3, 'Abhayapuri Asam', 'AYU', 'Abhayapuri Asam', 0, 3, 1, NULL, NULL),
(4, 'Abohar', 'ABS', 'Abohar', 0, 4, 1, NULL, NULL),
(5, 'Abu Road', 'ABR', 'Abu Road', 0, 5, 1, NULL, NULL),
(6, 'Achalda', 'ULD', 'Achalda', 0, 6, 1, NULL, NULL),
(7, 'Achhnera Junction', 'AH', 'Achhnera Junction', 0, 7, 1, NULL, NULL),
(8, 'Adas Road', 'ADD', 'Adas Road', 0, 8, 1, NULL, NULL),
(9, 'Adavali', 'ADVI', 'Adavali', 0, 9, 1, NULL, NULL),
(10, 'Adesar', 'AAR', 'Adesar', 0, 10, 1, NULL, NULL),
(11, 'Adgaon Buzurg', 'ABZ', 'Adgaon Buzurg', 0, 11, 1, NULL, NULL),
(12, 'Adhartal', 'ADTL', 'Adhartal', 0, 12, 1, NULL, NULL),
(13, 'Adhikari', 'ADQ', 'Adhikari', 0, 13, 1, NULL, NULL),
(14, 'Adi Saptagram', 'ADST', 'Adi Saptagram', 0, 14, 1, NULL, NULL),
(15, 'Adilabad', 'ADB', 'Adilabad', 0, 15, 1, NULL, NULL),
(16, 'Adina', 'ADF', 'Adina', 0, 16, 1, NULL, NULL),
(17, 'Adipur', 'AI', 'Adipur', 0, 17, 1, NULL, NULL),
(18, 'Adityapur', 'ADTP', 'Adityapur', 0, 18, 1, NULL, NULL),
(19, 'Adoni', 'AD', 'Adoni', 0, 19, 1, NULL, NULL),
(20, 'Adra Junction', 'ADRA', 'Adra Junction', 0, 20, 1, NULL, NULL),
(21, 'Delhi', 'ANDI', 'Adrsh Ngr Delhi', 0, 21, 1, NULL, NULL),
(22, 'Aduturai', 'ADT', 'Aduturai', 0, 22, 1, NULL, NULL),
(23, 'Agartala', 'AGTL', 'Agartala', 0, 23, 1, NULL, NULL),
(24, 'Agasod', 'AGD', 'Agasod', 0, 24, 1, NULL, NULL),
(25, 'Aghwanpur', 'AWP', 'Aghwanpur', 0, 25, 1, NULL, NULL),
(26, 'Agomoni', 'AGMN', 'Agomoni', 0, 26, 1, NULL, NULL),
(27, 'Agori Khas', 'AGY', 'Agori Khas', 0, 27, 1, NULL, NULL),
(28, 'Agra', 'AGC', 'Agra Cantt', 0, 28, 1, NULL, NULL),
(29, 'Agra', 'AGA', 'Agra City', 0, 29, 1, NULL, NULL),
(30, 'Agra', 'AF', 'Agra Fort', 0, 30, 1, NULL, NULL),
(31, 'Ahalyapur', 'AHLR', 'Ahalyapur', 0, 31, 1, NULL, NULL),
(32, 'Aherwadi', 'AHD', 'Aherwadi', 0, 32, 1, NULL, NULL),
(33, 'Ahiran', 'AHN', 'Ahiran', 0, 33, 1, NULL, NULL),
(34, 'Ahmadgarh', 'AHH', 'Ahmadgarh', 0, 34, 1, NULL, NULL),
(35, 'Ahmadnagar', 'ANG', 'Ahmadnagar', 0, 35, 1, NULL, NULL),
(36, 'Ahmadpur', 'AMP', 'Ahmadpur Junction', 0, 36, 1, NULL, NULL),
(37, 'Ahmedabad', 'ADI', 'Ahmedabad Junction', 0, 37, 1, NULL, NULL),
(38, 'Ahmedabad Mg', 'ADIJ', 'Ahmedabad Mg', 0, 38, 1, NULL, NULL),
(39, 'Ahraura Road', 'ARW', 'Ahraura Road', 0, 39, 1, NULL, NULL),
(40, 'Aishbagh', 'ASH', 'Aishbagh', 0, 40, 1, NULL, NULL),
(41, 'Ait', 'AIT', 'Ait', 0, 41, 1, NULL, NULL),
(42, 'Aithal', 'ATMO', 'Aithal', 0, 42, 1, NULL, NULL),
(43, 'Ajaibpur', 'AJR', 'Ajaibpur', 0, 43, 1, NULL, NULL),
(44, 'Ajanti', 'ANI', 'Ajanti', 0, 44, 1, NULL, NULL),
(45, 'Ajaraka', 'AIA', 'Ajaraka', 0, 45, 1, NULL, NULL),
(46, 'Ajgain', 'AJ', 'Ajgain', 0, 46, 1, NULL, NULL),
(47, 'Ajjampur', 'AJP', 'Ajjampur', 0, 47, 1, NULL, NULL),
(48, 'Ajmer Junction', 'AII', 'Ajmer Junction', 0, 48, 1, NULL, NULL),
(49, 'Ajni', 'AJNI', 'Ajni', 0, 49, 1, NULL, NULL),
(50, 'Ajnod', 'AJN', 'Ajnod', 0, 50, 1, NULL, NULL),
(51, 'Akalkot Road', 'AKOR', 'Akalkot Road', 0, 51, 1, NULL, NULL),
(52, 'Akaltara', 'AKT', 'Akaltara', 0, 52, 1, NULL, NULL),
(53, 'Akanapet', 'AKE', 'Akanapet', 0, 53, 1, NULL, NULL),
(54, 'Akathumuri', 'AMY', 'Akathumuri', 0, 54, 1, NULL, NULL),
(55, 'Akbarganj', 'AKJ', 'Akbarganj', 0, 55, 1, NULL, NULL),
(56, 'Akbarnagar', 'AKN', 'Akbarnagar', 0, 56, 1, NULL, NULL),
(57, 'Akbarpur', 'ABP', 'Akbarpur', 0, 57, 1, NULL, NULL),
(58, 'Akividu', 'AKVD', 'Akividu', 0, 58, 1, NULL, NULL),
(59, 'Akkaraippatti', 'API', 'Akkaraippatti', 0, 59, 1, NULL, NULL),
(60, 'Akodia', 'AKD', 'Akodia', 0, 60, 1, NULL, NULL),
(61, 'Akola Junction', 'AK', 'Akola Junction', 0, 61, 1, NULL, NULL),
(62, 'Akolner', 'AKR', 'Akolner', 0, 62, 1, NULL, NULL),
(63, 'Akot', 'AKOT', 'Akot', 0, 63, 1, NULL, NULL),
(64, 'Akshaywat R Ngr', 'AYRN', 'Akshaywat R Ngr', 0, 64, 1, NULL, NULL),
(65, 'Akurdi', 'AKRD', 'Akurdi', 0, 65, 1, NULL, NULL),
(66, 'Alai', 'ALJ', 'Alai', 0, 66, 1, NULL, NULL),
(67, 'Alai', 'ALAI', 'Alai', 0, 67, 1, NULL, NULL),
(68, 'Alamanda', 'ALM', 'Alamanda', 0, 68, 1, NULL, NULL),
(69, 'Alamnagar', 'AMG', 'Alamnagar', 0, 69, 1, NULL, NULL),
(70, 'Alampur', 'ALMR', 'Alampur', 0, 70, 1, NULL, NULL),
(71, 'Alandi', 'ALN', 'Alandi', 0, 71, 1, NULL, NULL),
(72, 'Aler', 'ALER', 'Aler', 0, 72, 1, NULL, NULL),
(73, 'Algawan', 'AIG', 'Algawan', 0, 73, 1, NULL, NULL),
(74, 'Alia Bada', 'ALB', 'Alia Bada', 0, 74, 1, NULL, NULL),
(75, 'Aligarh Junction', 'ALJN', 'Aligarh Junction', 0, 75, 1, NULL, NULL),
(76, 'Alipur Duar', 'APD', 'Alipur Duar', 0, 76, 1, NULL, NULL),
(77, 'Alipur Duar Junction', 'APDJ', 'Alipur Duar Junction', 0, 77, 1, NULL, NULL),
(78, 'Allahabad', 'ALY', 'Allahabad City', 0, 78, 1, NULL, NULL),
(79, 'Allahabad', 'ALD', 'Allahabad Junction', 0, 79, 1, NULL, NULL),
(80, 'Alleppey', 'ALLP', 'Alleppey', 0, 80, 1, NULL, NULL),
(81, 'Alluru Road', 'AXR', 'Alluru Road', 0, 81, 1, NULL, NULL),
(82, 'Almatti', 'LMT', 'Almatti', 0, 82, 1, NULL, NULL),
(83, 'Alnavar Junction', 'LWR', 'Alnavar Junction', 0, 83, 1, NULL, NULL),
(84, 'Alniya', 'ALNI', 'Alniya', 0, 84, 1, NULL, NULL),
(85, 'Aluabari Road', 'AUB', 'Aluabari Road', 0, 85, 1, NULL, NULL),
(86, 'Aluva', 'AWY', 'Aluva', 0, 86, 1, NULL, NULL),
(87, 'Alwal', 'ALW', 'Alwal', 0, 87, 1, NULL, NULL),
(88, 'Alwar', 'AWR', 'Alwar', 0, 88, 1, NULL, NULL),
(89, 'Amagura', 'AGZ', 'Amagura', 0, 89, 1, NULL, NULL),
(90, 'Amalner', 'AN', 'Amalner', 0, 90, 1, NULL, NULL),
(91, 'Amalsad', 'AML', 'Amalsad', 0, 91, 1, NULL, NULL),
(92, 'Amarda Road', 'ARD', 'Amarda Road', 0, 92, 1, NULL, NULL),
(93, 'Amargarh', 'AGR', 'Amargarh', 0, 93, 1, NULL, NULL),
(94, 'Amarpura', 'APA', 'Amarpura', 0, 94, 1, NULL, NULL),
(95, 'Amarpura Rathan', 'AMPR', 'Amarpura Rathan', 0, 95, 1, NULL, NULL),
(96, 'Lucknow', 'AMS', 'Amausi', 0, 96, 1, NULL, NULL),
(97, 'Amb Andaura', 'AADR', 'Amb Andaura', 0, 97, 1, NULL, NULL),
(98, 'Ambagaon', 'AGB', 'Ambagaon', 0, 98, 1, NULL, NULL),
(99, 'Ambala', 'UMB', 'Ambala Cant Junction', 0, 99, 1, NULL, NULL),
(100, 'Ambala', 'UBC', 'Ambala City', 0, 100, 1, NULL, NULL),
(101, 'Ambalapuzha', 'AMPA', 'Ambalapuzha', 0, 101, 1, NULL, NULL),
(102, 'Ambale', 'ABLE', 'Ambale', 0, 102, 1, NULL, NULL),
(103, 'Ambari Falakata', 'ABFC', 'Ambari Falakata', 0, 103, 1, NULL, NULL),
(104, 'Ambarnath', 'ABH', 'Ambarnath', 0, 104, 1, NULL, NULL),
(105, 'Ambasa', 'ABSA', 'Ambasa', 0, 105, 1, NULL, NULL),
(106, 'Ambasamudram', 'ASD', 'Ambasamudram', 0, 106, 1, NULL, NULL),
(107, 'Ambaturai', 'ABI', 'Ambaturai', 0, 107, 1, NULL, NULL),
(108, 'Ambika Kalna', 'ABKA', 'Ambika Kalna', 0, 108, 1, NULL, NULL),
(109, 'Ambika Rohina', 'AMBR', 'Ambika Rohina', 0, 109, 1, NULL, NULL),
(110, 'Ambikapur', 'ABKP', 'Ambikapur', 0, 110, 1, NULL, NULL),
(111, 'Ambli Road', 'ABD', 'Ambli Road', 0, 111, 1, NULL, NULL),
(112, 'Ambliyasan', 'UMN', 'Ambliyasan', 0, 112, 1, NULL, NULL),
(113, 'Ambodala', 'AMB', 'Ambodala', 0, 113, 1, NULL, NULL),
(114, 'Ambur', 'AB', 'Ambur', 0, 114, 1, NULL, NULL),
(115, 'Amdara', 'UDR', 'Amdara', 0, 115, 1, NULL, NULL),
(116, 'Amethi', 'AME', 'Amethi', 0, 116, 1, NULL, NULL),
(117, 'Amgaon', 'AGN', 'Amgaon', 0, 117, 1, NULL, NULL),
(118, 'Amguri', 'AGI', 'Amguri', 0, 118, 1, NULL, NULL),
(119, 'Amla Junction', 'AMLA', 'Amla Junction', 0, 119, 1, NULL, NULL),
(120, 'Amlai', 'AAL', 'Amlai', 0, 120, 1, NULL, NULL),
(121, 'Amlakhurd', 'AMX', 'Amlakhurd', 0, 121, 1, NULL, NULL),
(122, 'Amli', 'AMLI', 'Amli', 0, 122, 1, NULL, NULL),
(123, 'Ammanabrolu', 'ANB', 'Ammanabrolu', 0, 123, 1, NULL, NULL),
(124, 'Ammasandra', 'AMSA', 'Ammasandra', 0, 124, 1, NULL, NULL),
(125, 'Ammuguda', 'AMQ', 'Ammuguda', 0, 125, 1, NULL, NULL),
(126, 'Amoni', 'AONI', 'Amoni', 0, 126, 1, NULL, NULL),
(127, 'Amravati', 'AMI', 'Amravati', 0, 127, 1, NULL, NULL),
(128, 'Amritapura', 'AMC', 'Amritapura', 0, 128, 1, NULL, NULL),
(129, 'Amritsar', 'ASR', 'Amritsar Junction', 0, 129, 1, NULL, NULL),
(130, 'Amroha', 'AMRO', 'Amroha', 0, 130, 1, NULL, NULL),
(131, 'Anakapalle', 'AKP', 'Anakapalle', 0, 131, 1, NULL, NULL),
(132, 'Anand', 'ANND', 'Anand Junction', 0, 132, 1, NULL, NULL),
(133, 'Anand Nagar', 'ANDN', 'Anand Nagar', 0, 133, 1, NULL, NULL),
(134, 'New Delhi', 'ANVR', 'Anand Vihar', 0, 134, 1, NULL, NULL),
(135, 'Anand Vihar Trm', 'ANVT', 'Anand Vihar Trm', 0, 135, 1, NULL, NULL),
(136, 'Anandapuram', 'ANF', 'Anandapuram', 0, 136, 1, NULL, NULL),
(137, 'Anandpur Sahib', 'ANSB', 'Anandpur Sahib', 0, 137, 1, NULL, NULL),
(138, 'Anantapur', 'ATP', 'Anantapur', 0, 138, 1, NULL, NULL),
(139, 'Anantnag', 'ANT', 'Anantnag', 0, 139, 1, NULL, NULL),
(140, 'Anaparti', 'APT', 'Anaparti', 0, 140, 1, NULL, NULL),
(141, 'Anara', 'ANR', 'Anara', 0, 141, 1, NULL, NULL),
(142, 'Anas', 'ANAS', 'Anas', 0, 142, 1, NULL, NULL),
(143, 'Anavardikhanpet', 'AVN', 'Anavardikhanpet', 0, 143, 1, NULL, NULL),
(144, 'Ancheli', 'ACL', 'Ancheli', 0, 144, 1, NULL, NULL),
(145, 'Andal Junction', 'UDL', 'Andal Junction', 0, 145, 1, NULL, NULL),
(146, 'Mumbai', 'ADH', 'Andheri', 0, 146, 1, NULL, NULL),
(147, 'Andul', 'ADL', 'Andul', 0, 147, 1, NULL, NULL),
(148, 'Angadippuram', 'AAM', 'Angadippuram', 0, 148, 1, NULL, NULL),
(149, 'Angamali', 'AFK', 'Angamali', 0, 149, 1, NULL, NULL),
(150, 'Angar', 'AAG', 'Angar', 0, 150, 1, NULL, NULL),
(151, 'Angul', 'ANGL', 'Angul', 0, 151, 1, NULL, NULL),
(152, 'Anjani', 'ANO', 'Anjani', 0, 152, 1, NULL, NULL),
(153, 'Anjar', 'AJE', 'Anjar', 0, 153, 1, NULL, NULL),
(154, 'Anjhi Shahabad', 'AJI', 'Anjhi Shahabad', 0, 154, 1, NULL, NULL),
(155, 'Ank Mmr Direct', 'ANKX', 'Ank Mmr Direct', 0, 155, 1, NULL, NULL),
(156, 'Ankai', 'ANK', 'Ankai', 0, 156, 1, NULL, NULL),
(157, 'Ankleshwar', 'AKV', 'Ankleshwar Junction', 0, 157, 1, NULL, NULL),
(158, 'Ankola', 'ANKL', 'Ankola', 0, 158, 1, NULL, NULL),
(159, 'Ankorah Akorha', 'ANH', 'Ankorah Akorha', 0, 159, 1, NULL, NULL),
(160, 'Annavaram', 'ANV', 'Annavaram', 0, 160, 1, NULL, NULL),
(161, 'Annigeri', 'NGR', 'Annigeri', 0, 161, 1, NULL, NULL),
(162, 'Anpara', 'ANPR', 'Anpara', 0, 162, 1, NULL, NULL),
(163, 'Antah', 'ATH', 'Antah', 0, 163, 1, NULL, NULL),
(164, 'Antu', 'ANTU', 'Antu', 0, 164, 1, NULL, NULL),
(165, 'Anugraha N Road', 'AUBR', 'Anugraha N Road', 0, 165, 1, NULL, NULL),
(166, 'Anuppur Junction', 'APR', 'Anuppur Junction', 0, 166, 1, NULL, NULL),
(167, 'Anupshahr', 'AUS', 'Anupshahr', 0, 167, 1, NULL, NULL),
(168, 'Aonla', 'AO', 'Aonla', 0, 168, 1, NULL, NULL),
(169, 'Appikatla', 'APL', 'Appikatla', 0, 169, 1, NULL, NULL),
(170, 'Apta', 'APTA', 'Apta', 0, 170, 1, NULL, NULL),
(171, 'Ara', 'ARA', 'Ara', 0, 171, 1, NULL, NULL),
(172, 'Arag', 'ARAG', 'Arag', 0, 172, 1, NULL, NULL),
(173, 'Arakkonam', 'AJJ', 'Arakkonam', 0, 173, 1, NULL, NULL),
(174, 'Arakku', 'ARK', 'Arakku', 0, 174, 1, NULL, NULL),
(175, 'Aralvaymozhi', 'AAY', 'Aralvaymozhi', 0, 175, 1, NULL, NULL),
(176, 'Arand', 'ARN', 'Arand', 0, 176, 1, NULL, NULL),
(177, 'Arang Mahanadi', 'ANMD', 'Arang Mahanadi', 0, 177, 1, NULL, NULL),
(178, 'Arariya', 'ARR', 'Arariya', 0, 178, 1, NULL, NULL),
(179, 'Arariya Court', 'ARQ', 'Arariya Court', 0, 179, 1, NULL, NULL),
(180, 'Aravali Road', 'AVRD', 'Aravali Road', 0, 180, 1, NULL, NULL),
(181, 'Aravankadu', 'AVK', 'Aravankadu', 0, 181, 1, NULL, NULL),
(182, 'Arigada', 'ARGD', 'Arigada', 0, 182, 1, NULL, NULL),
(183, 'Ariyalur', 'ALU', 'Ariyalur', 0, 183, 1, NULL, NULL),
(184, 'Arjansar', 'AS', 'Arjansar', 0, 184, 1, NULL, NULL),
(185, 'Arjuni', 'AJU', 'Arjuni', 0, 185, 1, NULL, NULL),
(186, 'Arnetha', 'ARE', 'Arnetha', 0, 186, 1, NULL, NULL),
(187, 'Arni Road', 'ARV', 'Arni Road', 0, 187, 1, NULL, NULL),
(188, 'Arnia', 'ARNA', 'Arnia', 0, 188, 1, NULL, NULL),
(189, 'Arsikere', 'ASK', 'Arsikere Junction', 0, 189, 1, NULL, NULL),
(190, 'Arumuganeri', 'ANY', 'Arumuganeri', 0, 190, 1, NULL, NULL),
(191, 'Arunachal', 'ARCL', 'Arunachal', 0, 191, 1, NULL, NULL),
(192, 'Aruppukkottai', 'APK', 'Aruppukkottai', 0, 192, 1, NULL, NULL),
(193, 'Asafpur', 'AFR', 'Asafpur', 0, 193, 1, NULL, NULL),
(194, 'Asalpur Jobner', 'JOB', 'Asalpur Jobner', 0, 194, 1, NULL, NULL),
(195, 'Asangaon', 'ASO', 'Asangaon', 0, 195, 1, NULL, NULL),
(196, 'Asansol', 'ASN', 'Asansol Junction', 0, 196, 1, NULL, NULL),
(197, 'Asaoti', 'AST', 'Asaoti', 0, 197, 1, NULL, NULL),
(198, 'Asarva Junction', 'ASV', 'Asarva Junction', 0, 198, 1, NULL, NULL),
(199, 'Ashapura Gomat', 'AQG', 'Ashapura Gomat', 0, 199, 1, NULL, NULL),
(200, 'Ashok Nagar', 'ASKN', 'Ashok Nagar', 0, 200, 1, NULL, NULL),
(201, 'Ashokapuram', 'AP', 'Ashokapuram', 0, 201, 1, NULL, NULL),
(202, 'Ashtegaon', 'ASTG', 'Ashtegaon', 0, 202, 1, NULL, NULL),
(203, 'Asifabad Road', 'ASAF', 'Asifabad Road', 0, 203, 1, NULL, NULL),
(204, 'Aslana', 'ANA', 'Aslana', 0, 204, 1, NULL, NULL),
(205, 'Aslaoda', 'ASL', 'Aslaoda', 0, 205, 1, NULL, NULL),
(206, 'Asokhar', 'AXK', 'Asokhar', 0, 206, 1, NULL, NULL),
(207, 'Asranada', 'AAS', 'Asranada', 0, 207, 1, NULL, NULL),
(208, 'Atari', 'ATT', 'Atari', 0, 208, 1, NULL, NULL),
(209, 'Atarra', 'ATE', 'Atarra', 0, 209, 1, NULL, NULL),
(210, 'Ateli', 'AEL', 'Ateli', 0, 210, 1, NULL, NULL),
(211, 'Athmal Gola', 'ATL', 'Athmal Gola', 0, 211, 1, NULL, NULL),
(212, 'Atrampur', 'ARP', 'Atrampur', 0, 212, 1, NULL, NULL),
(213, 'Atru', 'ATRU', 'Atru', 0, 213, 1, NULL, NULL),
(214, 'Attabira', 'ATS', 'Attabira', 0, 214, 1, NULL, NULL),
(215, 'Attar', 'ATR', 'Attar', 0, 215, 1, NULL, NULL),
(216, 'Attili', 'AL', 'Attili', 0, 216, 1, NULL, NULL),
(217, 'Attippattu', 'AIP', 'Attippattu', 0, 217, 1, NULL, NULL),
(218, 'Attur', 'ATU', 'Attur', 0, 218, 1, NULL, NULL),
(219, 'Atul', 'ATUL', 'Atul', 0, 219, 1, NULL, NULL),
(220, 'Aujari', 'AJRE', 'Aujari', 0, 220, 1, NULL, NULL),
(221, 'Aulenda', 'AED', 'Aulenda', 0, 221, 1, NULL, NULL),
(222, 'Aung', 'AUNG', 'Aung', 0, 222, 1, NULL, NULL),
(223, 'Aunrihar Junction', 'ARJ', 'Aunrihar Junction', 0, 223, 1, NULL, NULL),
(224, 'Aurangabad', 'AWB', 'Aurangabad', 0, 224, 1, NULL, NULL),
(225, 'Ausa Road', 'OSA', 'Ausa Road', 0, 225, 1, NULL, NULL),
(226, 'Auvaneswsarem', 'AVS', 'Auvaneswsarem', 0, 226, 1, NULL, NULL),
(227, 'Auwa', 'AUWA', 'Auwa', 0, 227, 1, NULL, NULL),
(228, 'Avadi', 'AVD', 'Avadi', 0, 228, 1, NULL, NULL),
(229, 'Awantipura', 'ATPA', 'Awantipura', 0, 229, 1, NULL, NULL),
(230, 'Awatarnagar', 'ATNR', 'Awatarnagar', 0, 230, 1, NULL, NULL),
(231, 'Ayodhya', 'AY', 'Ayodhya', 0, 231, 1, NULL, NULL),
(232, 'Ayodhyapattanam', 'APN', 'Ayodhyapattanam', 0, 232, 1, NULL, NULL),
(233, 'Azamgarh', 'AMH', 'Azamgarh', 0, 233, 1, NULL, NULL),
(234, 'Azamnagar Road', 'AZR', 'Azamnagar Road', 0, 234, 1, NULL, NULL),
(235, 'Azimganj City', 'ACLE', 'Azimganj City', 0, 235, 1, NULL, NULL),
(236, 'Azimganj Junction', 'AZ', 'Azimganj Junction', 0, 236, 1, NULL, NULL),
(237, 'B Cement Nagar', 'BEY', 'B Cement Nagar', 0, 237, 1, NULL, NULL),
(238, 'Babatpur', 'BTP', 'Babatpur', 0, 238, 1, NULL, NULL),
(239, 'Babhnan', 'BV', 'Babhnan', 0, 239, 1, NULL, NULL),
(240, 'Babina', 'BAB', 'Babina', 0, 240, 1, NULL, NULL),
(241, 'Babrala', 'BBA', 'Babrala', 0, 241, 1, NULL, NULL),
(242, 'Babugarh', 'BBO', 'Babugarh', 0, 242, 1, NULL, NULL),
(243, 'Babupeth', 'BUPH', 'Babupeth', 0, 243, 1, NULL, NULL),
(244, 'Bacheli', 'BCHL', 'Bacheli', 0, 244, 1, NULL, NULL),
(245, 'Bachhrawan', 'BCN', 'Bachhrawan', 0, 245, 1, NULL, NULL),
(246, 'Bachwara Junction', 'BCA', 'Bachwara Junction', 0, 246, 1, NULL, NULL),
(247, 'Bad', 'BAD', 'Bad', 0, 247, 1, NULL, NULL),
(248, 'Badabandha', 'BDBA', 'Badabandha', 0, 248, 1, NULL, NULL),
(249, 'Badami', 'BDM', 'Badami', 0, 249, 1, NULL, NULL),
(250, 'Badampudi', 'BPY', 'Badampudi', 0, 250, 1, NULL, NULL),
(251, 'Badarpur Junction', 'BPB', 'Badarpur Junction', 0, 251, 1, NULL, NULL),
(252, 'Badarwas', 'BDWS', 'Badarwas', 0, 252, 1, NULL, NULL),
(253, 'Bade Arapur', 'BDXX', 'Bade Arapur', 0, 253, 1, NULL, NULL),
(254, 'Badhal', 'BDHL', 'Badhal', 0, 254, 1, NULL, NULL),
(255, 'Badhwa Bara', 'BDWA', 'Badhwa Bara', 0, 255, 1, NULL, NULL),
(256, 'Badkulla', 'BDZ', 'Badkulla', 0, 256, 1, NULL, NULL),
(257, 'Badla Ghat', 'BHB', 'Badla Ghat', 0, 257, 1, NULL, NULL),
(258, 'Badlapur', 'BUD', 'Badlapur', 0, 258, 1, NULL, NULL),
(259, 'New Delhi', 'BHD', 'Badli', 0, 259, 1, NULL, NULL),
(260, 'Badmal', 'BUDM', 'Badmal', 0, 260, 1, NULL, NULL),
(261, 'Badnapur', 'BDU', 'Badnapur', 0, 261, 1, NULL, NULL),
(262, 'Badnera Junction', 'BD', 'Badnera Junction', 0, 262, 1, NULL, NULL),
(263, 'Badodar', 'BDDR', 'Badodar', 0, 263, 1, NULL, NULL),
(264, 'Badshahnagar', 'BNZ', 'Badshahnagar', 0, 264, 1, NULL, NULL),
(265, 'Badshahpur', 'BSE', 'Badshahpur', 0, 265, 1, NULL, NULL),
(266, 'Badulipar', 'BLPR', 'Badulipar', 0, 266, 1, NULL, NULL),
(267, 'Badurpur Ghat', 'BPG', 'Badurpur Ghat', 0, 267, 1, NULL, NULL),
(268, 'Badwasi', 'BWS', 'Badwasi', 0, 268, 1, NULL, NULL),
(269, 'Bagaha', 'BUG', 'Bagaha', 0, 269, 1, NULL, NULL),
(270, 'Bagahai Road', 'BGHI', 'Bagahai Road', 0, 270, 1, NULL, NULL),
(271, 'Bagalia', 'BGA', 'Bagalia', 0, 271, 1, NULL, NULL),
(272, 'Bagalkot', 'BGK', 'Bagalkot', 0, 272, 1, NULL, NULL),
(273, 'Bagbahra', 'BGBR', 'Bagbahra', 0, 273, 1, NULL, NULL),
(274, 'Bagdihi', 'BEH', 'Bagdihi', 0, 274, 1, NULL, NULL),
(275, 'Bagetar', 'BF', 'Bagetar', 0, 275, 1, NULL, NULL),
(276, 'Bagevadi Road', 'BSRX', 'Bagevadi Road', 0, 276, 1, NULL, NULL),
(277, 'Baghauli', 'BGH', 'Baghauli', 0, 277, 1, NULL, NULL),
(278, 'Baghdogra', 'BORA', 'Baghdogra', 0, 278, 1, NULL, NULL),
(279, 'Baghnapara', 'BGRA', 'Baghnapara', 0, 279, 1, NULL, NULL),
(280, 'Baghora', 'BJQ', 'Baghora', 0, 280, 1, NULL, NULL),
(281, 'Baghuapal', 'BGPL', 'Baghuapal', 0, 281, 1, NULL, NULL),
(282, 'Bagnan', 'BZN', 'Bagnan', 0, 282, 1, NULL, NULL),
(283, 'Bagra Tawa', 'BGTA', 'Bagra Tawa', 0, 283, 1, NULL, NULL),
(284, 'Bagri Nagar', 'BQN', 'Bagri Nagar', 0, 284, 1, NULL, NULL),
(285, 'Bagri Sajjanpur', 'BGX', 'Bagri Sajjanpur', 0, 285, 1, NULL, NULL),
(286, 'Bagumra', 'BGMR', 'Bagumra', 0, 286, 1, NULL, NULL),
(287, 'Bagwada (Halt)', 'BAGD', 'Bagwada (Halt)', 0, 287, 1, NULL, NULL),
(288, 'Bagwali', 'BWB', 'Bagwali', 0, 288, 1, NULL, NULL),
(289, 'Bahadur Singh W', 'BSS', 'Bahadur Singh W', 0, 289, 1, NULL, NULL),
(290, 'Bahadurgarh', 'BGZ', 'Bahadurgarh', 0, 290, 1, NULL, NULL),
(291, 'Bahadurpur', 'BPD', 'Bahadurpur', 0, 291, 1, NULL, NULL),
(292, 'Baheri', 'BHI', 'Baheri', 0, 292, 1, NULL, NULL),
(293, 'Bahjoi', 'BJ', 'Bahjoi', 0, 293, 1, NULL, NULL),
(294, 'Bahraich', 'BRK', 'Bahraich', 0, 294, 1, NULL, NULL),
(295, 'Baiguda', 'BGUA', 'Baiguda', 0, 295, 1, NULL, NULL),
(296, 'Baihatola', 'BATL', 'Baihatola', 0, 296, 1, NULL, NULL),
(297, 'Baikunth', 'BKTH', 'Baikunth', 0, 297, 1, NULL, NULL),
(298, 'Baikunthpur Road', 'BRH', 'Baikunthpur Road', 0, 298, 1, NULL, NULL),
(299, 'Bainchi', 'BOI', 'Bainchi', 0, 299, 1, NULL, NULL),
(300, 'Bairagarh', 'BIH', 'Bairagarh', 0, 300, 1, NULL, NULL),
(301, 'Bairagnia', 'BGU', 'Bairagnia', 0, 301, 1, NULL, NULL),
(302, 'Baitalpur', 'BALR', 'Baitalpur', 0, 302, 1, NULL, NULL),
(303, 'Baitarani Road', 'BTV', 'Baitarani Road', 0, 303, 1, NULL, NULL),
(304, 'Baiyyappanahali', 'BYPL', 'Baiyyappanahali', 0, 304, 1, NULL, NULL),
(305, 'Bajrangarh', 'BJG', 'Bajrangarh', 0, 305, 1, NULL, NULL),
(306, 'Bajud', 'BJUD', 'Bajud', 0, 306, 1, NULL, NULL),
(307, 'Bajva', 'BJW', 'Bajva', 0, 307, 1, NULL, NULL),
(308, 'Bakanian Bhaunr', 'BQE', 'Bakanian Bhaunr', 0, 308, 1, NULL, NULL),
(309, 'Bakhleta', 'BQQ', 'Bakhleta', 0, 309, 1, NULL, NULL),
(310, 'Bakhtiyarpur Junction', 'BKP', 'Bakhtiyarpur Junction', 0, 310, 1, NULL, NULL),
(311, 'Baktal', 'BKTL', 'Baktal', 0, 311, 1, NULL, NULL),
(312, 'Bakudi', 'BKLE', 'Bakudi', 0, 312, 1, NULL, NULL),
(313, 'Balabhadrapuram', 'BBPM', 'Balabhadrapuram', 0, 313, 1, NULL, NULL),
(314, 'Balabnramapuram', 'BRAM', 'Balabnramapuram', 0, 314, 1, NULL, NULL),
(315, 'Balagarh', 'BGAE', 'Balagarh', 0, 315, 1, NULL, NULL),
(316, 'Balaghat Junction', 'BTC', 'Balaghat Junction', 0, 316, 1, NULL, NULL),
(317, 'Balamu Junction', 'BLM', 'Balamu Junction', 0, 317, 1, NULL, NULL),
(318, 'Balangir', 'BLGR', 'Balangir', 0, 318, 1, NULL, NULL),
(319, 'Balasore', 'BLS', 'Balasore', 0, 319, 1, NULL, NULL),
(320, 'Balawali', 'BLW', 'Balawali', 0, 320, 1, NULL, NULL),
(321, 'Bale', 'BALE', 'Bale', 0, 321, 1, NULL, NULL),
(322, 'Balganur', 'BLR', 'Balganur', 0, 322, 1, NULL, NULL),
(323, 'Balharshah', 'BPQ', 'Balharshah', 0, 323, 1, NULL, NULL),
(324, 'Baliakheri', 'BAE', 'Baliakheri', 0, 324, 1, NULL, NULL),
(325, 'Balichak', 'BCK', 'Balichak', 0, 325, 1, NULL, NULL),
(326, 'Ballabgarh', 'BVH', 'Ballabgarh', 0, 326, 1, NULL, NULL),
(327, 'Ballenahalli', 'BAHI', 'Ballenahalli', 0, 327, 1, NULL, NULL),
(328, 'Ballia', 'BUI', 'Ballia', 0, 328, 1, NULL, NULL),
(329, 'Bally', 'BLY', 'Bally', 0, 329, 1, NULL, NULL),
(330, 'Balod', 'BXA', 'Balod', 0, 330, 1, NULL, NULL),
(331, 'Balotra Junction', 'BLT', 'Balotra Junction', 0, 331, 1, NULL, NULL),
(332, 'Balpur Halt', 'BPRH', 'Balpur Halt', 0, 332, 1, NULL, NULL),
(333, 'Balrampur', 'BLP', 'Balrampur', 0, 333, 1, NULL, NULL),
(334, 'Balsamand', 'BLSD', 'Balsamand', 0, 334, 1, NULL, NULL),
(335, 'Balugan', 'BALU', 'Balugan', 0, 335, 1, NULL, NULL),
(336, 'Balurghat', 'BLGT', 'Balurghat', 0, 336, 1, NULL, NULL),
(337, 'Bamanwali', 'BMNL', 'Bamanwali', 0, 337, 1, NULL, NULL),
(338, 'Bamhrauli', 'BMU', 'Bamhrauli', 0, 338, 1, NULL, NULL),
(339, 'Bamla', 'BMLL', 'Bamla', 0, 339, 1, NULL, NULL),
(340, 'Bamnia', 'BMI', 'Bamnia', 0, 340, 1, NULL, NULL),
(341, 'Bamra', 'BMB', 'Bamra', 0, 341, 1, NULL, NULL),
(342, 'Banahi', 'BYN', 'Banahi', 0, 342, 1, NULL, NULL),
(343, 'Banapura', 'BPF', 'Banapura', 0, 343, 1, NULL, NULL),
(344, 'Banar', 'BNO', 'Banar', 0, 344, 1, NULL, NULL),
(345, 'Banas', 'BNS', 'Banas', 0, 345, 1, NULL, NULL),
(346, 'Banaswadi', 'BAND', 'Banaswadi', 0, 346, 1, NULL, NULL),
(347, 'Banbasa', 'BNSA', 'Banbasa', 0, 347, 1, NULL, NULL),
(348, 'Banda', 'BNDA', 'Banda Junction', 0, 348, 1, NULL, NULL),
(349, 'Bandakpur', 'BNU', 'Bandakpur', 0, 349, 1, NULL, NULL),
(350, 'Bandanwara', 'BDW', 'Bandanwara', 0, 350, 1, NULL, NULL),
(351, 'Bandarkhal', 'BXK', 'Bandarkhal', 0, 351, 1, NULL, NULL),
(352, 'Bandel Junction', 'BDC', 'Bandel Junction', 0, 352, 1, NULL, NULL),
(353, 'Bandh Bareta', 'BR', 'Bandh Bareta', 0, 353, 1, NULL, NULL),
(354, 'Bandhua', 'BNF', 'Bandhua', 0, 354, 1, NULL, NULL),
(355, 'Bandikui Junction', 'BKI', 'Bandikui Junction', 0, 355, 1, NULL, NULL),
(356, 'Mumbai', 'BDTS', 'Bandra Terminus', 0, 356, 1, NULL, NULL),
(357, 'Bangalore', 'BNC', 'Bangalore Cant', 0, 357, 1, NULL, NULL),
(358, 'Bangalore', 'SBC', 'Bangalore Cy Junction', 0, 358, 1, NULL, NULL),
(359, 'Bangalore', 'BNCE', 'Bangalore East', 0, 359, 1, NULL, NULL),
(360, 'Bangarapet', 'BWY', 'Bangarapet', 0, 360, 1, NULL, NULL),
(361, 'Bangarapet', 'BWT', 'Bangarapet', 0, 361, 1, NULL, NULL),
(362, 'Bangriposi', 'BGY', 'Bangriposi', 0, 362, 1, NULL, NULL),
(363, 'Bangrod', 'BOD', 'Bangrod', 0, 363, 1, NULL, NULL),
(364, 'Bani', 'BANI', 'Bani', 0, 364, 1, NULL, NULL),
(365, 'Bani Bihar', 'BNBH', 'Bani Bihar', 0, 365, 1, NULL, NULL),
(366, 'Banihal', 'BAHL', 'Banihal', 0, 366, 1, NULL, NULL),
(367, 'Banisar', 'BS', 'Banisar', 0, 367, 1, NULL, NULL),
(368, 'Banka', 'BAKA', 'Banka', 0, 368, 1, NULL, NULL),
(369, 'Banka Ghat', 'BKG', 'Banka Ghat', 0, 369, 1, NULL, NULL),
(370, 'Banka Road Oa', 'BNKR', 'Banka Road Oa', 0, 370, 1, NULL, NULL),
(371, 'Bankata', 'BTK', 'Bankata', 0, 371, 1, NULL, NULL),
(372, 'Bankhedi', 'BKH', 'Bankhedi', 0, 372, 1, NULL, NULL),
(373, 'Bankura', 'BQA', 'Bankura', 0, 373, 1, NULL, NULL),
(374, 'Banmor', 'BAO', 'Banmor', 0, 374, 1, NULL, NULL),
(375, 'Bano', 'BANO', 'Bano', 0, 375, 1, NULL, NULL),
(376, 'Banpas', 'BPS', 'Banpas', 0, 376, 1, NULL, NULL),
(377, 'Bansh Baria', 'BSAE', 'Bansh Baria', 0, 377, 1, NULL, NULL),
(378, 'Banshlai Bridge', 'BSBR', 'Banshlai Bridge', 0, 378, 1, NULL, NULL),
(379, 'Bansi Paharpur', 'BIQ', 'Bansi Paharpur', 0, 379, 1, NULL, NULL),
(380, 'Bansipur', 'BSQP', 'Bansipur', 0, 380, 1, NULL, NULL),
(381, 'Banskho', 'BSKO', 'Banskho', 0, 381, 1, NULL, NULL),
(382, 'Banspani', 'BSPX', 'Banspani', 0, 382, 1, NULL, NULL),
(383, 'Bansthali Niwai', 'BNLW', 'Bansthali Niwai', 0, 383, 1, NULL, NULL),
(384, 'Banta Rnathgarh', 'BGG', 'Banta Rnathgarh', 0, 384, 1, NULL, NULL),
(385, 'Bantanahal', 'BLL', 'Bantanahal', 0, 385, 1, NULL, NULL),
(386, 'Bantawala', 'BNTL', 'Bantawala', 0, 386, 1, NULL, NULL),
(387, 'Banthra', 'BTRA', 'Banthra', 0, 387, 1, NULL, NULL),
(388, 'Baori Thikria', 'BOTI', 'Baori Thikria', 0, 388, 1, NULL, NULL),
(389, 'Bap', 'BAF', 'Bap', 0, 389, 1, NULL, NULL),
(390, 'Bapatla', 'BPP', 'Bapatla', 0, 390, 1, NULL, NULL),
(391, 'Bapudm Motihari', 'MKI', 'Bapudm Motihari', 0, 391, 1, NULL, NULL),
(392, 'Bapudm Motihari', 'BMKI', 'Bapudm Motihari', 0, 392, 1, NULL, NULL),
(393, 'Bar', 'BAR', 'Bar', 0, 393, 1, NULL, NULL),
(394, 'Bara Jamda', 'BJMD', 'Bara Jamda', 0, 394, 1, NULL, NULL),
(395, 'Barabambo', 'BRM', 'Barabambo', 0, 395, 1, NULL, NULL),
(396, 'Barabanki Junction', 'BBK', 'Barabanki Junction', 0, 396, 1, NULL, NULL),
(397, 'Barabhum', 'BBM', 'Barabhum', 0, 397, 1, NULL, NULL),
(398, 'Barabil', 'BBN', 'Barabil', 0, 398, 1, NULL, NULL),
(399, 'Barachak', 'BCQ', 'Barachak', 0, 399, 1, NULL, NULL),
(400, 'Baradwar', 'BUA', 'Baradwar', 0, 400, 1, NULL, NULL),
(401, 'Baragopal', 'BAGL', 'Baragopal', 0, 401, 1, NULL, NULL),
(402, 'Barahat', 'BHLE', 'Barahat', 0, 402, 1, NULL, NULL),
(403, 'Barahu', 'BRHU', 'Barahu', 0, 403, 1, NULL, NULL),
(404, 'Baraigram Jn', 'BRGM', 'Baraigram Jn', 0, 404, 1, NULL, NULL),
(405, 'Barakar', 'BRR', 'Barakar', 0, 405, 1, NULL, NULL),
(406, 'Baral', 'BARL', 'Baral', 0, 406, 1, NULL, NULL),
(407, 'Baramati', 'BRMT', 'Baramati', 0, 407, 1, NULL, NULL),
(408, 'Baran', 'BAZ', 'Baran', 0, 408, 1, NULL, NULL),
(409, 'Barang', 'BRAG', 'Barang', 0, 409, 1, NULL, NULL),
(410, 'Barara', 'RAA', 'Barara', 0, 410, 1, NULL, NULL),
(411, 'Barauni Junction', 'BJU', 'Barauni Junction', 0, 411, 1, NULL, NULL),
(412, 'Baraut', 'BTU', 'Baraut', 0, 412, 1, NULL, NULL),
(413, 'Barbatpur', 'BBTR', 'Barbatpur', 0, 413, 1, NULL, NULL),
(414, 'Barchi Road', 'BCRD', 'Barchi Road', 0, 414, 1, NULL, NULL),
(415, 'Barddhaman Junction', 'BWN', 'Barddhaman Junction', 0, 415, 1, NULL, NULL),
(416, 'Bardhana Halt', 'BRDH', 'Bardhana Halt', 0, 416, 1, NULL, NULL),
(417, 'Bardoli', 'BIY', 'Bardoli', 0, 417, 1, NULL, NULL),
(418, 'Bareilly', 'BRY', 'Bareilly', 0, 418, 1, NULL, NULL),
(419, 'Bareilly', 'BE', 'Bareilly', 0, 419, 1, NULL, NULL),
(420, 'Bareilly', 'BC', 'Bareilly City', 0, 420, 1, NULL, NULL),
(421, 'Barejadi', 'BJD', 'Barejadi', 0, 421, 1, NULL, NULL),
(422, 'Barelipur', 'BQM', 'Barelipur', 0, 422, 1, NULL, NULL),
(423, 'Bareta', 'BRZ', 'Bareta', 0, 423, 1, NULL, NULL),
(424, 'Bareth', 'BET', 'Bareth', 0, 424, 1, NULL, NULL),
(425, 'Bargarh', 'BRG', 'Bargarh', 0, 425, 1, NULL, NULL),
(426, 'Bargarh Road', 'BRGA', 'Bargarh Road', 0, 426, 1, NULL, NULL),
(427, 'Bargawan', 'BRGW', 'Bargawan', 0, 427, 1, NULL, NULL),
(428, 'Bargi', 'BUQ', 'Bargi', 0, 428, 1, NULL, NULL),
(429, 'Barh', 'BARH', 'Barh', 0, 429, 1, NULL, NULL),
(430, 'Barhan', 'BRN', 'Barhan', 0, 430, 1, NULL, NULL),
(431, 'Barharwa Junction', 'BHW', 'Barharwa Junction', 0, 431, 1, NULL, NULL),
(432, 'Barhiya', 'BRYA', 'Barhiya', 0, 432, 1, NULL, NULL),
(433, 'Barhiya', 'DKGS', 'Barhiya', 0, 433, 1, NULL, NULL),
(434, 'Barhni', 'BNY', 'Barhni', 0, 434, 1, NULL, NULL),
(435, 'Bari Brahman', 'BBMN', 'Bari Brahman', 0, 435, 1, NULL, NULL),
(436, 'Bariarpur', 'BUP', 'Bariarpur', 0, 436, 1, NULL, NULL),
(437, 'Baripada', 'BPO', 'Baripada', 0, 437, 1, NULL, NULL),
(438, 'Bariwala', 'BRW', 'Bariwala', 0, 438, 1, NULL, NULL),
(439, 'Barka Kana', 'BRKA', 'Barka Kana', 0, 439, 1, NULL, NULL),
(440, 'Barkhera', 'BKA', 'Barkhera', 0, 440, 1, NULL, NULL),
(441, 'Barkisalalya', 'BSYA', 'Barkisalalya', 0, 441, 1, NULL, NULL),
(442, 'Barkur', 'BKJ', 'Barkur', 0, 442, 1, NULL, NULL),
(443, 'Barlai', 'BLAX', 'Barlai', 0, 443, 1, NULL, NULL),
(444, 'Barmer', 'BME', 'Barmer', 0, 444, 1, NULL, NULL),
(445, 'Barnala', 'BNN', 'Barnala', 0, 445, 1, NULL, NULL),
(446, 'Barog', 'BOF', 'Barog', 0, 446, 1, NULL, NULL),
(447, 'Barpali', 'BRPL', 'Barpali', 0, 447, 1, NULL, NULL),
(448, 'Barpathar', 'BXP', 'Barpathar', 0, 448, 1, NULL, NULL),
(449, 'Barpeta Road', 'BPRD', 'Barpeta Road', 0, 449, 1, NULL, NULL),
(450, 'Barrackpore', 'BP', 'Barrackpore', 0, 450, 1, NULL, NULL),
(451, 'Barrajpur', 'BJR', 'Barrajpur', 0, 451, 1, NULL, NULL),
(452, 'Barsali', 'BYS', 'Barsali', 0, 452, 1, NULL, NULL),
(453, 'Barsi Town', 'BTW', 'Barsi Town', 0, 453, 1, NULL, NULL),
(454, 'Barsoi Junction', 'BOE', 'Barsoi Junction', 0, 454, 1, NULL, NULL),
(455, 'Barsola', 'BZO', 'Barsola', 0, 455, 1, NULL, NULL),
(456, 'Barua Bamungaon', 'BBGN', 'Barua Bamungaon', 0, 456, 1, NULL, NULL),
(457, 'Barud', 'BRUD', 'Barud', 0, 457, 1, NULL, NULL),
(458, 'Barwa Sagar', 'BWR', 'Barwa Sagar', 0, 458, 1, NULL, NULL),
(459, 'Barwadih Junction', 'BRWD', 'Barwadih Junction', 0, 459, 1, NULL, NULL),
(460, 'Barwaha', 'BWW', 'Barwaha', 0, 460, 1, NULL, NULL),
(461, 'Barwala', 'BXC', 'Barwala', 0, 461, 1, NULL, NULL),
(462, 'Barya Ram', 'BYHA', 'Barya Ram', 0, 462, 1, NULL, NULL),
(463, 'Basai', 'BZY', 'Basai', 0, 463, 1, NULL, NULL),
(464, 'Basampalle', 'BSPL', 'Basampalle', 0, 464, 1, NULL, NULL),
(465, 'Basantapur', 'BSTP', 'Basantapur', 0, 465, 1, NULL, NULL),
(466, 'Basar', 'BSX', 'Basar', 0, 466, 1, NULL, NULL),
(467, 'Basbari', 'BSI', 'Basbari', 0, 467, 1, NULL, NULL),
(468, 'Basharatganj', 'BTG', 'Basharatganj', 0, 468, 1, NULL, NULL),
(469, 'Basin Bridge Junction', 'BBQ', 'Basin Bridge Junction', 0, 469, 1, NULL, NULL),
(470, 'Basmat', 'BMF', 'Basmat', 0, 470, 1, NULL, NULL),
(471, 'Basni', 'BANE', 'Basni', 0, 471, 1, NULL, NULL),
(472, 'Bassi', 'BAI', 'Bassi', 0, 472, 1, NULL, NULL),
(473, 'Bassi Pathanam', 'BSPN', 'Bassi Pathanam', 0, 473, 1, NULL, NULL),
(474, 'Basta', 'BTS', 'Basta', 0, 474, 1, NULL, NULL),
(475, 'Basti', 'BST', 'Basti', 0, 475, 1, NULL, NULL),
(476, 'Basugaon', 'BSGN', 'Basugaon', 0, 476, 1, NULL, NULL),
(477, 'Basukinath', 'BSKH', 'Basukinath', 0, 477, 1, NULL, NULL),
(478, 'Baswa', 'BU', 'Baswa', 0, 478, 1, NULL, NULL),
(479, 'Batala Junction', 'BAT', 'Batala Junction', 0, 479, 1, NULL, NULL),
(480, 'Bataspur', 'BSLE', 'Bataspur', 0, 480, 1, NULL, NULL),
(481, 'Bathinda Cantt.', 'BTIC', 'Bathinda Cantt.', 0, 481, 1, NULL, NULL),
(482, 'Bauria Junction', 'BVA', 'Bauria Junction', 0, 482, 1, NULL, NULL),
(483, 'Bawal', 'BWL', 'Bawal', 0, 483, 1, NULL, NULL),
(484, 'Bawani Khera', 'BWK', 'Bawani Khera', 0, 484, 1, NULL, NULL),
(485, 'Bayana', 'BXN', 'Bayana Junction', 0, 485, 1, NULL, NULL),
(486, 'Baytu', 'BUT', 'Baytu', 0, 486, 1, NULL, NULL),
(487, 'Bayyavaram', 'BVM', 'Bayyavaram', 0, 487, 1, NULL, NULL),
(488, 'Bazarsau', 'BZLE', 'Bazarsau', 0, 488, 1, NULL, NULL),
(489, 'Bazpur', 'BPZ', 'Bazpur', 0, 489, 1, NULL, NULL),
(490, 'Beas', 'BEAS', 'Beas', 0, 490, 1, NULL, NULL),
(491, 'Beawar', 'BER', 'Beawar', 0, 491, 1, NULL, NULL),
(492, 'Bechhiwara', 'BHWA', 'Bechhiwara', 0, 492, 1, NULL, NULL),
(493, 'Hyderabad', 'BMT', 'Begampet', 0, 493, 1, NULL, NULL),
(494, 'Begdewadi', 'BGW', 'Begdewadi', 0, 494, 1, NULL, NULL),
(495, 'Begu Sarai', 'BGS', 'Begu Sarai', 0, 495, 1, NULL, NULL),
(496, 'Behtagokul', 'BEG', 'Behtagokul', 0, 496, 1, NULL, NULL),
(497, 'Behula', 'BHLA', 'Behula', 0, 497, 1, NULL, NULL),
(498, 'Bekal Fort', 'BFR', 'Bekal Fort', 0, 498, 1, NULL, NULL),
(499, 'Bela', 'BELA', 'Bela', 0, 499, 1, NULL, NULL),
(500, 'Bela Tal', 'BTX', 'Bela Tal', 0, 500, 1, NULL, NULL),
(501, 'Belakoba', 'BLK', 'Belakoba', 0, 501, 1, NULL, NULL),
(502, 'Belampalli', 'BPA', 'Belampalli', 0, 502, 1, NULL, NULL),
(503, 'Belapur', 'BAP', 'Belapur', 0, 503, 1, NULL, NULL),
(504, 'Belasar', 'BLSR', 'Belasar', 0, 504, 1, NULL, NULL),
(505, 'Belda', 'BLDA', 'Belda', 0, 505, 1, NULL, NULL),
(506, 'Beldanga', 'BEB', 'Beldanga', 0, 506, 1, NULL, NULL),
(507, 'Belgahna', 'BIG', 'Belgahna', 0, 507, 1, NULL, NULL),
(508, 'Belgaum', 'BGM', 'Belgaum', 0, 508, 1, NULL, NULL),
(509, 'Belgharia', 'BLH', 'Belgharia', 0, 509, 1, NULL, NULL),
(510, 'Belha', 'BYL', 'Belha', 0, 510, 1, NULL, NULL),
(511, 'Bellamkonda', 'BMKD', 'Bellamkonda', 0, 511, 1, NULL, NULL),
(512, 'Bellary Cant', 'BYC', 'Bellary Cant', 0, 512, 1, NULL, NULL),
(513, 'Bellary', 'BAY', 'Bellary Junction', 0, 513, 1, NULL, NULL),
(514, 'Bellenahalli', 'BNHL', 'Bellenahalli', 0, 514, 1, NULL, NULL),
(515, 'Belpahar', 'BPH', 'Belpahar', 0, 515, 1, NULL, NULL),
(516, 'Belrayan', 'BXM', 'Belrayan', 0, 516, 1, NULL, NULL),
(517, 'Belsonda', 'BLSN', 'Belsonda', 0, 517, 1, NULL, NULL),
(518, 'Belthara Road', 'BLTR', 'Belthara Road', 0, 518, 1, NULL, NULL),
(519, 'Belvandi', 'BWD', 'Belvandi', 0, 519, 1, NULL, NULL),
(520, 'Beohari', 'BEHR', 'Beohari', 0, 520, 1, NULL, NULL),
(521, 'Berawanya', 'BRNA', 'Berawanya', 0, 521, 1, NULL, NULL),
(522, 'Berchha', 'BCH', 'Berchha', 0, 522, 1, NULL, NULL),
(523, 'Berhampore Crt', 'BPC', 'Berhampore Crt', 0, 523, 1, NULL, NULL),
(524, 'Bermo', 'BRMO', 'Bermo', 0, 524, 1, NULL, NULL),
(525, 'Besroli', 'BSRL', 'Besroli', 0, 525, 1, NULL, NULL),
(526, 'Betamcherla', 'BMH', 'Betamcherla', 0, 526, 1, NULL, NULL),
(527, 'Betavad', 'BEW', 'Betavad', 0, 527, 1, NULL, NULL),
(528, 'Bethampurdi', 'BTPD', 'Bethampurdi', 0, 528, 1, NULL, NULL),
(529, 'Bethuadahari', 'BTY', 'Bethuadahari', 0, 529, 1, NULL, NULL),
(530, 'Betnoti', 'BTQ', 'Betnoti', 0, 530, 1, NULL, NULL),
(531, 'Bettiah', 'BTH', 'Bettiah', 0, 531, 1, NULL, NULL),
(532, 'Betul', 'BZU', 'Betul', 0, 532, 1, NULL, NULL),
(533, 'Bevinahalu', 'BNL', 'Bevinahalu', 0, 533, 1, NULL, NULL),
(534, 'Bhabhar', 'BAH', 'Bhabhar', 0, 534, 1, NULL, NULL),
(535, 'Bhabta', 'BFT', 'Bhabta', 0, 535, 1, NULL, NULL),
(536, 'Bhabua Road', 'BBU', 'Bhabua Road', 0, 536, 1, NULL, NULL),
(537, 'Bhachau', 'BCO', 'Bhachau', 0, 537, 1, NULL, NULL),
(538, 'Bhachau Bg', 'BCOB', 'Bhachau Bg', 0, 538, 1, NULL, NULL),
(539, 'Bhadan', 'BDN', 'Bhadan', 0, 539, 1, NULL, NULL),
(540, 'Bhadanpur', 'BUU', 'Bhadanpur', 0, 540, 1, NULL, NULL),
(541, 'Bhadaura', 'BWH', 'Bhadaura', 0, 541, 1, NULL, NULL),
(542, 'Bhadbhadaghat', 'BVB', 'Bhadbhadaghat', 0, 542, 1, NULL, NULL),
(543, 'Bhadbhunja', 'BBAI', 'Bhadbhunja', 0, 543, 1, NULL, NULL),
(544, 'Bhadli', 'BDI', 'Bhadli', 0, 544, 1, NULL, NULL),
(545, 'Bhadohi', 'BOY', 'Bhadohi', 0, 545, 1, NULL, NULL),
(546, 'Bhadrachalam Road', 'BDCR', 'Bhadrachalam Road', 0, 546, 1, NULL, NULL),
(547, 'Bhadrakh', 'BHC', 'Bhadrakh', 0, 547, 1, NULL, NULL),
(548, 'Bhadravati', 'BDVT', 'Bhadravati', 0, 548, 1, NULL, NULL),
(549, 'Bhadreshwar', 'BHR', 'Bhadreshwar', 0, 549, 1, NULL, NULL),
(550, 'Bhadri', 'BHDR', 'Bhadri', 0, 550, 1, NULL, NULL),
(551, 'Bhadroli', 'BBY', 'Bhadroli', 0, 551, 1, NULL, NULL),
(552, 'Bhaga Junction', 'VAA', 'Bhaga Junction', 0, 552, 1, NULL, NULL),
(553, 'Bhagalpur', 'BGP', 'Bhagalpur', 0, 553, 1, NULL, NULL),
(554, 'Bhagalpur', 'ZZZZ', 'Bhagalpur', 0, 554, 1, NULL, NULL),
(555, 'Bhagat Ki Kothi', 'BGKT', 'Bhagat Ki Kothi', 0, 555, 1, NULL, NULL),
(556, 'Bhagwangola', 'BQG', 'Bhagwangola', 0, 556, 1, NULL, NULL),
(557, 'Bhagwanpur', 'BNR', 'Bhagwanpur', 0, 557, 1, NULL, NULL),
(558, 'Bhagwanpura', 'BGPR', 'Bhagwanpura', 0, 558, 1, NULL, NULL),
(559, 'Bhairoganj', 'BRU', 'Bhairoganj', 0, 559, 1, NULL, NULL),
(560, 'Bhairongarh', 'BOG', 'Bhairongarh', 0, 560, 1, NULL, NULL),
(561, 'Bhakti Nagar', 'BKNG', 'Bhakti Nagar', 0, 561, 1, NULL, NULL),
(562, 'Bhalki', 'BHLK', 'Bhalki', 0, 562, 1, NULL, NULL),
(563, 'Bhalui', 'BFM', 'Bhalui', 0, 563, 1, NULL, NULL),
(564, 'Bhaluka Road F', 'BKRD', 'Bhaluka Road F', 0, 564, 1, NULL, NULL),
(565, 'Bhalukmara', 'BLMR', 'Bhalukmara', 0, 565, 1, NULL, NULL),
(566, 'Bhalulata', 'BUL', 'Bhalulata', 0, 566, 1, NULL, NULL),
(567, 'Bhalumaska', 'BLMK', 'Bhalumaska', 0, 567, 1, NULL, NULL),
(568, 'Bhalwani', 'BLNI', 'Bhalwani', 0, 568, 1, NULL, NULL),
(569, 'Bhan Kari', 'BAK', 'Bhan Kari', 0, 569, 1, NULL, NULL),
(570, 'Bhanapur', 'BNP', 'Bhanapur', 0, 570, 1, NULL, NULL),
(571, 'Bhandak', 'BUX', 'Bhandak', 0, 571, 1, NULL, NULL),
(572, 'Bhandara Road', 'BRD', 'Bhandara Road', 0, 572, 1, NULL, NULL),
(573, 'Bhandaridah', 'BHME', 'Bhandaridah', 0, 573, 1, NULL, NULL),
(574, 'Bhandu Motidau', 'BHU', 'Bhandu Motidau', 0, 574, 1, NULL, NULL),
(575, 'Bhansi', 'BHNS', 'Bhansi', 0, 575, 1, NULL, NULL),
(576, 'Bhanvad', 'BNVD', 'Bhanvad', 0, 576, 1, NULL, NULL),
(577, 'Bhanvad', 'BNUD', 'Bhanvad', 0, 577, 1, NULL, NULL),
(578, 'Bhanwar Tonk', 'BHTK', 'Bhanwar Tonk', 0, 578, 1, NULL, NULL),
(579, 'Bhanwasa', 'BNWS', 'Bhanwasa', 0, 579, 1, NULL, NULL),
(580, 'Bharat Kup', 'BTKP', 'Bharat Kup', 0, 580, 1, NULL, NULL),
(581, 'Bharatpur Junction', 'BTE', 'Bharatpur Junction', 0, 581, 1, NULL, NULL),
(582, 'Bharoli', 'BHRL', 'Bharoli', 0, 582, 1, NULL, NULL),
(583, 'Bharthana', 'BNT', 'Bharthana', 0, 583, 1, NULL, NULL),
(584, 'Bharuch', 'BH', 'Bharuch Junction', 0, 584, 1, NULL, NULL),
(585, 'Bharwa Sumerpur', 'BSZ', 'Bharwa Sumerpur', 0, 585, 1, NULL, NULL),
(586, 'Bharwari', 'BRE', 'Bharwari', 0, 586, 1, NULL, NULL),
(587, 'Bhatapara', 'BYT', 'Bhatapara', 0, 587, 1, NULL, NULL),
(588, 'Bhatinda Junction', 'BTI', 'Bhatinda Junction', 0, 588, 1, NULL, NULL),
(589, 'Bhatisuda(Halt)', 'BTSD', 'Bhatisuda(Halt)', 0, 589, 1, NULL, NULL),
(590, 'Bhatiya', 'BHTA', 'Bhatiya', 0, 590, 1, NULL, NULL),
(591, 'Bhatkal', 'BTKL', 'Bhatkal', 0, 591, 1, NULL, NULL),
(592, 'Bhatkal', 'BTJL', 'Bhatkal', 0, 592, 1, NULL, NULL),
(593, 'Bhatni Junction', 'BTT', 'Bhatni Junction', 0, 593, 1, NULL, NULL),
(594, 'Bhaton Ki Gali', 'BHG', 'Bhaton Ki Gali', 0, 594, 1, NULL, NULL),
(595, 'Bhatpar Rani', 'BHTR', 'Bhatpar Rani', 0, 595, 1, NULL, NULL),
(596, 'Bhattiprolu', 'BQU', 'Bhattiprolu', 0, 596, 1, NULL, NULL),
(597, 'Bhattu', 'BHT', 'Bhattu', 0, 597, 1, NULL, NULL),
(598, 'Bhavanagar Para', 'BVP', 'Bhavanagar Para', 0, 598, 1, NULL, NULL),
(599, 'Bhavani Nagar', 'BVNR', 'Bhavani Nagar', 0, 599, 1, NULL, NULL),
(600, 'Bhavnagar Trmus', 'BVC', 'Bhavnagar Trmus', 0, 600, 1, NULL, NULL),
(601, 'Bhawani Mandi', 'BWM', 'Bhawani Mandi', 0, 601, 1, NULL, NULL),
(602, 'Bhawanipatna', 'BWIP', 'Bhawanipatna', 0, 602, 1, NULL, NULL),
(603, 'Bhayandar', 'BYR', 'Bhayandar', 0, 603, 1, NULL, NULL),
(604, 'Bhayavadar', 'BHY', 'Bhayavadar', 0, 604, 1, NULL, NULL),
(605, 'Bhedia', 'BDH', 'Bhedia', 0, 605, 1, NULL, NULL),
(606, 'Bheerpur', 'BEP', 'Bheerpur', 0, 606, 1, NULL, NULL),
(607, 'Bheja', 'BHJA', 'Bheja', 0, 607, 1, NULL, NULL),
(608, 'Bheraghat', 'BRGT', 'Bheraghat', 0, 608, 1, NULL, NULL),
(609, 'Bhesana', 'BFY', 'Bhesana', 0, 609, 1, NULL, NULL),
(610, 'Bheslana', 'BILA', 'Bheslana', 0, 610, 1, NULL, NULL),
(611, 'Bhestan', 'BHET', 'Bhestan', 0, 611, 1, NULL, NULL),
(612, 'Bhigwan', 'BGVN', 'Bhigwan', 0, 612, 1, NULL, NULL),
(613, 'Bhiknur', 'BKU', 'Bhiknur', 0, 613, 1, NULL, NULL),
(614, 'Bhilad', 'BLD', 'Bhilad', 0, 614, 1, NULL, NULL),
(615, 'Bhilai', 'BIA', 'Bhilai', 0, 615, 1, NULL, NULL),
(616, 'Bhilai Pwr Hs', 'BPHB', 'Bhilai Pwr Hs', 0, 616, 1, NULL, NULL),
(617, 'Bhilainagar', 'BQR', 'Bhilainagar', 0, 617, 1, NULL, NULL),
(618, 'Bhilavdi', 'BVQ', 'Bhilavdi', 0, 618, 1, NULL, NULL),
(619, 'Bhildi', 'BLDI', 'Bhildi', 0, 619, 1, NULL, NULL),
(620, 'Bhilwara', 'BHL', 'Bhilwara', 0, 620, 1, NULL, NULL),
(621, 'Bhimadolu', 'BMD', 'Bhimadolu', 0, 621, 1, NULL, NULL),
(622, 'Bhimal', 'BIML', 'Bhimal', 0, 622, 1, NULL, NULL),
(623, 'Bhimalgondi', 'BMC', 'Bhimalgondi', 0, 623, 1, NULL, NULL),
(624, 'Bhimana', 'BMN', 'Bhimana', 0, 624, 1, NULL, NULL),
(625, 'Bhimasar Bg', 'BMSB', 'Bhimasar Bg', 0, 625, 1, NULL, NULL),
(626, 'Bhimavaram Junction', 'BVRM', 'Bhimavaram Junction', 0, 626, 1, NULL, NULL),
(627, 'Bhimavaram Town', 'BVRT', 'Bhimavaram Town', 0, 627, 1, NULL, NULL),
(628, 'Bhimgara', 'BMGA', 'Bhimgara', 0, 628, 1, NULL, NULL),
(629, 'Bhimkhoj', 'BMKJ', 'Bhimkhoj', 0, 629, 1, NULL, NULL),
(630, 'Bhimsen', 'BZM', 'Bhimsen', 0, 630, 1, NULL, NULL),
(631, 'Bhind', 'BIX', 'Bhind', 0, 631, 1, NULL, NULL),
(632, 'Bhinwaliya', 'BWA', 'Bhinwaliya', 0, 632, 1, NULL, NULL),
(633, 'Bhira Kheri', 'BIK', 'Bhira Kheri', 0, 633, 1, NULL, NULL),
(634, 'Bhitaura', 'BTO', 'Bhitaura', 0, 634, 1, NULL, NULL),
(635, 'Bhitoni', 'BHTN', 'Bhitoni', 0, 635, 1, NULL, NULL),
(636, 'Bhivpuri Road', 'BVS', 'Bhivpuri Road', 0, 636, 1, NULL, NULL),
(637, 'Bhiwandi Road', 'BIRD', 'Bhiwandi Road', 0, 637, 1, NULL, NULL),
(638, 'Bhiwani', 'BNW', 'Bhiwani', 0, 638, 1, NULL, NULL),
(639, 'Bhiwani City', 'BNWC', 'Bhiwani City', 0, 639, 1, NULL, NULL),
(640, 'Bhogpur', 'BPRS', 'Bhogpur Sirwal', 0, 640, 1, NULL, NULL),
(641, 'Bhojipura Junction', 'BPR', 'Bhojipura Junction', 0, 641, 1, NULL, NULL),
(642, 'Bhojo', 'BOJ', 'Bhojo', 0, 642, 1, NULL, NULL),
(643, 'Bhojudih Junction', 'BJE', 'Bhojudih Junction', 0, 643, 1, NULL, NULL),
(644, 'Bhokar', 'BOKR', 'Bhokar', 0, 644, 1, NULL, NULL),
(645, 'Bhoke', 'BOKE', 'Bhoke', 0, 645, 1, NULL, NULL),
(646, 'Bhoma', 'BHV', 'Bhoma', 0, 646, 1, NULL, NULL),
(647, 'Bhone', 'BHNE', 'Bhone', 0, 647, 1, NULL, NULL),
(648, 'Bhongaon', 'BGQ', 'Bhongaon', 0, 648, 1, NULL, NULL),
(649, 'Bhongir', 'BG', 'Bhongir', 0, 649, 1, NULL, NULL),
(650, 'Bh Onra', 'BON', 'Bh Onra', 0, 650, 1, NULL, NULL),
(651, 'Bhopal Junction', 'BPL', 'Bhopal Junction', 0, 651, 1, NULL, NULL),
(652, 'Bhoras Budrukh', 'BFJ', 'Bhoras Budrukh', 0, 652, 1, NULL, NULL),
(653, 'Bhortex', 'BRTK', 'Bhortex', 0, 653, 1, NULL, NULL),
(654, 'Bhubaneswar', 'BBS', 'Bhubaneswar', 0, 654, 1, NULL, NULL),
(655, 'Bhuchchu', 'BCU', 'Bhuchchu', 0, 655, 1, NULL, NULL),
(656, 'Bhugaon', 'BPK', 'Bhugaon', 0, 656, 1, NULL, NULL),
(657, 'Bhuj', 'BHUJ', 'Bhuj', 0, 657, 1, NULL, NULL),
(658, 'Bhulanpur', 'BHLP', 'Bhulanpur', 0, 658, 1, NULL, NULL),
(659, 'Bhulon', 'BLO', 'Bhulon', 0, 659, 1, NULL, NULL),
(660, 'Bhupalsagar', 'BSJ', 'Bhupalsagar', 0, 660, 1, NULL, NULL),
(661, 'Bhupdeopur', 'BEF', 'Bhupdeopur', 0, 661, 1, NULL, NULL),
(662, 'Bhupia Mau', 'VPO', 'Bhupia Mau', 0, 662, 1, NULL, NULL),
(663, 'Bhurkunda', 'BHKD', 'Bhurkunda', 0, 663, 1, NULL, NULL),
(664, 'Bhusandpur', 'BSDP', 'Bhusandpur', 0, 664, 1, NULL, NULL),
(665, 'Bhusaval Junction', 'BSL', 'Bhusaval Junction', 0, 665, 1, NULL, NULL),
(666, 'Bhuteshwar', 'BTSR', 'Bhuteshwar', 0, 666, 1, NULL, NULL),
(667, 'Bibinagar', 'BN', 'Bibinagar', 0, 667, 1, NULL, NULL),
(668, 'Bichia', 'BIC', 'Bichia', 0, 668, 1, NULL, NULL),
(669, 'Bidadi', 'BID', 'Bidadi', 0, 669, 1, NULL, NULL),
(670, 'Bidanpur', 'BDNP', 'Bidanpur', 0, 670, 1, NULL, NULL),
(671, 'Bidar', 'BIDR', 'Bidar', 0, 671, 1, NULL, NULL),
(672, 'Bidhan Nagar', 'BNXR', 'Bidhan Nagar', 0, 672, 1, NULL, NULL),
(673, 'Bidupur', 'BIU', 'Bidupur', 0, 673, 1, NULL, NULL),
(674, 'Bigga', 'BIGA', 'Bigga', 0, 674, 1, NULL, NULL),
(675, 'Bighapur', 'BQP', 'Bighapur', 0, 675, 1, NULL, NULL),
(676, 'Bihar Sharif', 'BEHS', 'Bihar Sharif', 0, 676, 1, NULL, NULL),
(677, 'Bihara', 'BHZ', 'Bihara', 0, 677, 1, NULL, NULL),
(678, 'Bihiya', 'BEA', 'Bihiya', 0, 678, 1, NULL, NULL),
(679, 'Bihta', 'BTA', 'Bihta', 0, 679, 1, NULL, NULL),
(680, 'Bijainagar', 'BJNR', 'Bijainagar', 0, 680, 1, NULL, NULL),
(681, 'Bijapur', 'BJP', 'Bijapur', 0, 681, 1, NULL, NULL),
(682, 'Bijauli', 'BJI', 'Bijauli', 0, 682, 1, NULL, NULL),
(683, 'Bijaysota', 'VST', 'Bijaysota', 0, 683, 1, NULL, NULL),
(684, 'Bijni', 'BJF', 'Bijni', 0, 684, 1, NULL, NULL),
(685, 'Bijnor', 'BJO', 'Bijnor', 0, 685, 1, NULL, NULL),
(686, 'Bijoor', 'BIJR', 'Bijoor', 0, 686, 1, NULL, NULL),
(687, 'Bijora', 'BJK', 'Bijora', 0, 687, 1, NULL, NULL),
(688, 'Bijuli Halt', 'BJIH', 'Bijuli Halt', 0, 688, 1, NULL, NULL),
(689, 'Bijuri', 'BJRI', 'Bijuri', 0, 689, 1, NULL, NULL),
(690, 'Bijwasan', 'BWSN', 'Bijwasan', 0, 690, 1, NULL, NULL),
(691, 'Bikaner Junction', 'BKN', 'Bikaner Junction', 0, 691, 1, NULL, NULL),
(692, 'Bikkavolu', 'BVL', 'Bikkavolu', 0, 692, 1, NULL, NULL),
(693, 'Bikram Shila', 'BKSL', 'Bikram Shila', 0, 693, 1, NULL, NULL),
(694, 'Bikrampur', 'BMR', 'Bikrampur', 0, 694, 1, NULL, NULL),
(695, 'Bilaspur Junction', 'BSP', 'Bilaspur Junction', 0, 695, 1, NULL, NULL),
(696, 'Bilaspur Road', 'BLQR', 'Bilaspur Road', 0, 696, 1, NULL, NULL),
(697, 'Bilaspur Road', 'BLOR', 'Bilaspur Road', 0, 697, 1, NULL, NULL),
(698, 'Bildi', 'BILD', 'Bildi', 0, 698, 1, NULL, NULL),
(699, 'Bilga', 'BZG', 'Bilga', 0, 699, 1, NULL, NULL),
(700, 'Bilhar Ghat', 'BLG', 'Bilhar Ghat', 0, 700, 1, NULL, NULL),
(701, 'Bilhaur', 'BLU', 'Bilhaur', 0, 701, 1, NULL, NULL),
(702, 'Bilimora', 'BIM', 'Bilimora Junction', 0, 702, 1, NULL, NULL),
(703, 'Billi', 'BXLL', 'Billi', 0, 703, 1, NULL, NULL),
(704, 'Bilpur', 'BLPU', 'Bilpur', 0, 704, 1, NULL, NULL),
(705, 'Bilwai', 'BWI', 'Bilwai', 0, 705, 1, NULL, NULL),
(706, 'Bina Junction', 'BINA', 'Bina Junction', 0, 706, 1, NULL, NULL),
(707, 'Binaiki', 'VNK', 'Binaiki', 0, 707, 1, NULL, NULL),
(708, 'Bindayaka', 'BDYK', 'Bindayaka', 0, 708, 1, NULL, NULL),
(709, 'Bindki Road', 'BKO', 'Bindki Road', 0, 709, 1, NULL, NULL),
(710, 'Binnaguri', 'BNV', 'Binnaguri', 0, 710, 1, NULL, NULL),
(711, 'Bir', 'BIR', 'Bir', 0, 711, 1, NULL, NULL),
(712, 'Biradhwal', 'BDWL', 'Biradhwal', 0, 712, 1, NULL, NULL),
(713, 'Birambad', 'BAMA', 'Birambad', 0, 713, 1, NULL, NULL),
(714, 'Biramdih', 'BRMD', 'Biramdih', 0, 714, 1, NULL, NULL),
(715, 'Birang Khera', 'BMK', 'Birang Khera', 0, 715, 1, NULL, NULL),
(716, 'Birapatti', 'BRPT', 'Birapatti', 0, 716, 1, NULL, NULL),
(717, 'Birlanagar', 'BLNR', 'Birlanagar', 0, 717, 1, NULL, NULL),
(718, 'Birnagar', 'BIJ', 'Birnagar', 0, 718, 1, NULL, NULL),
(719, 'Birohe', 'BEO', 'Birohe', 0, 719, 1, NULL, NULL),
(720, 'Biroliya', 'BRLY', 'Biroliya', 0, 720, 1, NULL, NULL),
(721, 'Birsinghpur', 'BRS', 'Birsinghpur', 0, 721, 1, NULL, NULL),
(722, 'Birur', 'RRB', 'Birur Junction', 0, 722, 1, NULL, NULL),
(723, 'Bisalwas Kalan', 'BIWK', 'Bisalwas Kalan', 0, 723, 1, NULL, NULL),
(724, 'Bisanattam', 'BSM', 'Bisanattam', 0, 724, 1, NULL, NULL),
(725, 'Bisapurkalan', 'BRKH', 'Bisapurkalan', 0, 725, 1, NULL, NULL),
(726, 'Bishnathganj', 'BTJ', 'Bishnathganj', 0, 726, 1, NULL, NULL),
(727, 'Bishnupur', 'VSU', 'Bishnupur', 0, 727, 1, NULL, NULL),
(728, 'Bishrampur', 'BSPR', 'Bishrampur', 0, 728, 1, NULL, NULL),
(729, 'Bisra', 'BZR', 'Bisra', 0, 729, 1, NULL, NULL),
(730, 'Bissamcuttack', 'BMCK', 'Bissamcuttack', 0, 730, 1, NULL, NULL),
(731, 'Bissau', 'BUB', 'Bissau', 0, 731, 1, NULL, NULL),
(732, 'Bisugirsharif', 'BGSF', 'Bisugirsharif', 0, 732, 1, NULL, NULL),
(733, 'Biswan', 'BVN', 'Biswan', 0, 733, 1, NULL, NULL),
(734, 'Bitragunta', 'BTTR', 'Bitragunta', 0, 734, 1, NULL, NULL),
(735, 'Biyavra Rajgarh', 'BRRG', 'Biyavra Rajgarh', 0, 735, 1, NULL, NULL),
(736, 'Bobas', 'BOBS', 'Bobas', 0, 736, 1, NULL, NULL),
(737, 'Bobbili', 'VBL', 'Bobbili', 0, 737, 1, NULL, NULL),
(738, 'Bodhadi Bujrug', 'BHBK', 'Bodhadi Bujrug', 0, 738, 1, NULL, NULL),
(739, 'Bodwad', 'BDWD', 'Bodwad', 0, 739, 1, NULL, NULL),
(740, 'Bohali', 'BHLI', 'Bohali', 0, 740, 1, NULL, NULL),
(741, 'Bohani', 'BNE', 'Bohani', 0, 741, 1, NULL, NULL),
(742, 'Boinda', 'BONA', 'Boinda', 0, 742, 1, NULL, NULL),
(743, 'Boisar', 'BOR', 'Boisar', 0, 743, 1, NULL, NULL),
(744, 'Bokajan', 'BXJ', 'Bokajan', 0, 744, 1, NULL, NULL),
(745, 'Bokaro', 'BKSC', 'Bokaro Stl City', 0, 745, 1, NULL, NULL),
(746, 'Bokaro Thermal', 'BKRO', 'Bokaro Thermal', 0, 746, 1, NULL, NULL),
(747, 'Bolai', 'BLX', 'Bolai', 0, 747, 1, NULL, NULL),
(748, 'Bolarum', 'BMO', 'Bolarum', 0, 748, 1, NULL, NULL),
(749, 'Bolarum Bazar', 'BOZ', 'Bolarum Bazar', 0, 749, 1, NULL, NULL),
(750, 'Bolinna Doaba', 'BLND', 'Bolinna Doaba', 0, 750, 1, NULL, NULL),
(751, 'Bolpur S Niktn', 'BHP', 'Bolpur S Niktn', 0, 751, 1, NULL, NULL),
(752, 'Bolsa', 'BLSA', 'Bolsa', 0, 752, 1, NULL, NULL),
(753, 'Bomadra', 'BOM', 'Bomadra', 0, 753, 1, NULL, NULL),
(754, 'Bommidi', 'BQI', 'Bommidi', 0, 754, 1, NULL, NULL),
(755, 'Bona Kalu', 'BKL', 'Bona Kalu', 0, 755, 1, NULL, NULL),
(756, 'Bondamunda', 'BNDM', 'Bondamunda', 0, 756, 1, NULL, NULL),
(757, 'Bongaigaon', 'BNGN', 'Bongaigaon', 0, 757, 1, NULL, NULL),
(758, 'Bonidanga', 'BDAG', 'Bonidanga', 0, 758, 1, NULL, NULL),
(759, 'Borawar', 'BOW', 'Borawar', 0, 759, 1, NULL, NULL),
(760, 'Bordhal', 'BXY', 'Bordhal', 0, 760, 1, NULL, NULL),
(761, 'Bordi', 'BIO', 'Bordi', 0, 761, 1, NULL, NULL),
(762, 'Borhat', 'BFD', 'Borhat', 0, 762, 1, NULL, NULL),
(763, 'Boribial', 'BRB', 'Boribial', 0, 763, 1, NULL, NULL),
(764, 'Boridand', 'BRND', 'Boridand', 0, 764, 1, NULL, NULL),
(765, 'Mumbai', 'BVI', 'Borivali', 0, 765, 1, NULL, NULL),
(766, 'Boroti', 'BOT', 'Boroti', 0, 766, 1, NULL, NULL),
(767, 'Borraguhallu', 'BGHU', 'Borraguhallu', 0, 767, 1, NULL, NULL),
(768, 'Bortalao', 'BTL', 'Bortalao', 0, 768, 1, NULL, NULL),
(769, 'Borvihir', 'BRVR', 'Borvihir', 0, 769, 1, NULL, NULL),
(770, 'Botad Junction', 'BTD', 'Botad Junction', 0, 770, 1, NULL, NULL),
(771, 'Bpt Station', 'XXXX', 'Bpt Station', 0, 771, 1, NULL, NULL),
(772, 'Brahmanagudem', 'BMGM', 'Brahmanagudem', 0, 772, 1, NULL, NULL),
(773, 'Brahmanpalli', 'BMPL', 'Brahmanpalli', 0, 773, 1, NULL, NULL),
(774, 'Brahmapur', 'BAM', 'Brahmapur', 0, 774, 1, NULL, NULL),
(775, 'Brajrajnagar', 'BRJN', 'Brajrajnagar', 0, 775, 1, NULL, NULL),
(776, 'Brayla Chaurasi', 'BRLA', 'Brayla Chaurasi', 0, 776, 1, NULL, NULL),
(777, 'Budalur', 'BAL', 'Budalur', 0, 777, 1, NULL, NULL),
(778, 'Budaun', 'BEM', 'Budaun', 0, 778, 1, NULL, NULL),
(779, 'Buddireddippati', 'BDY', 'Buddireddippati', 0, 779, 1, NULL, NULL),
(780, 'Budhi', 'BDHY', 'Budhi', 0, 780, 1, NULL, NULL),
(781, 'Budhlada', 'BLZ', 'Budhlada', 0, 781, 1, NULL, NULL),
(782, 'Budni', 'BNI', 'Budni', 0, 782, 1, NULL, NULL),
(783, 'Budvel', 'BDVL', 'Budvel', 0, 783, 1, NULL, NULL),
(784, 'Bulandshahr', 'BSC', 'Bulandshahr', 0, 784, 1, NULL, NULL),
(785, 'Bundi', 'BUDI', 'Bundi', 0, 785, 1, NULL, NULL),
(786, 'Bundki', 'BEK', 'Bundki', 0, 786, 1, NULL, NULL),
(787, 'Buniadpur', 'BNDP', 'Buniadpur', 0, 787, 1, NULL, NULL),
(788, 'Burhanpur', 'BAU', 'Burhanpur', 0, 788, 1, NULL, NULL),
(789, 'Burhar', 'BUH', 'Burhar', 0, 789, 1, NULL, NULL),
(790, 'Burhwal', 'BUW', 'Burhwal', 0, 790, 1, NULL, NULL),
(791, 'Burnpur', 'BURN', 'Burnpur', 0, 791, 1, NULL, NULL),
(792, 'Butari', 'BTR', 'Butari', 0, 792, 1, NULL, NULL),
(793, 'Buti Bori', 'BTBR', 'Buti Bori', 0, 793, 1, NULL, NULL),
(794, 'Buxar', 'BXR', 'Buxar', 0, 794, 1, NULL, NULL),
(795, 'Byadarahalli', 'BDRL', 'Byadarahalli', 0, 795, 1, NULL, NULL),
(796, 'Byadgi', 'BYD', 'Byadgi', 0, 796, 1, NULL, NULL),
(797, 'Byculla', 'BY', 'Byculla', 0, 797, 1, NULL, NULL),
(798, 'Byndoor', 'BYNR', 'Byndoor', 0, 798, 1, NULL, NULL),
(799, 'Kolhapur', 'KOP', 'C Shahumharaj T', 0, 799, 1, NULL, NULL),
(800, 'Cancona', 'CNO', 'Cancona', 0, 800, 1, NULL, NULL),
(801, 'Castle Rock', 'CLR', 'Castle Rock', 0, 801, 1, NULL, NULL),
(802, 'Cavalry Barrcks', 'CVB', 'Cavalry Barrcks', 0, 802, 1, NULL, NULL),
(803, 'Chabua', 'CHB', 'Chabua', 0, 803, 1, NULL, NULL),
(804, 'Chachaura Bngj', 'CBK', 'Chachaura Bngj', 0, 804, 1, NULL, NULL),
(805, 'Chacher', 'CHCR', 'Chacher', 0, 805, 1, NULL, NULL),
(806, 'Chagallu', 'CU', 'Chagallu', 0, 806, 1, NULL, NULL),
(807, 'Chaibasa', 'CBSA', 'Chaibasa', 0, 807, 1, NULL, NULL),
(808, 'Chainpur', 'CNPR', 'Chainpur', 0, 808, 1, NULL, NULL),
(809, 'Chainwa', 'CW', 'Chainwa', 0, 809, 1, NULL, NULL),
(810, 'Chajawa', 'CJW', 'Chajawa', 0, 810, 1, NULL, NULL),
(811, 'Chajli', 'CJL', 'Chajli', 0, 811, 1, NULL, NULL),
(812, 'Chakand', 'CKH', 'Chakand', 0, 812, 1, NULL, NULL),
(813, 'Chakarbhatha', 'CHBT', 'Chakarbhatha', 0, 813, 1, NULL, NULL),
(814, 'Chakarlapalli', 'CPL', 'Chakarlapalli', 0, 814, 1, NULL, NULL),
(815, 'Chakarpur', 'CKK', 'Chakarpur', 0, 815, 1, NULL, NULL),
(816, 'Chakdaha', 'CDH', 'Chakdaha', 0, 816, 1, NULL, NULL);
INSERT INTO `stations` (`id`, `station_name`, `station_code`, `location`, `station_quarter`, `short`, `is_active`, `created_at`, `updated_at`) VALUES
(817, 'Chakdayala', 'CKDL', 'Chakdayala', 0, 817, 1, NULL, NULL),
(818, 'Chakia', 'CAA', 'Chakia', 0, 818, 1, NULL, NULL),
(819, 'Chakki Bank', 'CHKB', 'Chakki Bank', 0, 819, 1, NULL, NULL),
(820, 'Chakradharpur', 'CKP', 'Chakradharpur', 0, 820, 1, NULL, NULL),
(821, 'Chakraj Mal', 'CAJ', 'Chakraj Mal', 0, 821, 1, NULL, NULL),
(822, 'Chakrod', 'CKOD', 'Chakrod', 0, 822, 1, NULL, NULL),
(823, 'Chaksu', 'CKS', 'Chaksu', 0, 823, 1, NULL, NULL),
(824, 'Chakulia', 'CKU', 'Chakulia', 0, 824, 1, NULL, NULL),
(825, 'Chakur', 'CKX', 'Chakur', 0, 825, 1, NULL, NULL),
(826, 'Chalakudi', 'CKI', 'Chalakudi', 0, 826, 1, NULL, NULL),
(827, 'Chalama', 'CMZ', 'Chalama', 0, 827, 1, NULL, NULL),
(828, 'Chalgeri', 'CLI', 'Chalgeri', 0, 828, 1, NULL, NULL),
(829, 'Chalisgaon', 'CSN', 'Chalisgaon Junction', 0, 829, 1, NULL, NULL),
(830, 'Challakere', 'CHKE', 'Challakere', 0, 830, 1, NULL, NULL),
(831, 'Chalsa Junction', 'CLD', 'Chalsa Junction', 0, 831, 1, NULL, NULL),
(832, 'Chalthan', 'CHM', 'Chalthan', 0, 832, 1, NULL, NULL),
(833, 'Chamagram', 'CMX', 'Chamagram', 0, 833, 1, NULL, NULL),
(834, 'Chamarajanagar', 'CMNR', 'Chamarajanagar', 0, 834, 1, NULL, NULL),
(835, 'Champa', 'CPH', 'Champa', 0, 835, 1, NULL, NULL),
(836, 'Champaner Road Jn', 'CPN', 'Champaner Road Jn', 0, 836, 1, NULL, NULL),
(837, 'Chand Siau', 'CPS', 'Chand Siau', 0, 837, 1, NULL, NULL),
(838, 'Chanda Fort', 'CAF', 'Chanda Fort', 0, 838, 1, NULL, NULL),
(839, 'Chandan Nagar', 'CGR', 'Chandan Nagar', 0, 839, 1, NULL, NULL),
(840, 'Chandanattop', 'CTPE', 'Chandanattop', 0, 840, 1, NULL, NULL),
(841, 'Chandari', 'CNBI', 'Chandari', 0, 841, 1, NULL, NULL),
(842, 'Chandauli Mjhwr', 'CDMR', 'Chandauli Mjhwr', 0, 842, 1, NULL, NULL),
(843, 'Chandausi', 'CH', 'Chandausi Junction', 0, 843, 1, NULL, NULL),
(844, 'Chandawal', 'CNL', 'Chandawal', 0, 844, 1, NULL, NULL),
(845, 'Chanderiya', 'CNA', 'Chanderiya', 0, 845, 1, NULL, NULL),
(846, 'Chandi Mandir', 'CNDM', 'Chandi Mandir', 0, 846, 1, NULL, NULL),
(847, 'Chandia Road', 'CHD', 'Chandia Road', 0, 847, 1, NULL, NULL),
(848, 'Chandigarh', 'CDG', 'Chandigarh', 0, 848, 1, NULL, NULL),
(849, 'Chandil Junction', 'CNI', 'Chandil Junction', 0, 849, 1, NULL, NULL),
(850, 'Chandlodiya', 'CDLD', 'Chandlodiya', 0, 850, 1, NULL, NULL),
(851, 'Chandlodiya', 'CLDY', 'Chandlodiya', 0, 851, 1, NULL, NULL),
(852, 'Chandok', 'CNK', 'Chandok', 0, 852, 1, NULL, NULL),
(853, 'Chandragiri', 'CGI', 'Chandragiri', 0, 853, 1, NULL, NULL),
(854, 'Chandrakona Road', 'CDGR', 'Chandrakona Road', 0, 854, 1, NULL, NULL),
(855, 'Chandranathpur', 'CNE', 'Chandranathpur', 0, 855, 1, NULL, NULL),
(856, 'Chandrapur', 'CD', 'Chandrapur', 0, 856, 1, NULL, NULL),
(857, 'Chandrapura', 'CRP', 'Chandrapura', 0, 857, 1, NULL, NULL),
(858, 'Chandur', 'CND', 'Chandur', 0, 858, 1, NULL, NULL),
(859, 'Chandur Bazar', 'CNDB', 'Chandur Bazar', 0, 859, 1, NULL, NULL),
(860, 'Chaneti', 'CHTI', 'Chaneti', 0, 860, 1, NULL, NULL),
(861, 'Changanaseri', 'CGY', 'Changanaseri', 0, 861, 1, NULL, NULL),
(862, 'Changotola', 'CGLA', 'Changotola', 0, 862, 1, NULL, NULL),
(863, 'Changsari', 'CGS', 'Changsari', 0, 863, 1, NULL, NULL),
(864, 'Channani', 'CHNN', 'Channani', 0, 864, 1, NULL, NULL),
(865, 'Channapatna', 'CPT', 'Channapatna', 0, 865, 1, NULL, NULL),
(866, 'Chanpatia', 'CAI', 'Chanpatia', 0, 866, 1, NULL, NULL),
(867, 'Chaparmukh Junction', 'CPK', 'Chaparmukh Junction', 0, 867, 1, NULL, NULL),
(868, 'Charamula Kusum', 'CJS', 'Charamula Kusum', 0, 868, 1, NULL, NULL),
(869, 'Charanmahadevi', 'SMD', 'Charanmahadevi', 0, 869, 1, NULL, NULL),
(870, 'Charaud', 'CRW', 'Charaud', 0, 870, 1, NULL, NULL),
(871, 'Charbatia', 'CBT', 'Charbatia', 0, 871, 1, NULL, NULL),
(872, 'Charegaon', 'CRN', 'Charegaon', 0, 872, 1, NULL, NULL),
(873, 'Charghat Pipari', 'CGE', 'Charghat Pipari', 0, 873, 1, NULL, NULL),
(874, 'Charkhera', 'CRK', 'Charkhera', 0, 874, 1, NULL, NULL),
(875, 'Dadri', 'CKD', 'Charkhi Dadri', 0, 875, 1, NULL, NULL),
(876, 'Charlapalli', 'CHZ', 'Charlapalli', 0, 876, 1, NULL, NULL),
(877, 'Charvattur', 'CHV', 'Charvattur', 0, 877, 1, NULL, NULL),
(878, 'Chata', 'CHJ', 'Chata', 0, 878, 1, NULL, NULL),
(879, 'Chatra', 'CTR', 'Chatra', 0, 879, 1, NULL, NULL),
(880, 'Chatrappatti', 'CHPT', 'Chatrappatti', 0, 880, 1, NULL, NULL),
(881, 'Chatrapur', 'CAP', 'Chatrapur', 0, 881, 1, NULL, NULL),
(882, 'Chattriput', 'CTS', 'Chattriput', 0, 882, 1, NULL, NULL),
(883, 'Chau Mahla', 'CMU', 'Chau Mahla', 0, 883, 1, NULL, NULL),
(884, 'Chaube', 'CBH', 'Chaube', 0, 884, 1, NULL, NULL),
(885, 'Chauk', 'CHOK', 'Chauk', 0, 885, 1, NULL, NULL),
(886, 'Chaukhandi', 'CHH', 'Chaukhandi', 0, 886, 1, NULL, NULL),
(887, 'Chaunrah', 'CNH', 'Chaunrah', 0, 887, 1, NULL, NULL),
(888, 'Chaura', 'CUX', 'Chaura', 0, 888, 1, NULL, NULL),
(889, 'Chauri Chaura', 'CC', 'Chauri Chaura', 0, 889, 1, NULL, NULL),
(890, 'Chausa', 'CSA', 'Chausa', 0, 890, 1, NULL, NULL),
(891, 'Chautara', 'CROA', 'Chautara', 0, 891, 1, NULL, NULL),
(892, 'Chauth Ka Brwra', 'CKB', 'Chauth Ka Brwra', 0, 892, 1, NULL, NULL),
(893, 'Chavaj', 'CVJ', 'Chavaj', 0, 893, 1, NULL, NULL),
(894, 'Chavalkhede', 'CHLK', 'Chavalkhede', 0, 894, 1, NULL, NULL),
(895, 'Chawapall', 'CHA', 'Chawapall', 0, 895, 1, NULL, NULL),
(896, 'Chebrol', 'CEL', 'Chebrol', 0, 896, 1, NULL, NULL),
(897, 'Cheekateegalplm', 'CEM', 'Cheekateegalplm', 0, 897, 1, NULL, NULL),
(898, 'Chengalpattu', 'CGL', 'Chengalpattu', 0, 898, 1, NULL, NULL),
(899, 'Chengannur', 'CNGR', 'Chengannur', 0, 899, 1, NULL, NULL),
(900, 'Chennai', 'MSB', 'Chennai Beach', 0, 900, 1, NULL, NULL),
(901, 'Chennai', 'MAS', 'Chennai Central', 0, 901, 1, NULL, NULL),
(902, 'Chennai', 'MS', 'Chennai Egmore', 0, 902, 1, NULL, NULL),
(903, 'Chennasandra', 'CSDR', 'Chennasandra', 0, 903, 1, NULL, NULL),
(904, 'Cheoki', 'COI', 'Cheoki', 0, 904, 1, NULL, NULL),
(905, 'Cheriyanad', 'CYN', 'Cheriyanad', 0, 905, 1, NULL, NULL),
(906, 'Cherukara', 'CQA', 'Cherukara', 0, 906, 1, NULL, NULL),
(907, 'Chettinad', 'CTND', 'Chettinad', 0, 907, 1, NULL, NULL),
(908, 'Chhabra Gugor', 'CAG', 'Chhabra Gugor', 0, 908, 1, NULL, NULL),
(909, 'Chhan Arorian', 'CHNR', 'Chhan Arorian', 0, 909, 1, NULL, NULL),
(910, 'Chhandrauli', 'CDRL', 'Chhandrauli', 0, 910, 1, NULL, NULL),
(911, 'Chhanera', 'CAER', 'Chhanera', 0, 911, 1, NULL, NULL),
(912, 'Chhapi', 'CHP', 'Chhapi', 0, 912, 1, NULL, NULL),
(913, 'Chhapra', 'CPR', 'Chhapra', 0, 913, 1, NULL, NULL),
(914, 'Chhapra Kacheri', 'CI', 'Chhapra Kacheri', 0, 914, 1, NULL, NULL),
(915, 'Chharodi', 'CE', 'Chharodi', 0, 915, 1, NULL, NULL),
(916, 'Chharra', 'CHRA', 'Chharra', 0, 916, 1, NULL, NULL),
(917, 'Chhatna', 'CJN', 'Chhatna', 0, 917, 1, NULL, NULL),
(918, 'Chhina', 'CHN', 'Chhina', 0, 918, 1, NULL, NULL),
(919, 'Chhindwara Junction', 'CWA', 'Chhindwara Junction', 0, 919, 1, NULL, NULL),
(920, 'Chhipadohar', 'CPDR', 'Chhipadohar', 0, 920, 1, NULL, NULL),
(921, 'Chhota Gudha', 'COD', 'Chhota Gudha', 0, 921, 1, NULL, NULL),
(922, 'Chhoti Odai', 'COO', 'Chhoti Odai', 0, 922, 1, NULL, NULL),
(923, 'Chhulha', 'CLF', 'Chhulha', 0, 923, 1, NULL, NULL),
(924, 'Chichaki', 'CCK', 'Chichaki', 0, 924, 1, NULL, NULL),
(925, 'Chidambaram', 'CDM', 'Chidambaram', 0, 925, 1, NULL, NULL),
(926, 'Chigicherla', 'CCA', 'Chigicherla', 0, 926, 1, NULL, NULL),
(927, 'Chiheru', 'CEU', 'Chiheru', 0, 927, 1, NULL, NULL),
(928, 'Chik Banavar', 'BAW', 'Chik Banavar', 0, 928, 1, NULL, NULL),
(929, 'Chikalthan', 'CTH', 'Chikalthan', 0, 929, 1, NULL, NULL),
(930, 'Chikhli', 'CKHS', 'Chikhli', 0, 930, 1, NULL, NULL),
(931, 'Chikjajur Junction', 'JRU', 'Chikjajur Junction', 0, 931, 1, NULL, NULL),
(932, 'Chikni Road', 'CKNI', 'Chikni Road', 0, 932, 1, NULL, NULL),
(933, 'Chikodi Road', 'CKR', 'Chikodi Road', 0, 933, 1, NULL, NULL),
(934, 'Chilakalapudi', 'CLU', 'Chilakalapudi', 0, 934, 1, NULL, NULL),
(935, 'Chilbila Junction', 'CIL', 'Chilbila Junction', 0, 935, 1, NULL, NULL),
(936, 'Chilikidara', 'CLDR', 'Chilikidara', 0, 936, 1, NULL, NULL),
(937, 'Chilka', 'CLKA', 'Chilka', 0, 937, 1, NULL, NULL),
(938, 'Chilkahar', 'CHR', 'Chilkahar', 0, 938, 1, NULL, NULL),
(939, 'Chilo', 'CLO', 'Chilo', 0, 939, 1, NULL, NULL),
(940, 'Chiluvur', 'CLVR', 'Chiluvur', 0, 940, 1, NULL, NULL),
(941, 'Chima Pahad', 'CMW', 'Chima Pahad', 0, 941, 1, NULL, NULL),
(942, 'Chimidipalli', 'CMDP', 'Chimidipalli', 0, 942, 1, NULL, NULL),
(943, 'Chinchli', 'CNC', 'Chinchli', 0, 943, 1, NULL, NULL),
(944, 'Chinchpada', 'CPD', 'Chinchpada', 0, 944, 1, NULL, NULL),
(945, 'Pune', 'CCH', 'Chinchvad', 0, 945, 1, NULL, NULL),
(946, 'Chinna Ganjam', 'CJM', 'Chinna Ganjam', 0, 946, 1, NULL, NULL),
(947, 'Chinna Salem', 'CHSM', 'Chinna Salem', 0, 947, 1, NULL, NULL),
(948, 'Chinnaravuru', 'CIV', 'Chinnaravuru', 0, 948, 1, NULL, NULL),
(949, 'Chinpai', 'CPLE', 'Chinpai', 0, 949, 1, NULL, NULL),
(950, 'Chintaman Ganes', 'CNN', 'Chintaman Ganes', 0, 950, 1, NULL, NULL),
(951, 'Chiplun', 'CHI', 'Chiplun', 0, 951, 1, NULL, NULL),
(952, 'Chipurupalle', 'CPP', 'Chipurupalle', 0, 952, 1, NULL, NULL),
(953, 'Chirala', 'CLX', 'Chirala', 0, 953, 1, NULL, NULL),
(954, 'Chirawa', 'CRWA', 'Chirawa', 0, 954, 1, NULL, NULL),
(955, 'Chirayinkil', 'CRY', 'Chirayinkil', 0, 955, 1, NULL, NULL),
(956, 'Chirgaon', 'CGN', 'Chirgaon', 0, 956, 1, NULL, NULL),
(957, 'Chirmiri', 'CHRM', 'Chirmiri', 0, 957, 1, NULL, NULL),
(958, 'Chit Baragaon', 'CBN', 'Chit Baragaon', 0, 958, 1, NULL, NULL),
(959, 'Chitahra', 'CTHR', 'Chitahra', 0, 959, 1, NULL, NULL),
(960, 'Chitali', 'CIT', 'Chitali', 0, 960, 1, NULL, NULL),
(961, 'Chitgidda', 'CTF', 'Chitgidda', 0, 961, 1, NULL, NULL),
(962, 'Chitradurg', 'CTA', 'Chitradurg', 0, 962, 1, NULL, NULL),
(963, 'Chitrakot', 'CKTD', 'Chitrakot', 0, 963, 1, NULL, NULL),
(964, 'Chitrasani', 'CTT', 'Chitrasani', 0, 964, 1, NULL, NULL),
(965, 'Chitrod', 'COE', 'Chitrod', 0, 965, 1, NULL, NULL),
(966, 'Chittapur', 'CT', 'Chittapur', 0, 966, 1, NULL, NULL),
(967, 'Chittaranjan', 'CRJ', 'Chittaranjan', 0, 967, 1, NULL, NULL),
(968, 'Chittaurgarh', 'COR', 'Chittaurgarh', 0, 968, 1, NULL, NULL),
(969, 'Chittor', 'CTO', 'Chittor', 0, 969, 1, NULL, NULL),
(970, 'Chityala', 'CTYL', 'Chityala', 0, 970, 1, NULL, NULL),
(971, 'Chodiala', 'CDL', 'Chodiala', 0, 971, 1, NULL, NULL),
(972, 'Chola', 'CHL', 'Chola', 0, 972, 1, NULL, NULL),
(973, 'Chomun Samod', 'COM', 'Chomun Samod', 0, 973, 1, NULL, NULL),
(974, 'Chopan', 'CPU', 'Chopan', 0, 974, 1, NULL, NULL),
(975, 'Choral', 'CRL', 'Choral', 0, 975, 1, NULL, NULL),
(976, 'Chorghatpiparia', 'CRE', 'Chorghatpiparia', 0, 976, 1, NULL, NULL),
(977, 'Chorgi', 'CHRG', 'Chorgi', 0, 977, 1, NULL, NULL),
(978, 'Chorvad Road', 'CVR', 'Chorvad Road', 0, 978, 1, NULL, NULL),
(979, 'Choti Khatu', 'CTKT', 'Choti Khatu', 0, 979, 1, NULL, NULL),
(980, 'Choupale', 'CUE', 'Choupale', 0, 980, 1, NULL, NULL),
(981, 'Chuchura', 'CNS', 'Chuchura', 0, 981, 1, NULL, NULL),
(982, 'Chudawa', 'CRU', 'Chudawa', 0, 982, 1, NULL, NULL),
(983, 'Chunar', 'CAR', 'Chunar', 0, 983, 1, NULL, NULL),
(984, 'Churaibari', 'CBZ', 'Churaibari', 0, 984, 1, NULL, NULL),
(985, 'Churk', 'CUK', 'Churk', 0, 985, 1, NULL, NULL),
(986, 'Churu', 'CUR', 'Churu', 0, 986, 1, NULL, NULL),
(987, 'Cinnamara', 'CMA', 'Cinnamara', 0, 987, 1, NULL, NULL),
(988, 'Clutterbuckganj', 'CBJ', 'Clutterbuckganj', 0, 988, 1, NULL, NULL),
(989, 'Coimbatore', 'CBE', 'Coimbatore Junction', 0, 989, 1, NULL, NULL),
(990, 'Coimbatore', 'CBF', 'Coimbatore Nrth', 0, 990, 1, NULL, NULL),
(991, 'Colonelganj', 'CLJ', 'Colonelganj', 0, 991, 1, NULL, NULL),
(992, 'Contai Road', 'CNT', 'Contai Road', 0, 992, 1, NULL, NULL),
(993, 'Coonoor', 'ONR', 'Coonoor', 0, 993, 1, NULL, NULL),
(994, 'Cossimbazar', 'CSZ', 'Cossimbazar', 0, 994, 1, NULL, NULL),
(995, 'Cuddalore Port', 'CUPJ', 'Cuddalore Port', 0, 995, 1, NULL, NULL),
(996, 'Cuddapah', 'HX', 'Cuddapah', 0, 996, 1, NULL, NULL),
(997, 'Cumbum', 'CBM', 'Cumbum', 0, 997, 1, NULL, NULL),
(998, 'Cuttack', 'CTC', 'Cuttack', 0, 998, 1, NULL, NULL),
(999, 'Dabhaura', 'DBR', 'Dabhaura', 0, 999, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trains`
--

DROP TABLE IF EXISTS `trains`;
CREATE TABLE IF NOT EXISTS `trains` (
  `id` int NOT NULL AUTO_INCREMENT,
  `train_name` varchar(255) DEFAULT NULL,
  `train_no` varchar(10) DEFAULT NULL,
  `from_station` varchar(100) DEFAULT NULL,
  `to_station` varchar(100) DEFAULT NULL,
  `short` int NOT NULL,
  `is_active` int NOT NULL DEFAULT '1' COMMENT '1:Active,0:De-active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trains`
--

INSERT INTO `trains` (`id`, `train_name`, `train_no`, `from_station`, `to_station`, `short`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Andhra Pradesh Express', '12723', 'Hyderabad Decan', 'New Delhi', 1, 1, '2023-11-15 18:30:00', NULL),
(2, 'Cdg Indb Express', '19308', 'Chandigarh', 'Indore Junction Bg', 2, 1, '2023-11-15 18:30:00', NULL),
(3, 'Cdg Ppta Express', '13256', 'Chandigarh', 'Danapur', 3, 1, '2023-11-15 18:30:00', NULL),
(4, 'Cdg Asr Inaugra', '02411', 'Chandigarh', 'Amritsar Junction', 4, 1, '2023-11-15 18:30:00', NULL),
(5, 'Cdg Dli Express', '04032', 'Chandigarh', 'Delhi', 5, 1, '2023-11-15 18:30:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `traveling_allowances`
--

DROP TABLE IF EXISTS `traveling_allowances`;
CREATE TABLE IF NOT EXISTS `traveling_allowances` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from_date` datetime DEFAULT NULL,
  `arrived_date` datetime DEFAULT NULL,
  `train_id` varchar(40) DEFAULT NULL,
  `from_station` int DEFAULT NULL,
  `to_station` int DEFAULT NULL,
  `hrs_out_of_hq` decimal(10,2) DEFAULT NULL,
  `amt` decimal(10,2) DEFAULT NULL,
  `ta_percentage` int DEFAULT NULL,
  `object_of_journey` varchar(255) DEFAULT NULL,
  `is_active` int NOT NULL DEFAULT '1' COMMENT '1 means Active and 0 means De-active',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `traveling_allowances`
--

INSERT INTO `traveling_allowances` (`id`, `from_date`, `arrived_date`, `train_id`, `from_station`, `to_station`, `hrs_out_of_hq`, `amt`, `ta_percentage`, `object_of_journey`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(1, '2023-11-01 06:45:00', '2023-11-01 09:30:00', '4', 4, 48, NULL, NULL, NULL, '0000-00-00 00:00:00', 1, 1, '2023-11-15 20:26:36', NULL),
(2, '2023-11-01 07:30:00', '2023-11-01 10:30:00', '5', 8, 62, NULL, NULL, NULL, '0000-00-00 00:00:00', 1, 1, '2023-11-15 20:26:36', NULL),
(3, '2025-04-30 05:30:00', '2025-04-30 16:30:00', '1', 1, 134, NULL, NULL, NULL, NULL, 1, 3, '2025-05-01 05:10:55', '2025-05-01 05:10:55'),
(4, '2025-05-01 05:30:00', '2025-05-01 16:30:00', '2', 1, 3, NULL, NULL, NULL, NULL, 1, 3, '2025-05-01 05:14:06', '2025-05-01 05:14:06'),
(5, '2025-05-01 11:30:00', '2025-05-01 22:30:00', '3', 4, 12, NULL, NULL, NULL, NULL, 1, 3, '2025-05-01 05:18:52', '2025-05-01 05:18:52'),
(6, '2025-05-01 11:00:00', '2025-05-01 22:00:00', '2', 315, 998, NULL, NULL, NULL, NULL, 1, 3, '2025-05-01 05:24:43', '2025-05-01 05:24:43'),
(7, '2025-05-01 22:30:00', '2025-05-01 23:30:00', '3', 21, 61, NULL, NULL, NULL, NULL, 1, 3, '2025-05-01 05:24:43', '2025-05-01 05:24:43'),
(8, '2025-04-29 19:30:00', '2025-04-30 15:00:00', '4', 29, 4, NULL, NULL, NULL, NULL, 1, 3, '2025-05-01 10:07:20', '2025-05-01 10:07:20'),
(9, '2025-04-21 14:00:00', '2025-04-22 01:30:00', '4', 999, 827, NULL, NULL, NULL, NULL, 1, 3, '2025-05-01 10:14:26', '2025-05-01 10:14:26'),
(10, '2025-05-02 13:30:00', '2025-05-02 15:00:00', '4', 4, 21, NULL, NULL, NULL, NULL, 1, 3, '2025-05-02 08:23:12', '2025-05-02 08:23:12');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_type` enum('A','U') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'U',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `father_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pf_no` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('m','f','o') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'm',
  `date_of_birth` date DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `division_id` int DEFAULT NULL,
  `designation_id` int DEFAULT NULL,
  `station_head_quarter_id` int DEFAULT NULL,
  `mobile_no` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authority_no` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_class_duty_card_no` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ta_sr_no` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `incentive_amount` decimal(10,2) DEFAULT NULL,
  `incentive_percentage` decimal(10,2) DEFAULT NULL,
  `pay_band` decimal(10,2) DEFAULT NULL,
  `g_pay` decimal(10,2) DEFAULT NULL,
  `profile_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `timezone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reporting_to` int DEFAULT NULL,
  `is_active` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `deactive_date` date DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `username`, `email`, `email_verified_at`, `password`, `first_name`, `last_name`, `father_name`, `pf_no`, `gender`, `date_of_birth`, `date_of_joining`, `branch_id`, `division_id`, `designation_id`, `station_head_quarter_id`, `mobile_no`, `authority_no`, `first_class_duty_card_no`, `ta_sr_no`, `incentive_amount`, `incentive_percentage`, `pay_band`, `g_pay`, `profile_image`, `expiry_date`, `timezone`, `reporting_to`, `is_active`, `created_by`, `deactive_date`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'A', 'superadmin', 'roshan@dreamweaversindia.com', NULL, '$2y$10$BXjmhHhw2jhBmyEDzYcaAuJCibSdluTa6qAkelbYe61t0ooGM10.K', 'Super', 'Admin', NULL, NULL, 'm', NULL, NULL, NULL, NULL, NULL, NULL, '1234567890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '2025-04-19 11:22:13', '2025-04-19 11:22:13'),
(3, 'U', 'johnDoe', 'john@doe.com', NULL, '$2y$10$Whodcb7841wB9jGBmR.VJePV9BH4e1PpCToAlylxKeq0GeSYyTxTW', 'John', 'Doe', NULL, NULL, 'm', '2025-04-24', '2025-04-25', 7, 4, 11, 22, '2342342', NULL, NULL, NULL, NULL, NULL, '32423.00', '53424.00', NULL, '2025-05-29', NULL, NULL, '1', NULL, NULL, NULL, '2025-04-25 09:31:09', '2025-04-25 09:31:09');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
