-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 103.145.226.74
-- Generation Time: Nov 06, 2021 at 05:18 AM
-- Server version: 10.3.31-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ianfelix_pertaminaCoba`
--

-- --------------------------------------------------------

--
-- Table structure for table `datamobil`
--

CREATE TABLE `datamobil` (
  `id` int(5) NOT NULL,
  `id_mobil` int(5) NOT NULL,
  `time_on` timestamp NULL DEFAULT current_timestamp(),
  `time_off` datetime DEFAULT NULL,
  `action` int(5) DEFAULT NULL,
  `dismiss` text DEFAULT NULL,
  `reason` int(11) DEFAULT NULL,
  `reason_detail` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `datamobil`
--

INSERT INTO `datamobil` (`id`, `id_mobil`, `time_on`, `time_off`, `action`, `dismiss`, `reason`, `reason_detail`) VALUES
(1, 1, '2021-10-04 11:46:14', '2021-10-05 18:46:14', 2, NULL, 1, 'Interlock Hose Reel Front'),
(2, 1, '2021-10-01 11:47:09', '2021-10-02 18:47:09', 1, NULL, 2, 'Interlock Hose Reel Rear'),
(3, 1, '2021-10-02 11:47:09', '2021-10-03 18:47:09', 3, NULL, 3, 'Interlock Input Coupler Stow'),
(4, 2, '2021-10-06 06:57:36', '2021-10-07 13:57:36', 1, NULL, 4, 'Interlock Input Hose Boom Stow'),
(5, 2, '2021-10-07 06:57:36', '2021-10-08 13:57:36', 2, NULL, 5, 'Interlock Platform Stow'),
(6, 2, '2021-10-08 06:58:32', '2021-10-09 13:58:32', 3, NULL, 1, 'Interlock Hose Reel Front'),
(7, 1, '2021-10-08 09:56:50', '2021-10-09 16:56:50', 2, NULL, 6, 'Interlock Platform Nozzle Left\n'),
(8, 2, '2021-10-11 04:56:50', '2021-10-11 11:56:50', 1, NULL, 10, 'Interlock Bonding Static Reel Rear\r\n'),
(9, 1, '2021-10-08 09:57:44', '2021-10-09 16:57:44', 1, NULL, 10, 'Interlock Bonding Static Reel Rear'),
(10, 1, '2021-10-24 18:41:15', '2021-10-25 01:42:27', 1, NULL, 1, 'Interlock Hose Reel Front'),
(11, 2, '2021-10-24 18:41:31', '2021-10-25 01:42:33', 1, NULL, 15, 'Interlock System Fault'),
(12, 1, '2021-11-05 22:13:31', '2021-11-06 05:13:51', 4, NULL, 8, 'Interlock Boom Stow'),
(13, 2, '2021-11-05 22:18:12', '2021-11-06 05:18:32', 4, NULL, 16, 'ini adalah sebuah alasan');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2021-10-04-104744', 'App\\Database\\Migrations\\Users', 'default', 'App', 1633506191, 1),
(2, '2021-10-06-072240', 'App\\Database\\Migrations\\Mobil', 'default', 'App', 1633506191, 1),
(7, '2021-10-06-103607', 'App\\Database\\Migrations\\Data', 'default', 'App', 1633526004, 2),
(9, '2021-10-21-064946', 'App\\Database\\Migrations\\Subscription', 'default', 'App', 1634800781, 3);

-- --------------------------------------------------------

--
-- Table structure for table `mobil`
--

CREATE TABLE `mobil` (
  `id` int(5) NOT NULL,
  `nama_mobil` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mobil`
--

INSERT INTO `mobil` (`id`, `nama_mobil`) VALUES
(1, 'mobil_satu'),
(2, 'mobil_dua'),
(3, 'mobil_tiga'),
(4, 'mobil_empat'),
(5, 'mobil_lima');

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

