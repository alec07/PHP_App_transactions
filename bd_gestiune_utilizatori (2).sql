-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2023 at 08:24 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_gestiune_utilizatori`
--

-- --------------------------------------------------------

--
-- Table structure for table `contactefrecvente`
--

CREATE TABLE `contactefrecvente` (
  `id` int(11) NOT NULL,
  `nume` varchar(255) DEFAULT NULL,
  `contBancar` varchar(255) DEFAULT NULL,
  `utilizatori_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contactefrecvente`
--

INSERT INTO `contactefrecvente` (`id`, `nume`, `contBancar`, `utilizatori_id`) VALUES
(1, 'Mircea', '65378', NULL),
(3, 'Maricica', '17346', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `furnizori`
--

CREATE TABLE `furnizori` (
  `id` int(11) NOT NULL,
  `nume` varchar(255) DEFAULT NULL,
  `contBancar` varchar(255) DEFAULT NULL,
  `utilizatori_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `furnizori`
--

INSERT INTO `furnizori` (`id`, `nume`, `contBancar`, `utilizatori_id`) VALUES
(5, 'Enel2', '45346', NULL),
(6, 'Farma', '56436', NULL),
(7, 'Alpha', '75425', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `plati`
--

CREATE TABLE `plati` (
  `id` int(11) NOT NULL,
  `suma` decimal(10,2) DEFAULT NULL,
  `nume` varchar(255) DEFAULT NULL,
  `contBancar` varchar(255) DEFAULT NULL,
  `contactefrecvente` int(11) DEFAULT NULL,
  `utilizatori_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plati`
--

INSERT INTO `plati` (`id`, `suma`, `nume`, `contBancar`, `contactefrecvente`, `utilizatori_id`) VALUES
(1, '12.00', 'Maricica', '85540', NULL, NULL),
(2, '55.00', 'Ana', '5634', NULL, NULL),
(3, '34.00', 'Sara', '65378', NULL, NULL),
(4, '78.00', 'Miriam', '78432', NULL, NULL),
(5, '35.00', 'Leontina', '85698', NULL, NULL),
(6, '987.00', 'Quintino', '78540', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transferuri`
--

CREATE TABLE `transferuri` (
  `id` int(11) NOT NULL,
  `suma` decimal(10,2) DEFAULT NULL,
  `nume` varchar(255) DEFAULT NULL,
  `contBancar` varchar(255) DEFAULT NULL,
  `furnizori` int(11) DEFAULT NULL,
  `utilizatori_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transferuri`
--

INSERT INTO `transferuri` (`id`, `suma`, `nume`, `contBancar`, `furnizori`, `utilizatori_id`) VALUES
(1, '3450.00', 'Enel', '80096', NULL, NULL),
(3, '345.00', 'Enel', '45346', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `utilizatori`
--

CREATE TABLE `utilizatori` (
  `id` int(11) NOT NULL,
  `nume` varchar(255) DEFAULT NULL,
  `parola` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `utilizatori`
--

INSERT INTO `utilizatori` (`id`, `nume`, `parola`) VALUES
(1, 'Alexandra', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contactefrecvente`
--
ALTER TABLE `contactefrecvente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilizatori_id` (`utilizatori_id`);

--
-- Indexes for table `furnizori`
--
ALTER TABLE `furnizori`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilizatori_id` (`utilizatori_id`);

--
-- Indexes for table `plati`
--
ALTER TABLE `plati`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contactefrecvente` (`contactefrecvente`),
  ADD KEY `utilizatori_id` (`utilizatori_id`);

--
-- Indexes for table `transferuri`
--
ALTER TABLE `transferuri`
  ADD PRIMARY KEY (`id`),
  ADD KEY `furnizori` (`furnizori`),
  ADD KEY `utilizatori_id` (`utilizatori_id`);

--
-- Indexes for table `utilizatori`
--
ALTER TABLE `utilizatori`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contactefrecvente`
--
ALTER TABLE `contactefrecvente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `furnizori`
--
ALTER TABLE `furnizori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `plati`
--
ALTER TABLE `plati`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transferuri`
--
ALTER TABLE `transferuri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `utilizatori`
--
ALTER TABLE `utilizatori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contactefrecvente`
--
ALTER TABLE `contactefrecvente`
  ADD CONSTRAINT `contactefrecvente_ibfk_1` FOREIGN KEY (`utilizatori_id`) REFERENCES `utilizatori` (`id`);

--
-- Constraints for table `furnizori`
--
ALTER TABLE `furnizori`
  ADD CONSTRAINT `furnizori_ibfk_1` FOREIGN KEY (`utilizatori_id`) REFERENCES `utilizatori` (`id`);

--
-- Constraints for table `plati`
--
ALTER TABLE `plati`
  ADD CONSTRAINT `plati_ibfk_1` FOREIGN KEY (`contactefrecvente`) REFERENCES `contactefrecvente` (`id`),
  ADD CONSTRAINT `plati_ibfk_2` FOREIGN KEY (`utilizatori_id`) REFERENCES `utilizatori` (`id`);

--
-- Constraints for table `transferuri`
--
ALTER TABLE `transferuri`
  ADD CONSTRAINT `transferuri_ibfk_1` FOREIGN KEY (`furnizori`) REFERENCES `furnizori` (`id`),
  ADD CONSTRAINT `transferuri_ibfk_2` FOREIGN KEY (`utilizatori_id`) REFERENCES `utilizatori` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
