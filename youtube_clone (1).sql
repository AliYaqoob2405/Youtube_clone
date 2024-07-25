-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2024 at 07:41 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `youtube_clone`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

CREATE TABLE `channels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channels`
--

INSERT INTO `channels` (`id`, `name`, `description`, `banner_url`, `avatar_url`, `created_at`, `updated_at`, `status`, `user_id`) VALUES
(1, 'test', 'for testing', NULL, NULL, '2024-06-20 05:44:13', '2024-06-27 03:03:42', 1, 1),
(2, 'PTV', 'THIS IS PAKISTAN GOVERNMENT CHANNEL', NULL, NULL, '2024-06-20 05:44:47', '2024-06-26 04:53:58', 1, 1),
(3, 'channel 1', 'for videos', NULL, NULL, '2024-06-20 05:45:05', '2024-06-20 05:45:05', 1, 1),
(4, 'channel 2', 'for all things', NULL, NULL, '2024-06-20 05:45:24', '2024-06-20 05:45:24', 1, 1),
(7, 'ali', 'for test', NULL, NULL, '2024-06-28 00:37:00', '2024-06-28 00:37:00', 1, 1),
(9, 'ali channel', 'this is for testing', NULL, NULL, '2024-07-01 02:20:58', '2024-07-01 02:20:58', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `channel_video`
--

CREATE TABLE `channel_video` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `channel_id` bigint(20) UNSIGNED NOT NULL,
  `video_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channel_video`
--

INSERT INTO `channel_video` (`id`, `channel_id`, `video_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 2, 4, NULL, NULL),
(5, 2, 5, NULL, NULL),
(6, 2, 6, NULL, NULL),
(7, 2, 7, NULL, NULL),
(8, 3, 8, NULL, NULL),
(9, 1, 9, NULL, NULL),
(10, 3, 10, NULL, NULL),
(11, 4, 11, NULL, NULL),
(12, 3, 12, NULL, NULL),
(13, 1, 13, NULL, NULL),
(14, 1, 14, NULL, NULL),
(16, 7, 16, NULL, NULL),
(17, 7, 17, NULL, NULL),
(18, 1, 18, NULL, NULL),
(19, 9, 19, NULL, NULL),
(20, 1, 20, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `video_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `video_id`, `created_at`, `updated_at`) VALUES
(40, 2, 6, NULL, NULL),
(41, 2, 3, NULL, NULL),
(44, 2, 2, NULL, NULL),
(48, 1, 10, NULL, NULL),
(49, 1, 9, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_06_10_081924_create_searches_table', 1),
(6, '2024_06_10_124541_create_channels_table', 1),
(7, '2024_06_10_124552_create_videos_table', 1),
(8, '2024_06_11_092658_add_role_to_users_table', 1),
(9, '2024_06_12_052601_create_admins_table', 1),
(10, '2024_06_12_102743_update_videos_table_add_nullable_fields', 1),
(11, '2024_06_14_055607_create_channel_video_table', 1),
(12, '2024_06_20_063824_add_category_to_videos_table', 1),
(13, '2024_06_21_095330_add_status_to_users_table', 2),
(14, '2024_06_21_102154_add_status_to_videos_table', 3),
(15, '2024_06_24_043036_create_permission_tables', 3),
(16, '2024_06_26_093830_add_status_to_channels_table', 4),
(17, '2024_07_02_062523_add_likes_and_views_to_videos_table', 5),
(18, '2024_07_02_065827_create_video_user_table', 6),
(19, '2024_07_02_070839_create_user_video_table', 7),
(20, '2024_07_02_074845_create_video_user_table', 8),
(21, '2024_07_02_075440_create_video_user_table', 9),
(22, '2024_07_02_082933_add_likes_and_dislikes_to_videos_table', 10),
(23, '2024_07_05_045936_add_user_id_to_channels_table', 11),
(24, '2024_07_05_050251_add_foreign_key_to_user_id_in_channels_table', 12),
(25, '2024_07_05_062439_create_favorites_table', 13),
(26, '2024_07_05_113132_create_video_likes_table', 14),
(27, '2024_07_05_113144_create_video_dislikes_table', 14),
(28, '2024_07_08_050905_create_likes_table', 15),
(29, '2024_07_08_053547_create_video_likes_table', 16),
(30, '2024_07_08_053600_create_video_dislikes_table', 16),
(31, '2024_07_08_065653_create_video_likes_table', 17),
(32, '2024_07_08_065703_create_video_dislikes_table', 17),
(33, '2024_07_09_063755_add_user_id_to_videos_table', 18),
(34, '2024_07_09_064216_add_foreign_key_to_user_id_in_videos_table', 19);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(6, 'App\\Models\\User', 14),
(7, 'App\\Models\\User', 2),
(12, 'App\\Models\\User', 20),
(13, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(11, 'role-list', 'web', '2024-06-25 00:48:53', '2024-06-25 00:48:53'),
(12, 'role-create', 'web', '2024-06-25 00:48:53', '2024-06-25 00:48:53'),
(13, 'role-edit', 'web', '2024-06-25 00:48:54', '2024-06-25 00:48:54'),
(14, 'role-delete', 'web', '2024-06-25 00:48:54', '2024-06-25 00:48:54'),
(21, 'user-controller', 'web', '2024-07-09 00:51:02', '2024-07-09 00:51:02'),
(22, 'channel-list', 'web', '2024-07-09 04:47:55', '2024-07-09 04:47:55'),
(23, 'channel-create', 'web', '2024-07-09 04:47:55', '2024-07-09 04:47:55'),
(24, 'channel-delete', 'web', '2024-07-09 04:47:56', '2024-07-09 04:47:56'),
(25, 'user-list', 'web', '2024-07-09 04:47:56', '2024-07-09 04:47:56'),
(27, 'user-delete', 'web', '2024-07-09 04:47:56', '2024-07-09 04:47:56'),
(28, 'channel-edit', 'web', '2024-07-09 04:53:45', '2024-07-09 04:53:45'),
(29, 'user-edit', 'web', '2024-07-09 04:54:35', '2024-07-09 04:54:35'),
(30, 'video-list', 'web', '2024-07-09 04:54:35', '2024-07-09 04:54:35'),
(32, 'video-edit', 'web', '2024-07-09 04:54:36', '2024-07-09 04:54:36'),
(33, 'video-delete', 'web', '2024-07-09 04:54:36', '2024-07-09 04:54:36'),
(34, 'upload-video', 'web', '2024-07-09 23:14:46', '2024-07-09 23:14:46');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(6, 'admin', 'web', '2024-06-25 01:25:37', '2024-06-25 01:25:37'),
(7, 'user', 'web', '2024-06-25 01:50:31', '2024-06-25 01:50:31'),
(12, 'test', 'web', '2024-06-26 00:05:26', '2024-06-26 00:05:26'),
(13, 'super admin', 'web', '2024-07-10 01:03:54', '2024-07-10 01:03:54');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(11, 6),
(11, 13),
(12, 6),
(12, 13),
(13, 6),
(13, 13),
(14, 6),
(14, 13),
(21, 6),
(21, 13),
(22, 6),
(22, 12),
(22, 13),
(23, 6),
(23, 13),
(24, 6),
(24, 13),
(25, 6),
(25, 12),
(25, 13),
(27, 6),
(27, 13),
(28, 6),
(28, 13),
(29, 6),
(29, 13),
(30, 6),
(30, 12),
(30, 13),
(32, 6),
(32, 12),
(32, 13),
(33, 6),
(33, 13),
(34, 6),
(34, 13);

-- --------------------------------------------------------

--
-- Table structure for table `searches`
--

CREATE TABLE `searches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `status`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$12$wzVn5V0hm8LjZouoWH2fXOsZwWwAenikHJNzrYiWKRoJMlPIdRlQS', NULL, '2024-06-20 05:40:14', '2024-07-10 01:04:26', 1),
(2, 'ali', 'ali@gmail.com', NULL, '$2y$12$05Nnix8jwuoXqWmrbh3K1OSLUf5Eddo/bCpjnQSpb0gJhiBXKXRRy', NULL, '2024-06-20 05:41:01', '2024-06-28 05:07:57', 1),
(20, 'test', 'test@gmail.com', NULL, '$2y$12$T4alBqG3oCqGolDh730uMub48Ts24jpZRVS/Cwq1UsII61G9DVNB.', NULL, '2024-07-09 04:41:30', '2024-07-09 04:41:30', 1),
(22, 'user', 'user@gmail.com', NULL, '$2y$12$wVPuC.ovMFa25Sijlp2fMOKsLPTeAD5LG9F84orfww3rcVNyJZoTC', NULL, '2024-07-10 01:22:23', '2024-07-10 01:22:23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_video`
--

CREATE TABLE `user_video` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `video_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `channel_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `likes` int(11) NOT NULL DEFAULT 0,
  `dislikes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `user_id`, `channel_id`, `title`, `path`, `description`, `video_url`, `thumbnail_url`, `views`, `created_at`, `updated_at`, `category`, `status`, `likes`, `dislikes`) VALUES
(1, 1, 1, 'tes', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras finibus, erat vel ultricies malesuada, nunc eros posuere lorem, tristique laoreet augue magna in tellus.', 'https://www.youtube.com/embed/QMzeiTov6a8', NULL, 25, '2024-06-20 05:45:49', '2024-07-09 02:57:10', NULL, 0, 45, 21),
(2, 1, 1, 'test', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras finibus, erat vel ultricies malesuada, nunc eros posuere lorem, tristique laoreet augue magna in tellus.', 'https://www.youtube.com/embed/kYY88h5J86A', NULL, 13, '2024-06-20 05:46:15', '2024-07-08 05:06:41', 'test', 0, 12, 15),
(3, 1, 1, 'test url', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras finibus, erat vel ultricies malesuada, nunc eros posuere lorem, tristique laoreet augue magna in tellus.', 'https://www.youtube.com/embed/OeEHJgzqS1k', NULL, 11, '2024-06-20 05:46:31', '2024-07-08 05:34:38', 'test', 0, 1, 0),
(4, 1, 2, 'for news', NULL, NULL, 'https://www.youtube.com/embed/Q8F6xf5udYg', NULL, 3, '2024-06-20 05:47:24', '2024-07-04 04:17:13', NULL, 0, 0, 0),
(5, 1, 2, 'PTV 123', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras finibus, erat vel ultricies malesuada, nunc eros posuere lorem, tristique laoreet augue magna in tellus.\'', 'https://www.youtube.com/embed/YBf6e4lNN4Q', NULL, 13, '2024-06-20 05:48:03', '2024-07-09 04:35:52', 'test', 1, 2, 0),
(6, 1, 2, 'ptv', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras finibus, erat vel ultricies malesuada, nunc eros posuere lorem, tristique laoreet augue magna in tellus.', 'https://www.youtube.com/embed/7q4CwOAXDQY', NULL, 13, '2024-06-20 05:48:20', '2024-07-08 05:20:59', NULL, 1, 10, 4),
(7, 1, 2, 'ptv URL', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras finibus, erat vel ultricies malesuada, nunc eros posuere lorem, tristique laoreet augue magna in tellus.', 'https://www.youtube.com/embed/kYY88h5J86A', NULL, 5, '2024-06-20 05:48:39', '2024-07-08 01:46:11', NULL, 1, 54, 0),
(8, 1, 3, 'Channel 1', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras finibus, erat vel ultricies malesuada, nunc eros posuere lorem, tristique laoreet augue magna in tellus.', 'https://www.youtube.com/embed/anFgASw-Zh8', NULL, 10, '2024-06-20 05:49:07', '2024-07-08 02:16:09', NULL, 1, 33, 16),
(9, 1, 1, 'Channel 2', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras finibus, erat vel ultricies malesuada, nunc eros posuere lorem, tristique laoreet augue magna in tellus.', 'https://www.youtube.com/embed/XGa4onZP66Q', NULL, 10, '2024-06-20 05:49:41', '2024-07-09 02:38:49', NULL, 1, 1, 1),
(10, 1, 3, 'channel', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras finibus, erat vel ultricies malesuada, nunc eros posuere lorem, tristique laoreet augue magna in tellus.', 'https://www.youtube.com/embed/bkdcMa5-RM4', NULL, 9, '2024-06-20 05:50:15', '2024-07-08 02:48:23', NULL, 1, 1, 0),
(11, 1, 4, 'music', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras finibus, erat vel ultricies malesuada, nunc eros posuere lorem, tristique laoreet augue magna in tellus.', 'https://www.youtube.com/embed/EsRyyJmO-u8', NULL, 10, '2024-06-20 05:50:32', '2024-07-08 05:21:03', NULL, 1, 1, 0),
(12, 1, 3, 'music', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras finibus, erat vel ultricies malesuada, nunc eros posuere lorem, tristique laoreet augue magna in tellus.', 'https://www.youtube.com/embed/9mhLbcs96xc', NULL, 6, '2024-06-20 05:50:47', '2024-07-08 02:45:39', NULL, 1, 5, 0),
(13, 1, 1, 'test test test', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras finibus, erat vel ultricies malesuada, nunc eros posuere lorem, tristique laoreet augue magna in tellus.', 'https://www.youtube.com/embed/QMzeiTov6a8', NULL, 5, '2024-06-20 07:00:46', '2024-07-09 04:33:53', NULL, 1, 0, 1),
(14, 1, 1, 'test 2', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras finibus, erat vel ultricies malesuada, nunc eros posuere lorem, tristique laoreet augue magna in tellus.', 'https://www.youtube.com/embed/cqofB2vNGFo', NULL, 7, '2024-06-20 07:08:25', '2024-07-08 02:32:14', 'test test', 0, 2, 0),
(16, 2, 7, 'test', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras finibus, erat vel ultricies malesuada, nunc eros posuere lorem, tristique laoreet augue magna in tellus.', 'https://www.youtube.com/embed/hbVKM-jhwiE', NULL, 7, '2024-06-28 00:37:20', '2024-07-08 00:50:24', 'test test', 1, 1, 0),
(17, 2, 7, 'embed video of ducky', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras finibus, erat vel ultricies malesuada, nunc eros posuere lorem, tristique laoreet augue magna in tellus.', 'https://www.youtube.com/embed/QMhggRR5znA', NULL, 7, '2024-07-04 00:16:04', '2024-07-08 05:34:31', 'test', 1, 1, 0),
(18, 2, 1, 'ducky embed', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras finibus, erat vel ultricies malesuada, nunc eros posuere lorem, tristique laoreet augue magna in tellus.', 'https://www.youtube.com/embed/WwI9qwgutuM', NULL, 6, '2024-07-04 00:20:14', '2024-07-04 03:11:41', 'test', 1, 0, 0),
(19, 2, 9, 'test', NULL, NULL, 'https://www.youtube.com/embed/jdiy6sz1-fk', NULL, 3, '2024-07-04 02:07:41', '2024-07-08 02:45:24', 'test', 1, 0, 0),
(20, 2, 1, 'for test as a single user', 'videos/dwtSu23kMe7SzItui3CvZPnmi0V3HGhQZ11VDbnc.mp4', NULL, NULL, NULL, 1, '2024-07-09 01:02:33', '2024-07-09 01:13:11', 'test', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `video_dislikes`
--

CREATE TABLE `video_dislikes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `video_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `video_dislikes`
--

INSERT INTO `video_dislikes` (`id`, `user_id`, `video_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-07-09 02:57:10', '2024-07-09 02:57:10');

-- --------------------------------------------------------

--
-- Table structure for table `video_likes`
--

CREATE TABLE `video_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `video_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `video_likes`
--

INSERT INTO `video_likes` (`id`, `user_id`, `video_id`, `created_at`, `updated_at`) VALUES
(4, 1, 17, '2024-07-08 05:24:08', '2024-07-08 05:24:08'),
(9, 1, 5, '2024-07-09 04:35:52', '2024-07-09 04:35:52');

-- --------------------------------------------------------

--
-- Table structure for table `video_user`
--

CREATE TABLE `video_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `video_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('like','dislike') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `channels`
--
ALTER TABLE `channels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channels_user_id_foreign` (`user_id`);

--
-- Indexes for table `channel_video`
--
ALTER TABLE `channel_video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channel_video_channel_id_foreign` (`channel_id`),
  ADD KEY `channel_video_video_id_foreign` (`video_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `favorites_user_id_video_id_unique` (`user_id`,`video_id`),
  ADD KEY `favorites_video_id_foreign` (`video_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `searches`
--
ALTER TABLE `searches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_video`
--
ALTER TABLE `user_video`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_video_user_id_video_id_type_unique` (`user_id`,`video_id`,`type`),
  ADD KEY `user_video_video_id_foreign` (`video_id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `videos_channel_id_foreign` (`channel_id`),
  ADD KEY `videos_user_id_foreign` (`user_id`);

--
-- Indexes for table `video_dislikes`
--
ALTER TABLE `video_dislikes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video_dislikes_user_id_foreign` (`user_id`),
  ADD KEY `video_dislikes_video_id_foreign` (`video_id`);

--
-- Indexes for table `video_likes`
--
ALTER TABLE `video_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video_likes_user_id_foreign` (`user_id`),
  ADD KEY `video_likes_video_id_foreign` (`video_id`);

--
-- Indexes for table `video_user`
--
ALTER TABLE `video_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `video_user_video_id_user_id_unique` (`video_id`,`user_id`),
  ADD KEY `video_user_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `channels`
--
ALTER TABLE `channels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `channel_video`
--
ALTER TABLE `channel_video`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `searches`
--
ALTER TABLE `searches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user_video`
--
ALTER TABLE `user_video`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `video_dislikes`
--
ALTER TABLE `video_dislikes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `video_likes`
--
ALTER TABLE `video_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `video_user`
--
ALTER TABLE `video_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `channels`
--
ALTER TABLE `channels`
  ADD CONSTRAINT `channels_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `channel_video`
--
ALTER TABLE `channel_video`
  ADD CONSTRAINT `channel_video_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `channel_video_video_id_foreign` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_video_id_foreign` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_video`
--
ALTER TABLE `user_video`
  ADD CONSTRAINT `user_video_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_video_video_id_foreign` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `videos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `video_dislikes`
--
ALTER TABLE `video_dislikes`
  ADD CONSTRAINT `video_dislikes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `video_dislikes_video_id_foreign` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `video_likes`
--
ALTER TABLE `video_likes`
  ADD CONSTRAINT `video_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `video_likes_video_id_foreign` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `video_user`
--
ALTER TABLE `video_user`
  ADD CONSTRAINT `video_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `video_user_video_id_foreign` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
