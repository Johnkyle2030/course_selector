-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2024 at 09:21 AM
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
-- Database: `course_selector`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_strengths`
--

CREATE TABLE `academic_strengths` (
  `id` int(11) NOT NULL,
  `strength` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cluster`
--

CREATE TABLE `cluster` (
  `cluster_id` int(11) NOT NULL,
  `cluster_name` varchar(255) NOT NULL,
  `sub1` varchar(255) DEFAULT NULL,
  `sub2` varchar(255) DEFAULT NULL,
  `sub3` varchar(255) DEFAULT NULL,
  `course_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cluster`
--

INSERT INTO `cluster` (`cluster_id`, `cluster_name`, `sub1`, `sub2`, `sub3`, `course_name`) VALUES
(100, 'cluster 1', 'mathmatics', 'biology', 'chemestry', 'bachelor of animal science '),
(101, 'cluster 1 ', 'biology ', 'chemestry', 'mathmatics', 'bachelors of medical lab '),
(103, 'custer 2', 'computer ', 'mathmatics', 'english', 'bachelors of business information technology ');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `cluster` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_name`, `cluster`) VALUES
(1, 'Bachelor of Laws (LL.B.)', 'Cluster 1 - Law and Related Fields'),
(2, 'Business Administration', 'Cluster 2 - Business and Related Fields'),
(3, 'Bachelor of Arts (Political Science)', 'Cluster 3 - Arts and Related Fields');

-- --------------------------------------------------------

--
-- Table structure for table `course_preferences`
--

CREATE TABLE `course_preferences` (
  `id` int(11) NOT NULL,
  `interest_or_hobby` varchar(255) NOT NULL,
  `course_preference` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_preferences`
--

INSERT INTO `course_preferences` (`id`, `interest_or_hobby`, `course_preference`) VALUES
(4, 'Literature', 'Bachelor of Education and Art'),
(7, 'Physical Education', 'Bachelor of Education and Art'),
(8, 'Criminology', 'Criminology/Security'),
(9, 'Art', 'Hair and Beauty'),
(10, 'Hospitality', 'Catering'),
(12, 'Physics', 'Bachelor of Science in Physics'),
(13, 'Chemistry', 'Bachelor of Science in Chemistry'),
(14, 'Environmental Science', 'Bachelor of Environmental Science'),
(15, 'Music', 'Bachelor of Arts in Music'),
(16, 'Theatre', 'Bachelor of Arts in Theatre'),
(17, 'Psychology', 'Bachelor of Science in Psychology'),
(19, 'Economics', 'Business & Economics'),
(20, 'History', 'Bachelor of Arts in History'),
(21, 'Political Science', 'Bachelor of Arts in Political Science'),
(22, 'Sociology', 'Bachelor of Arts in Sociology'),
(23, 'Philosophy', 'Bachelor of Arts in Philosophy'),
(24, 'Sports', 'Bachelor of Science in Sports Management'),
(25, 'Fashion Design', 'Bachelor of Arts in Fashion Design'),
(26, 'Graphic Design', 'Bachelor of Arts in Graphic Design'),
(27, 'Video Games', 'Bachelor of Science in Game Design and Development'),
(28, 'Astronomy', 'Bachelor of Science in Astronomy'),
(29, 'Robotics', 'Bachelor of Science in Robotics'),
(30, 'Nutrition', 'Bachelor of Science in Nutrition'),
(31, 'Journalism', 'Bachelor of Arts in Journalism'),
(33, 'Film Making', 'Bachelor of Arts in Film and Media Studies'),
(34, 'Cybersecurity', 'Bachelor of Science in Cybersecurity'),
(35, 'Dance', 'Bachelor of Fine Arts in Dance'),
(36, 'Veterinary Science', 'Bachelor of Veterinary Science'),
(37, 'Marine Biology', 'Bachelor of Science in Marine Biology'),
(38, 'Forensic Science', 'Bachelor of Science in Forensic Science'),
(39, 'Anthropology', 'Bachelor of Arts in Anthropology'),
(40, 'Archaeology', 'Bachelor of Arts in Archaeology'),
(41, 'Architecture', 'Bachelor of Architecture'),
(42, 'Urban Planning', 'Bachelor of Science in Urban Planning'),
(43, 'Public Health', 'Bachelor of Science in Public Health'),
(44, 'Nursing', 'Bachelor of Science in Nursing'),
(45, 'Dentistry', 'Bachelor of Dental Surgery'),
(46, 'Medicine', 'Doctor of Medicine'),
(47, 'Pharmacy', 'Bachelor of Pharmacy'),
(51, 'Software Development', 'Bachelor of Science in Software Development'),
(52, 'Artificial Intelligence', 'Bachelor of Science in Artificial Intelligence'),
(53, 'Data Science', 'Bachelor of Science in Data Science'),
(55, 'Sustainable Agriculture', 'Bachelor of Science in Sustainable Agriculture'),
(56, 'teaching', 'Bachelor of Arts'),
(69, 'Dancing', 'Diploma in Dancing'),
(70, 'Dancing', 'Diploma in Dancing');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `county_born` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `full_name`, `phone_number`, `email`, `password`, `dob`, `county_born`) VALUES
(5, 'John', '075647635', 'johnkiarie032@gmail.com', '$2y$10$st8h5cPWAbkWQ4LPilA/GubLhyR7IwasoS0wQA30/cYRM8OQL/WqK', '2000-09-23', 'Nakuru'),
(6, 'John', '75647635', 'j@mail.com', '$2y$10$Pu5TP5AYFBc0YdY4IAKFyuSoNsOTGbtPNrU8np6gN8DFQ5coWIzDS', '5677-04-12', 'Mn'),
(7, 'mwangi', '741234676', 'derbikbena@gmail.com', '$2y$10$e7N0Vvg.WFx.mnDOpKpqseXC7XUQyr2QIWLIfU2fN/Je2PUf.5rdi', '2002-02-10', 'nakuru'),
(8, 'shelly', '0722000000', 'shelly@gmail.com', '$2y$10$WwWB2Eh32VPeHLQNLC.gyuRqigbFC2sU1xMSIlWxJckrhJV3qaxFG', '2000-12-10', 'Mombasa'),
(9, 'Alex', '1234', 'alex@gmail.com', '$2y$10$hZunViOyd604ccaNshMu5./zKQd65BNUceAEyJFmQZmJyyB0xwfdq', '2024-04-02', 'Muranga'),
(10, 'kevo', '75647635', 'a@kvo', '$2y$10$gICNjrYeuLUUapzR/94MWesZ7OO.1zzPksIy6ZxgN1VF/o5HS9joi', '2000-09-01', 'kiambu'),
(11, 'Alice', '', 'Alice@gmail.com', '$2y$10$d3a9YwCsomynojnlVxS9B.Jtgwki6oHU8gLrhaOO3snOo9wRTSPyK', '2024-04-04', 'kiambu'),
(12, '123', 'abcd', '1@1', '$2y$10$6WWIo6YQGSmHLG5BT4HGiuRie8r51x82v2S5SNUnzJ7f8phL2q30a', '2024-04-03', 'kiambu'),
(13, 'John', '0756476352', '032@gmail.com', '$2y$10$Fwdxi60.R7oIwYE2FKEhZuRqyXRisAuSU4toZk59vwVHsoK2fVcEe', '0000-00-00', 'Muranga'),
(14, 'John', '0755647635', '1@gmail.com', '$2y$10$NssjttRiAexP/VOuZzf5kOlWR6WWVo/uUB8GJWqz7DJzpkrFQqAqa', '0000-00-00', 'Nakuru');

