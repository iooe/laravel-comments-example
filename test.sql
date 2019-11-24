-- -------------------------------------------------------------
-- TablePlus 2.9(263)
--
-- https://tableplus.com/
--
-- Database: test
-- Generation Time: 2019-11-24 22:24:08.7190
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `comment_votes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `commenter_id` int(10) unsigned NOT NULL,
  `comment_id` int(10) unsigned NOT NULL,
  `commenter_vote` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_votes_commenter_id_index` (`commenter_id`),
  KEY `comment_votes_comment_id_index` (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `commenter_id` int(10) unsigned NOT NULL,
  `commentable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentable_id` bigint(20) unsigned NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `child_id` int(10) unsigned DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_commentable_type_commentable_id_index` (`commentable_type`,`commentable_id`),
  KEY `comments_child_id_foreign` (`child_id`),
  KEY `comments_commenter_id_index` (`commenter_id`),
  CONSTRAINT `comments_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `users` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `comment_votes` (`id`, `commenter_id`, `comment_id`, `commenter_vote`, `created_at`, `updated_at`) VALUES ('2', '2', '3', '1', '2019-11-21 05:51:15', '2019-11-21 05:51:15');

INSERT INTO `comments` (`id`, `commenter_id`, `commentable_type`, `commentable_id`, `comment`, `child_id`, `rating`, `created_at`, `updated_at`, `deleted_at`) VALUES ('1', '1', 'App\\Post', '1', '<p>dd</p>2222', NULL, '0', '2019-11-21 05:49:31', '2019-11-21 05:51:14', NULL),
('2', '1', 'App\\Post', '1', '<p>dddd</p>', '1', '0', '2019-11-21 05:50:19', '2019-11-21 05:50:45', '2019-11-21 05:50:45'),
('3', '1', 'App\\Post', '1', '<p>dddddd</p>', NULL, '1', '2019-11-21 05:50:47', '2019-11-21 05:51:15', NULL),
('4', '1', 'App\\Post', '1', '<p>dddd</p>', '3', '0', '2019-11-21 05:50:51', '2019-11-21 05:50:51', NULL),
('5', '2', 'App\\Post', '1', '<p>dddd</p>', '4', '0', '2019-11-21 05:51:18', '2019-11-21 05:51:18', NULL),
('6', '2', 'App\\Post', '1', '<p>ddd</p>', NULL, '0', '2019-11-21 05:51:20', '2019-11-21 05:51:20', NULL),
('7', '2', 'App\\Post', '1', '<p>ddd</p>', '5', '0', '2019-11-21 05:51:27', '2019-11-21 05:51:27', NULL),
('8', '1', 'App\\Post', '1', '<p>test</p>', NULL, '0', '2019-11-21 05:55:34', '2019-11-21 05:55:34', NULL);

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES ('1', '2014_10_12_000000_create_users_table', '1'),
('2', '2014_10_12_100000_create_password_resets_table', '1'),
('3', '2018_06_30_113500_create_comments_table', '1'),
('4', '2018_11_15_135428_create_comments_votes_table', '1'),
('5', '2019_08_19_000000_create_failed_jobs_table', '1');

INSERT INTO `posts` (`id`, `name`) VALUES ('1', 'test');

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES ('1', 'test222@mil.com', 'test222@mil.com', NULL, '$2y$10$V2gThVSWdxNB7CvTLmG6f.qFjpAas25FDNjEmk7tJE9i3/Qzzxa4q', NULL, '2019-11-21 05:44:33', '2019-11-21 05:44:33'),
('2', 'test333@mail.com', 'test333@mail.com', NULL, '$2y$10$jqXlaDUV3s668YvRHuk80OjUYfxEeGZYn/tWRhfXLgevNvMRhjcDS', NULL, '2019-11-21 05:51:08', '2019-11-21 05:51:08');




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;