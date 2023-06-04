-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2023 at 06:33 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adhoards`
--

-- --------------------------------------------------------

--
-- Table structure for table `ad_post_info`
--

CREATE TABLE `ad_post_info` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `ad_title` varchar(100) NOT NULL,
  `ad_post_type` enum('offer','want') NOT NULL,
  `ad_youtube_video` varchar(100) NOT NULL,
  `ad_address` text NOT NULL,
  `desc` text NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_name`) VALUES
(1, 'services'),
(2, 'sale'),
(3, 'job'),
(4, 'real state'),
(5, 'business'),
(6, 'persnol');

-- --------------------------------------------------------

--
-- Table structure for table `dynamic_form_rel`
--

CREATE TABLE `dynamic_form_rel` (
  `id` tinyint(4) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `form_tag_id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dynamic_form_rel`
--

INSERT INTO `dynamic_form_rel` (`id`, `category_id`, `sub_category_id`, `form_tag_id`) VALUES
(1, 1, 1, 0),
(2, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `form_tag`
--

CREATE TABLE `form_tag` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `tag_name` varchar(50) NOT NULL,
  `tag_attr_name` varchar(50) NOT NULL,
  `tag_label_name` varchar(50) NOT NULL,
  `tag_input_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `form_tag`
--

INSERT INTO `form_tag` (`id`, `tag_name`, `tag_attr_name`, `tag_label_name`, `tag_input_type`) VALUES
(2, 'input', 'price_amt', 'Price', NULL),
(3, 'input', 'negotiable', 'Negotiable', NULL),
(4, 'select', 'posted-by', 'Posted By', NULL),
(5, 'select', 'furnishing-type', 'Furnishing Type', NULL),
(6, 'select', 'no-of-rooms', 'No. of Rooms', NULL),
(7, 'input', 'area_val', 'Area', NULL),
(8, 'select', 'area_unit', 'Unit', NULL),
(9, 'select', 'parking', 'Parking', NULL),
(10, 'select', 'property_type', 'Property Type', NULL),
(11, 'input', 'available-on', 'Available On', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rel_form_tag_cat_subcat`
--

CREATE TABLE `rel_form_tag_cat_subcat` (
  `id` tinyint(4) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `form_tag_id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rel_form_tag_cat_subcat`
--

INSERT INTO `rel_form_tag_cat_subcat` (`id`, `category_id`, `sub_category_id`, `form_tag_id`) VALUES
(1, 1, 1, 2),
(8, 3, 4, 8),
(2, 4, 4, 2),
(3, 4, 4, 3),
(4, 4, 4, 4),
(5, 4, 4, 5),
(6, 4, 4, 6),
(7, 4, 4, 7),
(9, 4, 4, 9),
(10, 4, 4, 10),
(11, 4, 4, 11);

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`id`, `category_id`, `sub_category_name`) VALUES
(1, 1, 'beauty'),
(2, 1, 'education'),
(3, 3, 'account/finance'),
(4, 4, 'apartment for rent'),
(5, 4, 'apartment for sale'),
(6, 1, 'creative'),
(7, 1, 'web services'),
(8, 1, 'pet'),
(9, 1, 'electronics'),
(10, 1, 'food / dining'),
(11, 1, 'legal'),
(12, 1, 'finance'),
(13, 1, 'event');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ad_post_info`
--
ALTER TABLE `ad_post_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `sub_category_id` (`sub_category_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dynamic_form_rel`
--
ALTER TABLE `dynamic_form_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `sub_category_id` (`sub_category_id`);

--
-- Indexes for table `form_tag`
--
ALTER TABLE `form_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rel_form_tag_cat_subcat`
--
ALTER TABLE `rel_form_tag_cat_subcat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_id_2` (`category_id`,`sub_category_id`,`form_tag_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `sub_category_id` (`sub_category_id`),
  ADD KEY `form_tag_id` (`form_tag_id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ad_post_info`
--
ALTER TABLE `ad_post_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dynamic_form_rel`
--
ALTER TABLE `dynamic_form_rel`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `form_tag`
--
ALTER TABLE `form_tag`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `rel_form_tag_cat_subcat`
--
ALTER TABLE `rel_form_tag_cat_subcat`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ad_post_info`
--
ALTER TABLE `ad_post_info`
  ADD CONSTRAINT `ad_post_info_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `ad_post_info_ibfk_2` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_category` (`id`);

--
-- Constraints for table `dynamic_form_rel`
--
ALTER TABLE `dynamic_form_rel`
  ADD CONSTRAINT `dynamic_form_rel_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `dynamic_form_rel_ibfk_2` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_category` (`id`);

--
-- Constraints for table `rel_form_tag_cat_subcat`
--
ALTER TABLE `rel_form_tag_cat_subcat`
  ADD CONSTRAINT `rel_form_tag_cat_subcat_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `rel_form_tag_cat_subcat_ibfk_2` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_category` (`id`),
  ADD CONSTRAINT `rel_form_tag_cat_subcat_ibfk_3` FOREIGN KEY (`form_tag_id`) REFERENCES `form_tag` (`id`);

--
-- Constraints for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD CONSTRAINT `sub_category_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
