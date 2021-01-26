-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2021 at 01:21 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `springcrm`
--

-- --------------------------------------------------------

--
-- Table structure for table `authorities`
--

CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authorities`
--

INSERT INTO `authorities` (`username`, `authority`, `id`) VALUES
('john', 'ROLE_EMPLOYEE', 1),
('mary', 'ROLE_EMPLOYEE', 2),
('mary', 'ROLE_MANAGER', 3),
('susan', 'ROLE_EMPLOYEE', 4),
('susan', 'ROLE_ADMIN', 5);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `first_name`, `last_name`, `email`) VALUES
(1, 'Abdulraheem', 'Adavuruku', 'aabdulraheem@gmail.com'),
(2, 'Mubarak', 'Oyamine', 'oyamine@yahoo.com'),
(4, 'Hawa', 'Oyamine S.', 'hawaoyami@yahoo.com'),
(5, 'Karimu', 'Zulka', 'zulka@gmail.com'),
(6, 'Samuel', 'John P', 'johnsam@yahoo.com'),
(7, 'Mercy', 'Daniel', 'mercy@gmail.com'),
(8, 'Nana', 'Hawa K.', 'nana@yahoo.com'),
(9, 'Janet', 'Joseph', 'janetjoe@gmail.com'),
(10, 'Khadijat', 'Yusuf', 'khadijat@yahoo.com'),
(11, 'Habibat', 'Jimoh', 'habibat@yahoo.com');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `enabled`) VALUES
('john', '$2a$12$2zcLhCqX9vTxh74ueha6b.gw.MziwWOe7skXTBl0yuXCjIZOOiTvm', 1),
('mary', '$2a$12$2zcLhCqX9vTxh74ueha6b.gw.MziwWOe7skXTBl0yuXCjIZOOiTvm', 1),
('susan', '$2a$12$2zcLhCqX9vTxh74ueha6b.gw.MziwWOe7skXTBl0yuXCjIZOOiTvm', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authorities`
--
ALTER TABLE `authorities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authorities`
--
ALTER TABLE `authorities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
