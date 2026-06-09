-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2026 at 01:29 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tasktracer`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminlogin`
--

CREATE TABLE `adminlogin` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `Phoneno` varchar(15) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` varchar(20) DEFAULT 'employee'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminlogin`
--

INSERT INTO `adminlogin` (`id`, `photo`, `Phoneno`, `Password`, `username`, `email`, `role`) VALUES
(1, 'abc_1775154004.jpg', '9921353338', 'Snehal#2004', 'snehal Namdev jadhav', 'snehaljadhav852004@gmail.com', 'admin'),
(2, 'abc.webp', '9422926362', 'Anuradha212', 'anurdha', 'anuradhajadhav1346@gmail.com', 'admin'),
(3, 'abc.jpeg', NULL, 'Yash@12', 'yash', 'yashjadhav852004@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `phoneno` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `name`, `photo`, `email`, `password`, `phoneno`, `created_at`) VALUES
(1, 'Snehal Jadhav', 'abc.jpeg', 'snehaljadhav852004@gmail.com', 'Snehal#2004', '9921353338', '2026-04-02 19:27:39'),
(2, 'anurdha', 'abc.jpg', 'anuradhajadhav1346@gmail.com', 'anu@12', '9960446362', '2026-04-02 19:28:29');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `task_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `priority` enum('Low','Medium','High') DEFAULT 'Low',
  `deadline` datetime NOT NULL,
  `status` enum('Pending','In Progress','Completed') DEFAULT 'Pending',
  `assigned_to` varchar(100) DEFAULT NULL,
  `assigned_emp_id` int(11) DEFAULT NULL,
  `email_reminder_1day_sent` tinyint(1) DEFAULT 0,
  `email_reminder_on_deadline_sent` tinyint(1) DEFAULT 0,
  `email_reminder_on_deadline_sent_admin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`task_id`, `title`, `description`, `priority`, `deadline`, `status`, `assigned_to`, `assigned_emp_id`, `email_reminder_1day_sent`, `email_reminder_on_deadline_sent`, `email_reminder_on_deadline_sent_admin`) VALUES
(1, 'Prepare Monthly Report', 'Compile sales data from last month and prepare report.', 'High', '2026-04-03 02:15:00', 'Completed', 'snehal namdev jadhav', 1, 0, 0, 0),
(2, 'Prepare Monthly Report', 'Compile sales data from last month and prepare report.', 'High', '2026-03-29 01:30:00', 'Pending', 'Anuradha Namdev Jadhav', 2, 0, 1, 1),
(3, 'Prepare Monthly Report', 'Compile sales data from last month and prepare report.', 'High', '2026-04-02 01:30:00', 'Pending', 'snehal namdev jadhav', 1, 0, 1, 1),
(4, 'Prepare Monthly Report', 'Compile sales data from last month and prepare report.', 'High', '2026-03-10 08:30:00', 'Pending', 'Anuradha Namdev Jadhav', 2, 0, 1, 1),
(5, 'Prepare Monthly Report', 'Compile sales data from last month and prepare report.', 'High', '2026-04-30 01:30:00', 'Completed', 'snehal namdev jadhav', 1, 0, 0, 0),
(6, 'Prepare Monthly Report', 'Compile sales data from last month and prepare report.', 'Medium', '2026-03-05 12:30:00', 'Completed', 'Anuradha Namdev Jadhav', 2, 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminlogin`
--
ALTER TABLE `adminlogin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`task_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminlogin`
--
ALTER TABLE `adminlogin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
