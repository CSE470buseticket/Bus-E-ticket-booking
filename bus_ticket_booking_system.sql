-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2024 at 01:04 PM
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
-- Database: `bus ticket booking system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Username` varchar(15) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `E_Phone` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Username`, `Password`, `E_Phone`) VALUES
('ayesha', '1234', '01737607861');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `E_Email` varchar(50) NOT NULL,
  `E_Phone` char(11) NOT NULL,
  `E_Name` varchar(50) NOT NULL,
  `E_Address` varchar(100) DEFAULT NULL,
  `Position` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`E_Email`, `E_Phone`, `E_Name`, `E_Address`, `Position`) VALUES
('momo@gmail.com', '01678546087', 'momo', 'dhaka', 'accountant'),
('ayesha@gmail.com', '01737607861', 'ayesha', 'dhaka', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `Message` varchar(500) DEFAULT NULL,
  `Feedback_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`Message`, `Feedback_ID`) VALUES
('Good Service.', 1),
('Do better next time.', 2),
('Nice journey.', 3),
('Goo Ahead...', 4);

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `P_ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone_no` char(11) NOT NULL,
  `Address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `Route_no` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Departing_from` varchar(30) NOT NULL,
  `Destination` varchar(30) NOT NULL,
  `Pickup_Time` time NOT NULL,
  `Fare` int(11) NOT NULL,
  `sold_seats` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`Route_no`, `Date`, `Departing_from`, `Destination`, `Pickup_Time`, `Fare`, `sold_seats`) VALUES
(1, '2024-11-15', 'Dhaka', 'Chittagong', '08:00:00', 250, 25),
(2, '2024-11-16', 'Chittagong', 'Dhaka', '07:00:00', 300, 16),
(3, '2024-11-01', 'Chandpur', 'Cumilla', '09:00:00', 150, 10),
(4, '2024-11-29', 'Dhaka', 'Cumilla', '07:00:00', 200, 16),
(5, '2024-11-21', 'Cumilla', 'Chandpur', '08:30:00', 170, 20),
(10, '2024-11-15', 'Dhaka', 'Chittagong', '09:00:00', 300, 27);

-- --------------------------------------------------------

--
-- Table structure for table `temp`
--

CREATE TABLE `temp` (
  `id` int(11) NOT NULL,
  `list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `Ticket_no` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `P_ID` int(11) NOT NULL,
  `Route_no` int(11) NOT NULL,
  `Payment_Type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `travels_through`
--

CREATE TABLE `travels_through` (
  `Vehicle_no` int(11) NOT NULL,
  `Route_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `travels_through`
--

INSERT INTO `travels_through` (`Vehicle_no`, `Route_no`) VALUES
(1, 2),
(2, 1),
(3, 3),
(4, 5),
(5, 4),
(5, 10);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `Vehicle_no` int(11) NOT NULL,
  `Registered_Area` varchar(30) NOT NULL,
  `Total_Seat` int(11) NOT NULL,
  `Vehicle_type` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`Vehicle_no`, `Registered_Area`, `Total_Seat`, `Vehicle_type`) VALUES
(1, 'Dhaka', 36, 'NON AC'),
(2, 'Dhaka', 36, 'AC'),
(3, 'Chittagong', 36, 'NON AC'),
(4, 'Chittagong', 36, 'NON AC'),
(5, 'Chittagong', 36, 'AC');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Username`),
  ADD KEY `E_Phone` (`E_Phone`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`E_Phone`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`Feedback_ID`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`P_ID`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`Route_no`);

--
-- Indexes for table `temp`
--
ALTER TABLE `temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`Ticket_no`),
  ADD KEY `P_ID` (`P_ID`),
  ADD KEY `Route_no` (`Route_no`);

--
-- Indexes for table `travels_through`
--
ALTER TABLE `travels_through`
  ADD PRIMARY KEY (`Vehicle_no`,`Route_no`),
  ADD KEY `Route_no` (`Route_no`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`Vehicle_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `Feedback_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `P_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `temp`
--
ALTER TABLE `temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `Ticket_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`E_Phone`) REFERENCES `employee` (`E_Phone`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`P_ID`) REFERENCES `passenger` (`P_ID`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`Route_no`) REFERENCES `route` (`Route_no`);

--
-- Constraints for table `travels_through`
--
ALTER TABLE `travels_through`
  ADD CONSTRAINT `travels_through_ibfk_1` FOREIGN KEY (`Vehicle_no`) REFERENCES `vehicle` (`Vehicle_no`),
  ADD CONSTRAINT `travels_through_ibfk_2` FOREIGN KEY (`Route_no`) REFERENCES `route` (`Route_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
