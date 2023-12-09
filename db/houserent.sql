-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2022 at 04:40 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `houserent`
--

-- --------------------------------------------------------

--
-- Table structure for table `book_houses`
--

CREATE TABLE `book_houses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `house_id` int(11) NOT NULL,
  `house_owner_id` int(11) NOT NULL,
  `booking_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expired_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `children` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '1 for active o for en-active 2 for booked',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_houses`
--

INSERT INTO `book_houses` (`id`, `user_id`, `house_id`, `house_owner_id`, `booking_date`, `expired_date`, `member`, `children`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, '2022-02-27', '2022-02-28', '1', '1', 'awef', 1, '2022-02-27 11:17:53', '2022-02-27 11:18:11'),
(2, 1, 1, 2, '2022-03-04', '2022-03-05', '1', '1', 'sdf', 1, '2022-02-28 07:59:19', '2022-02-28 07:59:39'),
(3, 1, 1, 2, '2022-03-10', '2022-03-12', '1', '1', 'sdf', 1, '2022-02-28 08:02:37', '2022-02-28 08:02:46'),
(4, 1, 1, 2, '2022-03-12', '2022-04-09', '1', '1', 'asdf', 1, '2022-02-28 08:50:14', '2022-02-28 08:51:12'),
(5, 1, 1, 2, NULL, NULL, '1', '1', 'we', 0, '2022-02-28 08:55:08', NULL),
(6, 1, 1, 2, '2022-03-02', '2022-03-04', '1', '1', 'sdf', 0, '2022-02-28 12:23:10', NULL),
(7, 1, 1, 2, '2022-03-01', '2022-03-02', '1', '1', 'dfg', 1, '2022-02-28 12:24:02', '2022-02-28 12:24:12'),
(8, 1, 1, 2, '03/02/2022 - 03/12/2022', NULL, '1', '1', 'dsf', 0, '2022-03-01 12:15:33', NULL),
(9, 1, 1, 2, '03/01/2022 - 03/19/2022', NULL, '1', '1', 'sda', 0, '2022-03-01 12:16:00', NULL),
(10, 1, 1, 2, '03/01/2022 - 03/19/2022', NULL, '1', '1', 'asdf', 0, '2022-03-01 12:17:39', NULL),
(11, 1, 1, 2, '03/02/2022 - 04/23/2022', NULL, '1', '1', 'sadf', 0, '2022-03-01 12:18:56', NULL),
(12, 1, 1, 2, '03/02/2022', '03/05/2022', '1', '1', 'asdf', 0, '2022-03-01 12:22:08', NULL),
(13, 1, 1, 2, '03/01/2022', '03/04/2022', '1', '1', 'sdfa', 0, '2022-03-01 12:22:41', NULL),
(14, 1, 1, 2, '22-03-02', '22-03-05', '1', '1', 'asdf', 1, '2022-03-01 12:36:41', '2022-03-01 12:38:09'),
(15, 1, 1, 2, '22-03-03', '22-03-04', '1', '1', 'df', 1, '2022-03-03 00:00:36', '2022-03-03 00:00:51'),
(16, 1, 1, 2, '22-03-06', '22-03-07', '1', '1', 'asd', 1, '2022-03-06 08:53:28', '2022-03-06 08:54:14');

-- --------------------------------------------------------

--
-- Table structure for table `book_house_dates`
--

CREATE TABLE `book_house_dates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `house_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `house_owner_id` int(11) NOT NULL,
  `booking_date` date DEFAULT NULL,
  `change` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_rent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_rent_with_commission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `days` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1 for active 2 for cancel request 3 for cancel',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_house_dates`
--

