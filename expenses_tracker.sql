-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2024 at 10:49 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `expenses_tracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `expenses_table`
--

CREATE TABLE `expenses_table` (
  `id` int(11) NOT NULL,
  `user_id` varchar(30) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `expenses` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `date_spent` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenses_table`
--

INSERT INTO `expenses_table` (`id`, `user_id`, `title`, `expenses`, `category`, `date_spent`) VALUES
(1, '4', 'Expenses On December', '10000', 'Food And Gala', '2024-12-06'),
(2, '4', 'Expenses On December', '20000', 'Christmas Occation', '2024-12-02'),
(5, '4', 'Expenses On December', '20000', 'Date', '2024-12-06'),
(7, '4', 'Expenses On December', '10100', 'Food And Gala', '2024-12-04'),
(8, '4', 'Expenses On December', '10100', 'Food And Gala', '2024-12-05'),
(12, '2', 'Expenses On December', '10100', 'Food', '2024-11-22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_role` varchar(255) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `password`, `user_role`, `date_created`) VALUES
(2, 'Yonille', '12345678', 'admin', '2024-10-26 14:11:48'),
(4, 'Yo Nille', '1234567890', 'user', '2024-10-27 03:37:20'),
(5, 'Yonille', '12345678', 'user', '2024-10-27 09:36:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `expenses_table`
--
ALTER TABLE `expenses_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `expenses_table`
--
ALTER TABLE `expenses_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
