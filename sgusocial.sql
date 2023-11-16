-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2023 at 09:06 AM
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
  `timing` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `email1`, `email2`, `message`, `timing`) VALUES
(28, 'abc@google.com', 'aryan@apple.com', 'hello', '23:48:29'),
(29, 'abc@google.com', 'aryan@apple.com', 'how are you today\r\n', '23:48:29'),
(30, 'aryan@apple.com', 'abc@google.com', 'hai\r\n', '23:48:29'),
(31, 'aryan@apple.com', 'abc@google.com', 'how are u\r\n', '23:48:29'),
(33, 'aryan@apple.com', 'priyam.roy1@wipro.com', 'avb', '15:41:15'),
(36, 'abc@google.com', 'priyam.roy1@wipro.com', 'ê', '12:06:20'),
(37, 'abc@google.com', 'aryan@apple.com', 'ùm', '12:19:29'),
(38, 'abc@google.com', 'aryan@apple.com', 'toi khỏe', '12:23:03'),
(40, 'abc@google.com', 'aryan@apple.com', 'mệt', '12:33:41'),
(41, 'e@gmail.com', 'abc@google.com', 'chào bạn', '13:30:42'),
(42, 'e@gmail.com', 'abc@google.com', 'bạn có phải ngươi đăng cái tus này hong', '13:31:02'),
(45, 'e@gmail.com', 'abc@google.com', 'ê', '13:34:45'),
(46, 'e@gmail.com', 'abc@google.com', 'bạn ơi', '13:34:50');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment` varchar(100) NOT NULL,
  `time` varchar(20) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `email`, `comment`, `time`, `date`) VALUES
(3, 1, 'aryan@apple.com', 'avc', '12:04:52', '2023-11-15'),
(4, 1, 'aryan@apple.com', 'abc', '12:04:52', '2023-11-12'),
(5, 1, 'aryan@apple.com', 'va', '12:32:35', '2023-11-12'),
(6, 39, 'abc@google.com', 'hi', '10:18:38', '2023-11-16'),
(7, 39, 'abc@google.com', 'ákjd', '11:56:41', '2023-11-16'),
(9, 39, 'abc@google.com', 'quá ghê ', '12:02:29', '2023-11-16'),
(10, 24, 'abc@google.com', 'siêu nhân điện quang', '12:02:47', '2023-11-16');

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
('mili@wipro.com', 'aryan@apple.com'),
('mili@wipro.com', 'priyam.roy1@wipro.com'),
('munna@yahoo.com', 'priyam.roy1@wipro.com'),
('priyam.roy1@wipro.com', 'mili@wipro.com'),
('abc@google.com', 'priyam.roy1@wipro.com'),
('aryan@apple.com', 'abc@google.com'),
('abc@google.com', 'aryan@apple.com'),
('e@gmail.com', 'abc@google.com');

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
(1, 'manbir@google.com'),
(1, 'srk@redchillies.com'),
(20, 'mili@wipro.com'),
(22, 'mili@wipro.com'),
(22, 'priyam.roy1@wipro.com'),
(32, 'aryan@apple.com'),
(36, 'hello@mail.com'),
(38, 'h@mail.com'),
(24, 'abc@google.com'),
(39, 'abc@google.com'),
(1, 'e@gmail.com'),
(42, 'e@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `postdate` date DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `email`, `likes`, `message`, `postdate`, `time`, `active`) VALUES
(1, 'abc@google.com', 3, 'hiii', '2019-04-18', '19:53:38', 1),
(20, 'priyam.roy1@wipro.com', 1, 'hola', '2019-04-19', '19:53:38', 1),
(21, 'mili@wipro.com', 0, 'Hi', '2019-05-30', '19:53:38', 1),
(22, 'mili@wipro.com', 2, 'egegeg', '2019-05-30', '19:53:38', 1),
(23, 'munna@yahoo.com', 0, 'Hellooooo.....', '2019-06-04', '19:53:38', 1),
(24, 'priyam.roy1@wipro.com', 1, 'putki', '2019-06-04', '19:53:38', 1),
(30, 'aryan@apple.com', 0, 'hello ae', '2023-10-25', '19:53:38', 1),
(32, 'aryan@apple.com', 1, 'hee', '2023-10-25', '19:58:54', 1),
(36, 'hello@mail.com', 1, 'Your', '2023-11-12', '02:07:19', 1),
(37, 'h@mail.com', 0, 'Your first post is here! This post is automatically created when you create your account for the first time.', '2023-11-12', '02:12:51', 1),
(38, 'h@mail.com', 1, 'yo', '2023-11-12', '02:13:19', 1),
(39, 'abc@google.com', 1, 'hello', '2023-11-16', '10:18:21', 1),
(42, 'e@gmail.com', 1, 'Good', '2023-11-16', '14:27:00', 1),
(43, 'e@gmail.com', 0, 'Never gonna give you up\r\nNever gonna let you down\r\nNever gonna run around and\r\nDesert you!', '2023-11-16', '14:57:26', 1);

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
('e@gmail.com', 'E', '123', 1),
('h@mail.com', 'H', '123', 1),
('hello@mail.com', 'Hello', '123', 1),
('mili@wipro.com', 'Mili', 'mili', 1),
('munna@yahoo.com', 'Munna', 'munna123', 1),
('priyam.roy1@wipro.com', 'priyam', 'priyam123', 1);

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
('abc@google.com', NULL, '/SGUSocial/images/abc@google.com.png'),
('aryan@apple.com', 'asd', '/SGUSocial/images/aryan@apple.com.png'),
('e@gmail.com', NULL, '/SGUSocial/images/e@gmail.com.png'),
('h@mail.com', NULL, NULL),
('hello@mail.com', NULL, NULL),
('mili@wipro.com', 'Hollaaaaaa....', '/SGUSocial/images/mili@wipro.com.png'),
('munna@yahoo.com', ' ', '/SGUSocial/images/munna@yahoo.com.jpg'),
('priyam.roy1@wipro.com', 'hello :) :) :) :)', '/SGUSocial/images/priyam.roy1@wipro.com.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_email1` (`email1`),
  ADD KEY `fk_email2` (`email2`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_post` (`post_id`),
  ADD KEY `fn` (`email`) USING BTREE;

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_user` (`email`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `fk_email1` FOREIGN KEY (`email1`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_email2` FOREIGN KEY (`email2`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_email` FOREIGN KEY (`email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`email1`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`email2`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `liked`
--
ALTER TABLE `liked`
  ADD CONSTRAINT `liked_ibfk_1` FOREIGN KEY (`id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_user` FOREIGN KEY (`email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `fk_details` FOREIGN KEY (`email`) REFERENCES `user` (`email`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
