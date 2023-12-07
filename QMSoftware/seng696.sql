create database seng696; 

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 05, 2023 at 02:46 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seng696`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'science'),
(2, 'technology'),
(3, 'history'),
(4, 'sports');

SELECT * FROM categories;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
CREATE TABLE IF NOT EXISTS `options` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_correct` bit(1) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `question_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5bmv46so2y5igt9o9n9w4fh6y` (`question_id`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `is_correct`, `text`, `question_id`) VALUES
(1, b'1', '100°C', 1),
(2, b'0', '90°C', 1),
(3, b'0', '80°C', 1),
(4, b'0', '110°C', 1),
(5, b'1', 'Mars', 2),
(6, b'0', 'Venus', 2),
(7, b'0', 'Jupiter', 2),
(8, b'0', 'Mercury', 2),
(9, b'1', 'O', 3),
(10, b'0', 'Ox', 3),
(11, b'0', 'Om', 3),
(12, b'0', 'Op', 3),
(13, b'1', '8', 4),
(14, b'0', '7', 4),
(15, b'0', '9', 4),
(16, b'0', '10', 4),
(17, b'1', 'Gravity', 5),
(18, b'0', 'Magnetic force', 5),
(19, b'0', 'Centrifugal force', 5),
(20, b'0', 'Electromagnetic force', 5),
(21, b'1', 'HyperText Transfer Protocol', 6),
(22, b'0', 'HighText Transfer Protocol', 6),
(23, b'0', 'HyperTech Transfer Protocol', 6),
(24, b'0', 'HyperText Transmission Protocol', 6),
(25, b'1', 'Charles Babbage', 7),
(26, b'0', 'Alan Turing', 7),
(27, b'0', 'John von Neumann', 7),
(28, b'0', 'Blaise Pascal', 7),
(29, b'1', '2007', 8),
(30, b'0', '2005', 8),
(31, b'0', '2008', 8),
(32, b'0', '2006', 8),
(33, b'1', 'Z3', 9),
(34, b'0', 'ENIAC', 9),
(35, b'0', 'UNIVAC', 9),
(36, b'0', 'Mark I', 9),
(37, b'1', 'Python', 10),
(38, b'0', 'Java', 10),
(39, b'0', 'C++', 10),
(40, b'0', 'JavaScript', 10),
(41, b'1', '1945', 11),
(42, b'0', '1944', 11),
(43, b'0', '1946', 11),
(44, b'0', '1939', 11),
(45, b'1', 'George Washington', 12),
(46, b'0', 'John Adams', 12),
(47, b'0', 'Thomas Jefferson', 12),
(48, b'0', 'Abraham Lincoln', 12),
(49, b'1', 'Japanese Empire', 13),
(50, b'0', 'Roman Empire', 13),
(51, b'0', 'Ottoman Empire', 13),
(52, b'0', 'British Empire', 13),
(53, b'1', 'Cleopatra', 14),
(54, b'0', 'Nefertiti', 14),
(55, b'0', 'Hatshepsut', 14),
(56, b'0', 'Joan of Arc', 14),
(57, b'1', 'Titanic', 15),
(58, b'0', 'Lusitania', 15),
(59, b'0', 'Britannic', 15),
(60, b'0', 'Olympic', 15),
(61, b'1', '11', 16),
(62, b'0', '10', 16),
(63, b'0', '12', 16),
(64, b'0', '9', 16),
(65, b'1', '1896', 17),
(66, b'0', '1900', 17),
(67, b'0', '1920', 17),
(68, b'0', '1888', 17),
(69, b'1', 'Germany', 18),
(70, b'0', 'Brazil', 18),
(71, b'0', 'Italy', 18),
(72, b'0', 'Argentina', 18),
(73, b'1', '300', 19),
(74, b'0', '500', 19),
(75, b'0', '400', 19),
(76, b'0', '350', 19),
(77, b'1', 'Horse racing', 20),
(78, b'0', 'Polo', 20),
(79, b'0', 'Fencing', 20),
(80, b'0', 'Golf', 20);

SELECT * FROM options;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKctl6tuf74n8cufkb3ulj6b3fc` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `text`, `category_id`) VALUES
(1, 'What is the boiling point of water?', 1),
(2, 'Which planet is known as the Red Planet?', 1),
(3, 'What is the symbol for the element oxygen?', 1),
(4, 'How many planets are in the Solar System?', 1),
(5, 'What force keeps the planets in orbit around the sun?', 1),
(6, 'What does \"HTTP\" stand for?', 2),
(7, 'Who is known as the father of the computer?', 2),
(8, 'In what year was the first iPhone released?', 2),
(9, 'What is the name of the world\'s first programmable computer?', 2),
(10, 'Which programming language is known for its use in AI development?', 2),
(11, 'In which year did the Second World War end?', 3),
(12, 'Who was the first President of the United States?', 3),
(13, 'Which empire was known as the \"Land of the Rising Sun\"?', 3),
(14, 'Who was the Egyptian queen famous for her beauty and her role in the Roman political battles?', 3),
(15, 'What was the name of the ship that sank after hitting an iceberg on its maiden voyage in 1912?', 3),
(16, 'How many players are on a soccer team?', 4),
(17, 'In which year were the first modern Olympic Games held?', 4),
(18, 'Which country won the FIFA World Cup in 2014?', 4),
(19, 'What is the highest score possible in 10 pin bowling?', 4),
(20, 'Which sport is known as \"the sport of kings\"?', 4);


-- --------------------------------------------------------

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
CREATE TABLE IF NOT EXISTS `score` (
  `score_id` bigint NOT NULL AUTO_INCREMENT,
  `score_value` int DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`score_id`),
  KEY `FKehlc8ejus0dovn0btojcx5rih` (`category_id`),
  KEY `FKpqss47h2fevnmkh76r14055o0` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `username`) VALUES
(1, 'hello2@gmail.com', 'Hello12345', 'Mohaiminul Islam'),
(2, 'hello12@gmail.com', 'Hello12345', 'Mohaiminul Islam1'),
(3, 'hello121@gmail.com', 'Hello12345', 'Mohaiminul Islam11');
COMMIT;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
