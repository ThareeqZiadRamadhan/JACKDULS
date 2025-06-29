-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for jackduls
CREATE DATABASE IF NOT EXISTS `jackduls` /*!40100 DEFAULT CHARACTER SET armscii8 COLLATE armscii8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jackduls`;

-- Dumping structure for table jackduls.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `adminname` varchar(50) CHARACTER SET armscii8 COLLATE armscii8_bin NOT NULL,
  `password` varchar(255) COLLATE armscii8_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`adminname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table jackduls.admin: ~3 rows (approximately)
INSERT INTO `admin` (`id`, `adminname`, `password`, `created_at`) VALUES
	(11, 'jecky', '$2y$10$FQfSRsDOLnhE4ZSJFvgzLOuRehVGljDgNPtgFHFyq9mNjeG68J6Ma', '2025-06-14 05:10:23'),
	(12, 'raka', '$2y$10$sI2l0HP.lD/TQmS1YpVL.OWogTlja3PyLn0kTVi5NzUcHdGgcVYGm', '2025-06-14 05:11:36'),
	(13, 'heral', '$2y$10$kold7POr9CjPMhvpWlx/yuKykID8y6MaSAoouDlD2v3gWgHoGFYsG', '2025-06-14 05:12:11');

-- Dumping structure for table jackduls.data_support
CREATE TABLE IF NOT EXISTS `data_support` (
  `Kode` int NOT NULL AUTO_INCREMENT,
  `Nama` varchar(100) COLLATE armscii8_bin NOT NULL,
  `Email` varchar(100) COLLATE armscii8_bin DEFAULT NULL,
  `Isi` text COLLATE armscii8_bin NOT NULL,
  `Balasan` text COLLATE armscii8_bin,
  `Status` enum('Belum Dibaca','Sudah Dibalas') COLLATE armscii8_bin DEFAULT 'Belum Dibaca',
  `Tanggal` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Kode`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table jackduls.data_support: ~3 rows (approximately)
INSERT INTO `data_support` (`Kode`, `Nama`, `Email`, `Isi`, `Balasan`, `Status`, `Tanggal`) VALUES
	(11, 'absor', 'absor@gmail.com', 'testetstetst', 'apaaa\r\n', 'Sudah Dibalas', '2025-06-13 11:12:53'),
	(12, 'absor', 'absor@gmail.com', 'test', 'halooo', 'Sudah Dibalas', '2025-06-13 14:49:10'),
	(13, 'badrul', 'badrul@g.com', 'kenapaa yaaaa', 'gapapa', 'Sudah Dibalas', '2025-06-14 08:20:59');

-- Dumping structure for table jackduls.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE armscii8_bin NOT NULL,
  `password` varchar(255) COLLATE armscii8_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table jackduls.users: ~1 rows (approximately)
INSERT INTO `users` (`id`, `username`, `password`, `created_at`) VALUES
	(2, 'user', '$2y$10$VHvDlqHYQHwXS6vN35c9TeMXmPwZYMbPtTPP.F.VlbhgA12gyWSnq', '2025-06-01 14:15:03');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