CREATE TABLE `subscription` (
  `id` int(5) NOT NULL,
  `endpoint` text NOT NULL,
  `p256dh` text NOT NULL,
  `auth` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subscription`
--

INSERT INTO `subscription` (`id`, `endpoint`, `p256dh`, `auth`) VALUES
(2, 'https://fcm.googleapis.com/fcm/send/dPOZ_SppeTc:APA91bHQlMX2BCXG7qcrp_fln6lgOHVIqtvpZgsMGjoGkyYxk7-Q3PsMJyGUZ5-NxVTqq3tgzIA_MKO-rXz-WFenPgcOBssGePD3v_WNEV5WzuoNpuLEH7QLfGkiDYKyO36iJpkdSpiw', 'BKi9I1yvuVWIVxmWzWYXSpLKD1vD1+ogShityEqEiPZvvv3Gr5mS1ZqV34SyWojzS46vBA182/dfJp0f2hQuQwA=', 'ml0yjj3K7VZRp1RsBcJvIg=='),
(3, 'https://fcm.googleapis.com/fcm/send/e-HD1oqMZpU:APA91bEkLTqM1ofzsXfUsgFGRNfl19KPIv4R16YpctxJwt7zqoIHnkmmC8hLAmVEOUqkzEIkZy8DTfDgnCnyCt6HnY5QMeO3JAX_JQ8duNbL7mtDKsjcxzSREn_pAabwGbKS-lwon82e', 'BCnqEnZtPtpuylRJ+ozfzHGjCQbPgyNZDCITntI3nQb7BIV2sryhnlnRcCSESa0pfpRiDqLE3krkD24J+5WvZSA=', 'lYDpEYH4cE7eF6nb80k4cg=='),
(4, 'https://fcm.googleapis.com/fcm/send/dePKAIADrSs:APA91bE58zmPCXQEjTDQKgJjmwevooEe_LUoPuGqbmmse2nDlNaVaBnb3E-5gEHmsjswumywdzCL8avzEs38OHQA4PtbbXZrRELDi9VYBqPT0bjbkg-J16CRqCS6Avxw444EOn2Ir4d0', 'BDZpLon1TKj+kEZHR4mFf75c+EU6rZKTaQEnTNgpQstMxaDEP2uKj50DjfdFVkPHBZH8wnq3i0IzJ5pcPx0Y1ns=', 'XgVRieyF6k9vDkCjyQKzfg=='),
(5, 'https://fcm.googleapis.com/fcm/send/fG8_1OTCqJI:APA91bHsvKqQ_OBTndkslJBzwUC3O-q-yiZ8jTELnnzuzWouIXQmGzvo0VlaBYw5HnpgLVaoxXH6mmrCoVcDeDZ8EiMfmsvZqFm6rHEy7wsa5y_r6sfWvWB9GKbPIfY0E-uIRuLGy0X6', 'BAOxlJVIOsO3ExfBU/dW/5LEJU0AV/G2AbqmulnNik3Bsn9w1WSM3LErxij2KLuSdFoFpqSWsAIhnC8nrwiFVao=', 'O1ui58BcnMbU9GBAFErdvQ=='),
(6, 'https://fcm.googleapis.com/fcm/send/d5aF1PFcTc8:APA91bHj005OR5fOT6b7jjxnO42-u-_aVYMYw7K3ZtDViOrA1yWEftDdHRy7H7rdher7VPHb5PDUdxATjk9Evo5IloK0dkiRJqssQVbGRH81l-Tu7BhSqRGcaMG2XdC8DlBwAdyzi8Gs', 'BAYl+ngDDE8g9gy0oO76C7iWzAKuP9BfXWKNX3CgEQv1wd4X4s+waJLiSw/rQKjSB3m6Y46B6QtZiu3IO/paJAM=', 'xJcTsdRNNsRHgyhznycPOw=='),
(7, 'https://fcm.googleapis.com/fcm/send/dp3VLfTJPwQ:APA91bFyhA0ioSQeD6uHrG_hoLAVe5PTiRNsXjxT3vPCjUH80g7Wah_SxUQzkUY-BhFyjLx6wZofiJfxDYZahvaamBgQrgePAAKEkNWG1JAebPg7vZl8u-UUyMp3tKEMsTaEq0TbM9Jg', 'BCZafjFYOFHk175q7J74y+mjJutysJOuAIokli7diV6i8Sdbx/uihoHMDQUpdBA6TKL6hXS8i9gZPnNoI4I6zm4=', '6R08OhGRy4ZtX7bvdjp9Rg=='),
(8, 'https://fcm.googleapis.com/fcm/send/e9kP_ULTTok:APA91bEHVArDSXJLDOEDaMPmedqhqzokYmBqnBAOC96qgJYb6Y6_gVdqgtDlgZE8istqvZ7RM0R_dv0YQVPcmcJu4aqoP3KrLhC77GJumqMshMnwTRsdghiZfAFxPMUvwTHfeDSN5_rn', 'BIID1R4qJXzRiZ8ShiPp1XjUjdHqc7Ld25q0meCTcQF0jXjC7nTyLaobpO6XdTZ6BZk9rNRqMow8DOro/CbWSho=', 'SZOcdQlyFcZj5E5YsMueBg=='),
(9, 'https://fcm.googleapis.com/fcm/send/dG73Ap-Kf9g:APA91bEj0-JvGlVGb4qP8V8_37gFcm7T9mf5pSqH1-9O8qI6OumkIu8XZTlAdEUz-R9pxrLm0PxBedDzoOBk22KN1cFO7XQHszQjM_iYlazKmYVkMuFlFahJmy17jo25I4yVIgezKT-z', 'BFuXKA0AeP8wslLEGPmeu1uSHYv5BjuCIQ4s4mBhTfhGA+mftvI4u3ZeFD8fLaoJ3IdtZqY5l0zjPE7tqNuSh5w=', 'A4K4nRsp8BCArQ2X08bneA==');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(5) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `nama` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `nama`) VALUES
(1, 'ian25yola@gmail.com', '$2y$10$xUiltUnOMhbjW3MK6pBBVeXlFd0toSZJkY0ICaFEzEUb496knb5xy', 'Ian Felix Jonathan'),
(2, 'calvin@gmail.com', '$2y$10$BV9dtNq2RSV.AFwNgPaF/eaOmGJsLKhNC4Mp381qv5rQMrTWSHp3i', 'Calvin Simatupang'),
(3, 'claudia@gmail.com', '$2y$10$zAo6XrOrbfYVIIL8W4nTUO2jBIjsxd6No7O4eQaCb4mUlpKVI3pVS', 'Claudia Simatupang'),
(4, 'user2@gmail.com', '$2y$10$DEKsI3OebLH7Hpd.IY7JRO6/eqba7B/I13AG9darLmDTi./hreKAi', 'User2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `datamobil`
--
ALTER TABLE `datamobil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `datamobil`
--
ALTER TABLE `datamobil`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `mobil`
--
ALTER TABLE `mobil`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subscription`
--
ALTER TABLE `subscription`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
