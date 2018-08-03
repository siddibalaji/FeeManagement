-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2018 at 04:09 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `feemanagment_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE IF NOT EXISTS `branches` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(255) NOT NULL,
  `branch_address` varchar(255) NOT NULL,
  `branch_details` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `branch_name`, `branch_address`, `branch_details`) VALUES
(1, 'new york', '#123,white house lane', 'IT comapany');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `doj` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `fathername` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  `section` varchar(255) DEFAULT NULL,
  `totalfee` varchar(255) DEFAULT NULL,
  `advancefee` varchar(255) DEFAULT NULL,
  `balance` varchar(255) DEFAULT NULL,
  `feeremarks` varchar(400) DEFAULT NULL,
  `aboutstudent` varchar(4000) DEFAULT NULL,
  `address` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `doj`, `phone_number`, `fathername`, `gender`, `email`, `class`, `section`, `totalfee`, `advancefee`, `balance`, `feeremarks`, `aboutstudent`, `address`) VALUES
(2, NULL, NULL, NULL, NULL, 'Alex', 'male', NULL, 'CSE', 'I', NULL, 'lifetime', NULL, NULL, 'good guy', 'jextapose'),
(3, NULL, NULL, NULL, NULL, '', NULL, NULL, 'CSE', 'I', NULL, '', NULL, 'abc', '', ''),
(4, 'shivaji', 'siddesh', '2018-07-14', '9533153142', 'mahi', 'male', 'siddu.varikela9533@gmail.com', 'EEE', 'II', '10000', '1000', '90000', 'jhvdhcgfkhd', 'dfFG', 'DASFvbe'),
(9, 'shivaji', '50000', '2018-07-05', '9533153142', 'mahi', 'male', 'siddu.varikela9533@gmail.com', 'CSE', 'I', '10000', '1000', '90000', 'jhvdhcgfkhd', 'dfFG', 'DASFvbe');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