-- --------------------------------------------------------

--
-- Table structure for table `student_grades`
--

CREATE TABLE `student_grades` (
  `id` int(11) NOT NULL,
  `english_grade` varchar(5) DEFAULT NULL,
  `math_grade` varchar(5) DEFAULT NULL,
  `kiswahili_grade` varchar(5) DEFAULT NULL,
  `physics_grade` varchar(5) DEFAULT NULL,
  `chemistry_grade` varchar(5) DEFAULT NULL,
  `biology_grade` varchar(5) DEFAULT NULL,
  `history_grade` varchar(5) DEFAULT NULL,
  `geography_grade` varchar(5) DEFAULT NULL,
  `cre_grade` varchar(5) DEFAULT NULL,
  `submission_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `weighted_cluster_points` decimal(5,2) DEFAULT NULL,
  `cluster` varchar(255) DEFAULT NULL,
  `recommended_course` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_grades`
--

INSERT INTO `student_grades` (`id`, `english_grade`, `math_grade`, `kiswahili_grade`, `physics_grade`, `chemistry_grade`, `biology_grade`, `history_grade`, `geography_grade`, `cre_grade`, `submission_date`, `weighted_cluster_points`, `cluster`, `recommended_course`) VALUES
(4, 'A+', 'B-', 'C+', 'D', 'E', 'C-', 'A-', 'E', 'E', '2024-04-04 05:22:38', 0.00, 'Cluster 3 - Arts and Related Fields', 'Bachelor of Arts (Political Science)'),
(5, 'A+', 'B-', 'C+', 'B-', 'A', 'C-', 'D', 'C-', 'B', '2024-04-04 05:22:50', 0.00, 'Cluster 3 - Arts and Related Fields', 'Bachelor of Arts (Political Science)'),
(6, 'A+', 'B-', 'C+', 'B-', 'A', 'C-', 'D', 'C-', 'B', '2024-04-04 05:41:24', 40.99, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(7, 'A+', 'B-', 'C+', 'B-', 'A', 'C-', 'D', 'C-', 'B', '2024-04-04 05:43:18', 52.65, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(8, 'A+', 'B-', 'C+', 'B-', 'A', 'C-', 'D', 'C-', 'B', '2024-04-04 05:43:31', 52.65, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(9, 'A', 'B', 'C-', 'D', 'B', 'C', 'A', 'B+', 'B', '2024-04-04 05:50:19', 45.83, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(10, 'A', 'B', 'C-', 'D', 'B', 'C', 'A', 'B+', 'B', '2024-04-04 06:21:37', 45.83, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(11, 'A', 'B', 'C-', 'D', 'B', 'C', 'A', 'B+', 'B', '2024-04-04 06:21:52', 45.83, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(12, 'A', 'B', 'C-', 'D', 'B', 'C', 'A', 'B+', 'B', '2024-04-04 06:22:34', 45.83, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(13, 'C+', 'C', 'B-', 'C-', 'C-', 'B', 'A-', 'A', 'B+', '2024-04-04 06:24:22', 40.99, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(14, 'C+', 'C', 'B-', 'C-', 'C-', 'B', 'A-', 'A', 'B+', '2024-04-04 10:42:33', 40.99, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(15, 'C+', 'C', 'B-', 'C-', 'C-', 'B', 'A-', 'A', 'B+', '2024-04-04 11:03:59', 40.99, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(16, 'C+', 'C', 'B-', 'C-', 'C-', 'B', 'A-', 'A', 'B+', '2024-04-04 11:04:14', 40.99, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(17, 'C+', 'C', 'B-', 'C-', 'C-', 'B', 'A-', 'A', 'B+', '2024-04-04 11:05:08', 40.99, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(18, 'C+', 'C', 'B-', 'C-', 'C-', 'B', 'A-', 'A', 'B+', '2024-04-04 11:10:32', 40.99, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(19, 'C+', 'C', 'B-', 'C-', 'C-', 'B', 'A-', 'A', 'B+', '2024-04-04 11:16:40', 40.99, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(20, 'A+', 'B-', 'C-', 'D', 'C-', 'C-', 'D', 'A', 'B+', '2024-04-04 11:31:55', 45.83, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(21, 'A+', 'B-', 'C-', 'D', 'C-', 'C-', 'D', 'A', 'B+', '2024-04-04 11:38:13', 45.83, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(22, 'A', 'C', 'E', 'E', 'E', 'E', 'E', 'E', 'E', '2024-04-04 11:38:55', 36.66, 'Cluster 10 - Agriculture and Environmental Studies', 'Agriculture'),
(23, 'A', 'C', 'B-', 'A', 'E', 'B+', 'E', 'E', 'E', '2024-04-04 12:27:53', 54.22, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(24, 'A', 'C', 'B-', 'A', 'E', 'B+', 'E', 'E', 'E', '2024-04-04 14:56:24', 54.22, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(25, 'A', 'C', 'C-', 'C-', 'D', 'E', 'D', 'C-', 'E', '2024-04-05 04:37:07', 42.99, 'Cluster 4 - Medicine and Health Sciences', 'Medicine'),
(26, 'A', 'C', 'C-', 'C-', 'D', 'E', 'D', 'C-', 'E', '2024-04-05 04:47:51', 42.99, 'Cluster 4 - Medicine and Health Sciences', 'Medicine'),
(27, 'A', 'C', 'C-', 'C-', 'D', 'E', 'D', 'C-', 'E', '2024-04-05 04:51:19', 42.99, 'Cluster 4 - Medicine and Health Sciences', 'Medicine'),
(28, 'A', 'C', 'C-', 'C-', 'D', 'E', 'D', 'C-', 'E', '2024-04-06 19:21:12', 42.99, NULL, NULL),
(29, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-06 19:21:48', 57.97, NULL, 'General Studies'),
(30, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-06 19:23:25', 57.97, NULL, NULL),
(31, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-06 19:29:16', 57.97, 'Default Cluster', NULL),
(32, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-06 19:29:40', 57.97, 'Default Cluster', NULL),
(33, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-06 19:30:12', 57.97, 'Default Cluster', NULL),
(34, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-06 19:30:41', 57.97, 'Default Cluster', NULL),
(35, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-06 19:53:16', 57.97, 'Default Cluster', NULL),
(36, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-06 21:47:36', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(37, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-06 21:53:05', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(38, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-06 21:53:37', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(39, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-06 22:20:44', 57.97, 'Cluster 1 - Law and Related Fields', NULL),
(40, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-06 22:23:09', 57.97, 'Cluster 1 - Law and Related Fields', NULL),
(41, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-06 22:23:33', 57.97, 'Cluster 1 - Law and Related Fields', NULL),
(42, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 04:28:16', 57.97, 'Cluster 1 - Law and Related Fields', NULL),
(43, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 04:30:14', 57.97, 'Cluster 1 - Law and Related Fields', NULL),
(44, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 04:30:19', 57.97, 'Cluster 1 - Law and Related Fields', NULL),
(45, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 04:30:28', 57.97, 'Cluster 1 - Law and Related Fields', NULL),
(46, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 04:36:49', 57.97, 'Cluster 1 - Law and Related Fields', NULL),
(47, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 05:02:17', 57.97, 'Cluster 1 - Law and Related Fields', NULL),
(48, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 05:03:13', 57.97, 'Cluster 1 - Law and Related Fields', NULL),
(49, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 05:03:20', 57.97, 'Cluster 1 - Law and Related Fields', NULL),
(50, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 05:06:45', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(51, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 05:07:17', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(52, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 05:07:22', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(53, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 05:07:33', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(54, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 05:08:41', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(55, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 05:25:51', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(56, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 05:26:14', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(57, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 05:33:15', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(58, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 05:36:16', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(59, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 05:40:05', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(60, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 05:49:05', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(61, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 05:49:22', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(62, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 06:00:17', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(63, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 06:04:56', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(64, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 06:19:51', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(65, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 06:26:27', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(66, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 06:26:32', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(67, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 07:15:20', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(68, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 11:15:09', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(69, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 12:16:38', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(70, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 12:17:00', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(71, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 12:21:25', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(72, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 12:30:19', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(73, 'A', 'C', 'A', 'A', 'D', 'A', 'D', 'A', 'E', '2024-04-07 12:41:00', 57.97, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(74, 'A', 'C', 'B-', 'A', 'D', 'A', 'A-', 'A', 'E', '2024-04-07 12:42:09', 54.22, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(75, 'A', 'C', 'B-', 'A', 'D', 'A', 'A-', 'A', 'E', '2024-04-07 12:45:01', 54.22, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(76, 'A', 'C', 'B-', 'A', 'D', 'A', 'A-', 'A', 'E', '2024-04-07 12:47:37', 54.22, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(77, 'A', 'C', 'B-', 'A', 'D', 'A', 'A-', 'A', 'E', '2024-04-07 12:47:46', 54.22, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(78, 'A', 'C', 'B-', 'A', 'D', 'A', 'A-', 'A', 'E', '2024-04-07 12:48:12', 54.22, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(79, 'A', 'C', 'B-', 'A', 'D', 'A', 'A-', 'A', 'E', '2024-04-07 12:48:22', 54.22, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(80, 'A', 'C', 'B-', 'A', 'D', 'E', 'A', 'A', 'B', '2024-04-07 12:49:10', 54.22, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(81, 'A', 'C', 'B-', 'A', 'D', 'E', 'A', 'A', 'B', '2024-04-07 12:58:49', 54.22, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(82, 'A', 'C', 'B-', 'A', 'D', 'E', 'A', 'A', 'B', '2024-04-07 12:59:32', 54.22, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(83, 'A', 'C', 'B-', 'A', 'D', 'E', 'A', 'A', 'B', '2024-04-07 13:11:32', 54.22, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(84, 'A', 'C', 'B-', 'A', 'D', 'E', 'A', 'A', 'B', '2024-04-07 13:14:47', 54.22, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(85, 'A', 'C', 'B-', 'A', 'D', 'E', 'A', 'A', 'B', '2024-04-07 13:21:59', 54.22, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(86, 'A', 'C', 'C-', 'A', 'D', 'B', 'E', 'A', 'E', '2024-04-07 13:22:33', 51.03, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(87, 'A', 'C', 'C-', 'A', 'D', 'B', 'E', 'A', 'E', '2024-04-07 13:37:41', 51.03, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(88, 'A', 'C', 'B-', 'A', 'D', 'E', 'A', 'A', 'B', '2024-04-07 13:38:02', 54.22, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(89, 'A', 'C', 'C-', 'A', 'D', 'B', 'E', 'A', 'E', '2024-04-07 13:58:08', 51.03, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(90, 'A', 'C', 'C-', 'A', 'D', 'B', 'E', 'A', 'E', '2024-04-07 14:05:19', 51.03, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(91, 'A', 'C', 'C-', 'A', 'D', 'B', 'E', 'A', 'E', '2024-04-07 14:28:59', 51.03, 'Cluster 1 - Law and Related Fields', 'Diploma in Law'),
(92, 'A', 'C', 'C-', 'A', 'D', 'B', 'E', 'A', 'E', '2024-04-07 14:29:08', 51.03, 'Cluster 1 - Law and Related Fields', 'Diploma in Law'),
(93, 'A', 'C', 'C-', 'A', 'D', 'B', 'E', 'A', 'E', '2024-04-07 14:52:40', 51.03, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(94, 'A', 'C', 'C-', 'A', 'D', 'B', 'E', 'A', 'E', '2024-04-07 14:52:55', 51.03, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(95, 'A', 'C', 'C-', 'A', 'D', 'B', 'E', 'A', 'E', '2024-04-07 15:03:52', 51.03, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(96, 'A', 'C', 'C-', 'A', 'D', 'B', 'E', 'A', 'E', '2024-04-07 15:04:16', 51.03, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(97, 'A', 'C', 'C-', 'A', 'D', 'B', 'E', 'A', 'E', '2024-04-07 15:07:29', 51.03, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(98, 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'A', 'E', '2024-04-07 15:08:20', 0.00, NULL, NULL),
(99, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 15:09:13', 0.00, NULL, NULL),
(100, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 15:11:23', 0.00, NULL, NULL),
(101, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 15:11:36', 0.00, NULL, NULL),
(102, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 15:36:07', 0.00, NULL, NULL),
(103, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 15:36:37', 0.00, NULL, NULL),
(104, 'E', 'E', 'E', 'E', 'E', 'A', 'E', 'A', 'E', '2024-04-07 15:37:04', 0.00, NULL, NULL),
(105, 'E', 'E', 'E', 'E', 'E', 'A', 'E', 'A', 'E', '2024-04-07 15:49:18', 0.00, NULL, NULL),
(106, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 15:49:55', 0.00, NULL, NULL),
(107, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 15:56:45', 0.00, NULL, NULL),
(108, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 15:57:17', 0.00, NULL, NULL),
(109, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 16:33:12', 0.00, NULL, NULL),
(110, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 16:34:06', 0.00, NULL, NULL),
(111, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 16:40:58', 0.00, NULL, NULL),
(112, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 16:48:51', 0.00, NULL, NULL),
(113, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 16:51:51', 0.00, NULL, NULL),
(114, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 16:52:13', 0.00, NULL, NULL),
(115, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 16:52:34', 0.00, NULL, NULL),
(116, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 16:52:47', 0.00, NULL, NULL),
(117, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 16:53:07', 0.00, NULL, NULL),
(118, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 16:53:32', 0.00, NULL, NULL),
(119, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 16:53:53', 0.00, NULL, NULL),
(120, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 16:54:09', 0.00, NULL, NULL),
(121, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 16:54:21', 0.00, NULL, NULL),
(122, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 16:54:45', 0.00, NULL, NULL),
(123, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 16:54:59', 0.00, NULL, NULL),
(124, 'E', 'E', 'E', 'E', 'E', 'A', 'E', 'A', 'E', '2024-04-07 17:00:34', 0.00, NULL, NULL),
(125, 'E', 'E', 'E', 'E', 'E', 'A', 'E', 'A', 'E', '2024-04-07 17:40:37', 0.00, NULL, NULL),
(126, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 17:41:05', 0.00, NULL, NULL),
(127, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 19:16:48', 0.00, NULL, NULL),
(128, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 20:22:35', 0.00, NULL, NULL),
(129, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 20:38:27', 0.00, NULL, NULL),
(130, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 20:52:45', 0.00, NULL, NULL),
(131, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 20:53:16', 0.00, NULL, NULL),
(132, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 20:54:15', 0.00, NULL, NULL),
(133, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 20:54:39', 0.00, NULL, NULL),
(134, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 21:02:55', 0.00, NULL, NULL),
(135, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 21:03:12', 0.00, NULL, NULL),
(136, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-07 21:04:07', 0.00, NULL, NULL),
(137, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-08 00:42:15', 0.00, NULL, NULL),
(138, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-08 00:42:29', 0.00, NULL, NULL),
(139, 'E', 'E', 'E', 'E', 'E', 'D', 'E', 'A', 'E', '2024-04-08 00:44:01', 0.00, NULL, NULL),
(140, 'A', 'E', 'A', 'A', 'A', 'A', 'A', 'A', 'A', '2024-04-08 00:45:14', 54.99, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(141, 'A', 'E', 'A', 'A', 'A', 'A', 'A', 'A', 'A', '2024-04-08 00:45:45', 54.99, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(142, 'A', 'E', 'A', 'A', 'A', 'A', 'A', 'A', 'A', '2024-04-08 01:00:52', 54.99, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(143, 'A', 'E', 'A', 'A', 'A', 'A', 'A', 'A', 'A', '2024-04-08 01:01:19', 54.99, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(144, 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', '2024-04-08 01:02:39', 0.00, NULL, 'Diploma in Law'),
(145, 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', '2024-04-08 01:05:35', 0.00, NULL, 'Diploma in Law'),
(146, 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', '2024-04-08 01:12:49', 0.00, NULL, 'Diploma in Law'),
(147, 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', '2024-04-08 01:27:09', 0.00, NULL, 'Diploma in Law'),
(148, 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', '2024-04-08 01:27:17', 0.00, NULL, 'Diploma in Law'),
(149, 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', '2024-04-08 01:27:44', 0.00, NULL, 'Diploma in Law'),
(150, 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', '2024-04-08 01:28:20', 0.00, NULL, 'Diploma in Law'),
(151, 'A', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', '2024-04-08 02:04:02', 31.75, NULL, 'Diploma in Business Administration'),
(152, 'A', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', '2024-04-08 02:06:00', 31.75, NULL, 'Diploma in Business Entrepreneurship'),
(153, 'A', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', '2024-04-08 02:12:05', 31.75, NULL, 'Diploma in Business Administration'),
(154, 'A', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', '2024-04-08 02:20:08', 31.75, NULL, 'Diploma in Business Administration'),
(155, 'A', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', '2024-04-08 02:28:52', 31.75, NULL, 'Diploma in Business Administration'),
(156, 'A', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', '2024-04-08 02:29:37', 31.75, NULL, 'Diploma in Business Entrepreneurship'),
(157, 'A', 'A', 'A', 'B-', 'D', 'B', 'B', 'C-', 'E', '2024-04-08 02:33:11', 60.10, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(158, 'E', 'E', 'A', 'E', 'D', 'E', 'E', 'C-', 'E', '2024-04-08 02:42:33', 31.75, NULL, 'Diploma in Business Administration'),
(159, 'E', 'E', 'A', 'E', 'D', 'E', 'E', 'C-', 'E', '2024-04-08 03:25:44', 31.75, NULL, 'Diploma in Business Administration'),
(160, 'A', 'E', 'A', 'E', 'D', 'E', 'E', 'C-', 'E', '2024-04-08 03:26:01', 44.90, 'Cluster 2 - Business and Related Fields', 'Bachelor Of Business Administration'),
(161, 'A', 'E', 'A', 'E', 'D', 'E', 'E', 'C-', 'E', '2024-04-08 03:26:35', 44.90, 'Cluster 2 - Business and Related Fields', 'Bachelor Of Business Administration'),
(162, 'A', 'E', 'A', 'E', 'D', 'E', 'E', 'C-', 'E', '2024-04-08 03:37:54', 44.90, 'Cluster 2 - Business and Related Fields', 'Bachelor Of Business Administration'),
(163, 'E', 'E', 'A', 'E', 'D', 'E', 'E', 'C-', 'E', '2024-04-08 03:38:07', 31.75, NULL, 'Diploma in Electrical Engineering'),
(164, 'E', 'E', 'A', 'E', 'D', 'E', 'E', 'C-', 'E', '2024-04-08 03:39:09', 31.75, NULL, 'Diploma in Electrical Engineering'),
(165, 'A', 'A', 'A', 'A', 'A', 'A', 'E', 'A', 'E', '2024-04-08 03:39:59', 63.50, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(166, 'A', 'A', 'A', 'A', 'A', 'A', 'E', 'A', 'E', '2024-04-08 03:54:19', 63.50, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(167, 'A', 'A', 'A', 'A', 'A', 'A', 'E', 'A', 'E', '2024-04-08 03:54:19', 63.50, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(168, 'A', 'A', 'A', 'A', 'A', 'A', 'E', 'A', 'E', '2024-04-08 04:01:08', 63.50, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(169, 'A', 'A', 'A', 'A', 'A', 'A', 'E', 'A', 'E', '2024-04-08 04:01:21', 63.50, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(170, 'B', 'A', 'A', 'A', 'A', 'A', 'E', 'A', 'E', '2024-04-08 04:01:52', 60.79, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(171, 'A', 'A', 'A', 'A', 'A', 'A', 'E', 'A', 'E', '2024-04-08 04:03:39', 63.50, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(172, 'A', 'A', 'A', 'A', 'A', 'A', 'E', 'A', 'E', '2024-04-08 04:13:53', 63.50, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(173, 'A', 'E', 'E', 'E', 'C-', 'E', 'E', 'C-', 'A', '2024-04-08 07:27:42', 31.75, NULL, 'Diploma in Law'),
(174, 'C+', 'B-', 'A', 'B-', 'B', 'D', 'B', 'A', 'B', '2024-04-08 07:29:44', 51.85, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(175, 'C+', 'B-', 'A', 'B-', 'B', 'D', 'B', 'A', 'B', '2024-04-08 07:30:18', 51.85, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(176, 'C+', 'B-', 'A', 'B-', 'B', 'D', 'B', 'A', 'B', '2024-04-08 07:30:50', 51.85, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(177, 'C+', 'B-', 'A', 'B-', 'B', 'D', 'B', 'A', 'B', '2024-04-08 07:34:03', 51.85, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(178, 'C+', 'B-', 'A', 'B-', 'B', 'D', 'B', 'A', 'B', '2024-04-08 07:50:57', 51.85, 'Cluster 2 - Business and Related Fields', 'Bachelor Of Business Administration'),
(179, 'C+', 'B-', 'A', 'B-', 'B', 'D', 'B', 'A', 'B', '2024-04-08 07:55:29', 51.85, 'Cluster 2 - Business and Related Fields', 'Bachelor Of Business Administration'),
(180, 'C+', 'B-', 'A', 'B-', 'B', 'D', 'B', 'A', 'B', '2024-04-08 07:55:36', 51.85, 'Cluster 2 - Business and Related Fields', 'Bachelor Of Business Administration'),
(181, 'C+', 'E', 'E', 'E', 'B', 'D', 'E', 'D', 'B', '2024-04-08 08:05:11', 22.45, NULL, NULL),
(182, 'C+', 'E', 'E', 'E', 'B', 'D', 'E', 'D', 'A', '2024-04-08 08:19:17', 22.45, NULL, 'Diploma in Business Administration'),
(183, 'C+', 'E', 'E', 'E', 'B', 'D', 'E', 'D', 'A', '2024-04-08 08:26:50', 22.45, NULL, 'Diploma in Business Administration'),
(184, 'C+', 'E', 'E', 'E', 'B', 'D', 'E', 'D', 'A', '2024-04-08 08:26:54', 22.45, NULL, 'Diploma in Business Administration'),
(185, 'C+', 'E', 'E', 'E', 'B', 'D', 'E', 'D', 'D', '2024-04-08 08:27:30', 22.45, NULL, 'Diploma in Business Administration'),
(186, 'C+', 'E', 'E', 'E', 'B', 'D', 'E', 'D', 'D', '2024-04-08 08:37:48', 22.45, NULL, 'Diploma in Nursing'),
(187, 'C+', 'E', 'E', 'E', 'B', 'D', 'E', 'D', 'D', '2024-04-08 08:38:05', 22.45, NULL, 'Diploma in Nursing'),
(188, 'C+', 'E', 'E', 'E', 'B', 'D', 'E', 'D', 'D', '2024-04-08 08:39:30', 22.45, NULL, 'Diploma in Nursing'),
(189, 'C+', 'E', 'E', 'E', 'B', 'D', 'E', 'D', 'A', '2024-04-08 08:39:52', 22.45, NULL, 'Diploma in Nursing'),
(190, 'C+', 'E', 'E', 'E', 'B', 'D', 'E', 'D', 'A', '2024-04-08 08:41:58', 22.45, NULL, 'Diploma in Nursing'),
(191, 'C+', 'E', 'E', 'E', 'B', 'D', 'E', 'D', 'A', '2024-04-08 08:46:37', 22.45, NULL, 'Diploma in Nursing'),
(192, 'C+', 'E', 'E', 'E', 'B', 'D', 'E', 'D', 'A', '2024-04-08 11:23:17', 22.45, NULL, 'Diploma in Nursing'),
(193, 'E', 'E', 'E', 'E', 'B', 'D', 'E', 'D', 'A', '2024-04-08 11:23:53', 0.00, NULL, 'Diploma in Law'),
(194, 'A', 'A', 'B-', 'C-', 'B', 'B+', 'B', 'C-', 'A', '2024-04-08 11:39:05', 53.44, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(195, 'A', 'A', 'B-', 'C-', 'B', 'B+', 'B', 'C-', 'A', '2024-04-08 11:44:04', 53.44, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(196, 'A', 'A', 'B-', 'C-', 'B', 'B+', 'B', 'C-', 'A', '2024-04-08 11:45:37', 53.44, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(197, 'A', 'A', 'B-', 'C-', 'B', 'B+', 'B', 'C-', 'A', '2024-04-08 13:15:37', 53.44, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(198, 'A', 'A', 'B-', 'C-', 'B', 'B+', 'B', 'C-', 'A', '2024-04-08 13:28:51', 53.44, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(199, 'A', 'A', 'B-', 'C-', 'B', 'B+', 'B', 'C-', 'A', '2024-04-08 13:30:01', 53.44, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(200, 'A', 'A', 'B-', 'C-', 'B', 'B+', 'B', 'C-', 'A', '2024-04-08 13:30:18', 53.44, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(201, 'E', 'D', 'B-', 'D', 'B', 'D', 'D', 'C-', 'D', '2024-04-08 13:34:55', 30.40, NULL, ''),
(202, 'E', 'D', 'B-', 'D', 'B', 'D', 'D', 'C-', 'D', '2024-04-08 13:38:06', 30.40, NULL, ''),
(203, 'E', 'D', 'B-', 'D', 'B', 'D', 'D', 'C-', 'D', '2024-04-08 13:40:52', 30.40, NULL, NULL),
(204, 'E', 'D', 'B-', 'D', 'B', 'D', 'D', 'C-', 'D', '2024-04-08 13:42:41', 30.40, NULL, NULL),
(205, 'E', 'D', 'B-', 'D', 'B', 'D', 'D', 'C-', 'D', '2024-04-08 14:25:15', 30.40, NULL, 'Diploma in Law'),
(206, 'E', 'D', 'B-', 'D', 'B', 'D', 'D', 'C-', 'D', '2024-04-08 14:26:19', 30.40, NULL, NULL),
(207, 'E', 'D', 'B-', 'D', 'B', 'D', 'D', 'C-', 'D', '2024-04-08 14:27:25', 30.40, NULL, NULL),
(208, 'E', 'D', 'B-', 'D', 'B', 'D', 'D', 'C-', 'D', '2024-04-08 14:37:56', 30.40, NULL, NULL),
(209, 'E', 'D', 'B-', 'D', 'B', 'D', 'D', 'C-', 'D', '2024-04-08 14:38:34', 30.40, NULL, NULL),
(210, 'E', 'D', 'B-', 'D', 'B', 'D', 'D', 'C-', 'D', '2024-04-08 14:40:31', 30.40, NULL, NULL),
(211, 'E', 'D', 'B-', 'D', 'B', 'D', 'D', 'C-', 'D', '2024-04-08 14:40:39', 30.40, NULL, NULL),
(212, 'E', 'D', 'B-', 'D', 'B', 'D', 'D', 'C-', 'D', '2024-04-08 14:42:02', 30.40, NULL, NULL),
(213, 'E', 'D', 'B-', 'D', 'B', 'D', 'D', 'C-', 'D', '2024-04-08 14:42:13', 30.40, NULL, NULL),
(214, 'E', 'D', 'B-', 'D', 'B', 'D', 'D', 'C-', 'D', '2024-04-08 14:42:49', 30.40, NULL, NULL),
(215, 'E', 'D', 'B-', 'D', 'B', 'D', 'D', 'C-', 'D', '2024-04-08 14:45:22', 30.40, NULL, NULL),
(216, 'E', 'D', 'B-', 'D', 'B', 'D', 'D', 'C-', 'D', '2024-04-08 14:45:31', 30.40, NULL, NULL),
(217, 'E', 'D', 'B-', 'D', 'B', 'D', 'D', 'C-', 'D', '2024-04-08 14:46:05', 30.40, NULL, NULL),
(218, 'E', 'D', 'B-', 'D', 'B', 'D', 'D', 'C-', 'D', '2024-04-08 14:48:53', 30.40, NULL, NULL),
(219, 'E', 'D', 'B-', 'D', 'D', 'D', 'D', 'C-', 'D', '2024-04-08 14:50:12', 30.40, NULL, 'Diploma in Law'),
(220, 'E', 'D', 'B-', 'D', 'D', 'D', 'D', 'C-', 'D', '2024-04-09 02:04:20', 30.40, NULL, NULL),
(221, 'E', 'D', 'B-', 'D', 'D', 'D', 'D', 'C-', 'D', '2024-04-09 02:05:52', 30.40, NULL, NULL),
(222, 'E', 'D', 'B-', 'D', 'D', 'D', 'D', 'C-', 'D', '2024-04-09 02:06:00', 30.40, NULL, NULL),
(223, 'E', 'D', 'B-', 'D', 'D', 'D', 'D', 'C-', 'D', '2024-04-09 02:07:48', 30.40, NULL, NULL),
(224, 'E', 'D', 'B-', 'D', 'D', 'D', 'D', 'C-', 'D', '2024-04-09 02:09:24', 30.40, NULL, NULL),
(225, 'E', 'D', 'B-', 'D', 'D', 'D', 'D', 'C-', 'D', '2024-04-09 02:11:07', 30.40, NULL, NULL),
(226, 'A', 'A', 'A', 'A', 'A', 'A', 'D', 'C-', 'D', '2024-04-09 02:19:31', 63.50, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(227, 'A', 'A', 'A', 'A', 'A', 'A', 'D', 'C-', 'D', '2024-04-09 02:50:26', 63.50, 'Cluster 3 - Engineering and Technology', 'Bachelor of Electrical Engineering'),
(228, 'A', 'A', 'A', 'A', 'A', 'A', 'D', 'C-', 'D', '2024-04-09 02:50:38', 63.50, 'Cluster 3 - Engineering and Technology', 'Bachelor of Electrical Engineering'),
(229, 'A', 'A', 'A', 'A', 'A', 'A', 'D', 'C-', 'D', '2024-04-09 02:51:21', 63.50, 'Cluster 2 - Business and Related Fields', 'Bachelor Of Business Administration'),
(230, 'A', 'A', 'A', 'A', 'A', 'A', 'D', 'C-', 'D', '2024-04-09 02:51:47', 63.50, NULL, NULL),
(231, 'E', 'C', 'E', 'A', 'E', 'B', 'E', 'C-', 'E', '2024-04-09 02:53:01', 36.66, NULL, 'Diploma in Business Administration'),
(232, 'A', 'A', 'B-', 'A', 'A', 'B+', 'A', 'B+', 'A', '2024-04-09 03:03:16', 60.10, 'Cluster 6 - Computer and IT', 'Bachelor of Software Engineering'),
(233, 'A', 'A', 'B-', 'A', 'A', 'B+', 'A', 'B+', 'A', '2024-04-09 03:10:24', 60.10, 'Cluster 3 - Engineering and Technology', 'Bachelor of Mechanical Engineering'),
(234, 'D', 'A', 'B', 'A', 'A', 'C-', 'A', 'D', 'D', '2024-04-09 03:11:57', 53.44, 'Cluster 3 - Engineering and Technology', 'Bachelor of Mechanical Engineering'),
(235, 'D', 'A', 'B', 'A', 'A', 'C-', 'A', 'D', 'D', '2024-04-09 03:22:59', 53.44, NULL, NULL),
(236, 'D', 'A', 'D', 'A', 'A', 'C-', 'A', 'D', 'D', '2024-04-09 03:23:23', 48.50, NULL, NULL),
(237, 'D', 'A', 'D', 'A', 'A', 'C-', 'A', 'D', 'D', '2024-04-09 03:23:50', 48.50, 'Cluster 2 - Business and Related Fields', 'Diploma in Business Administration'),
(238, 'D', 'A', 'D', 'A', 'A', 'C-', 'A', 'D', 'D', '2024-04-09 03:29:56', 48.50, 'Cluster 3 - Engineering and Technology', 'Bachelor of Mechanical Engineering'),
(239, 'E', 'B', 'E', '', 'E', 'E', 'E', 'C-', 'E', '2024-04-09 03:30:48', 0.00, NULL, 'Diploma in Electrical  Engineering'),
(240, 'E', 'B', 'E', '', 'E', 'E', 'E', 'C-', 'E', '2024-04-09 03:32:49', 0.00, NULL, 'Diploma in Electrical  Engineering'),
(241, 'E', 'B', 'E', '', 'E', 'E', 'E', 'C-', 'E', '2024-04-09 03:41:37', 0.00, NULL, 'Diploma in Business Administration'),
(242, 'E', 'B', 'E', '', 'E', 'E', 'E', 'C-', 'E', '2024-04-09 03:45:33', 0.00, NULL, 'Diploma in Business Administration'),
(243, 'E', 'B', 'E', 'A', 'E', 'E', 'E', 'C-', 'E', '2024-04-09 04:39:41', 40.99, NULL, 'Diploma in Business Administration'),
(244, 'E', 'B', 'E', 'A', 'E', 'E', 'E', 'C-', 'E', '2024-04-09 04:41:42', 40.99, NULL, 'Diploma in Business Administration'),
(245, 'A', 'B', 'E', 'A', 'A', 'D', 'B', 'A', 'E', '2024-04-09 05:07:18', 51.85, NULL, 'Diploma in Business Administration'),
(246, 'A', 'B', 'E', 'A', 'A', 'D', 'B', 'A', 'E', '2024-04-09 05:07:29', 51.85, NULL, 'Diploma in Business Administration'),
(247, 'A', 'B', 'E', 'A', 'A', 'D', 'B', 'A', 'E', '2024-04-09 05:24:39', 51.85, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(248, 'A', 'B', 'E', 'A', 'A', 'D', 'B', 'A', 'E', '2024-04-09 05:25:39', 51.85, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(249, 'A', 'B', 'E', 'A', 'A', 'D', 'C-', 'A', 'E', '2024-04-09 05:26:06', 51.85, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(250, 'A', 'B', 'E', 'A', 'A', 'D', 'C-', 'A', 'E', '2024-04-09 05:31:12', 51.85, 'Cluster 1 - Law and Related Fields', 'Bachelor of Laws (LL.B.)'),
(251, 'A', 'B', 'E', 'A', 'A', 'D', 'C-', 'A', 'E', '2024-04-09 05:31:43', 51.85, NULL, 'Diploma in Business Administration'),
(252, 'A', 'B', 'E', 'A', 'A', 'D', 'C-', 'A', 'E', '2024-04-09 06:05:27', 51.85, NULL, 'Diploma in Software Engineering'),
(253, 'A', 'B', 'E', 'A', 'A', 'D', 'C-', 'A', 'E', '2024-04-09 06:05:53', 51.85, 'Cluster 5 - Medicine and Health Sciences', 'Bachelor of Nursing'),
(254, 'A', 'B', 'E', 'A', 'A', 'D', 'C-', 'A', 'E', '2024-04-09 06:06:44', 51.85, NULL, 'Diploma in Software Engineering'),
(255, 'A', 'B', 'E', 'A', 'A', 'D', 'C-', 'A', 'E', '2024-04-09 06:08:04', 51.85, NULL, 'Diploma in Software Engineering'),
(256, 'A', 'B', 'E', 'A', 'A', 'D', 'C-', 'A', 'E', '2024-04-09 06:08:28', 51.85, 'Cluster 11 - Arts and Performing Arts', 'Bachelor of Arts and Humanities'),
(257, 'A', 'B', 'E', 'A', 'A', 'D', 'C-', 'A', 'E', '2024-04-09 06:19:01', 51.85, 'Cluster 11 - Arts and Performing Arts', 'Bachelor of Arts and Humanities'),
(258, 'A', 'B', 'E', 'A', 'A', 'D', 'C-', 'A', 'E', '2024-04-09 06:19:24', 51.85, 'Cluster 7 - Education and Teaching', 'Bachelor of Education Arts'),
(259, 'A', 'B', 'E', 'A', 'A', 'D', 'C-', 'A', 'E', '2024-04-09 06:25:04', 51.85, 'Cluster 7 - Education and Teaching', 'Bachelor of Education Arts'),
(260, 'A', 'B', 'E', 'A', 'A', 'D', 'C-', 'A', 'E', '2024-04-09 06:42:48', 51.85, 'Cluster 12 - Hospitality and Tourism', 'Bachelor of Hospitality and Tourism'),
(261, 'A', 'B', 'E', 'A', 'A', 'D', 'C-', 'A', 'E', '2024-04-09 06:42:56', 51.85, 'Cluster 12 - Hospitality and Tourism', 'Bachelor of Hospitality and Tourism'),
(262, 'A', 'B', 'E', 'A', 'A', 'D', 'C-', 'A', 'E', '2024-04-09 10:34:07', 51.85, 'Cluster 12 - Hospitality and Tourism', NULL),
(263, 'A', 'B', 'E', 'A', 'A', 'D', 'C-', 'A', 'E', '2024-04-09 10:35:34', 51.85, 'Cluster 12 - Hospitality and Tourism', NULL),
(264, 'A', 'B', 'E', 'A', 'A', 'D', 'C-', 'A', 'E', '2024-04-09 10:38:47', 51.85, 'Cluster 12 - Hospitality and Tourism', NULL),
(265, 'A', 'B', 'E', 'A', 'A', 'D', 'C-', 'A', 'E', '2024-04-09 10:39:09', 51.85, 'Cluster 7 - Education and Teaching', NULL),
(266, 'A', 'B', 'E', 'A', 'A', 'D', 'C-', 'A', 'E', '2024-04-09 10:40:18', 51.85, 'Cluster 11 - Arts and Performing Arts', NULL),
(267, 'A', 'B', 'E', 'A', 'A', 'D', 'C-', 'A', 'E', '2024-04-09 10:41:22', 51.85, NULL, NULL),
(268, 'E', 'B', 'B-', 'A', 'B', 'C-', 'B', 'A', 'D', '2024-04-09 11:11:44', 47.62, 'Cluster 11 - Arts and Performing Arts', NULL),
(269, 'E', 'B', 'B-', 'A', 'B', 'C-', 'B', 'A', 'D', '2024-04-09 11:12:48', 47.62, 'Cluster 5 - Medicine and Health Sciences', NULL),
(270, 'E', 'D', 'B-', 'D', 'D', 'C-', 'B', 'E', 'D', '2024-04-09 11:13:38', 30.40, NULL, NULL),
(271, 'E', 'D', 'B-', 'D', 'D', 'C-', 'B', 'E', 'D', '2024-04-09 11:14:55', 30.40, NULL, NULL),
(272, 'E', 'D', 'B-', 'D', 'D', 'C-', 'B', 'E', 'D', '2024-04-09 11:17:21', 30.40, NULL, NULL),
(273, 'E', 'D', 'B-', 'D', 'D', 'C-', 'B', 'E', 'D', '2024-04-09 11:18:55', 30.40, NULL, NULL),
(274, 'E', 'D', 'B-', 'D', 'D', 'C-', 'B', 'E', 'D', '2024-04-09 11:19:54', 30.40, NULL, NULL),
(275, 'E', 'D', 'B-', 'D', 'D', 'C-', 'B', 'E', 'D', '2024-04-09 13:17:14', 30.40, NULL, NULL),
(276, 'E', 'D', 'B-', 'D', 'D', 'C-', 'B', 'E', 'D', '2024-04-10 18:24:03', 30.40, NULL, NULL),
(277, 'E', 'D', 'B-', 'D', 'D', 'C-', 'B', 'E', 'D', '2024-04-10 18:39:49', 30.40, NULL, NULL),
(278, 'E', 'D', 'B-', 'D', 'D', 'C-', 'B', 'E', 'D', '2024-04-10 18:39:57', 30.40, NULL, NULL),
(279, 'E', 'D', 'B-', 'D', 'D', 'C-', 'B', 'E', 'D', '2024-04-10 18:40:51', 30.40, NULL, NULL),
(280, 'E', 'D', 'B-', 'D', 'D', 'C-', 'B', 'E', 'D', '2024-04-10 18:41:17', 30.40, NULL, NULL),
(281, 'E', 'D', 'B-', 'D', 'D', 'C-', 'B', 'E', 'D', '2024-04-10 18:41:52', 30.40, NULL, NULL),
(282, 'E', 'D', 'B-', 'D', 'D', 'C-', 'B', 'E', 'D', '2024-04-18 13:54:34', 30.40, NULL, NULL),
(283, 'E', 'D', 'B-', 'D', 'D', 'C-', 'B', 'E', 'D', '2024-04-18 14:24:54', 30.40, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_strengths`
--
ALTER TABLE `academic_strengths`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cluster`
--
ALTER TABLE `cluster`
  ADD PRIMARY KEY (`cluster_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_preferences`
--
ALTER TABLE `course_preferences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `student_grades`
--
ALTER TABLE `student_grades`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_strengths`
--
ALTER TABLE `academic_strengths`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cluster`
--
ALTER TABLE `cluster`
  MODIFY `cluster_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `course_preferences`
--
ALTER TABLE `course_preferences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `student_grades`
--
ALTER TABLE `student_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=284;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
