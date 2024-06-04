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
-- Table structure for table `case_animal_ji`
--

CREATE TABLE `case_animal_ji` (
  `id` int(11) NOT NULL,
  `caseAnimal` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `case_animal_ji`
--

INSERT INTO `case_animal_ji` (`id`, `caseAnimal`) VALUES
(1, 'ปกติ'),
(2, 'อวัยวะเพศเริ่มแดง'),
(3, 'อวัยวะเพศบวมแดง'),
(4, 'อวัยวะเพศบวมแดง มีเมือกไหล'),
(5, 'ปีนตัวอื่น'),
(6, 'สนใจพ่อ'),
(7, 'ไม่สนใจพ่อ'),
(8, 'สนใจคนที่เข้าใกล้'),
(9, 'กดหลังแล้วยืนนิ่ง หูตั้งชัน'),
(10, 'ยีนนิ่งเอง โดยไม่ต้องกดหลัง'),
(11, 'กดหลังแล้วไม่ยืนนิ่ง');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `case_animal_ji`
--
ALTER TABLE `case_animal_ji`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `case_animal_ji`
--
ALTER TABLE `case_animal_ji`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
