-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2023 at 05:12 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sgusocial`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `email1` varchar(50) DEFAULT NULL,
  `email2` varchar(50) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  `timing` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `email1` varchar(50) DEFAULT NULL,
  `email2` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`email1`, `email2`) VALUES
('priyam.roy1@wipro.com', 'abc@google.com'),
('aryan@apple.com', 'sam@usfoods.com'),
('manbir@google.com', 'aryan@apple.com'),
('manbir@google.com', 'priyam.roy1@wipro.com'),
('abc@google.com', 'sam@usfoods.com'),
('priyam.roy1@wipro.com', 'sam@usfoods.com'),
('manbir@google.com', 'srk@redchillies.com'),
('priyam.roy1@wipro.com', 'srk@redchillies.com'),
('sayantan@fb.com', 'sam@usfoods.com'),
('sayantan@fb.com', 'srk@redchillies.com'),
('abc@google.com', 'priyam.roy1@wipro.com'),
('abc@google.com', 'aryan@apple.com'),
('mili@wipro.com', 'aryan@apple.com'),
('mili@wipro.com', 'priyam.roy1@wipro.com'),
('mili@wipro.com', 'srk@redchillies.com'),
('munna@yahoo.com', 'srk@redchillies.com'),
('munna@yahoo.com', 'priyam.roy1@wipro.com'),
('priyam.roy1@wipro.com', 'mili@wipro.com'),
('protis3@gmail.com', 'sam@usfoods.com');

-- --------------------------------------------------------

--
-- Table structure for table `liked`
--

CREATE TABLE `liked` (
  `id` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `liked`
--

INSERT INTO `liked` (`id`, `email`) VALUES
(3, 'sam@usfoods.com'),
(5, 'aryan@apple.com'),
(1, 'manbir@google.com'),
(10, 'abc@google.com'),
(5, 'abc@google.com'),
(19, 'sayantan@fb.com'),
(1, 'srk@redchillies.com'),
(20, 'abc@google.com'),
(20, 'mili@wipro.com'),
(22, 'mili@wipro.com'),
(10, 'mili@wipro.com'),
(3, 'mili@wipro.com'),
(5, 'mili@wipro.com'),
(5, 'priyam.roy1@wipro.com'),
(22, 'priyam.roy1@wipro.com');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  `postdate` date DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `email`, `likes`, `message`, `postdate`, `time`, `active`) VALUES
(1, 'abc@google.com', 2, 'hiii', '2019-04-18', 1555564046, 1),
(3, 'priyam.roy1@wipro.com', 2, 'Hi', '2019-04-18', 1555564585, 1),
(5, 'sam@usfoods.com', 4, 'hi', '2019-04-18', 1555569546, 1),
(10, 'aryan@apple.com', 2, 'ok...', '2019-04-18', 1555572952, 1),
(19, 'srk@redchillies.com', 1, 'Hi', '2019-04-19', 1555652635, 1),
(20, 'priyam.roy1@wipro.com', 2, 'hola', '2019-04-19', 1555652829, 1),
(21, 'mili@wipro.com', 0, 'Hi', '2019-05-30', 1559215666, 1),
(22, 'mili@wipro.com', 2, 'egegeg', '2019-05-30', 1559217098, 1),
(23, 'munna@yahoo.com', 0, 'Hellooooo.....', '2019-06-04', 1559634609, 1),
(24, 'priyam.roy1@wipro.com', 0, 'putki shalaaaaaa... :) :)\r\n', '2019-06-04', 1559635277, 1),
(27, 'protis3@gmail.com', 0, 'hi\r\n', '2019-06-05', 1559740679, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `email` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`email`, `name`, `password`, `active`) VALUES
('abc@google.com', 'ABC', 'abc123', 1),
('aryan@apple.com', 'Aryan Khanna', 'aryan1', 1),
('manbir@google.com', 'Manoj Kumar', 'manoj123', 1),
('mili@wipro.com', 'Mili', 'mili', 1),
('munna@yahoo.com', 'Munna', 'munna123', 1),
('phamphukhanh.sgu.edu@gmail.com', 'Ph&#7841;m Phú Khánh', 'L5B4!wFKdJzYR@a', 1),
('priyam.roy1@wipro.com', 'priyam', 'priyam123', 1),
('protis3@gmail.com', 'Pratyush', 'protis3', 1),
('sam@usfoods.com', 'Sam', 'sam123', 1),
('sayantan@fb.com', 'Sayantan Roy', 'say123', 1),
('srk@redchillies.com', 'SRK', 'srk123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `email` varchar(50) NOT NULL,
  `about` varchar(500) DEFAULT NULL,
  `path` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`email`, `about`, `path`) VALUES
('abc@google.com', '     dsfdsf', '/PBook/images/abc@google.com.jpg'),
('aryan@apple.com', '            asd', '/PBook/images/aryan@apple.com.png'),
('manbir@google.com', 'Hi m inevitable....', '/PBook/images/manbir@google.com.jpg'),
('mili@wipro.com', '  Hollaaaaaa....', '/PBook/images/mili@wipro.com.png'),
('munna@yahoo.com', ' ', '/PBook/images/munna@yahoo.com.jpg'),
('priyam.roy1@wipro.com', '                             hello :) :) :) :)', '/PBook/images/priyam.roy1@wipro.com.jpg'),
('sam@usfoods.com', NULL, '/PBook/images/sam@usfoods.com.jpg'),
('sayantan@fb.com', NULL, '/PBook/images/sayantan@fb.com.jpg'),
('srk@redchillies.com', '  I feel like the king of this world......!!\r\n', '/PBook/images/srk@redchillies.com.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD KEY `email1` (`email1`),
  ADD KEY `email2` (`email2`);

--
-- Indexes for table `liked`
--
ALTER TABLE `liked`
  ADD KEY `id` (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`email1`) REFERENCES `user` (`email`),
  ADD CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`email2`) REFERENCES `user` (`email`);

--
-- Constraints for table `liked`
--
ALTER TABLE `liked`
  ADD CONSTRAINT `liked_ibfk_1` FOREIGN KEY (`id`) REFERENCES `post` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `fk_details` FOREIGN KEY (`email`) REFERENCES `user` (`email`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
