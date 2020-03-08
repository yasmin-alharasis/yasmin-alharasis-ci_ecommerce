-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2020 at 07:17 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci_product`
--

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `OrderId` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `product_price` int(11) DEFAULT NULL,
  `deleted_at` date NOT NULL,
  `color_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `image` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `description` varchar(255) NOT NULL,
  `color_id` int(11) NOT NULL,
  `quentity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `category_id`, `pname`, `status`, `image`, `price`, `description`, `color_id`, `quentity`) VALUES
(28, 1, 'LG', 0, 'lg-v40-thinq5.png', 541, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 4, 5),
(29, 1, 'LG', 0, 'lg-v40-thinq5.png', 541, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 5, 6),
(30, 1, 'apple', 0, 'apple19.png', 463, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 1, 1),
(31, 1, 'apple', 0, 'apple19.png', 463, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 2, 10),
(32, 1, 'apple', 0, 'apple19.png', 463, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 3, 5),
(33, 1, 'apple', 0, 'apple19.png', 463, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 5, 4),
(34, 1, 'vivo', 0, 'vivo3.png', 351, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 2, 10),
(35, 1, 'vivo', 0, 'vivo3.png', 351, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 4, 4),
(36, 1, 'XiaomiMi9-b', 0, 'XiaomiMi9-b5.jpg', 600, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 2, 9);

-- --------------------------------------------------------

--
-- Table structure for table `product_color`
--

CREATE TABLE `product_color` (
  `color_id` int(11) NOT NULL,
  `color_name` varchar(11) NOT NULL,
  `color_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_color`
--

INSERT INTO `product_color` (`color_id`, `color_name`, `color_value`) VALUES
(1, 'red', '#B93B20'),
(2, 'black', '#000000 '),
(3, 'white', '#FFFFFF '),
(4, 'silver', '#C0C0C0'),
(5, 'gold', '#EEE8AA');

-- --------------------------------------------------------

--
-- Table structure for table `product_quentity`
--

CREATE TABLE `product_quentity` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(50) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_type` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` char(60) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_type`, `username`, `email`, `password`, `gender`, `created_date`, `phone`) VALUES
(10, 'member', 'reham', 'reham@gmail.com', '$2y$10$4JkfAEyw0VfSvn3dFQJ5Tep5Xh71ctSOgeQgU.IHzQ8', 'Female', '2020-02-08 22:00:00', '0789632145'),
(34, 'member', 'tala', 'tala@gmail.com', '$2y$10$GSh4ysZNKcGVS/4aKdAFGOtYaGb9obRRuSh8oSF1TnD', 'Female', '2020-02-22 22:00:00', '7896532410'),
(38, 'member', 'yasmin', 'yasmin@gmail.com', '$2y$07$usesomesillystringforeNYbgbcHf5r10MccJZdNSb', 'Female', '2020-02-22 22:00:00', '5698321470'),
(39, 'member', 'bushra', 'bushra@gmail.com', '$2y$10$nxDZlnKFoextFt/.yddc0.cfEvOFs2u.lyGoN8BWi6ld4U3vX1zd.', 'Female', '2020-02-22 22:00:00', '0236985147'),
(40, 'member', 'rama', 'rama@gmail.com', '$2y$10$herwFGe3k10j/Wpj23NpDeHaFCHcKqkQvQXhs.djdYIsMaNKJsvni', 'Female', '2020-02-23 22:00:00', '0796325841'),
(41, 'member', 'ahmad', 'ahmad@gmail.com', '$2y$10$tQ/rNaCcJ94HR6sZw0O9SerqCFFXTkL2IRKusaCrvf19CaHBm9cum', 'Male', '2020-02-23 22:00:00', '0798654123'),
(42, 'admin', 'admin', 'admin@gmail.com', '$2y$10$uliOX2NvfHhd7rX8lJ780.BmGp/iAtkNSlNj230DGTaqh5S7WxEjK', 'Female', '2020-02-25 08:04:06', '0798564123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderId`),
  ADD KEY `fk_user` (`user_id`),
  ADD KEY `fk_order` (`product_id`),
  ADD KEY `FK_colorOrder` (`color_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_color`
--
ALTER TABLE `product_color`
  ADD PRIMARY KEY (`color_id`);

--
-- Indexes for table `product_quentity`
--
ALTER TABLE `product_quentity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `color_id` (`color_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
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
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `OrderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `product_color`
--
ALTER TABLE `product_color`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_colorOrder` FOREIGN KEY (`color_id`) REFERENCES `product_color` (`color_id`),
  ADD CONSTRAINT `fk_order` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_order_user1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `fk_order_user2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_quentity`
--
ALTER TABLE `product_quentity`
  ADD CONSTRAINT `product_quentity_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_quentity_ibfk_2` FOREIGN KEY (`color_id`) REFERENCES `product_color` (`color_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