INSERT INTO `book_house_dates` (`id`, `house_id`, `user_id`, `house_owner_id`, `booking_date`, `change`, `total_rent`, `total_rent_with_commission`, `commission`, `days`, `currency`, `transaction_id`, `expired_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2022-03-03', '0.46', '23', '23.46', '0.46', '1', 'usd', 'txn_3KZ7iYJXz4mwbqPL1Qrf31nH', '2022-03-04', 1, '2022-03-03 00:00:51', NULL),
(2, 1, 1, 1, '2022-03-06', '0.46', '23', '23.46', '0.46', '1', 'usd', 'txn_3KaLTNJXz4mwbqPL1Ikwnz9d', '2022-03-07', 1, '2022-03-06 08:54:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cancel_bookings`
--

CREATE TABLE `cancel_bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `house_owner_id` int(11) NOT NULL,
  `house_id` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0 for en-complete 1 for complete',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `houses`
--

CREATE TABLE `houses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `booking_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expired_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rent` int(11) NOT NULL,
  `service_charge` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `security_deposit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flat_release_policy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flat_size` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floor` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `room_category` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facilities` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_facilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `indoor_features` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bed_room` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bath_room` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_review` int(11) DEFAULT 0,
  `total_rating` int(11) DEFAULT 0,
  `average_rating` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `houses`
--

INSERT INTO `houses` (`id`, `user_id`, `category_id`, `title`, `description`, `booking_date`, `expired_date`, `rent`, `service_charge`, `security_deposit`, `flat_release_policy`, `address`, `flat_size`, `floor`, `room_category`, `facilities`, `additional_facilities`, `indoor_features`, `bed_room`, `bath_room`, `image`, `total_review`, `total_rating`, `average_rating`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, 'sad', 'asdf', NULL, NULL, 23, NULL, NULL, NULL, 'Rangs Malancha, House-68, Road-6A (Dead End Road), Dhanmondi Residential Area.', '3000 Sq Feet.', 'A5 (5th Floor) (6 storied Building ) (South Facing Unit)', 'sdaf', '1 Modern Lift, All Modern Amenities & Semi Furnished.', NULL, 'sdfa', '5', 'asdfsdaf', 'image/house/1725937477107428.jpg', 5, 19, 4, '2022-02-27 11:17:24', '2022-03-06 08:54:34');

-- --------------------------------------------------------

--
-- Table structure for table `house_images`
--

CREATE TABLE `house_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `house_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `house_images`
--

INSERT INTO `house_images` (`id`, `house_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'image/house/1725937477915439.jpg', '2022-02-27 11:17:24', NULL),
(2, 1, 'image/house/1725937478189676.jpg', '2022-02-27 11:17:24', NULL);

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
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_02_10_055234_create_roles_table', 1),
(6, '2022_02_10_161741_create_categories_table', 1),
(7, '2022_02_11_163036_create_houses_table', 1),
(8, '2022_02_11_164046_create_house_images_table', 1),
(9, '2022_02_13_131704_create_contacts_table', 1),
(10, '2022_02_20_160700_create_book_houses_table', 1),
(12, '2022_02_26_180956_create_reviews_table', 1),
(13, '2022_02_21_041926_create_book_house_dates_table', 2),
(14, '2022_03_03_055211_create_cancel_bookings_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `house_owner_id` int(11) NOT NULL,
  `house_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL COMMENT '0 for 1 stat 1 for 2-star 3 for 3-star 4 for 4-star 5 for five star',
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0 for en-complete 1 for complete',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `house_owner_id`, `house_id`, `rating`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 3, 'asdf', 1, '2022-02-27 11:18:11', '2022-02-27 11:25:27'),
(2, 1, 1, 1, 4, 'sdfa', 1, '2022-02-28 07:59:39', '2022-02-28 07:59:56'),
(3, 1, 1, 1, 5, 'asdfds', 1, '2022-02-28 08:02:46', '2022-03-01 12:34:49'),
(4, 1, 1, 1, 2, 'asdf', 1, '2022-02-28 08:51:12', '2022-03-01 12:35:00'),
(5, 1, 1, 1, NULL, NULL, 1, '2022-02-28 12:24:12', NULL),
(6, 1, 1, 1, 4, NULL, 1, '2022-03-01 12:38:09', NULL),
(7, 1, 1, 1, 5, 'sdsds', 1, '2022-03-03 00:00:51', '2022-03-06 08:54:34'),
(8, 1, 1, 1, NULL, NULL, 0, '2022-03-06 08:54:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, NULL),
(2, 'HouseOwner', NULL, NULL),
(3, 'User', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `division` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int(11) NOT NULL DEFAULT 3,
  `last_seen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `division`, `district`, `area`, `file`, `role_id`, `last_seen`, `phone`, `provider_id`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'monim rasel', NULL, NULL, NULL, NULL, 3, NULL, '01779251787', NULL, 'image/user/1725999687784567.jpg', 'monim@gmail.com', NULL, '$2y$10$GuMg7FVPJsOui.rQLZ5S6e94Z1JCGfeYj9Rm/q4F.Ea8shwbDhDBm', 'gDCC6jyV4a0GIZ8NPEGn9TPmRyRxQZC66CHhhfXBuWBD65m5qZWwqWPmjKNt', '2022-02-27 11:15:21', '2022-02-28 10:16:17'),
(2, 'Sublet', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, 'image/user/1725940280237640.jpg', 'rasel@gmail.com', NULL, '$2y$10$kDp0zYMR/cDst6R6tyHGAOlhEgSLo9eVhs7L5YAQ/FccZJ1IqciPu', NULL, '2022-02-27 11:15:48', '2022-02-28 12:01:34'),
(3, 'monim', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'admin@gmail.com', NULL, '$2y$10$ann9BACJ6R.CqzRJVNUSDufIUFgDyFyYNIsT8Mrd.D1CfUTwy3uYG', NULL, '2022-02-27 11:16:25', '2022-02-27 11:16:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book_houses`
--
ALTER TABLE `book_houses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_house_dates`
--
ALTER TABLE `book_house_dates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cancel_bookings`
--
ALTER TABLE `cancel_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `house_images`
--
ALTER TABLE `house_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book_houses`
--
ALTER TABLE `book_houses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `book_house_dates`
--
ALTER TABLE `book_house_dates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cancel_bookings`
--
ALTER TABLE `cancel_bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `house_images`
--
ALTER TABLE `house_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
