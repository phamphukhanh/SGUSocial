-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 12, 2023 lúc 06:09 AM
-- Phiên bản máy phục vụ: 10.4.18-MariaDB
-- Phiên bản PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `sgusocial`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `email1` varchar(50) DEFAULT NULL,
  `email2` varchar(50) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  `timing` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `chat`
--

INSERT INTO `chat` (`id`, `email1`, `email2`, `message`, `timing`) VALUES
(28, 'abc@google.com', 'aryan@apple.com', 'hello', '23:48:29'),
(29, 'abc@google.com', 'aryan@apple.com', 'how are you today\r\n', '23:48:29'),
(30, 'aryan@apple.com', 'abc@google.com', 'hai\r\n', '23:48:29'),
(31, 'aryan@apple.com', 'abc@google.com', 'how are u\r\n', '23:48:29'),
(32, 'abc@google.com', 'srk@redchillies.com', 'hello ae', '23:48:29'),
(33, 'aryan@apple.com', 'priyam.roy1@wipro.com', 'avb', '15:41:15'),
(34, 'aryan@apple.com', 'sam@usfoods.com', 'cax', '10:31:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 NOT NULL,
  `comment` varchar(100) NOT NULL,
  `time` varchar(20) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `email`, `comment`, `time`, `date`) VALUES
(1, 1, 'manbir@google.com', 'helloo', '12:04:52', '2023-11-15'),
(3, 1, 'aryan@apple.com', 'avc', '12:04:52', '2023-11-15'),
(4, 1, 'aryan@apple.com', 'abc', '12:04:52', '2023-11-12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `follow`
--

CREATE TABLE `follow` (
  `email1` varchar(50) DEFAULT NULL,
  `email2` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `follow`
--

INSERT INTO `follow` (`email1`, `email2`) VALUES
('priyam.roy1@wipro.com', 'abc@google.com'),
('aryan@apple.com', 'sam@usfoods.com'),
('manbir@google.com', 'aryan@apple.com'),
('manbir@google.com', 'priyam.roy1@wipro.com'),
('priyam.roy1@wipro.com', 'sam@usfoods.com'),
('manbir@google.com', 'srk@redchillies.com'),
('priyam.roy1@wipro.com', 'srk@redchillies.com'),
('sayantan@fb.com', 'sam@usfoods.com'),
('sayantan@fb.com', 'srk@redchillies.com'),
('mili@wipro.com', 'aryan@apple.com'),
('mili@wipro.com', 'priyam.roy1@wipro.com'),
('mili@wipro.com', 'srk@redchillies.com'),
('munna@yahoo.com', 'srk@redchillies.com'),
('munna@yahoo.com', 'priyam.roy1@wipro.com'),
('priyam.roy1@wipro.com', 'mili@wipro.com'),
('protis3@gmail.com', 'sam@usfoods.com'),
('abc@google.com', 'priyam.roy1@wipro.com'),
('aryan@apple.com', 'abc@google.com'),
('aryan@apple.com', 'srk@redchillies.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `liked`
--

CREATE TABLE `liked` (
  `id` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `liked`
--

INSERT INTO `liked` (`id`, `email`) VALUES
(1, 'manbir@google.com'),
(1, 'srk@redchillies.com'),
(20, 'abc@google.com'),
(20, 'mili@wipro.com'),
(22, 'mili@wipro.com'),
(22, 'priyam.roy1@wipro.com'),
(32, 'aryan@apple.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  `postdate` date DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `post`
--

INSERT INTO `post` (`id`, `email`, `likes`, `message`, `postdate`, `time`, `active`) VALUES
(1, 'abc@google.com', 2, 'hiii', '2019-04-18', '19:53:38', 1),
(20, 'priyam.roy1@wipro.com', 2, 'hola', '2019-04-19', '19:53:38', 1),
(21, 'mili@wipro.com', 0, 'Hi', '2019-05-30', '19:53:38', 1),
(22, 'mili@wipro.com', 2, 'egegeg', '2019-05-30', '19:53:38', 1),
(23, 'munna@yahoo.com', 0, 'Hellooooo.....', '2019-06-04', '19:53:38', 1),
(24, 'priyam.roy1@wipro.com', 0, 'putki', '2019-06-04', '19:53:38', 1),
(27, 'protis3@gmail.com', 0, 'hi\r\n', '2019-06-05', '19:53:38', 1),
(30, 'aryan@apple.com', 0, 'hello ae', '2023-10-25', '19:53:38', 1),
(32, 'aryan@apple.com', 1, 'hee', '2023-10-25', '19:58:54', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `email` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user`
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
-- Cấu trúc bảng cho bảng `user_details`
--

CREATE TABLE `user_details` (
  `email` varchar(50) NOT NULL,
  `about` varchar(500) DEFAULT NULL,
  `path` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user_details`
--

INSERT INTO `user_details` (`email`, `about`, `path`) VALUES
('abc@google.com', ' HELLO', '/Begin/images/abc@google.com.png'),
('aryan@apple.com', '            asd', '/PBook/images/aryan@apple.com.png'),
('manbir@google.com', 'Hi m inevitable....', '/PBook/images/manbir@google.com.jpg'),
('mili@wipro.com', '  Hollaaaaaa....', '/PBook/images/mili@wipro.com.png'),
('munna@yahoo.com', ' ', '/PBook/images/munna@yahoo.com.jpg'),
('priyam.roy1@wipro.com', '                             hello :) :) :) :)', '/PBook/images/priyam.roy1@wipro.com.jpg'),
('sam@usfoods.com', NULL, '/PBook/images/sam@usfoods.com.jpg'),
('sayantan@fb.com', NULL, '/PBook/images/sayantan@fb.com.jpg'),
('srk@redchillies.com', '  I feel like the king of this world......!!\r\n', '/PBook/images/srk@redchillies.com.jpg');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_email1` (`email1`),
  ADD KEY `fk_email2` (`email2`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_post` (`post_id`),
  ADD KEY `fn` (`email`) USING BTREE;

--
-- Chỉ mục cho bảng `follow`
--
ALTER TABLE `follow`
  ADD KEY `email1` (`email1`),
  ADD KEY `email2` (`email2`);

--
-- Chỉ mục cho bảng `liked`
--
ALTER TABLE `liked`
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `fk_email1` FOREIGN KEY (`email1`) REFERENCES `user` (`email`),
  ADD CONSTRAINT `fk_email2` FOREIGN KEY (`email2`) REFERENCES `user` (`email`);

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_email` FOREIGN KEY (`email`) REFERENCES `user` (`email`),
  ADD CONSTRAINT `fk_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`);

--
-- Các ràng buộc cho bảng `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`email1`) REFERENCES `user` (`email`),
  ADD CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`email2`) REFERENCES `user` (`email`);

--
-- Các ràng buộc cho bảng `liked`
--
ALTER TABLE `liked`
  ADD CONSTRAINT `liked_ibfk_1` FOREIGN KEY (`id`) REFERENCES `post` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `fk_details` FOREIGN KEY (`email`) REFERENCES `user` (`email`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
