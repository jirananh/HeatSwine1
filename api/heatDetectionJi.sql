-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 04, 2024 at 03:25 PM
-- Server version: 10.6.16-MariaDB-cll-lve
-- PHP Version: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `livestoc_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `heatDetectionJi`
--

CREATE TABLE `heatDetectionJi` (
  `id` int(11) NOT NULL,
  `swineCode` text NOT NULL,
  `farmFarmCode` text NOT NULL,
  `age` text NOT NULL,
  `listCaseAnimals` text NOT NULL,
  `startTime` text NOT NULL,
  `finishTime` text NOT NULL,
  `recorder` text NOT NULL,
  `inspector` text NOT NULL,
  `weight` text NOT NULL,
  `breastLeft` text NOT NULL,
  `breastRight` text NOT NULL,
  `pen` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `heatDetectionJi`
--

INSERT INTO `heatDetectionJi` (`id`, `swineCode`, `farmFarmCode`, `age`, `listCaseAnimals`, `startTime`, `finishTime`, `recorder`, `inspector`, `weight`, `breastLeft`, `breastRight`, `pen`) VALUES
(18, '2113026394', '2006C29 KK ดาราพร นิลนุ่ม', '24-06-23', '[, อวัยวะเพศเริ่มแดง, , อวัยวะเพศบวมแดง มีเมือกไหล, , สนใจพ่อ, , สนใจคนที่เข้าใกล้, , , ]', '24-06-03 13:34', '24-06-03 13:34', '', '', '124', 'wwew', 'ewe', 'wee'),
(19, '2113126394', '2006C29 KK ดาราพร นิลนุ่ม', '24-06-23', '[ปกติ, อวัยวะเพศเริ่มแดง, อวัยวะเพศบวมแดง, อวัยวะเพศบวมแดง มีเมือกไหล, , , , , , , ]', '24-06-03 13:37', '24-06-03 13:38', '', '', '2323', '2332', '223', 'wwe'),
(20, '1000427394', '2006C29 KK ดาราพร นิลนุ่ม', '26-06-23', '[ปกติ, อวัยวะเพศเริ่มแดง, อวัยวะเพศบวมแดง, อวัยวะเพศบวมแดง มีเมือกไหล, ปีนตัวอื่น, , ไม่สนใจพ่อ, สนใจคนที่เข้าใกล้, , , ]', '24-06-03 13:55', '24-06-03 13:56', '', '', '23', '45', '34', 'wewe'),
(21, '2111526394', '2006C29 KK ดาราพร นิลนุ่ม', '24-06-23', '[ปกติ, , , อวัยวะเพศบวมแดง มีเมือกไหล, ปีนตัวอื่น, สนใจพ่อ, ไม่สนใจพ่อ, สนใจคนที่เข้าใกล้, , , ]', '24-06-04 15:16', '24-06-03 15:22', '', '', '150', '100', '200', 'Test 333'),
(22, '2111626394', '2006C29 KK ดาราพร นิลนุ่ม', '24-06-23', '[ปกติ, อวัยวะเพศเริ่มแดง, อวัยวะเพศบวมแดง, อวัยวะเพศบวมแดง มีเมือกไหล, ปีนตัวอื่น, , , , , , ]', '24-05-30 15:20', '24-06-03 15:22', '', '', '12.3', '77', '88', 'test1'),
(25, '2111626394', '2006C29 KK ดาราพร นิลนุ่ม', '24-06-23', '[ปกติ, อวัยวะเพศเริ่มแดง, , , , , , , , , ]', '24-05-30 15:20', '24-06-03 15:22', '', '', '12.3', '77', '88', 'test1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `heatDetectionJi`
--
ALTER TABLE `heatDetectionJi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `heatDetectionJi`
--
ALTER TABLE `heatDetectionJi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
