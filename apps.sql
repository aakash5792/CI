-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2016 at 06:43 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `apps`
--

-- --------------------------------------------------------

--
-- Table structure for table `backup_master`
--

CREATE TABLE IF NOT EXISTS `backup_master` (
`backup_id` int(11) NOT NULL,
  `backup_database` varchar(25) NOT NULL,
  `backup_table` int(11) DEFAULT NULL,
  `backup_field` varchar(2000) DEFAULT NULL,
  `backup_from` int(11) DEFAULT NULL,
  `backup_to` int(11) DEFAULT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `backup_master_meta`
--

CREATE TABLE IF NOT EXISTS `backup_master_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `backup_master_meta`
--

INSERT INTO `backup_master_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'backup_id', 'Backup id', 12, 2, 1, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(2, 'backup_database', 'Backup database', 19, 1, 2, 'select distinct CONCAT(table_schema,''-'',table_schema) as options\n from information_schema.columns', '4', NULL, 1, 1, 'getoption(''backup_database'',''#backup_table'',''0'',''1'')', 'select distinct CONCAT(table_name,''-'',table_name) as options\n from information_schema.columns\nwhere table_schema=''#field_val#''', ''),
(3, 'backup_table', 'Backup table', 18, 1, 3, NULL, '4', NULL, 1, 1, 'getoption(''backup_table'',''#backup_field'',''0'',''1'')', '', NULL),
(4, 'backup_field', 'Backup field', 18, 1, 4, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(5, 'backup_from', 'Backup from', 18, 1, 5, NULL, '6', NULL, 1, 1, NULL, NULL, NULL),
(6, 'backup_to', 'Backup to', 18, 1, 6, NULL, '6', NULL, 1, 1, NULL, NULL, NULL),
(7, 'user_created_by', 'User created by', 9, 2, 7, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(8, 'user_created_date', 'User created date', NULL, 2, 8, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(9, 'user_modified_by', 'User modified by', 9, 2, 9, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(10, 'user_modified_date', 'User modified date', NULL, 2, 10, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(11, 'backup_id', 'Backup id', 12, 2, 1, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(12, 'backup_database', 'Backup database', 15, 2, 2, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(13, 'backup_table', 'Backup table', NULL, 2, 3, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(14, 'backup_field', 'Backup field', NULL, 2, 4, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(15, 'backup_from', 'Backup from', NULL, 2, 5, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(16, 'backup_to', 'Backup to', NULL, 2, 6, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(17, 'user_created_by', 'User created by', 9, 2, 7, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(18, 'user_created_date', 'User created date', NULL, 2, 8, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(19, 'user_modified_by', 'User modified by', 9, 2, 9, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(20, 'user_modified_date', 'User modified date', NULL, 2, 10, NULL, '4', NULL, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_branch`
--

CREATE TABLE IF NOT EXISTS `client_branch` (
`client_branch_id` int(11) unsigned NOT NULL,
  `client_code` varchar(300) NOT NULL,
  `client_branch_code` varchar(300) NOT NULL,
  `client_branch_name` varchar(300) NOT NULL,
  `client_branch_latitude` float NOT NULL,
  `client_branch_longitude` float NOT NULL,
  `client_branch_address` text NOT NULL,
  `client_branch_address1` text NOT NULL,
  `client_branch_accuracy` int(12) NOT NULL,
  `client_branch_radius` int(12) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client_branch`
--

INSERT INTO `client_branch` (`client_branch_id`, `client_code`, `client_branch_code`, `client_branch_name`, `client_branch_latitude`, `client_branch_longitude`, `client_branch_address`, `client_branch_address1`, `client_branch_accuracy`, `client_branch_radius`, `user_created_by`, `user_created_date`, `user_modified_by`, `user_modified_date`) VALUES
(7, 'C001', 'CB01', 'Manali Village', 19.2692, 72.8869, 'jari mari mandir Rd, Kashigaon, Mira Road East, Mira Bhayandar, Maharashtra 401107, India', '', 12280, 100, 'U002', '2016-02-07 00:00:00', '', '0000-00-00 00:00:00'),
(8, 'C001', 'CB02', 'Chikoowadi', 19.2215, 72.839, 'Jupiter Apartment, Chikoowadi, Borivali West, Mumbai, Maharashtra 400092, India', '', 12280, 100, 'U002', '2016-02-07 00:00:00', '', '0000-00-00 00:00:00'),
(9, 'C001', 'CB03', 'Shriram-wadala', 19.013, 72.8499, 'Shriram Industrial Estate, GD Ambekar Marg, Sahakar Nagar, Wadala, Mumbai, Maharashtra 400031, India', '', 12280, 100, 'U003', '2016-02-07 00:00:00', '', '0000-00-00 00:00:00'),
(10, 'C001', 'CB04', 'Antop Hill', 19.0283, 72.8698, '96, CGS Colony, Sector 7, Antop Hill, Mumbai, Maharashtra 400037, India', '', 12280, 100, 'U003', '2016-02-07 00:00:00', '', '0000-00-00 00:00:00'),
(11, 'C003', 'CB05', 'YES BANK-WADALA', 19.013, 72.8499, 'Shriram Industrial Estate, G.D.Ambekar Marg, Sahakar Nagar, Wadala, Mumbai, Maharashtra 400031, India', '', 49, 100, 'U001', '2016-02-23 00:00:00', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `client_branch_meta`
--

CREATE TABLE IF NOT EXISTS `client_branch_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_branch_meta`
--

INSERT INTO `client_branch_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'client_branch_id', 'Client branch id', 12, 1, 1, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(2, 'client_code', 'Client code', 1, 1, 2, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(3, 'client_branch_code', 'Client branch code', 1, 1, 3, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(4, 'client_branch_name', 'Client branch name', 1, 1, 4, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(6, 'client_branch_latitude', 'Client branch latitude', 1, 1, 6, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(7, 'client_branch_longitude', 'Client branch longitude', 1, 1, 7, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(8, 'client_branch_address', 'Client branch address', 1, 1, 8, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(9, 'client_branch_address1', 'Client branch address1', 1, 1, 9, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(10, 'client_branch_accuracy', 'Client branch accuracy', 1, 1, 10, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(11, 'client_branch_radius', 'Client branch radius', 1, 1, 11, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(12, 'user_created_by', 'User created by', 9, 2, 12, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(13, 'user_created_date', 'User created date', 1, 2, 13, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(14, 'user_modified_by', 'User modified by', 9, 2, 14, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(15, 'user_modified_date', 'User modified date', 1, 2, 15, NULL, '4', NULL, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_master`
--

CREATE TABLE IF NOT EXISTS `client_master` (
`client_id` int(11) unsigned NOT NULL,
  `client_code` varchar(300) NOT NULL,
  `client_name` varchar(300) NOT NULL,
  `client_Address` text NOT NULL,
  `client_country` int(12) NOT NULL,
  `client_state` int(12) NOT NULL,
  `client_city` int(12) NOT NULL,
  `client_pincode` int(12) NOT NULL,
  `client_person_nm` varchar(300) NOT NULL,
  `client_cont_no1` int(12) NOT NULL,
  `client_cont_no2` int(12) NOT NULL,
  `client_email_id` varchar(300) NOT NULL,
  `client_website` varchar(300) NOT NULL,
  `client_lat` float(18,2) NOT NULL,
  `client_long` float(18,2) NOT NULL,
  `client_google_Address` text NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_master`
--

INSERT INTO `client_master` (`client_id`, `client_code`, `client_name`, `client_Address`, `client_country`, `client_state`, `client_city`, `client_pincode`, `client_person_nm`, `client_cont_no1`, `client_cont_no2`, `client_email_id`, `client_website`, `client_lat`, `client_long`, `client_google_Address`, `user_created_by`, `user_created_date`, `user_modified_by`, `user_modified_date`) VALUES
(1, 'C001', 'HDFC', 'Client address', 0, 0, 0, 400031, 'Hdfc poc', 12334, 12345, 'hdfcpoc@hdfc.com', 'Www.hdfc.com', 0.00, 0.00, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(2, 'C002', 'PAMAC', 'Client address', 0, 0, 0, 400031, 'Pamac poc', 3141623, 314173, 'pamacpoc@pamac.com', 'Www.Pamac.com', 0.00, 0.00, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `client_master_meta`
--

CREATE TABLE IF NOT EXISTS `client_master_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_master_meta`
--

INSERT INTO `client_master_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'client_id', 'Client id', 12, 1, 1, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(2, 'client_code', 'Client code', 1, 1, 2, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(3, 'client_name', 'Client name', 1, 1, 3, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(4, 'client_Address', 'Client Address', 1, 1, 4, NULL, '12', NULL, 1, 1, NULL, NULL, NULL),
(5, 'client_country', 'Client country', 19, 1, 5, 'select CONCAT(country_id,''-'',country_name) as options from country', '3', NULL, 1, 1, NULL, NULL, NULL),
(6, 'client_state', 'Client state', 1, 1, 6, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(7, 'client_city', 'Client city', 1, 1, 7, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(8, 'client_pincode', 'Client pincode', 1, 1, 8, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(9, 'client_person_nm', 'Client person nm', 1, 1, 9, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(10, 'client_cont_no1', 'Client cont no1', 1, 1, 10, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(11, 'client_cont_no2', 'Client cont no2', 1, 1, 11, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(12, 'client_email_id', 'Client email id', 1, 1, 12, NULL, '6', NULL, 1, 1, NULL, NULL, NULL),
(13, 'client_website', 'Client website', 1, 1, 13, NULL, '6', NULL, 1, 1, NULL, NULL, NULL),
(14, 'client_lat', 'Client lat', 1, 1, 15, NULL, '6', NULL, 1, 1, NULL, NULL, NULL),
(15, 'client_long', 'Client long', 1, 1, 16, NULL, '6', NULL, 1, 1, NULL, NULL, NULL),
(16, 'client_google_Address', 'Client google Address', 1, 1, 14, NULL, '12', NULL, 1, 1, NULL, NULL, NULL),
(17, 'user_created_by', 'User created by', 9, 2, 17, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(18, 'user_created_date', 'User created date', 7, 2, 18, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(19, 'user_modified_by', 'User modified by', 9, 2, 19, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(20, 'user_modified_date', 'User modified date', 7, 2, 20, NULL, '4', NULL, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(300) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_name`, `user_created_by`, `user_created_date`, `user_modified_by`, `user_modified_date`) VALUES
(1, 'India', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(2, 'United Arab Emirates', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `country_city`
--

CREATE TABLE IF NOT EXISTS `country_city` (
`city_id` int(11) unsigned NOT NULL,
  `country_id` int(12) NOT NULL,
  `state_id` varchar(1) NOT NULL,
  `city_name` varchar(300) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `country_city_meta`
--

CREATE TABLE IF NOT EXISTS `country_city_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country_city_meta`
--

INSERT INTO `country_city_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'city_id', 'City id', 12, 1, 1, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(2, 'country_id', 'Country id', 19, 1, 2, 'select CONCAT(country_id,''-'',country_name) as options from country', '3', NULL, 1, 1, NULL, NULL, NULL),
(3, 'state_id', 'State id', 18, 1, 3, 'select CONCAT(country_id,''-'',country_name) as options from country', '3', NULL, 1, 1, '', '', ''),
(4, 'city_name', 'City name', 1, 1, 4, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(5, 'user_created_by', 'User created by', 9, 2, 5, NULL, '3', NULL, 2, 2, NULL, NULL, NULL),
(6, 'user_created_date', 'User created date', 7, 2, 6, NULL, '3', NULL, 2, 2, NULL, NULL, NULL),
(7, 'user_modified_by', 'User modified by', 9, 2, 7, NULL, '3', NULL, 2, 2, NULL, NULL, NULL),
(8, 'user_modified_date', 'User modified date', 7, 2, 8, NULL, '3', NULL, 2, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `country_meta`
--

CREATE TABLE IF NOT EXISTS `country_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country_meta`
--

INSERT INTO `country_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'country_id', 'Country id', 12, 1, 1, '', '6', NULL, 1, 1, '', '', ''),
(2, 'country_name', 'Country name', 1, 1, 2, '', '6', 'required|alpha', 1, 1, '', '', ''),
(3, 'user_created_by', 'User created by', 9, 2, 3, '', '4', NULL, 1, 1, '', '', ''),
(4, 'user_created_date', 'User created date', 7, 2, 4, '', '4', NULL, 1, 1, '', '', ''),
(5, 'user_modified_by', 'User modified by', 9, 2, 5, '', '4', NULL, 1, 1, '', '', ''),
(6, 'user_modified_date', 'User modified date', 7, 2, 6, '', '4', NULL, 1, 1, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `country_state`
--

CREATE TABLE IF NOT EXISTS `country_state` (
`state_id` int(11) unsigned NOT NULL,
  `country_id` int(12) NOT NULL,
  `zone_id` int(12) NOT NULL,
  `state_name` varchar(300) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country_state`
--

INSERT INTO `country_state` (`state_id`, `country_id`, `zone_id`, `state_name`, `user_created_by`, `user_created_date`, `user_modified_by`, `user_modified_date`) VALUES
(1, 1, 2, 'Maharashtra', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(2, 1, 2, 'Gujarat', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `country_state_meta`
--

CREATE TABLE IF NOT EXISTS `country_state_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country_state_meta`
--

INSERT INTO `country_state_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'state_id', 'State id', 12, 1, 1, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(2, 'country_id', 'Country id', 14, 1, 2, 'select CONCAT(country_id,''-'',country_name) as options from country', '3', 'required', 1, 1, '', '', ''),
(3, 'zone_id', 'Zone id', 14, 1, 3, 'select CONCAT(zone_id,''-'',zone_name) as options from country_zone', '3', '', 1, 1, '', '', ''),
(4, 'state_name', 'State name', 1, 1, 4, '', '3', 'required', 1, 1, '', '', ''),
(5, 'user_created_by', 'User created by', 9, 2, 5, '', '4', NULL, 2, 2, '', '', ''),
(6, 'user_created_date', 'User created date', 7, 2, 6, '', '4', NULL, 2, 2, '', '', ''),
(7, 'user_modified_by', 'User modified by', 9, 2, 7, '', '4', NULL, 2, 2, '', '', ''),
(9, 'user_modified_date', 'User modified date', 7, 2, 8, '', '3', NULL, 2, 2, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `country_subcenter`
--

CREATE TABLE IF NOT EXISTS `country_subcenter` (
`subcenter_id` int(11) unsigned NOT NULL,
  `country_id` int(12) NOT NULL,
  `state_id` int(12) NOT NULL,
  `city_id` int(12) NOT NULL,
  `subcenter_name` varchar(300) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `country_subcenter_meta`
--

CREATE TABLE IF NOT EXISTS `country_subcenter_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country_subcenter_meta`
--

INSERT INTO `country_subcenter_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'subcenter_id', 'Subcenter id', 12, 1, 1, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(2, 'country_id', 'Country id', 19, 1, 2, 'select CONCAT(country_id,''-'',country_name) as options from country', '4', NULL, 1, 1, NULL, NULL, NULL),
(3, 'state_id', 'State id', 1, 1, 3, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(4, 'city_id', 'City id', 1, 1, 4, NULL, '6', NULL, 1, 1, NULL, NULL, NULL),
(5, 'subcenter_name', 'Subcenter name', 1, 1, 5, NULL, '6', NULL, 1, 1, NULL, NULL, NULL),
(6, 'user_created_by', 'User created by', 9, 2, 6, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(7, 'user_created_date', 'User created date', 1, 2, 7, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(8, 'user_modified_by', 'User modified by', 9, 2, 8, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(9, 'user_modified_date', 'User modified date', 1, 2, 9, NULL, '4', NULL, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `country_zone`
--

CREATE TABLE IF NOT EXISTS `country_zone` (
`zone_id` int(11) NOT NULL,
  `zone_name` varchar(300) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` varchar(300) NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` varchar(300) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country_zone`
--

INSERT INTO `country_zone` (`zone_id`, `zone_name`, `user_created_by`, `user_created_date`, `user_modified_by`, `user_modified_date`) VALUES
(1, 'East', '', '', '', ''),
(2, 'West', '', '', '', ''),
(3, 'South', '', '', '', ''),
(4, 'North', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `country_zone_meta`
--

CREATE TABLE IF NOT EXISTS `country_zone_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country_zone_meta`
--

INSERT INTO `country_zone_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'zone_id', 'Zone id', 12, 1, 1, '', '6', NULL, 1, 1, '', '', ''),
(2, 'zone_name', 'Zone name', 1, 1, 2, '', '6', '', 1, 1, '', '', ''),
(3, 'user_created_by', 'User created by', 9, 2, 3, '', '4', NULL, 2, 2, '', '', ''),
(4, 'user_created_date', 'User created date', 1, 2, 4, '', '4', NULL, 2, 2, '', '', ''),
(5, 'user_modified_by', 'User modified by', 9, 2, 5, '', '4', NULL, 2, 2, '', '', ''),
(6, 'user_modified_date', 'User modified date', 1, 2, 6, '', '4', NULL, 2, 2, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `emp`
--

CREATE TABLE IF NOT EXISTS `emp` (
`emp_id` int(11) unsigned NOT NULL,
  `emp_code` varchar(30) NOT NULL,
  `emp_first_name` varchar(300) NOT NULL,
  `emp_last_name` varchar(300) NOT NULL,
  `emp_dob` date NOT NULL,
  `emp_doj` date NOT NULL,
  `emp_dol` date NOT NULL,
  `emp_resi_address` varchar(300) NOT NULL,
  `emp_dept_id` varchar(300) NOT NULL,
  `emp_design_id` varchar(300) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emp_dept`
--

CREATE TABLE IF NOT EXISTS `emp_dept` (
`dept_id` int(11) unsigned NOT NULL,
  `dept_name` varchar(300) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emp_dept_meta`
--

CREATE TABLE IF NOT EXISTS `emp_dept_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_dept_meta`
--

INSERT INTO `emp_dept_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'dept_id', 'Dept id', 12, 1, 1, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(2, 'dept_name', 'Dept name', 1, 1, 2, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(3, 'user_created_by', 'User created by', 9, 1, 3, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(4, 'user_created_date', 'User created date', NULL, 1, 4, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(5, 'user_modified_by', 'User modified by', 9, 1, 5, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(6, 'user_modified_date', 'User modified date', NULL, 1, 6, NULL, '4', NULL, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `emp_design`
--

CREATE TABLE IF NOT EXISTS `emp_design` (
`design_id` int(11) unsigned NOT NULL,
  `dept_id` int(12) NOT NULL,
  `design_name` varchar(300) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emp_design_meta`
--

CREATE TABLE IF NOT EXISTS `emp_design_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_design_meta`
--

INSERT INTO `emp_design_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'design_id', 'Design id', 12, 1, 1, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(2, 'dept_id', 'Dept id', 14, 1, 2, '', '4', NULL, 1, 1, '', '', ''),
(3, 'design_name', 'Design name', 1, 1, 3, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(4, 'user_created_by', 'User created by', 9, 2, 4, '', '4', NULL, 2, 2, '', '', ''),
(5, 'user_created_date', 'User created date', 7, 2, 5, '', '4', NULL, 2, 2, '', '', ''),
(6, 'user_modified_by', 'User modified by', 9, 2, 6, '', '4', NULL, 2, 2, '', '', ''),
(7, 'user_modified_date', 'User modified date', 7, 2, 7, '', '4', NULL, 2, 2, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `emp_meta`
--

CREATE TABLE IF NOT EXISTS `emp_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_meta`
--

INSERT INTO `emp_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'emp_id', 'Emp id', 12, 1, 1, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(2, 'emp_code', 'Emp code', 17, 1, 2, '', '4', NULL, 1, 1, '', '', ''),
(3, 'emp_first_name', 'Emp first name', 1, 1, 3, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(4, 'emp_last_name', 'Emp last name', 1, 1, 4, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(5, 'emp_dob', 'Emp dob', 6, 1, 5, '', '4', 'required', 1, 1, '', '', ''),
(6, 'emp_doj', 'Emp doj', 6, 1, 6, '', '4', '', 1, 1, '', '', ''),
(7, 'emp_dol', 'Emp dol', 6, 1, 7, '', '4', '', 1, 1, '', '', ''),
(8, 'emp_resi_address', 'Emp resi address', 1, 1, 8, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(9, 'emp_dept_id', 'Emp dept id', 1, 1, 9, '', '4', '', 1, 1, '', '', ''),
(10, 'emp_design_id', 'Emp design id', 1, 1, 10, '', '4', '|', 1, 1, '', '', ''),
(11, 'user_created_by', 'User created by', 9, 2, 11, '', '4', NULL, 2, 2, '', '', ''),
(12, 'user_created_date', 'User created date', 7, 2, 12, '', '4', NULL, 2, 2, '', '', ''),
(13, 'user_modified_by', 'User modified by', 9, 2, 13, '', '4', NULL, 2, 2, '', '', ''),
(14, 'user_modified_date', 'User modified date', 7, 2, 14, '', '4', NULL, 2, 2, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `field_master`
--

CREATE TABLE IF NOT EXISTS `field_master` (
`field_id` int(11) NOT NULL,
  `field_type` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `constraint` varchar(100) NOT NULL,
  `unsigned` tinyint(1) NOT NULL,
  `auto_increment` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `field_master`
--

INSERT INTO `field_master` (`field_id`, `field_type`, `type`, `constraint`, `unsigned`, `auto_increment`) VALUES
(1, 'text', 'varchar', '300', 0, 0),
(2, 'textarea', 'text', '', 0, 0),
(3, 'select', 'varchar', '500', 0, 0),
(4, 'radio', 'varchar', '350', 0, 0),
(5, 'checkbox', 'text', '400', 0, 0),
(6, 'date', 'date', '', 0, 0),
(7, 'datetime', 'datetime', '', 0, 0),
(8, 'time', 'time', '', 0, 0),
(9, 'readonly', 'varchar', '250', 0, 0),
(10, 'file', 'varchar', '200', 0, 0),
(11, 'multiselect', 'varchar', '600', 0, 0),
(12, 'primary key', 'int', '11', 0, 0),
(13, 'decimal number', 'float', '18,2', 0, 0),
(14, 'number', 'int', '12', 0, 0),
(15, 'select', 'varchar', '800', 0, 0),
(16, 'Fix Value', 'varchar', '50', 0, 0),
(17, 'Auto Code', 'varchar', '30', 0, 0),
(18, 'select', 'varchar', '100', 0, 0),
(19, 'select query option 2', 'varchar', '25', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE IF NOT EXISTS `file` (
`file_id` int(11) unsigned NOT NULL,
  `file_path` varchar(300) NOT NULL,
  `no_file` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `file_meta`
--

CREATE TABLE IF NOT EXISTS `file_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `file_meta`
--

INSERT INTO `file_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'file_id', 'File id', 12, 1, 1, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(2, 'file_path', 'File path', 1, 1, 2, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(3, 'no_file', 'No file', 1, 1, 3, NULL, '4', NULL, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `form`
--

CREATE TABLE IF NOT EXISTS `form` (
  `form_id` int(11) NOT NULL,
  `form_name` varchar(300) NOT NULL,
  `form_table_name` varchar(300) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` datetime NOT NULL,
  `form_module` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `form_edit`
--

CREATE TABLE IF NOT EXISTS `form_edit` (
`form_edit_id` int(11) NOT NULL,
  `meta_id` varchar(250) NOT NULL,
  `field_name` varchar(300) NOT NULL,
  `field_label` varchar(300) NOT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL,
  `meta_tables` varchar(100) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=418 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `form_edit`
--

INSERT INTO `form_edit` (`form_edit_id`, `meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`, `meta_tables`, `user_created_by`, `user_created_date`, `user_modified_by`, `user_modified_date`) VALUES
(1, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(2, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(3, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required|alpha', 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-02-27 02:22:55', 'U001', '2016-02-27 02:22:55'),
(4, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required|alpha', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(5, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required|alpha', 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-02-27 02:23:33', 'U001', '2016-02-27 02:23:33'),
(6, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(7, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required', 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-02-27 02:25:10', 'U001', '2016-02-27 02:25:10'),
(8, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(9, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required|alpha', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(10, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required|alpha', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(11, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required|alpha', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(12, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required|alpha', 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-02-27 02:33:31', 'U001', '2016-02-27 02:33:31'),
(13, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(14, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required', 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-02-27 02:34:06', 'U001', '2016-02-27 02:34:06'),
(15, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required|alpha', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(16, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required|alpha', 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-02-27 02:35:32', 'U001', '2016-02-27 02:35:32'),
(17, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required|alpha', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(18, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required|alpha', 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-02-27 02:36:17', 'U001', '2016-02-27 02:36:17'),
(19, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(20, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(21, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(22, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(23, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(24, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(25, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(27, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(28, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(29, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required', 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-02-27 02:45:47', 'U001', '2016-02-27 02:45:47'),
(30, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required|alpha', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(31, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required|alpha', 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-02-27 02:46:50', 'U001', '2016-02-27 02:46:50'),
(32, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(33, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required', 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-02-27 02:49:22', 'U001', '2016-02-27 02:49:22'),
(34, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required|alpha', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(35, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required|alpha', 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-02-27 02:51:17', 'U001', '2016-02-27 02:51:17'),
(36, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required|alpha', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(37, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required|alpha', 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-02-27 02:52:22', 'U001', '2016-02-27 02:52:22'),
(38, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(39, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required', 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-02-27 02:53:22', 'U001', '2016-02-27 02:53:22'),
(40, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required|alpha', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(41, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required|alpha', 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-02-27 02:53:53', 'U001', '2016-02-27 02:53:53'),
(42, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required|alpha', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(43, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required|alpha', 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-02-27 02:55:49', 'U001', '2016-02-27 02:55:49'),
(44, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required|alpha', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(45, '2', 'country_id', 'Country id', 0, 1, 2, '', '4', NULL, 1, 1, '', '', '', 'city_meta', 'U001', '2016-02-27 03:22:11', 'U001', '2016-02-27 03:22:11'),
(46, '2', 'country_name', 'Country name', 1, 1, 2, '', '4', NULL, 1, 1, '', '', '', 'country_meta', 'U001', '2016-02-27 03:27:14', 'U001', '2016-02-27 03:27:14'),
(47, '2', 'country_name', 'Country name', 1, 1, 2, '', '4', 'required|alpha', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(48, '2', 'country_name', 'Country name', 1, 1, 2, '', '4', '|', 1, 1, '', '', '', 'country_meta', 'U001', '2016-02-27 03:27:37', 'U001', '2016-02-27 03:27:37'),
(49, '3', 'user_created_by', 'User created by', 1, 1, 3, '', '4', NULL, 1, 1, '', '', '', 'country_meta', 'U001', '2016-02-27 03:28:21', 'U001', '2016-02-27 03:28:21'),
(50, '3', 'user_created_by', 'User created by', 1, 2, 3, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(51, '5', 'user_modified_by', 'User modified by', 1, 1, 5, '', '4', NULL, 1, 1, '', '', '', 'country_meta', 'U001', '2016-02-27 03:28:30', 'U001', '2016-02-27 03:28:30'),
(52, '5', 'user_modified_by', 'User modified by', 1, 2, 5, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(53, '4', 'user_created_date', 'User created date', 1, 1, 4, '', '4', NULL, 1, 1, '', '', '', 'country_meta', 'U001', '2016-02-27 03:28:40', 'U001', '2016-02-27 03:28:40'),
(54, '4', 'user_created_date', 'User created date', 1, 2, 4, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(55, '6', 'user_modified_date', 'User modified date', 1, 1, 6, '', '4', NULL, 1, 1, '', '', '', 'country_meta', 'U001', '2016-02-27 03:28:48', 'U001', '2016-02-27 03:28:48'),
(56, '6', 'user_modified_date', 'User modified date', 1, 2, 6, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(57, '1', 'country_id', 'Country id', 12, 1, 1, '', '4', NULL, 1, 1, '', '', '', 'country_meta', 'U001', '2016-02-27 03:30:18', 'U001', '2016-02-27 03:30:18'),
(58, '1', 'country_id', 'Country id', 12, 1, 1, '', '6', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(59, '2', 'country_name', 'Country name', 1, 1, 2, '', '4', '|', 1, 1, '', '', '', 'country_meta', 'U001', '2016-02-27 03:30:29', 'U001', '2016-02-27 03:30:29'),
(60, '2', 'country_name', 'Country name', 1, 1, 2, '', '6', '|', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(61, '6', 'user_modified_date', 'User modified date', 0, 1, 6, '', '4', NULL, 1, 1, '', '', '', 'country_meta', 'U001', '2016-02-27 03:34:25', 'U001', '2016-02-27 03:34:25'),
(62, '6', 'user_modified_date', 'User modified date', 7, 1, 6, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(63, '6', 'user_modified_date', 'User modified date', 7, 1, 6, '', '4', NULL, 1, 1, '', '', '', 'country_meta', 'U001', '2016-02-27 03:34:45', 'U001', '2016-02-27 03:34:45'),
(64, '4', 'user_created_date', 'User created date', 0, 1, 4, '', '4', NULL, 1, 1, '', '', '', 'country_meta', 'U001', '2016-02-27 03:34:51', 'U001', '2016-02-27 03:34:51'),
(65, '4', 'user_created_date', 'User created date', 7, 1, 4, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(66, '6', 'user_modified_date', 'User modified date', 7, 1, 6, '', '4', NULL, 1, 1, '', '', '', 'country_meta', 'U001', '2016-02-27 03:36:25', 'U001', '2016-02-27 03:36:25'),
(67, '2', 'country_name', 'Country name', 1, 1, 2, '', '4', NULL, 1, 1, '', '', '', 'country_meta', 'U001', '2016-02-27 03:38:41', 'U001', '2016-02-27 03:38:41'),
(68, '2', 'country_name', 'Country name', 1, 1, 2, '', '4', 'required|alpha', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(69, '2', 'country_id', 'Country id', 0, 1, 2, '', '4', NULL, 1, 1, '', '', '', 'country_state_meta', 'U001', '2016-02-27 03:53:31', 'U001', '2016-02-27 03:53:31'),
(70, '2', 'country_id', 'Country id', 15, 1, 2, 'select CONCAT(country_id,''-'',country_name) as options from country', '4', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(71, '3', 'zone_id', 'Zone id', 0, 1, 3, '', '4', NULL, 1, 1, '', '', '', 'country_state_meta', 'U001', '2016-02-27 03:55:11', 'U001', '2016-02-27 03:55:11'),
(72, '3', 'zone_id', 'Zone id', 15, 1, 3, 'select CONCAT(zone_id,''-'',zone_name) as options from zone', '4', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(73, '4', 'state_name', 'State name', 1, 1, 4, '', '4', NULL, 1, 1, '', '', '', 'country_state_meta', 'U001', '2016-02-27 03:57:07', 'U001', '2016-02-27 03:57:07'),
(74, '4', 'state_name', 'State name', 1, 1, 4, '', '4', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(75, '6', 'user_created_date', 'User created date', 0, 1, 6, '', '4', NULL, 1, 1, '', '', '', 'country_state_meta', 'U001', '2016-02-27 03:57:51', 'U001', '2016-02-27 03:57:51'),
(76, '6', 'user_created_date', 'User created date', 7, 1, 6, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(77, '3', 'zone_id', 'Zone id', 15, 1, 3, 'select CONCAT(zone_id,''-'',zone_name) as options from zone', '4', NULL, 1, 1, '', '', '', 'country_state_meta', 'U001', '2016-02-27 03:58:49', 'U001', '2016-02-27 03:58:49'),
(78, '3', 'zone_id', 'Zone id', 15, 1, 3, 'select CONCAT(zone_id,''-'',zone_name) as options from zone', '4', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(79, '4', 'state_name', 'State name', 1, 1, 4, '', '4', NULL, 1, 1, '', '', '', 'country_state_meta', 'U001', '2016-02-27 03:58:57', 'U001', '2016-02-27 03:58:57'),
(80, '4', 'state_name', 'State name', 1, 1, 4, '', '4', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(81, '4', 'state_name', 'State name', 1, 1, 4, '', '4', NULL, 1, 1, '', '', '', 'country_state_meta', 'U001', '2016-02-27 03:59:31', 'U001', '2016-02-27 03:59:31'),
(82, '4', 'state_name', 'State name', 1, 1, 4, '', '4', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(83, '4', 'state_name', 'State name', 1, 1, 4, '', '4', '', 1, 1, '', '', '', 'country_state_meta', 'U001', '2016-02-27 03:59:38', 'U001', '2016-02-27 03:59:38'),
(84, '3', 'zone_id', 'Zone id', 15, 1, 3, 'select CONCAT(zone_id,''-'',zone_name) as options from zone', '4', 'required', 1, 1, '', '', '', 'country_state_meta', 'U001', '2016-02-27 04:00:19', 'U001', '2016-02-27 04:00:19'),
(85, '3', 'zone_id', 'Zone id', 19, 1, 3, 'select CONCAT(zone_id,''-'',zone_name) as options from zone', '4', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(86, '2', 'country_id', 'Country id', 15, 1, 2, 'select CONCAT(country_id,''-'',country_name) as options from country', '4', '', 1, 1, '', '', '', 'country_state_meta', 'U001', '2016-02-27 04:01:46', 'U001', '2016-02-27 04:01:46'),
(87, '2', 'country_id', 'Country id', 19, 1, 2, 'select CONCAT(country_id,''-'',country_name) as options from country', '4', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(88, '2', 'country_id', 'Country id', 19, 1, 2, 'select CONCAT(country_id,''-'',country_name) as options from country', '4', NULL, 1, 1, '', '', '', 'country_state_meta', 'U001', '2016-02-27 04:02:12', 'U001', '2016-02-27 04:02:12'),
(89, '2', 'country_id', 'Country id', 14, 1, 2, 'select CONCAT(country_id,''-'',country_name) as options from country', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(90, '3', 'zone_id', 'Zone id', 19, 1, 3, 'select CONCAT(zone_id,''-'',zone_name) as options from zone', '4', '', 1, 1, '', '', '', 'country_state_meta', 'U001', '2016-02-27 04:02:35', 'U001', '2016-02-27 04:02:35'),
(91, '3', 'zone_id', 'Zone id', 14, 1, 3, 'select CONCAT(zone_id,''-'',zone_name) as options from zone', '4', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(92, '3', 'user_created_by', 'User created by', 9, 1, 3, '', '4', NULL, 1, 1, '', '', '', 'country_meta', 'U001', '2016-02-27 05:06:28', 'U001', '2016-02-27 05:06:28'),
(93, '3', 'user_created_by', 'User created by', 9, 2, 3, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(94, '4', 'user_created_date', 'User created date', 7, 1, 4, '', '4', NULL, 1, 1, '', '', '', 'country_meta', 'U001', '2016-02-27 05:06:38', 'U001', '2016-02-27 05:06:38'),
(95, '4', 'user_created_date', 'User created date', 7, 2, 4, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(96, '5', 'user_modified_by', 'User modified by', 9, 1, 5, '', '4', NULL, 1, 1, '', '', '', 'country_meta', 'U001', '2016-02-27 05:06:44', 'U001', '2016-02-27 05:06:44'),
(97, '5', 'user_modified_by', 'User modified by', 9, 2, 5, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(98, '6', 'user_modified_date', 'User modified date', 7, 1, 6, '', '4', NULL, 1, 1, '', '', '', 'country_meta', 'U001', '2016-02-27 05:06:51', 'U001', '2016-02-27 05:06:51'),
(99, '6', 'user_modified_date', 'User modified date', 7, 2, 6, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(100, '2', 'country_name', 'Country name', 1, 1, 2, '', '4', 'required|alpha', 1, 1, '', '', '', 'country_meta', 'U001', '2016-02-27 05:07:22', 'U001', '2016-02-27 05:07:22'),
(101, '2', 'country_name', 'Country name', 1, 1, 2, '', '6', 'required|alpha', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(102, '1', 'country_id', 'Country id', 12, 1, 1, '', '4', NULL, 1, 1, '', '', '', 'country_meta', 'U001', '2016-02-27 05:07:30', 'U001', '2016-02-27 05:07:30'),
(103, '1', 'country_id', 'Country id', 12, 1, 1, '', '6', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(104, '4', 'menu_sub_category_url', 'Menu sub category url', 1, 1, 4, '', '4', NULL, 1, 1, '', '', '', 'menu_sub_category_meta', 'U001', '2016-02-27 05:09:23', 'U001', '2016-02-27 05:09:23'),
(105, '4', 'menu_sub_category_url', 'Menu sub category url', 1, 1, 4, '', '12', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(106, '6', 'page_form_name', 'Page form name', 1, 1, 6, '', '4', NULL, 1, 1, '', '', '', 'menu_sub_category_meta', 'U001', '2016-02-27 05:09:41', 'U001', '2016-02-27 05:09:41'),
(107, '6', 'page_form_name', 'Page form name', 1, 1, 6, '', '3', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(108, '6', 'page_form_name', 'Page form name', 1, 1, 6, '', '3', NULL, 1, 1, '', '', '', 'menu_sub_category_meta', 'U001', '2016-02-27 05:09:56', 'U001', '2016-02-27 05:09:56'),
(109, '7', 'page_list_name', 'Page list name', 1, 1, 7, '', '4', NULL, 1, 1, '', '', '', 'menu_sub_category_meta', 'U001', '2016-02-27 05:10:02', 'U001', '2016-02-27 05:10:02'),
(110, '7', 'page_list_name', 'Page list name', 1, 1, 7, '', '3', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(111, '8', 'page_breadcrumb', 'Page breadcrumb', 1, 1, 8, '', '4', NULL, 1, 1, '', '', '', 'menu_sub_category_meta', 'U001', '2016-02-27 05:10:12', 'U001', '2016-02-27 05:10:12'),
(112, '8', 'page_breadcrumb', 'Page breadcrumb', 1, 1, 8, '', '3', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(113, '5', 'menu_sub_category_seq', 'Menu sub category seq', 1, 1, 5, '', '4', NULL, 1, 1, '', '', '', 'menu_sub_category_meta', 'U001', '2016-02-27 05:10:24', 'U001', '2016-02-27 05:10:24'),
(114, '5', 'menu_sub_category_seq', 'Menu sub category seq', 1, 1, 5, '', '3', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(115, '2', 'menu_category_id', 'Menu category id', 15, 1, 2, 'select CONCAT(menu_category_id,''-'',menu_category_name) as options from menu_category', '4', NULL, 1, 1, '', '', '', 'menu_sub_category_meta', 'U001', '2016-02-27 05:11:57', 'U001', '2016-02-27 05:11:57'),
(116, '2', 'menu_category_id', 'Menu category id', 15, 1, 2, 'select CONCAT(menu_category_id,''-'',menu_category_name) as options from menu_category', '4', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(117, '3', 'menu_sub_category_name', 'Menu sub category name', 1, 1, 3, '', '4', NULL, 1, 1, '', '', '', 'menu_sub_category_meta', 'U001', '2016-02-27 05:12:15', 'U001', '2016-02-27 05:12:15'),
(118, '3', 'menu_sub_category_name', 'Menu sub category name', 1, 1, 3, '', '4', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(119, '3', 'menu_sub_category_name', 'Menu sub category name', 1, 1, 3, '', '4', NULL, 1, 1, '', '', '', 'menu_sub_category_meta', 'U001', '2016-02-27 05:12:24', 'U001', '2016-02-27 05:12:24'),
(120, '3', 'menu_sub_category_name', 'Menu sub category name', 1, 1, 3, '', '4', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(121, '3', 'menu_sub_category_name', 'Menu sub category name', 1, 1, 3, '', '4', NULL, 1, 1, '', '', '', 'menu_sub_category_meta', 'U001', '2016-02-27 05:12:59', 'U001', '2016-02-27 05:12:59'),
(122, '3', 'menu_sub_category_name', 'Menu sub category name', 1, 1, 3, '', '4', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(123, '4', 'menu_sub_category_url', 'Menu sub category url', 1, 1, 4, '', '12', NULL, 1, 1, '', '', '', 'menu_sub_category_meta', 'U001', '2016-02-27 05:13:11', 'U001', '2016-02-27 05:13:11'),
(124, '4', 'menu_sub_category_url', 'Menu sub category url', 1, 1, 4, '', '12', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(125, '5', 'menu_sub_category_seq', 'Menu sub category seq', 1, 1, 5, '', '3', NULL, 1, 1, '', '', '', 'menu_sub_category_meta', 'U001', '2016-02-27 05:13:22', 'U001', '2016-02-27 05:13:22'),
(126, '5', 'menu_sub_category_seq', 'Menu sub category seq', 1, 1, 5, '', '3', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(127, '4', 'menu_sub_category_url', 'Menu sub category url', 1, 1, 4, '', '12', NULL, 1, 1, '', '', '', 'menu_sub_category_meta', 'U001', '2016-02-27 05:13:31', 'U001', '2016-02-27 05:13:31'),
(128, '4', 'menu_sub_category_url', 'Menu sub category url', 1, 1, 4, '', '12', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(129, '4', 'menu_sub_category_url', 'Menu sub category url', 1, 1, 4, '', '12', NULL, 1, 1, '', '', '', 'menu_sub_category_meta', 'U001', '2016-02-27 05:13:42', 'U001', '2016-02-27 05:13:42'),
(130, '4', 'menu_sub_category_url', 'Menu sub category url', 1, 1, 4, '', '12', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(131, '4', 'menu_sub_category_url', 'Menu sub category url', 1, 1, 4, '', '12', NULL, 1, 1, '', '', '', 'menu_sub_category_meta', 'U001', '2016-02-27 05:13:53', 'U001', '2016-02-27 05:13:53'),
(132, '6', 'page_form_name', 'Page form name', 1, 1, 6, '', '3', NULL, 1, 1, '', '', '', 'menu_sub_category_meta', 'U001', '2016-02-27 05:14:02', 'U001', '2016-02-27 05:14:02'),
(133, '6', 'page_form_name', 'Page form name', 1, 1, 6, '', '3', NULL, 1, 1, '', '', '', 'menu_sub_category_meta', 'U001', '2016-02-27 05:14:03', 'U001', '2016-02-27 05:14:03'),
(134, '6', 'page_form_name', 'Page form name', 1, 1, 6, '', '3', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(135, '5', 'menu_sub_category_seq', 'Menu sub category seq', 1, 1, 5, '', '3', NULL, 1, 1, '', '', '', 'menu_sub_category_meta', 'U001', '2016-02-27 05:14:14', 'U001', '2016-02-27 05:14:14'),
(136, '5', 'menu_sub_category_seq', 'Menu sub category seq', 1, 1, 5, '', '3', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(137, '7', 'page_list_name', 'Page list name', 1, 1, 7, '', '3', NULL, 1, 1, '', '', '', 'menu_sub_category_meta', 'U001', '2016-02-27 05:14:32', 'U001', '2016-02-27 05:14:32'),
(138, '7', 'page_list_name', 'Page list name', 1, 1, 7, '', '3', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(139, '10', 'user_created_date', 'User created date', 0, 2, 10, '', '4', NULL, 1, 1, '', '', '', 'menu_sub_category_meta', 'U001', '2016-02-27 05:14:44', 'U001', '2016-02-27 05:14:44'),
(140, '10', 'user_created_date', 'User created date', 7, 2, 10, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(141, '3', 'menu_sub_category_name', 'Menu sub category name', 1, 1, 3, '', '4', '', 1, 1, '', '', '', 'menu_sub_category_meta', 'U001', '2016-02-27 05:15:06', 'U001', '2016-02-27 05:15:06'),
(142, '4', 'menu_sub_category_url', 'Menu sub category url', 1, 1, 4, '', '12', NULL, 1, 1, '', '', '', 'menu_sub_category_meta', 'U001', '2016-02-27 05:15:41', 'U001', '2016-02-27 05:15:41'),
(143, '4', 'menu_sub_category_url', 'Menu sub category url', 1, 1, 4, '', '12', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(144, '2', 'emp_code', 'Emp code', 0, 1, 2, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 11:49:01', 'U001', '2016-02-29 11:49:01'),
(145, '5', 'emp_dob', 'Emp dob', 0, 1, 5, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 11:49:21', 'U001', '2016-02-29 11:49:21'),
(146, '5', 'emp_dob', 'Emp dob', 0, 1, 5, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 11:53:03', 'U001', '2016-02-29 11:53:03'),
(147, '5', 'emp_dob', 'Emp dob', 7, 1, 5, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(148, '5', 'emp_dob', 'Emp dob', 7, 1, 5, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 11:54:49', 'U001', '2016-02-29 11:54:49'),
(149, '5', 'emp_dob', 'Emp dob', 6, 1, 5, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(150, '5', 'emp_dob', 'Emp dob', 6, 1, 5, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 11:55:07', 'U001', '2016-02-29 11:55:07'),
(151, '6', 'emp_doj', 'Emp doj', 0, 1, 6, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 11:55:18', 'U001', '2016-02-29 11:55:18'),
(152, '6', 'emp_doj', 'Emp doj', 6, 1, 6, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(153, '7', 'emp_dol', 'Emp dol', 0, 1, 7, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 11:55:35', 'U001', '2016-02-29 11:55:35'),
(154, '7', 'emp_dol', 'Emp dol', 6, 1, 7, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(155, '5', 'emp_dob', 'Emp dob', 6, 1, 5, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 11:55:53', 'U001', '2016-02-29 11:55:53'),
(156, '5', 'emp_dob', 'Emp dob', 6, 1, 5, '', '4', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(157, '6', 'emp_doj', 'Emp doj', 6, 1, 6, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 11:56:05', 'U001', '2016-02-29 11:56:05'),
(158, '6', 'emp_doj', 'Emp doj', 6, 1, 6, '', '4', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(159, '', 'user_modified_date', 'User modified date', 6, 1, 8, '', '4', NULL, 2, 2, '', '', '', 'country_state_meta', 'U001', '2016-02-29 12:45:18', 'U001', '2016-02-29 12:45:18'),
(160, '', 'user_modified_date', 'User modified date', 7, 1, 8, '', '3', NULL, 2, 2, '', '', '', 'country_state_meta', 'U001', '2016-02-29 12:49:14', 'U001', '2016-02-29 12:49:14'),
(161, '', 'page_name', 'Page name', 1, 1, 1, '', '4', 'required|alpha', 2, 1, '', '', '', 'menu_sub_category_meta', 'U001', '2016-02-29 12:52:54', 'U001', '2016-02-29 12:52:54'),
(162, '13', 'page_name', 'Page name', 1, 1, 1, '', '4', 'required|alpha', 2, 1, '', '', '', 'menu_sub_category_meta', 'U001', '2016-02-29 12:57:40', 'U001', '2016-02-29 12:57:40'),
(163, '13', 'page_name', 'Page name', 1, 1, 1, '', '4', 'required', 2, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(164, '9', 'user_modified_date', 'User modified date', 0, 1, 9, '', '4', NULL, 1, 1, '', '', '', 'user_assign_master_meta', 'U001', '2016-02-29 02:00:59', 'U001', '2016-02-29 02:00:59'),
(165, '9', 'user_modified_date', 'User modified date', 7, 2, 9, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(166, '8', 'user_modified_by', 'User modified by', 9, 1, 8, '', '4', NULL, 1, 1, '', '', '', 'user_assign_master_meta', 'U001', '2016-02-29 02:01:25', 'U001', '2016-02-29 02:01:25'),
(167, '8', 'user_modified_by', 'User modified by', 9, 2, 8, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(168, '7', 'user_created_date', 'User created date', 0, 1, 7, '', '4', NULL, 1, 1, '', '', '', 'user_assign_master_meta', 'U001', '2016-02-29 02:01:47', 'U001', '2016-02-29 02:01:47'),
(169, '7', 'user_created_date', 'User created date', 7, 2, 7, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(170, '6', 'user_created_by', 'User created by', 9, 1, 6, '', '4', NULL, 1, 1, '', '', '', 'user_assign_master_meta', 'U001', '2016-02-29 02:02:05', 'U001', '2016-02-29 02:02:05'),
(171, '6', 'user_created_by', 'User created by', 9, 2, 6, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(172, '5', 'user_role_code', 'User role code', 0, 1, 5, '', '4', NULL, 1, 1, '', '', '', 'user_assign_master_meta', 'U001', '2016-02-29 02:03:38', 'U001', '2016-02-29 02:03:38'),
(173, '5', 'user_role_code', 'User role code', 19, 1, 5, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(174, '11', 'user_role_code', 'User role code', 15, 1, 11, 'select distinct(CONCAT(role_code,''-'',role_name)) as options from user_role_master', '3', NULL, 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-02-29 02:05:55', 'U001', '2016-02-29 02:05:55'),
(175, '5', 'user_role_code', 'User role code', 19, 1, 5, '', '4', NULL, 1, 1, '', '', '', 'user_assign_master_meta', 'U001', '2016-02-29 02:06:13', 'U001', '2016-02-29 02:06:13'),
(176, '5', 'user_role_code', 'User role code', 19, 1, 5, 'select distinct(CONCAT(role_code,''-'',role_name)) as options from user_role_master', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(177, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required|alpha', 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-02-29 02:10:38', 'U001', '2016-02-29 02:10:38'),
(178, '2', 'client_code', 'Client code', 1, 1, 2, '', '4', 'required', 1, 1, '', '', '', 'user_assign_master_meta', 'U001', '2016-02-29 02:11:02', 'U001', '2016-02-29 02:11:02'),
(179, '2', 'client_code', 'Client code', 19, 1, 2, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(180, '5', 'user_role_code', 'User role code', 19, 1, 5, 'select distinct(CONCAT(role_code,''-'',role_name)) as options from user_role_master', '4', NULL, 1, 1, '', '', '', 'user_assign_master_meta', 'U001', '2016-02-29 02:12:08', 'U001', '2016-02-29 02:12:08'),
(181, '5', 'user_role_code', 'User role code', 19, 1, 5, 'select distinct(CONCAT(role_code,''-'',role_name)) as options from user_role_master', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(182, '2', 'emp_code', 'Emp code', 0, 1, 2, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 02:52:42', 'U001', '2016-02-29 02:52:42'),
(183, '2', 'emp_code', 'Emp code', 17, 1, 2, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(184, '9', 'emp_dept_id', 'Emp dept id', 0, 1, 9, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 03:00:15', 'U001', '2016-02-29 03:00:15'),
(185, '9', 'emp_dept_id', 'Emp dept id', 14, 1, 9, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(186, '10', 'emp_design_id', 'Emp design id', 0, 1, 10, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 03:00:52', 'U001', '2016-02-29 03:00:52'),
(187, '10', 'emp_design_id', 'Emp design id', 14, 1, 10, '', '4', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(188, '7', 'emp_dol', 'Emp dol', 6, 1, 7, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 03:01:10', 'U001', '2016-02-29 03:01:10'),
(189, '7', 'emp_dol', 'Emp dol', 6, 1, 7, '', '4', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(190, '6', 'emp_doj', 'Emp doj', 6, 1, 6, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 03:01:18', 'U001', '2016-02-29 03:01:18'),
(191, '6', 'emp_doj', 'Emp doj', 6, 1, 6, '', '4', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(192, '10', 'emp_design_id', 'Emp design id', 14, 1, 10, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 03:01:27', 'U001', '2016-02-29 03:01:27'),
(193, '10', 'emp_design_id', 'Emp design id', 14, 1, 10, '', '4', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(194, '10', 'emp_design_id', 'Emp design id', 14, 1, 10, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 03:01:41', 'U001', '2016-02-29 03:01:41'),
(195, '10', 'emp_design_id', 'Emp design id', 14, 1, 10, '', '4', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(196, '10', 'emp_design_id', 'Emp design id', 14, 1, 10, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 03:01:56', 'U001', '2016-02-29 03:01:56'),
(197, '10', 'emp_design_id', 'Emp design id', 14, 1, 10, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(198, '9', 'emp_dept_id', 'Emp dept id', 14, 1, 9, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 03:02:58', 'U001', '2016-02-29 03:02:58'),
(199, '9', 'emp_dept_id', 'Emp dept id', 14, 1, 9, '', '4', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(200, '5', 'emp_dob', 'Emp dob', 6, 1, 5, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 03:03:38', 'U001', '2016-02-29 03:03:38'),
(201, '5', 'emp_dob', 'Emp dob', 6, 1, 5, '', '4', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(202, '10', 'emp_design_id', 'Emp design id', 14, 1, 10, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 03:04:02', 'U001', '2016-02-29 03:04:02'),
(203, '10', 'emp_design_id', 'Emp design id', 14, 1, 10, '', '4', '|', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(204, '10', 'emp_design_id', 'Emp design id', 14, 1, 10, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 03:04:24', 'U001', '2016-02-29 03:04:24'),
(205, '10', 'emp_design_id', 'Emp design id', 14, 1, 10, '', '4', '|', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(206, '9', 'emp_dept_id', 'Emp dept id', 14, 1, 9, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 03:05:47', 'U001', '2016-02-29 03:05:47'),
(207, '9', 'emp_dept_id', 'Emp dept id', 1, 1, 9, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(208, '10', 'emp_design_id', 'Emp design id', 14, 1, 10, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 03:06:01', 'U001', '2016-02-29 03:06:01'),
(209, '10', 'emp_design_id', 'Emp design id', 1, 1, 10, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(210, '12', 'user_created_date', 'User created date', 0, 1, 12, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 03:09:21', 'U001', '2016-02-29 03:09:21'),
(211, '12', 'user_created_date', 'User created date', 7, 1, 12, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(212, '14', 'user_modified_date', 'User modified date', 0, 1, 14, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 03:09:35', 'U001', '2016-02-29 03:09:35'),
(213, '14', 'user_modified_date', 'User modified date', 7, 1, 14, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(214, '14', 'user_modified_date', 'User modified date', 7, 1, 14, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 03:31:01', 'U001', '2016-02-29 03:31:01'),
(215, '14', 'user_modified_date', 'User modified date', 7, 2, 14, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(216, '13', 'user_modified_by', 'User modified by', 9, 1, 13, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 03:31:22', 'U001', '2016-02-29 03:31:22'),
(217, '13', 'user_modified_by', 'User modified by', 9, 2, 13, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(218, '12', 'user_created_date', 'User created date', 7, 1, 12, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 03:31:44', 'U001', '2016-02-29 03:31:44'),
(219, '12', 'user_created_date', 'User created date', 7, 2, 12, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(220, '12', 'user_created_date', 'User created date', 7, 2, 12, '', '4', NULL, 2, 2, '', '', '', 'emp_meta', 'U001', '2016-02-29 03:32:03', 'U001', '2016-02-29 03:32:03'),
(221, '11', 'user_created_by', 'User created by', 9, 1, 11, '', '4', NULL, 1, 1, '', '', '', 'emp_meta', 'U001', '2016-02-29 03:32:09', 'U001', '2016-02-29 03:32:09'),
(222, '11', 'user_created_by', 'User created by', 9, 2, 11, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(223, '', 'form_module', 'form_module', 1, 1, 1, '', '3', 'required|alpha', 1, 1, '', '', '', 'form_meta', 'U001', '2016-02-29 05:11:46', 'U001', '2016-02-29 05:11:46'),
(224, '1', 'form_id', 'Form id', 12, 1, 1, '', '4', NULL, 1, 1, '', '', '', 'form_meta', 'U001', '2016-02-29 05:31:28', 'U001', '2016-02-29 05:31:28'),
(225, '1', 'form_id', 'Form id', 12, 1, 1, '', '3', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(226, '2', 'form_name', 'Form name', 1, 1, 2, '', '4', NULL, 1, 1, '', '', '', 'form_meta', 'U001', '2016-02-29 05:31:40', 'U001', '2016-02-29 05:31:40'),
(227, '2', 'form_name', 'Form name', 1, 1, 2, '', '3', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(228, '3', 'form_table_name', 'Form table name', 1, 1, 3, '', '4', NULL, 1, 1, '', '', '', 'form_meta', 'U001', '2016-02-29 05:31:50', 'U001', '2016-02-29 05:31:50'),
(229, '3', 'form_table_name', 'Form table name', 1, 1, 3, '', '3', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(230, '8', 'form_module', 'form_module', 1, 1, 1, '', '3', 'required|alpha', 1, 1, '', '', '', 'form_meta', 'U001', '2016-02-29 05:32:24', 'U001', '2016-02-29 05:32:24'),
(231, '8', 'form_module', 'Form Module', 1, 1, 1, '', '3', 'required|alpha', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(232, '2', 'dept_id', 'Dept id', 0, 1, 2, '', '4', NULL, 1, 1, '', '', '', 'emp_design_meta', 'U001', '2016-02-29 06:01:59', 'U001', '2016-02-29 06:01:59'),
(233, '2', 'dept_id', 'Dept id', 14, 1, 2, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(234, '5', 'user_created_date', 'User created date', 0, 1, 5, '', '4', NULL, 1, 1, '', '', '', 'emp_design_meta', 'U001', '2016-02-29 06:02:14', 'U001', '2016-02-29 06:02:14'),
(235, '5', 'user_created_date', 'User created date', 7, 1, 5, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(236, '7', 'user_modified_date', 'User modified date', 0, 1, 7, '', '4', NULL, 1, 1, '', '', '', 'emp_design_meta', 'U001', '2016-02-29 06:02:30', 'U001', '2016-02-29 06:02:30'),
(237, '7', 'user_modified_date', 'User modified date', 7, 1, 7, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(238, '7', 'user_modified_date', 'User modified date', 7, 1, 7, '', '4', NULL, 1, 1, '', '', '', 'emp_design_meta', 'U001', '2016-02-29 06:02:47', 'U001', '2016-02-29 06:02:47'),
(239, '7', 'user_modified_date', 'User modified date', 7, 2, 7, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(240, '6', 'user_modified_by', 'User modified by', 9, 1, 6, '', '4', NULL, 1, 1, '', '', '', 'emp_design_meta', 'U001', '2016-02-29 06:02:53', 'U001', '2016-02-29 06:02:53'),
(241, '6', 'user_modified_by', 'User modified by', 9, 2, 6, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(242, '5', 'user_created_date', 'User created date', 7, 1, 5, '', '4', NULL, 1, 1, '', '', '', 'emp_design_meta', 'U001', '2016-02-29 06:02:59', 'U001', '2016-02-29 06:02:59'),
(243, '5', 'user_created_date', 'User created date', 7, 2, 5, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(244, '4', 'user_created_by', 'User created by', 9, 1, 4, '', '4', NULL, 1, 1, '', '', '', 'emp_design_meta', 'U001', '2016-02-29 06:03:07', 'U001', '2016-02-29 06:03:07'),
(245, '4', 'user_created_by', 'User created by', 9, 2, 4, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(246, '5', 'user_created_date', 'User created date', 7, 2, 5, '', '4', NULL, 1, 1, '', '', '', 'emp_design_meta', 'U001', '2016-02-29 06:03:17', 'U001', '2016-02-29 06:03:17'),
(247, '5', 'user_created_date', 'User created date', 7, 2, 5, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(248, '6', 'user_modified_by', 'User modified by', 9, 2, 6, '', '4', NULL, 1, 1, '', '', '', 'emp_design_meta', 'U001', '2016-02-29 06:03:25', 'U001', '2016-02-29 06:03:25'),
(249, '6', 'user_modified_by', 'User modified by', 9, 2, 6, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(250, '7', 'user_modified_date', 'User modified date', 7, 2, 7, '', '4', NULL, 1, 1, '', '', '', 'emp_design_meta', 'U001', '2016-02-29 06:03:33', 'U001', '2016-02-29 06:03:33'),
(251, '7', 'user_modified_date', 'User modified date', 7, 2, 7, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(252, '6', 'user_modified_date', 'User modified date', 0, 1, 6, '', '4', NULL, 1, 1, '', '', '', 'emp_dept_meta', 'U001', '2016-02-29 06:04:16', 'U001', '2016-02-29 06:04:16'),
(253, '6', 'user_modified_date', 'User modified date', 7, 2, 6, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(254, '5', 'user_modified_by', 'User modified by', 9, 1, 5, '', '4', NULL, 1, 1, '', '', '', 'emp_dept_meta', 'U001', '2016-02-29 06:04:36', 'U001', '2016-02-29 06:04:36'),
(255, '5', 'user_modified_by', 'User modified by', 9, 2, 5, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(256, '4', 'user_created_date', 'User created date', 0, 1, 4, '', '4', NULL, 1, 1, '', '', '', 'emp_dept_meta', 'U001', '2016-02-29 06:04:47', 'U001', '2016-02-29 06:04:47'),
(257, '4', 'user_created_date', 'User created date', 7, 2, 4, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(258, '3', 'user_created_by', 'User created by', 9, 1, 3, '', '4', NULL, 1, 1, '', '', '', 'emp_dept_meta', 'U001', '2016-02-29 06:05:02', 'U001', '2016-02-29 06:05:02'),
(259, '3', 'user_created_by', 'User created by', 9, 2, 3, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(260, '1', 'dept_id', 'Dept id', 12, 1, 1, '', '4', NULL, 1, 1, '', '', '', 'emp_dept_meta', 'U001', '2016-02-29 06:06:19', 'U001', '2016-02-29 06:06:19'),
(261, '1', 'dept_id', 'Dept id', 12, 1, 1, '', '6', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(262, '2', 'dept_name', 'Dept name', 1, 1, 2, '', '4', NULL, 1, 1, '', '', '', 'emp_dept_meta', 'U001', '2016-02-29 06:06:27', 'U001', '2016-02-29 06:06:27'),
(263, '2', 'dept_name', 'Dept name', 1, 1, 2, '', '6', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(264, '1', 'zone_id', 'Zone id', 12, 1, 1, '', '4', NULL, 1, 1, '', '', '', 'country_zone_meta', 'U001', '2016-02-29 06:58:34', 'U001', '2016-02-29 06:58:34'),
(265, '1', 'zone_id', 'Zone id', 12, 1, 1, '', '6', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(266, '2', 'zone_name', 'Zone name', 1, 1, 2, '', '4', NULL, 1, 1, '', '', '', 'country_zone_meta', 'U001', '2016-02-29 06:58:45', 'U001', '2016-02-29 06:58:45'),
(267, '2', 'zone_name', 'Zone name', 1, 1, 2, '', '6', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(268, '3', 'user_created_by', 'User created by', 9, 1, 3, '', '4', NULL, 1, 1, '', '', '', 'country_zone_meta', 'U001', '2016-02-29 06:58:59', 'U001', '2016-02-29 06:58:59'),
(269, '3', 'user_created_by', 'User created by', 9, 2, 3, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(270, '4', 'user_created_date', 'User created date', 7, 1, 4, '', '4', NULL, 1, 1, '', '', '', 'country_zone_meta', 'U001', '2016-02-29 06:59:10', 'U001', '2016-02-29 06:59:10'),
(271, '4', 'user_created_date', 'User created date', 7, 2, 4, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(272, '5', 'user_modified_by', 'User modified by', 9, 1, 5, '', '4', NULL, 1, 1, '', '', '', 'country_zone_meta', 'U001', '2016-02-29 06:59:24', 'U001', '2016-02-29 06:59:24'),
(273, '5', 'user_modified_by', 'User modified by', 9, 2, 5, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(274, '6', 'user_modified_date', 'User modified date', 7, 1, 6, '', '4', NULL, 1, 1, '', '', '', 'country_zone_meta', 'U001', '2016-02-29 06:59:34', 'U001', '2016-02-29 06:59:34'),
(275, '6', 'user_modified_date', 'User modified date', 7, 2, 6, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(276, '6', 'user_created_by', 'User created by', 9, 1, 6, '', '4', NULL, 1, 1, '', '', '', 'holiday_meta', 'U001', '2016-02-29 07:27:52', 'U001', '2016-02-29 07:27:52'),
(277, '6', 'user_created_by', 'User created by', 9, 2, 6, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(278, '7', 'user_created_date', 'User created date', 1, 1, 7, '', '4', NULL, 1, 1, '', '', '', 'holiday_meta', 'U001', '2016-02-29 07:28:00', 'U001', '2016-02-29 07:28:00'),
(279, '7', 'user_created_date', 'User created date', 1, 2, 7, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(280, '8', 'user_modified_by', 'User modified by', 9, 1, 8, '', '4', NULL, 1, 1, '', '', '', 'holiday_meta', 'U001', '2016-02-29 07:28:12', 'U001', '2016-02-29 07:28:12');
INSERT INTO `form_edit` (`form_edit_id`, `meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`, `meta_tables`, `user_created_by`, `user_created_date`, `user_modified_by`, `user_modified_date`) VALUES
(281, '8', 'user_modified_by', 'User modified by', 9, 2, 8, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(282, '9', 'user_modified_date', 'User modified date', 1, 1, 9, '', '4', NULL, 1, 1, '', '', '', 'holiday_meta', 'U001', '2016-02-29 07:28:23', 'U001', '2016-02-29 07:28:23'),
(283, '9', 'user_modified_date', 'User modified date', 1, 2, 9, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(284, '1', 'holiday_id', 'Holiday id', 12, 1, 1, '', '4', NULL, 1, 1, '', '', '', 'holiday_meta', 'U001', '2016-02-29 07:30:59', 'U001', '2016-02-29 07:30:59'),
(285, '1', 'holiday_id', 'Holiday id', 12, 1, 1, '', '3', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(286, '2', 'country_id', 'Country id', 1, 1, 2, '', '4', NULL, 1, 1, '', '', '', 'holiday_meta', 'U001', '2016-02-29 07:31:28', 'U001', '2016-02-29 07:31:28'),
(287, '2', 'country_id', 'Country id', 1, 1, 2, '', '3', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(288, '3', 'holiday_name', 'Holiday name', 1, 1, 3, '', '4', NULL, 1, 1, '', '', '', 'holiday_meta', 'U001', '2016-02-29 07:31:40', 'U001', '2016-02-29 07:31:40'),
(289, '3', 'holiday_name', 'Holiday name', 1, 1, 3, '', '3', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(290, '4', 'holiday_remark', 'Holiday remark', 1, 1, 4, '', '4', NULL, 1, 1, '', '', '', 'holiday_meta', 'U001', '2016-02-29 07:31:54', 'U001', '2016-02-29 07:31:54'),
(291, '5', 'holiday_status', 'Holiday status', 2, 1, 5, '', '4', NULL, 1, 1, '', '', '', 'holiday_meta', 'U001', '2016-02-29 07:31:59', 'U001', '2016-02-29 07:31:59'),
(292, '5', 'holiday_status', 'Holiday status', 2, 1, 5, '', '3', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(293, '5', 'holiday_status', 'Holiday status', 2, 1, 5, '', '3', NULL, 1, 1, '', '', '', 'holiday_meta', 'U001', '2016-02-29 07:32:56', 'U001', '2016-02-29 07:32:56'),
(294, '5', 'holiday_status', 'Holiday status', 3, 1, 5, '', '3', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(295, '4', 'holiday_remark', 'Holiday remark', 1, 1, 4, '', '4', NULL, 1, 1, '', '', '', 'holiday_meta', 'U001', '2016-02-29 07:34:04', 'U001', '2016-02-29 07:34:04'),
(296, '4', 'holiday_remark', 'Holiday remark', 2, 1, 4, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(297, '5', 'holiday_status', 'Holiday status', 3, 1, 5, '', '3', NULL, 1, 1, '', '', '', 'holiday_meta', 'U001', '2016-02-29 07:34:50', 'U001', '2016-02-29 07:34:50'),
(298, '5', 'holiday_status', 'Holiday status', 3, 1, 4, '', '3', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(299, '4', 'holiday_remark', 'Holiday remark', 2, 1, 4, '', '4', NULL, 1, 1, '', '', '', 'holiday_meta', 'U001', '2016-02-29 07:35:00', 'U001', '2016-02-29 07:35:00'),
(300, '4', 'holiday_remark', 'Holiday remark', 2, 1, 5, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(301, '4', 'holiday_remark', 'Holiday remark', 2, 1, 5, '', '4', NULL, 1, 1, '', '', '', 'holiday_meta', 'U001', '2016-02-29 07:35:20', 'U001', '2016-02-29 07:35:20'),
(302, '4', 'holiday_remark', 'Holiday remark', 2, 1, 5, '', '12', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(303, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required|alpha', 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-03-01 12:27:40', 'U001', '2016-03-01 12:27:40'),
(304, '6', 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(305, '7', 'user_name', 'User name', 1, 1, 7, '', '6', '', 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-03-01 12:27:50', 'U001', '2016-03-01 12:27:50'),
(306, '11', 'user_role_code', 'User role code', 15, 1, 11, 'select distinct(CONCAT(role_code,''-'',role_name)) as options from user_role_master', '3', '', 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-03-01 12:28:03', 'U001', '2016-03-01 12:28:03'),
(307, '8', 'user_pass', 'User pass', 1, 1, 8, '', '6', '', 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-03-01 12:28:25', 'U001', '2016-03-01 12:28:25'),
(308, '11', 'user_role_code', 'User role code', 15, 1, 11, 'select distinct(CONCAT(role_code,''-'',role_name)) as options from user_role_master', '3', NULL, 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-03-01 12:28:50', 'U001', '2016-03-01 12:28:50'),
(309, '11', 'user_role_code', 'User role code', 15, 1, 11, 'select distinct(CONCAT(role_code,''-'',role_name)) as options from user_role_master', '3', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(310, '8', 'user_pass', 'User pass', 1, 1, 8, '', '6', NULL, 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-03-01 12:29:44', 'U001', '2016-03-01 12:29:44'),
(311, '8', 'user_pass', 'User pass', 1, 1, 8, '', '6', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(312, '10', 'user_status', 'User status', 3, 1, 10, '1-Yes,2-No', '3', NULL, 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-03-01 12:29:54', 'U001', '2016-03-01 12:29:54'),
(313, '10', 'user_status', 'User status', 3, 1, 10, '1-Yes,2-No', '3', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(314, '9', 'user_login_flag', 'User login flag', 3, 1, 9, '1-Yes,2-No', '3', NULL, 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-03-01 12:30:02', 'U001', '2016-03-01 12:30:02'),
(315, '9', 'user_login_flag', 'User login flag', 3, 1, 9, '1-Yes,2-No', '3', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(316, '4', 'user_mobile_no', 'User mobile no', 1, 1, 6, '', '4', NULL, 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-03-01 12:30:20', 'U001', '2016-03-01 12:30:20'),
(317, '4', 'user_mobile_no', 'User mobile no', 1, 1, 6, '', '4', '|', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(318, '3', 'user_last_name', 'User last name', 1, 1, 5, '', '4', NULL, 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-03-01 12:30:37', 'U001', '2016-03-01 12:30:37'),
(319, '3', 'user_last_name', 'User last name', 1, 1, 5, '', '4', '|', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(320, '3', 'user_last_name', 'User last name', 1, 1, 5, '', '4', NULL, 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-03-01 12:30:47', 'U001', '2016-03-01 12:30:47'),
(321, '3', 'user_last_name', 'User last name', 1, 1, 5, '', '4', '|', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(322, '2', 'user_first_name', 'User first name', 1, 1, 4, '', '4', NULL, 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-03-01 12:30:58', 'U001', '2016-03-01 12:30:58'),
(323, '2', 'user_first_name', 'User first name', 1, 1, 4, '', '4', '|', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(324, '2', 'user_first_name', 'User first name', 1, 1, 4, '', '4', 'required|alpha', 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-03-01 12:31:40', 'U001', '2016-03-01 12:31:40'),
(325, '2', 'user_first_name', 'User first name', 1, 1, 4, '', '4', 'required|alpha', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(326, '3', 'user_last_name', 'User last name', 1, 1, 5, '', '4', NULL, 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-03-01 12:31:46', 'U001', '2016-03-01 12:31:46'),
(327, '3', 'user_last_name', 'User last name', 1, 1, 5, '', '4', '|', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(328, '3', 'user_last_name', 'User last name', 1, 1, 5, '', '4', NULL, 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-03-01 12:31:57', 'U001', '2016-03-01 12:31:57'),
(329, '3', 'user_last_name', 'User last name', 1, 1, 5, '', '4', '|', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(330, '3', 'user_last_name', 'User last name', 1, 1, 5, '', '4', NULL, 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-03-01 12:32:20', 'U001', '2016-03-01 12:32:20'),
(331, '3', 'user_last_name', 'User last name', 1, 1, 5, '', '4', 'required|alpha', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(332, '5', 'user_role_code', 'User role code', 19, 1, 5, 'select distinct(CONCAT(role_code,''-'',role_name)) as options from user_role_master', '4', 'required', 1, 1, '', '', '', 'user_assign_master_meta', 'U001', '2016-03-01 12:40:17', 'U001', '2016-03-01 12:40:17'),
(333, '5', 'user_role_code', 'User role code', 19, 1, 5, 'select distinct(CONCAT(role_code,''-'',role_name)) as options from user_role_master', '4', 'required|alpha', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(334, '3', 'user_created_by', 'User created by', 9, 1, 3, '', '4', NULL, 1, 1, '', '', '', 'country_zone_meta', 'U001', '2016-03-01 12:47:41', 'U001', '2016-03-01 12:47:41'),
(335, '3', 'user_created_by', 'User created by', 9, 2, 3, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(336, '5', 'user_modified_by', 'User modified by', 9, 1, 5, '', '4', NULL, 1, 1, '', '', '', 'country_zone_meta', 'U001', '2016-03-01 12:48:00', 'U001', '2016-03-01 12:48:00'),
(337, '5', 'user_modified_by', 'User modified by', 9, 2, 5, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(338, '6', 'user_modified_date', 'User modified date', 1, 1, 6, '', '4', NULL, 1, 1, '', '', '', 'country_zone_meta', 'U001', '2016-03-01 12:48:12', 'U001', '2016-03-01 12:48:12'),
(339, '6', 'user_modified_date', 'User modified date', 1, 2, 6, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(340, '6', 'user_modified_date', 'User modified date', 1, 2, 6, '', '4', NULL, 2, 2, '', '', '', 'country_zone_meta', 'U001', '2016-03-01 12:48:24', 'U001', '2016-03-01 12:48:24'),
(341, '5', 'user_modified_by', 'User modified by', 9, 2, 5, '', '4', NULL, 2, 2, '', '', '', 'country_zone_meta', 'U001', '2016-03-01 12:48:30', 'U001', '2016-03-01 12:48:30'),
(342, '4', 'user_created_date', 'User created date', 1, 1, 4, '', '4', NULL, 1, 1, '', '', '', 'country_zone_meta', 'U001', '2016-03-01 12:48:34', 'U001', '2016-03-01 12:48:34'),
(343, '4', 'user_created_date', 'User created date', 1, 2, 4, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(344, '1', 'zone_id', 'Zone id', 12, 1, 1, '', '4', NULL, 1, 1, '', '', '', 'country_zone_meta', 'U001', '2016-03-01 12:48:53', 'U001', '2016-03-01 12:48:53'),
(345, '1', 'zone_id', 'Zone id', 12, 1, 1, '', '6', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(346, '2', 'zone_name', 'Zone name', 1, 1, 2, '', '4', NULL, 1, 1, '', '', '', 'country_zone_meta', 'U001', '2016-03-01 12:49:03', 'U001', '2016-03-01 12:49:03'),
(347, '2', 'zone_name', 'Zone name', 1, 1, 2, '', '4', NULL, 1, 1, '', '', '', 'country_zone_meta', 'U001', '2016-03-01 12:50:30', 'U001', '2016-03-01 12:50:30'),
(348, '2', 'zone_name', 'Zone name', 1, 1, 2, '', '4', NULL, 1, 1, '', '', '', 'country_zone_meta', 'U001', '2016-03-01 12:51:56', 'U001', '2016-03-01 12:51:56'),
(349, '2', 'zone_name', 'Zone name', 1, 1, 2, '', '4', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(350, '2', 'zone_name', 'Zone name', 1, 1, 2, '', '4', '', 1, 1, '', '', '', 'country_zone_meta', 'U001', '2016-03-01 12:52:13', 'U001', '2016-03-01 12:52:13'),
(351, '2', 'zone_name', 'Zone name', 1, 1, 2, '', '6', '', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(352, '1', 'zone_id', 'Zone id', 12, 1, 1, '', '6', NULL, 1, 1, '', '', '', 'country_zone_meta', 'U001', '2016-03-01 12:52:23', 'U001', '2016-03-01 12:52:23'),
(353, '1', 'zone_id', 'Zone id', 12, 1, 1, '', '6', NULL, 1, 1, '', '', '', 'country_zone_meta', 'U001', '2016-03-01 12:58:43', 'U001', '2016-03-01 12:58:43'),
(354, '1', 'zone_id', 'Zone id', 12, 1, 1, '', '5', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(355, '1', 'zone_id', 'Zone id', 12, 1, 1, '', '5', NULL, 1, 1, '', '', '', 'country_zone_meta', 'U001', '2016-03-01 12:59:54', 'U001', '2016-03-01 12:59:54'),
(356, '1', 'zone_id', 'Zone id', 12, 1, 1, '', '6', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(357, '2', 'country_id', 'Country id', 14, 1, 2, 'select CONCAT(country_id,''-'',country_name) as options from country', '4', NULL, 1, 1, '', '', '', 'country_state_meta', 'U001', '2016-03-01 01:00:46', 'U001', '2016-03-01 01:00:46'),
(358, '2', 'country_id', 'Country id', 14, 1, 2, 'select CONCAT(country_id,''-'',country_name) as options from country', '4', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(359, '3', 'zone_id', 'Zone id', 14, 1, 3, 'select CONCAT(zone_id,''-'',zone_name) as options from zone', '4', NULL, 1, 1, '', '', '', 'country_state_meta', 'U001', '2016-03-01 01:00:57', 'U001', '2016-03-01 01:00:57'),
(360, '3', 'zone_id', 'Zone id', 14, 1, 3, 'select CONCAT(zone_id,''-'',zone_name) as options from country_zone', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(361, '5', 'user_created_by', 'User created by', 9, 1, 5, '', '4', NULL, 1, 1, '', '', '', 'country_state_meta', 'U001', '2016-03-01 01:01:48', 'U001', '2016-03-01 01:01:48'),
(362, '5', 'user_created_by', 'User created by', 9, 2, 5, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(363, '6', 'user_created_date', 'User created date', 7, 1, 6, '', '4', NULL, 1, 1, '', '', '', 'country_state_meta', 'U001', '2016-03-01 01:02:01', 'U001', '2016-03-01 01:02:01'),
(364, '6', 'user_created_date', 'User created date', 7, 2, 6, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(365, '7', 'user_modified_by', 'User modified by', 9, 1, 7, '', '4', NULL, 1, 1, '', '', '', 'country_state_meta', 'U001', '2016-03-01 01:02:16', 'U001', '2016-03-01 01:02:16'),
(366, '7', 'user_modified_by', 'User modified by', 9, 2, 7, '', '4', NULL, 2, 2, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(367, '9', 'user_modified_date', 'User modified date', 7, 1, 8, '', '3', NULL, 2, 2, '', '', '', 'country_state_meta', 'U001', '2016-03-01 01:02:55', 'U001', '2016-03-01 01:02:55'),
(368, '7', 'user_modified_by', 'User modified by', 9, 2, 7, '', '4', NULL, 2, 2, '', '', '', 'country_state_meta', 'U001', '2016-03-01 01:03:01', 'U001', '2016-03-01 01:03:01'),
(369, '1', 'form_edit_id', 'Form edit id', 12, 2, 1, '', '4', NULL, 1, 1, '', '', '', 'form_edit_meta', 'U001', '2016-03-01 01:03:45', 'U001', '2016-03-01 01:03:45'),
(370, '1', 'form_edit_id', 'Form edit id', 12, 2, 1, '', '3', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(371, '2', 'meta_id', 'Meta Id', 9, 1, 2, '', '4', NULL, 1, 1, '', '', '', 'form_edit_meta', 'U001', '2016-03-01 01:03:57', 'U001', '2016-03-01 01:03:57'),
(372, '2', 'meta_id', 'Meta Id', 9, 1, 2, '', '3', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(373, '3', 'field_name', 'Field name', 1, 1, 3, '', '4', NULL, 1, 1, '', '', '', 'form_edit_meta', 'U001', '2016-03-01 01:04:21', 'U001', '2016-03-01 01:04:21'),
(374, '3', 'field_name', 'Field name', 1, 1, 3, '', '3', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(375, '4', 'field_label', 'Field label', 1, 1, 4, '', '4', NULL, 1, 1, '', '', '', 'form_edit_meta', 'U001', '2016-03-01 01:04:37', 'U001', '2016-03-01 01:04:37'),
(376, '4', 'field_label', 'Field label', 1, 1, 4, '', '3', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(377, '5', 'field_type', 'Field type', 15, 1, 5, 'select CONCAT(field_id,''-'',field_type,''('',type,''('',fm.constraint,'')'','')'') as options from field_master fm', '3', NULL, 1, 1, '', '', '', 'form_edit_meta', 'U001', '2016-03-01 01:04:49', 'U001', '2016-03-01 01:04:49'),
(378, '3', 'state_id', 'State id', 19, 1, 3, 'select CONCAT(country_id,''-'',country_name) as options from country', '3', NULL, 1, 1, '', '', '', 'country_city_meta', 'U001', '2016-03-01 01:32:53', 'U001', '2016-03-01 01:32:53'),
(379, '3', 'state_id', 'State id', 18, 1, 3, 'select CONCAT(country_id,''-'',country_name) as options from country', '3', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(380, '10', 'user_status', 'User status', 3, 1, 10, '1-Yes,2-No', '3', NULL, 1, 1, '', '', '', 'user_master_meta', 'U001', '2016-03-01 01:35:08', 'U001', '2016-03-01 01:35:08'),
(381, '5', 'holiday_status', 'Holiday status', 3, 1, 4, '', '3', NULL, 1, 1, '', '', '', 'holiday_meta', 'U001', '2016-03-01 01:35:29', 'U001', '2016-03-01 01:35:29'),
(382, '5', 'holiday_status', 'Holiday status', 15, 1, 4, '1-Yes,2-No', '3', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(383, '5', 'holiday_status', 'Holiday status', 15, 1, 4, '1-Yes,2-No', '3', NULL, 1, 1, '', '', '', 'holiday_meta', 'U001', '2016-03-01 01:37:33', 'U001', '2016-03-01 01:37:33'),
(384, '5', 'holiday_status', 'Holiday status', 3, 1, 4, '1-Yes,2-No', '3', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(385, '2', 'backup_database', 'Backup database', 19, 1, 2, '\nselect distinct CONCAT(table_schema,''-'',table_schema) as options\n from information_schema.columns', '4', NULL, 1, 1, 'getoption(''backup_database'',''#backup_table'',''0'',''1'')', '\nselect distinct CONCAT(table_name,''-'',table_name) as options\n from information_schema.columns\nwhere table_schema=''#field_val#''', '', 'backup_master_meta', 'U001', '2016-03-01 04:04:45', 'U001', '2016-03-01 04:04:45'),
(386, '2', 'backup_database', 'Backup database', 19, 1, 2, '\nselect distinct CONCAT(table_schema,''-'',table_schema) as options\n from information_schema.columns', '4', NULL, 1, 1, 'getoption(''backup_database'',''#backup_table'',''0'',''1'')', 'select distinct CONCAT(table_name,''-'',table_name) as options\n from information_schema.columns\nwhere table_schema=''#field_val#''', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(387, '2', 'backup_database', 'Backup database', 19, 1, 2, '\nselect distinct CONCAT(table_schema,''-'',table_schema) as options\n from information_schema.columns', '4', NULL, 1, 1, 'getoption(''backup_database'',''#backup_table'',''0'',''1'')', 'select distinct CONCAT(table_name,''-'',table_name) as options\n from information_schema.columns\nwhere table_schema=''#field_val#''', '', 'backup_master_meta', 'U001', '2016-03-01 04:04:58', 'U001', '2016-03-01 04:04:58'),
(388, '2', 'backup_database', 'Backup database', 19, 1, 2, 'select distinct CONCAT(table_schema,''-'',table_schema) as options\n from information_schema.columns', '4', NULL, 1, 1, 'getoption(''backup_database'',''#backup_table'',''0'',''1'')', 'select distinct CONCAT(table_name,''-'',table_name) as options\n from information_schema.columns\nwhere table_schema=''#field_val#''', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(389, '2', 'backup_database', 'Backup database', 19, 1, 2, 'select distinct CONCAT(table_schema,''-'',table_schema) as options\n from information_schema.columns', '4', NULL, 1, 1, 'getoption(''backup_database'',''#backup_table'',''0'',''1'')', 'select distinct CONCAT(table_name,''-'',table_name) as options\n from information_schema.columns\nwhere table_schema=''#field_val#''', '', 'backup_master_meta', 'U001', '2016-03-01 04:05:16', 'U001', '2016-03-01 04:05:16'),
(390, '2', 'product_category_id', 'Product category id', 1, 1, 2, '', '3', NULL, 1, 1, '', '', '', 'product_sub_category_meta', 'U001', '2016-03-01 05:02:45', 'U001', '2016-03-01 05:02:45'),
(391, '2', 'product_category_id', 'Product category id', 1, 1, 2, 'select CONCAT(product_category_id,''-'',product_category_name) as options from product_category', '3', 'required|integer', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(392, '2', 'product_category_id', 'Product category id', 1, 1, 2, 'select CONCAT(product_category_id,''-'',product_category_name) as options from product_category', '3', 'required|integer', 1, 1, '', '', '', 'product_sub_category_meta', 'U001', '2016-03-01 05:03:17', 'U001', '2016-03-01 05:03:17'),
(393, '2', 'product_category_id', 'Product category id', 19, 1, 2, 'select CONCAT(product_category_id,''-'',product_category_name) as options from product_category', '3', 'required|integer', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(394, '3', 'client_branch_code', 'Client branch code', 1, 1, 3, '', '4', NULL, 1, 1, '', '', '', 'user_assign_master_meta', 'U001', '2016-03-01 05:17:11', 'U001', '2016-03-01 05:17:11'),
(395, '3', 'client_branch_code', 'Client branch code', 3, 1, 3, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(396, '3', 'client_branch_code', 'Client branch code', 3, 1, 3, '', '4', NULL, 1, 1, '', '', '', 'user_assign_master_meta', 'U001', '2016-03-01 05:18:02', 'U001', '2016-03-01 05:18:02'),
(397, '3', 'client_branch_code', 'Client branch code', 14, 1, 3, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(398, '3', 'client_branch_code', 'Client branch code', 14, 1, 3, '', '4', NULL, 1, 1, '', '', '', 'user_assign_master_meta', 'U001', '2016-03-01 05:19:27', 'U001', '2016-03-01 05:19:27'),
(399, '3', 'client_branch_code', 'Client branch code', 18, 1, 3, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(400, '3', 'client_branch_code', 'Client branch code', 18, 1, 3, '', '4', NULL, 1, 1, '', '', '', 'user_assign_master_meta', 'U001', '2016-03-01 05:20:51', 'U001', '2016-03-01 05:20:51'),
(401, '3', 'client_branch_code', 'Client branch code', 18, 1, 3, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(402, '4', 'user_code', 'User code', 1, 1, 4, '', '4', NULL, 1, 1, '', '', '', 'user_sup_assign_master_meta', 'U001', '2016-03-03 08:16:52', 'U001', '2016-03-03 08:16:52'),
(403, '4', 'user_code', 'User code', 18, 1, 4, '', '4', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(404, '4', 'user_code', 'User code', 18, 1, 4, '', '4', NULL, 1, 1, '', '', '', 'user_sup_assign_master_meta', 'U001', '2016-03-03 08:17:48', 'U001', '2016-03-03 08:17:48'),
(405, '3', 'product_sub_category_name', 'sub category name', 1, 1, 3, '', '3', NULL, 1, 1, '', '', '', 'product_sub_category_meta', 'U001', '2016-03-04 03:15:32', 'U001', '2016-03-04 03:15:32'),
(406, '3', 'product_sub_category_name', 'sub category name', 1, 1, 3, '', '3', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(407, '3', 'product_sub_category_id', 'Product sub category id', 1, 1, 3, '', '3', NULL, 1, 1, '', '', '', 'product_master_meta', 'U001', '2016-03-06 01:31:04', 'U001', '2016-03-06 01:31:04'),
(408, '3', 'product_sub_category_id', 'Product sub category id', 18, 1, 3, '', '3', NULL, 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(409, '', 'product_purchase_date', 'product_purchase_date', 7, 1, 13, '', '4', 'required', 1, 1, 'sad', 'asdfa', '', 'product_meta', 'U001', '2016-03-07 06:07:08', 'U001', '2016-03-07 06:07:08'),
(410, '', 'sadsad', 'sadsa', 1, 1, 13, 'sadsa', '12', 'required', 1, 1, 'sadsad', '', '', 'product_feature_field_meta', 'U001', '2016-03-07 03:40:44', 'U001', '2016-03-07 03:40:44'),
(411, '1', 'sadsad', 'sadsa', 1, 1, 13, 'sadsa', '12', 'required', 1, 1, 'sadsad', '', '', 'product_feature_field_meta', 'U001', '2016-03-07 03:42:37', 'U001', '2016-03-07 03:42:37'),
(412, '1', 'sadsad', 'sadsa', 1, 1, 13, 'sadsa', '12', 'required', 1, 1, 'sadsad', '', '', 'product_feature_field_meta', 'U001', '2016-03-07 03:45:42', 'U001', '2016-03-07 03:45:42'),
(413, '1', 'sadsad', 'sadsa', 1, 1, 13, 'sadsa', '12', 'required', 1, 1, 'sadsad', '', '', 'product_feature_field_meta', 'U001', '2016-03-07 03:48:43', 'U001', '2016-03-07 03:48:43'),
(414, '1', 'sadsad', 'sadsa', 1, 1, 13, '', '12', 'required', 1, 1, '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(415, '1', 'sadsad', 'sadsa', 1, 1, 13, '', '12', '', 1, 1, '', '', '', 'product_feature_field_meta', 'U001', '2016-03-07 03:49:19', 'U001', '2016-03-07 03:49:19'),
(416, '1', 'sadsad', 'sadsa', 1, 1, 13, '', '12', 'required', 1, 1, '', '', '', 'product_feature_field_meta', 'U001', '2016-03-07 04:04:03', 'U001', '2016-03-07 04:04:03'),
(417, '1', 'sadsad', 'sadsa', 1, 1, 13, '', '12', 'required', 1, 1, 'sadsad', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `form_edit_meta`
--

CREATE TABLE IF NOT EXISTS `form_edit_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `form_edit_meta`
--

INSERT INTO `form_edit_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'form_edit_id', 'Form edit id', 12, 2, 1, '', '3', NULL, 1, 1, '', '', ''),
(2, 'meta_id', 'Meta Id', 9, 1, 2, '', '3', NULL, 1, 1, '', '', ''),
(3, 'field_name', 'Field name', 1, 1, 3, '', '3', NULL, 1, 1, '', '', ''),
(4, 'field_label', 'Field label', 1, 1, 4, '', '3', NULL, 1, 1, '', '', ''),
(5, 'field_type', 'Field type', 15, 1, 5, 'select CONCAT(field_id,''-'',field_type,''('',type,''('',fm.constraint,'')'','')'') as options from field_master fm', '3', NULL, 1, 1, NULL, NULL, NULL),
(6, 'form_show', 'Form show', 3, 1, 10, '1-Show,2-Hide', '2', NULL, 1, 1, NULL, NULL, NULL),
(7, 'form_order', 'Form order', 1, 1, 9, NULL, '2', NULL, 1, 1, NULL, NULL, NULL),
(8, 'field_options', 'Field options', 2, 1, 6, '', '12', NULL, 1, 1, NULL, NULL, NULL),
(9, 'field_col_sm_', 'Field col sm ', 3, 1, 8, '1-col_md_1,2-col_md_2,3-col_md_3,4-col_md_4,5-col_md_5,6-col_md_6,7-col_md_7,8-col_md_8,9-col_md_9,10-col_md_10,11-col_md_11,12-col_md_12', '2', NULL, 1, 1, NULL, NULL, NULL),
(10, 'field_validations', 'Field validations', 5, 1, 7, 'required,alpha,alpha_numeric,alpha_dash,numeric,integer,decimal,valid_email, 	\nvalid_emails', '12', NULL, 1, 1, NULL, NULL, NULL),
(11, 'form_app_show', 'App show', 3, 1, 11, '1-Show,2-Hide', '2', NULL, 1, 1, NULL, NULL, NULL),
(12, 'form_import_show', 'Import show', 3, 1, 12, '1-Show,2-Hide', '2', NULL, 1, 1, NULL, NULL, NULL),
(13, 'onchange', 'Onchange', 2, 1, 14, NULL, '6', NULL, 1, 1, NULL, NULL, NULL),
(14, 'dependon', 'Dependon', 2, 1, 15, NULL, '6', NULL, 1, 1, NULL, NULL, NULL),
(15, 'field_property', 'Field property', 1, 1, 13, NULL, '2', NULL, 1, 1, NULL, NULL, NULL),
(16, 'user_created_by', 'User created by', 9, 2, 16, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(17, 'user_created_date', 'User created date', 1, 2, 17, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(18, 'user_modified_by', 'User modified by', 9, 2, 18, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(19, 'user_modified_date', 'User modified date', 1, 2, 19, NULL, '4', NULL, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `form_meta`
--

CREATE TABLE IF NOT EXISTS `form_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `form_meta`
--

INSERT INTO `form_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'form_id', 'Form id', 12, 1, 1, '', '3', NULL, 1, 1, '', '', ''),
(2, 'form_name', 'Form name', 1, 1, 2, '', '3', NULL, 1, 1, '', '', ''),
(3, 'form_table_name', 'Form table name', 1, 1, 3, '', '3', NULL, 1, 1, '', '', ''),
(4, 'user_created_by', 'User created by', 9, 2, 4, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(5, 'user_created_date', 'User created date', NULL, 2, 5, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(6, 'user_modified_by', 'User modified by', 9, 2, 6, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(7, 'user_modified_date', 'User modified date', NULL, 2, 7, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(8, 'form_module', 'Form Module', 1, 1, 1, '', '3', 'required|alpha', 1, 1, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `holiday`
--

CREATE TABLE IF NOT EXISTS `holiday` (
  `holiday_id` int(11) NOT NULL,
  `country_id` varchar(300) NOT NULL,
  `holiday_name` varchar(300) NOT NULL,
  `holiday_remark` varchar(500) NOT NULL,
  `holiday_status` varchar(500) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` varchar(300) NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `holiday_meta`
--

CREATE TABLE IF NOT EXISTS `holiday_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `holiday_meta`
--

INSERT INTO `holiday_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'holiday_id', 'Holiday id', 12, 1, 1, '', '3', NULL, 1, 1, '', '', ''),
(2, 'country_id', 'Country id', 1, 1, 2, '', '3', NULL, 1, 1, '', '', ''),
(3, 'holiday_name', 'Holiday name', 1, 1, 3, '', '3', NULL, 1, 1, '', '', ''),
(4, 'holiday_remark', 'Holiday remark', 2, 1, 5, '', '12', NULL, 1, 1, '', '', ''),
(5, 'holiday_status', 'Holiday status', 3, 1, 4, '1-Yes,2-No', '3', NULL, 1, 1, '', '', ''),
(6, 'user_created_by', 'User created by', 9, 2, 6, '', '4', NULL, 2, 2, '', '', ''),
(7, 'user_created_date', 'User created date', 1, 2, 7, '', '4', NULL, 2, 2, '', '', ''),
(8, 'user_modified_by', 'User modified by', 9, 2, 8, '', '4', NULL, 2, 2, '', '', ''),
(9, 'user_modified_date', 'User modified date', 1, 2, 9, '', '4', NULL, 2, 2, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `import_master`
--

CREATE TABLE IF NOT EXISTS `import_master` (
`import_id` int(11) NOT NULL,
  `import_table` varchar(50) DEFAULT NULL,
  `import_file_path` varchar(200) DEFAULT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `import_master_meta`
--

CREATE TABLE IF NOT EXISTS `import_master_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `import_master_meta`
--

INSERT INTO `import_master_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'import_id', 'Import id', 12, 2, 1, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(2, 'import_table', 'Import table', 1, 2, 2, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(3, 'import_file_path', 'Import file path', 10, 1, 3, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(4, 'user_created_by', 'User created by', 9, 2, 4, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(5, 'user_created_date', 'User created date', NULL, 2, 5, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(6, 'user_modified_by', 'User modified by', 9, 2, 6, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(7, 'user_modified_date', 'User modified date', NULL, 2, 7, NULL, '4', NULL, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu_category`
--

CREATE TABLE IF NOT EXISTS `menu_category` (
`menu_category_id` int(11) NOT NULL,
  `menu_category_name` varchar(100) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_category`
--

INSERT INTO `menu_category` (`menu_category_id`, `menu_category_name`, `user_created_by`, `user_created_date`, `user_modified_by`, `user_modified_date`) VALUES
(1, 'Admin', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(2, 'Form', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(3, 'Assign', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(4, 'Menu', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(5, 'Master', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(6, 'Location', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(7, 'client', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(8, 'attendance', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(9, 'product', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(11, 'File', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(12, 'sahil', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `menu_category_meta`
--

CREATE TABLE IF NOT EXISTS `menu_category_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_category_meta`
--

INSERT INTO `menu_category_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'menu_category_id', 'Menu category id', 12, 1, 1, 'select CONCAT(menu_category_id,''-'',menu_category_name) as options from menu_category', '6', NULL, 1, 1, NULL, NULL, NULL),
(2, 'menu_category_name', 'Menu category name', 1, 1, 2, NULL, '6', 'required|callback_duplicate[menu_category_name]', 1, 1, NULL, NULL, NULL),
(3, 'user_created_by', 'User created by', 9, 2, 3, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(4, 'user_created_date', 'User created date', NULL, 2, 4, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(5, 'user_modified_by', 'User modified by', 9, 2, 5, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(6, 'user_modified_date', 'User modified date', NULL, 2, 6, NULL, '4', NULL, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu_master`
--

CREATE TABLE IF NOT EXISTS `menu_master` (
`menu_id` int(11) NOT NULL,
  `menu_text` varchar(100) DEFAULT NULL,
  `menu_parent_id` int(11) DEFAULT NULL,
  `menu_navigate_url` varchar(2000) DEFAULT NULL,
  `menu_sequence` int(11) DEFAULT NULL,
  `menu_product` varchar(50) DEFAULT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_master`
--

INSERT INTO `menu_master` (`menu_id`, `menu_text`, `menu_parent_id`, `menu_navigate_url`, `menu_sequence`, `menu_product`, `user_created_by`, `user_created_date`, `user_modified_by`, `user_modified_date`) VALUES
(1, 'Admin', 0, '#', 1, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(2, 'Form', 0, '#', 2, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(3, 'Assign', 0, '#', 3, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(4, 'Menu', 0, '#', 4, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(5, 'Master', 0, '#', 5, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(6, 'Location', 0, '#', 6, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(7, 'client', 0, '#', 7, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(8, 'attendance', 0, '#', 8, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(9, 'product', 0, '#', 9, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(10, 'File', 0, '#', 10, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(11, 'User Master', 1, 'admin/usermaster', 1, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(12, 'Role Master', 1, 'admin/rolemaster', 2, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(13, 'User Structure Master', 1, 'admin/userstructure', 3, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(14, 'Table Backup', 1, 'admin/db', 4, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(15, 'Sql Query', 1, 'admin/sql', 5, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(16, 'Import Master', 1, 'admin/import', 6, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(17, 'Form Create', 2, 'form/form', 1, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(18, 'Form Edit', 2, 'form/formedit', 2, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(19, 'User Assign', 3, 'assign/userassignmaster', 1, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(20, 'User Sup Assign ', 3, 'assign/usersupassignmaster', 2, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(21, 'Menu Category', 4, 'menu/menucat', 1, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(22, 'Menu Sub Category ', 4, 'menu/menusubcat', 2, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(23, 'Menu Master', 4, 'menu/menumaster', 3, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(24, 'Employee ', 5, 'master/emp', 1, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(25, 'Department', 5, 'master/dept', 2, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(26, 'Designation', 5, 'master/desig', 3, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(27, 'Holiday', 5, 'master/holiday', 4, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(28, 'Weekly Off', 5, 'master/weeklyoff', 5, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(29, 'country', 6, 'location/country', 1, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(30, 'State', 6, 'location/state', 3, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(31, 'Zone', 6, 'location/zone', 2, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(32, 'City', 6, 'location/city', 4, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(33, 'Sub Center', 6, 'location/subcenter', 5, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(34, 'Pincode', 6, 'location/pincode', 6, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(35, 'Client ', 7, 'client/clientmaster', 1, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(36, 'Client Branch', 7, 'client/clientbranchmaster', 2, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(37, 'Mark Attendance', 8, 'attendance/markattendance', 1, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(38, 'Mark Group Attendance', 8, 'attendance/markgroupattendance', 2, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(39, 'Review Attendance', 8, 'product/reviewattendance', 3, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(40, 'product category', 9, 'product/productcategory', 1, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(41, 'product sub category', 9, 'product/productsubcategory', 2, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(42, 'product master', 9, 'product/productmaster', 3, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(43, 'product feature master', 9, 'product/productfeaturemaster', 4, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(44, 'product Template Design', 9, 'product/producttemplate', 5, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(45, 'Add Product Details', 9, 'product/productdetails', 6, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(46, 'product Import', 9, 'product/productimport', 7, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(47, 'products', 9, 'product/product', 7, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(48, 'File Upload', 10, 'file/fileupload', 1, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(49, 'File view', 10, 'file/fileview', 2, 'attendance', 'U001', '2016-03-07 10:58:13', 'U001', '2016-03-07 10:58:13'),
(50, 'sahil', 0, '#', 1, 'attendance ', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `menu_master_meta`
--

CREATE TABLE IF NOT EXISTS `menu_master_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` text,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_master_meta`
--

INSERT INTO `menu_master_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'menu_id', 'Menu id', 12, 1, 1, '', '4', NULL, 1, 1, NULL, NULL, NULL),
(2, 'menu_text', 'Menu text', 9, 1, 3, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(3, 'menu_parent_id', 'Menu parent id', 19, 1, 2, '			select CONCAT(menu_parent_id,''-'',menu_id,''_'',menu_text,''_'',menu_navigate_url,''_'',menu_sequence,''_'',menu_product) as options \n			FROM( \n\nSELECT '''' AS menu_id,\n		menu_category_name AS menu_text,\n		''0'' AS menu_parent_id,\n		''#'' AS menu_navigate_url,\n		@row:=1+@row AS menu_sequence,\n		''attendance'' AS menu_product\n		FROM menu_category,(select @row :=0 ) as a\n		where menu_category_name not in (select menu_text from menu_master)\n		union all\n		SELECT '''' AS menu_id,\n		menu_sub_category_name AS menu_text,\n		menu_category_id AS menu_parent_id,\n		menu_sub_category_url AS menu_navigate_url,\n		menu_sub_category_seq AS menu_sequence,\n		''attendance'' AS menu_product\n		FROM menu_sub_category,(select @row :=0 ) as a\n			where menu_sub_category_name not in (select menu_text from menu_master)\n)DS', '4', NULL, 1, 1, NULL, NULL, NULL),
(4, 'menu_navigate_url', 'Menu navigate url', 9, 1, 4, NULL, '12', NULL, 1, 1, NULL, NULL, NULL),
(5, 'menu_sequence', 'Menu sequence', 9, 1, 5, NULL, '6', NULL, 1, 1, NULL, NULL, NULL),
(6, 'menu_product', 'Menu product', 9, 1, 6, NULL, '6', NULL, 1, 1, NULL, NULL, NULL),
(7, 'user_created_by', 'User created by', 9, 2, 7, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(8, 'user_created_date', 'User created date', NULL, 2, 8, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(9, 'user_modified_by', 'User modified by', 9, 2, 9, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(10, 'user_modified_date', 'User modified date', NULL, 2, 10, NULL, '4', NULL, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu_sub_category`
--

CREATE TABLE IF NOT EXISTS `menu_sub_category` (
`menu_sub_category_id` int(11) NOT NULL,
  `menu_category_id` varchar(800) NOT NULL,
  `menu_sub_category_name` varchar(300) NOT NULL,
  `menu_sub_category_url` varchar(300) NOT NULL,
  `menu_sub_category_seq` varchar(300) NOT NULL,
  `page_form_name` varchar(300) NOT NULL,
  `page_list_name` varchar(300) NOT NULL,
  `page_breadcrumb` varchar(300) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` date NOT NULL,
  `page_name` varchar(300) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_sub_category`
--

INSERT INTO `menu_sub_category` (`menu_sub_category_id`, `menu_category_id`, `menu_sub_category_name`, `menu_sub_category_url`, `menu_sub_category_seq`, `page_form_name`, `page_list_name`, `page_breadcrumb`, `user_created_by`, `user_created_date`, `user_modified_by`, `user_modified_date`, `page_name`) VALUES
(1, '1', 'User Master', 'admin/usermaster', '1', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'User Master'),
(2, '1', 'Role Master', 'admin/rolemaster', '2', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'Role Master'),
(3, '1', 'User Structure Master', 'admin/userstructure', '3', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'User Structure Master'),
(4, '1', 'Table Backup', 'admin/db', '4', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'Table Backup'),
(5, '1', 'Sql Query', 'admin/sql', '5', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'Sql Query'),
(6, '1', 'Import Master', 'admin/import', '6', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'Import Master'),
(7, '2', 'Form Create', 'form/form', '1', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'Form Create'),
(8, '2', 'Form Edit', 'form/formedit', '2', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'Form Edit'),
(9, '3', 'User Assign', 'assign/userassignmaster', '1', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'User Assign Master'),
(10, '3', 'User Sup Assign ', 'assign/usersupassignmaster', '2', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'User Sup Assign Master'),
(11, '4', 'Menu Category', 'menu/menucat', '1', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'Menu Category Master'),
(12, '4', 'Menu Sub Category ', 'menu/menusubcat', '2', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'Menu Sub Category Master'),
(13, '4', 'Menu Master', 'menu/menumaster', '3', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'Menu Master'),
(14, '5', 'Employee ', 'master/emp', '1', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'Employee Master'),
(15, '5', 'Department', 'master/dept', '2', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'Department Master'),
(16, '5', 'Designation', 'master/desig', '3', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'Designation Master'),
(17, '5', 'Holiday', 'master/holiday', '4', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'Holiday Master'),
(18, '5', 'Weekly Off', 'master/weeklyoff', '5', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'Weekly Off'),
(19, '6', 'country', 'location/country', '1', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'Country'),
(20, '6', 'State', 'location/state', '3', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'State'),
(21, '6', 'Zone', 'location/zone', '2', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'Zone'),
(22, '6', 'City', 'location/city', '4', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'City'),
(23, '6', 'Sub Center', 'location/subcenter', '5', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'Sub Center'),
(24, '6', 'Pincode', 'location/pincode', '6', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'Pincode'),
(25, '7', 'Client ', 'client/clientmaster', '1', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'City'),
(26, '7', 'Client Branch', 'client/clientbranchmaster', '2', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'Sub Center'),
(27, '8', 'Mark Attendance', 'attendance/markattendance', '1', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'Mark Attendane'),
(28, '8', 'Mark Group Attendance', 'attendance/markgroupattendance', '2', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'Mark Group Attendane'),
(29, '8', 'Review Attendance', 'product/reviewattendance', '3', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'Review Attendance'),
(30, '9', 'product category', 'product/productcategory', '1', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'Product Category'),
(31, '9', 'product sub category', 'product/productsubcategory', '2', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'Product Sub Category'),
(32, '9', 'product master', 'product/productmaster', '3', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'Product Master'),
(33, '9', 'product feature master', 'product/productfeaturemaster', '4', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'product feature master'),
(34, '9', 'product Template Design', 'product/producttemplate', '5', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'product Template Design'),
(35, '9', 'Add Product Details', 'product/productdetails', '6', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'Add Product Details'),
(36, '9', 'product Import', 'product/productimport', '7', '', '', '', 'U001', '0000-00-00 00:00:00', 'U001', '0000-00-00', 'product Import'),
(37, '9', 'products', 'product/product', '7', 'product', 'product', 'product', '', '0000-00-00 00:00:00', '', '0000-00-00', 'product'),
(38, '10', 'File Upload', 'file/fileupload', '1', 'File Upload Form', 'Uploaded List', 'file,fileupload', '', '0000-00-00 00:00:00', '', '0000-00-00', 'File Upload'),
(39, '10', 'File view', 'file/fileview', '2', 'File View Form', 'Files', 'file,fileview', '', '0000-00-00 00:00:00', '', '0000-00-00', 'File View');

-- --------------------------------------------------------

--
-- Table structure for table `menu_sub_category_meta`
--

CREATE TABLE IF NOT EXISTS `menu_sub_category_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_sub_category_meta`
--

INSERT INTO `menu_sub_category_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'menu_sub_category_id', 'Sub-category id', 12, 1, 1, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(2, 'menu_category_id', 'Category-id', 15, 1, 2, 'select CONCAT(menu_id,''-'',menu_text) as options FROM menu_master mm\n			WHERE menu_parent_id = ''0''', '3', 'required', 1, 1, '', '', ''),
(3, 'menu_sub_category_name', 'Sub-category name', 1, 1, 3, '', '3', 'required', 1, 1, '', '', ''),
(4, 'menu_sub_category_url', 'Menu sub category url', 1, 1, 5, '', '12', 'required', 1, 1, '', '', ''),
(5, 'menu_sub_category_seq', 'Sub-category seq', 1, 1, 4, '', '3', '', 1, 1, '', '', ''),
(6, 'page_form_name', 'Page form name', 1, 1, 7, '', '3', '', 1, 1, '', '', ''),
(7, 'page_list_name', 'Page list name', 1, 1, 8, '', '3', '', 1, 1, '', '', ''),
(8, 'page_breadcrumb', 'Page breadcrumb', 1, 1, 9, '', '3', '', 1, 1, '', '', ''),
(9, 'user_created_by', 'User created by', 9, 2, 10, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(10, 'user_created_date', 'User created date', 7, 2, 11, '', '4', NULL, 1, 1, '', '', ''),
(11, 'user_modified_by', 'User modified by', 9, 2, 12, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(12, 'user_modified_date', 'User modified date', 7, 2, 13, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(13, 'page_name', 'Page name', 1, 1, 6, '', '3', 'required', 2, 1, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
`product_item_id` int(11) unsigned NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `product_sub_category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_meta_desc` text NOT NULL,
  `product_meta_keyword` text NOT NULL,
  `product_name` varchar(300) NOT NULL,
  `product_sku` varchar(300) NOT NULL,
  `product_desc` text NOT NULL,
  `product_purchase_price` float NOT NULL,
  `product_price` float NOT NULL,
  `product_brand` varchar(300) NOT NULL,
  `product_quatity_avail` int(12) NOT NULL,
  `product_discount` float NOT NULL,
  `supplier_id` varchar(300) NOT NULL,
  `product_status` varchar(500) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user-modified_by` varchar(250) NOT NULL,
  `user-modified_date` datetime NOT NULL,
  `product_purchase_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE IF NOT EXISTS `product_category` (
`product_category_id` int(11) unsigned NOT NULL,
  `product_category_name` varchar(300) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`product_category_id`, `product_category_name`, `user_created_by`, `user_created_date`, `user_modified_by`, `user_modified_date`) VALUES
(1, 'Electronics', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_category_meta`
--

CREATE TABLE IF NOT EXISTS `product_category_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_category_meta`
--

INSERT INTO `product_category_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'product_category_id', 'Product category id', 12, 1, 1, NULL, '6', NULL, 1, 1, NULL, NULL, NULL),
(2, 'product_category_name', 'Product category name', 1, 1, 2, NULL, '6', 'required|callback_duplicate[product_category_name]', 1, 1, NULL, NULL, NULL),
(3, 'user_created_by', 'User created by', 9, 2, 3, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(4, 'user_created_date', 'User created date', NULL, 2, 4, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(5, 'user_modified_by', 'User modified by', 9, 2, 5, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(6, 'user_modified_date', 'User modified date', NULL, 2, 6, NULL, '4', NULL, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_feature_field_meta`
--

CREATE TABLE IF NOT EXISTS `product_feature_field_meta` (
`meta_id` int(11) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `list_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_options` varchar(255) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL,
  `user_created_by` varchar(250) DEFAULT NULL,
  `user_created_date` datetime DEFAULT NULL,
  `user_modified_by` varchar(250) DEFAULT NULL,
  `user_modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_feature_field_meta`
--

INSERT INTO `product_feature_field_meta` (`meta_id`, `table_name`, `field_name`, `field_label`, `field_type`, `form_show`, `list_show`, `form_order`, `form_app_show`, `form_import_show`, `field_col_sm_`, `field_options`, `field_validations`, `onchange`, `dependon`, `field_property`, `user_created_by`, `user_created_date`, `user_modified_by`, `user_modified_date`) VALUES
(1, '1_1_1', 'sadsad', 'sadsa', 1, 1, 1, 18, 1, 1, '12', '', 'required', 'sadsad', '', '', NULL, NULL, NULL, NULL),
(2, '1_1_1', 'sdaasd', 'sdsa', 1, 1, 1, 19, NULL, NULL, '6', 'sdaasdsa', 'required', '', NULL, NULL, NULL, NULL, NULL, NULL),
(3, '1_1_1', 'sadsa', 'sadasd', 1, 1, 1, 19, 1, 1, '6', 'sadasdas', 'required', 'sadas', NULL, NULL, NULL, NULL, NULL, NULL),
(4, '1_1_1', 'sdasssadasdsa', 'asddsa', 1, 1, NULL, 0, 1, 1, '3', 'sadas', 'required', 'sadsa', NULL, NULL, NULL, NULL, NULL, NULL),
(5, '1_1_1', 'asdsasadasdsadas', 'sadasd', 1, 1, NULL, 0, 1, 1, '1', 'sadsa', 'required', 'sadsad', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_master`
--

CREATE TABLE IF NOT EXISTS `product_master` (
`product_id` int(11) NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `product_sub_category_id` varchar(100) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_master`
--

INSERT INTO `product_master` (`product_id`, `product_category_id`, `product_sub_category_id`, `product_name`, `user_created_by`, `user_created_date`, `user_modified_by`, `user_modified_date`) VALUES
(1, 1, '1', 'smart', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_master_meta`
--

CREATE TABLE IF NOT EXISTS `product_master_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_master_meta`
--

INSERT INTO `product_master_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'product_id', 'Product id', 12, 1, 1, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(2, 'product_category_id', 'Product category id', 19, 1, 2, 'select CONCAT(product_category_id,''-'',product_category_name) as options from product_category', '3', NULL, 1, 1, NULL, NULL, NULL),
(3, 'product_sub_category_id', 'Product sub category id', 18, 1, 3, '', '3', NULL, 1, 1, '', '', ''),
(4, 'product_name', 'Product name', 1, 1, 4, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(5, 'user_created_by', 'User created by', 9, 2, 5, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(6, 'user_created_date', 'User created date', NULL, 2, 6, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(7, 'user_modified_by', 'User modified by', 9, 2, 7, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(8, 'user_modified_date', 'User modified date', NULL, 2, 8, NULL, '4', NULL, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_meta`
--

CREATE TABLE IF NOT EXISTS `product_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_meta`
--

INSERT INTO `product_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'product_item_id', 'Product item id', 12, 1, 1, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(2, 'product_category_id', 'Product category id', 3, 1, 2, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(3, 'product_sub_category_id', 'Product sub category id', 3, 1, 3, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(4, 'product_id', 'Product id', 3, 1, 4, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(5, 'product_meta_desc', 'Product meta desc', 2, 1, 5, NULL, '12', NULL, 1, 1, NULL, NULL, NULL),
(6, 'product_meta_keyword', 'Product meta keyword', 2, 1, 6, NULL, '12', NULL, 1, 1, NULL, NULL, NULL),
(7, 'product_name', 'Product name', 1, 1, 8, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(8, 'product_sku', 'Product sku', 1, 1, 9, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(9, 'product_desc', 'Product desc', 2, 1, 7, NULL, '12', NULL, 1, 1, NULL, NULL, NULL),
(10, 'product_purchase_price', 'Product purchase price', 13, 1, 12, NULL, '6', NULL, 1, 1, NULL, NULL, NULL),
(11, 'product_price', 'Product price', 1, 1, 10, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(12, 'product_brand', 'Product brand', 1, 1, 11, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(13, 'product_quatity_avail', 'Product quatity avail', 1, 1, 14, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(14, 'product_discount', 'Product discount', 1, 1, 15, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(15, 'supplier_id', 'Supplier id', 1, 1, 16, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(16, 'product_status', 'Product status', 3, 1, 17, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(17, 'user_created_by', 'User created by', 9, 2, 18, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(18, 'user_created_date', 'User created date', 7, 2, 19, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(19, 'user-modified_by', 'User-modified by', 9, 2, 20, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(20, 'user-modified_date', 'User-modified date', 7, 2, 21, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(21, 'product_purchase_date', 'Product purchase date', 6, 1, 13, NULL, '6', NULL, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_sub_category`
--

CREATE TABLE IF NOT EXISTS `product_sub_category` (
`product_sub_category_id` int(11) unsigned NOT NULL,
  `product_category_id` varchar(25) NOT NULL,
  `product_sub_category_name` varchar(300) NOT NULL,
  `product_sub_category_seq` varchar(300) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_sub_category`
--

INSERT INTO `product_sub_category` (`product_sub_category_id`, `product_category_id`, `product_sub_category_name`, `product_sub_category_seq`, `user_created_by`, `user_created_date`, `user_modified_by`, `user_modified_date`) VALUES
(1, '1', 'Mobile & Accessories', '1', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_sub_category_meta`
--

CREATE TABLE IF NOT EXISTS `product_sub_category_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_sub_category_meta`
--

INSERT INTO `product_sub_category_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'product_sub_category_id', 'Product sub category id', 12, 1, 1, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(2, 'product_category_id', 'Product category id', 19, 1, 2, 'select CONCAT(product_category_id,''-'',product_category_name) as options from product_category', '3', 'required|integer', 1, 1, '', '', ''),
(3, 'product_sub_category_name', 'sub category name', 1, 1, 3, '', '3', NULL, 1, 1, '', '', ''),
(4, 'product_sub_category_seq', 'sub category seq', 1, 1, 4, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(5, 'user_created_by', 'User created by', 9, 2, 5, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(6, 'user_created_date', 'User created date', 7, 2, 6, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(7, 'user_modified_by', 'User modified by', 9, 2, 7, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(8, 'user_modified_date', 'User modified date', 7, 2, 8, NULL, '4', NULL, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sql_master`
--

CREATE TABLE IF NOT EXISTS `sql_master` (
`sql_id` int(11) NOT NULL,
  `sql_database` varchar(100) DEFAULT NULL,
  `sql_query` varchar(2000) DEFAULT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sql_master_meta`
--

CREATE TABLE IF NOT EXISTS `sql_master_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sql_master_meta`
--

INSERT INTO `sql_master_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'sql_id', 'Sql id', 12, 2, 1, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(2, 'sql_database', 'Sql database', 191, 1, 2, '\nselect distinct CONCAT(table_schema,''-'',table_schema) as options\n from information_schema.columns', '12', NULL, 1, 1, 'getoption(''backup_database'',''#backup_table'',''0'',''1'')', '\nselect distinct CONCAT(table_name,''-'',table_name) as options\n from information_schema.columns\nwhere table_schema=''#field_val#''', NULL),
(3, 'sql_query', 'Sql query', 2, 1, 3, NULL, '12', NULL, 1, 1, NULL, NULL, NULL),
(4, 'user_created_by', 'User created by', 9, 2, 4, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(5, 'user_created_date', 'User created date', NULL, 2, 5, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(6, 'user_modified_by', 'User modified by', 9, 2, 6, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(7, 'user_modified_date', 'User modified date', NULL, 2, 7, NULL, '4', NULL, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_assign_master`
--

CREATE TABLE IF NOT EXISTS `user_assign_master` (
`user_assign_id` int(11) unsigned NOT NULL,
  `client_code` varchar(25) NOT NULL,
  `client_branch_code` varchar(100) NOT NULL,
  `user_code` varchar(300) NOT NULL,
  `user_role_code` varchar(25) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_assign_master`
--

INSERT INTO `user_assign_master` (`user_assign_id`, `client_code`, `client_branch_code`, `user_code`, `user_role_code`, `user_created_by`, `user_created_date`, `user_modified_by`, `user_modified_date`) VALUES
(3, 'C001', 'CB01', 'U001', 'SU', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_assign_master_meta`
--

CREATE TABLE IF NOT EXISTS `user_assign_master_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_assign_master_meta`
--

INSERT INTO `user_assign_master_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'user_assign_id', 'User assign id', 12, 1, 1, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(2, 'client_code', 'Client code', 19, 1, 2, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '3', 'required', 1, 1, '', '', ''),
(3, 'client_branch_code', 'Client branch code', 18, 1, 3, '', '3', NULL, 1, 1, '', '', ''),
(4, 'user_code', 'User code', 18, 1, 5, NULL, '12', NULL, 1, 1, NULL, NULL, NULL),
(5, 'user_role_code', 'User role code', 19, 1, 4, 'select distinct(CONCAT(role_code,''-'',role_name)) as options from user_role_master', '3', 'required|alpha', 1, 1, '', '', ''),
(6, 'user_created_by', 'User created by', 9, 2, 6, '', '4', NULL, 2, 2, '', '', ''),
(7, 'user_created_date', 'User created date', 7, 2, 7, '', '4', NULL, 2, 2, '', '', ''),
(8, 'user_modified_by', 'User modified by', 9, 2, 8, '', '4', NULL, 2, 2, '', '', ''),
(9, 'user_modified_date', 'User modified date', 7, 2, 9, '', '4', NULL, 2, 2, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_att_master`
--

CREATE TABLE IF NOT EXISTS `user_att_master` (
`att_id` int(11) NOT NULL,
  `att_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `client_name` varchar(250) NOT NULL,
  `client_branch_code` varchar(10) NOT NULL,
  `client_branch_name` varchar(250) NOT NULL,
  `client_branch_process` varchar(150) NOT NULL,
  `client_latitude` float NOT NULL,
  `client_longitude` float NOT NULL,
  `user_code` varchar(150) NOT NULL,
  `field_executive` varchar(150) NOT NULL,
  `attendance_status` varchar(5) NOT NULL,
  `user_name` varchar(150) NOT NULL,
  `user_latitude` float NOT NULL,
  `user_longitude` float NOT NULL,
  `user_accuracy` float NOT NULL,
  `user_radius` float NOT NULL,
  `user_address` varchar(500) NOT NULL,
  `user_reason` varchar(250) NOT NULL,
  `user_visit_branch` varchar(100) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_master`
--

CREATE TABLE IF NOT EXISTS `user_master` (
`user_id` int(11) NOT NULL,
  `user_first_name` varchar(300) NOT NULL,
  `user_last_name` varchar(300) NOT NULL,
  `user_mobile_no` varchar(300) NOT NULL,
  `user_code` varchar(50) NOT NULL,
  `user_client_code` varchar(800) NOT NULL,
  `user_name` varchar(250) NOT NULL,
  `user_pass` varchar(300) NOT NULL,
  `user_login_flag` text NOT NULL,
  `user_status` text NOT NULL,
  `user_role_code` varchar(800) NOT NULL,
  `user_product_names` varchar(1000) NOT NULL,
  `user_sec_question` varchar(250) NOT NULL,
  `user_sec_answer` varchar(250) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_master`
--

INSERT INTO `user_master` (`user_id`, `user_first_name`, `user_last_name`, `user_mobile_no`, `user_code`, `user_client_code`, `user_name`, `user_pass`, `user_login_flag`, `user_status`, `user_role_code`, `user_product_names`, `user_sec_question`, `user_sec_answer`, `user_created_by`, `user_created_date`, `user_modified_by`, `user_modified_date`) VALUES
(1, 'Super', 'admin', '54656446', 'U001', 'C001', 'admin', 'admin', '1', '1', 'SU', 'attendance', '1', '7738651907', 'U001', '2015-12-11 00:00:00', 'U001', '2016-01-15 00:00:00'),
(13, 'Hdfc head', 'Na', '1346887433', 'U002', 'C001', 'hdfchead', 'hdfchead', '1', '1', 'C', 'attendance', '1', 'Answer', 'U001', '2015-12-24 00:00:00', 'U001', '2015-12-24 00:00:00'),
(14, 'Pamac user', 'Na', '123457788', 'U003', 'C002', 'pamacuser', 'pamacuser', '1', '1', 'SU', 'attendance', '1', 'Answer', 'U001', '2015-12-24 00:00:00', 'U001', '2015-12-24 00:00:00'),
(15, 'Hdfc ch1', 'Na', '1346887433', 'U004', 'C001', 'hdfcch1', 'hdfcch1', '1', '1', 'CH', 'attendance', '1', 'Answer', 'U001', '2015-12-24 00:00:00', 'U001', '2015-12-24 00:00:00'),
(16, 'Hdfc ch2', 'Na', '1346887433', 'U005', 'C001', 'hdfcch2', 'hdfcch2', '1', '1', 'CH', 'attendance', '1', 'Answer', 'U001', '2015-12-24 00:00:00', 'U001', '2015-12-24 00:00:00'),
(17, 'Fs1', 'Na', '1346887433', 'U006', 'C001', 'fs1', 'fs1', '1', '1', 'FS', 'attendance', '1', 'Answer', 'U001', '2015-12-24 00:00:00', 'U001', '2015-12-24 00:00:00'),
(18, 'Fs2', 'Na', '1346887433', 'U007', 'C001', 'fs2', 'fs2', 'N', 'Y', 'FS', 'attendance', 'Question', 'Answer', 'U001', '2015-12-24 00:00:00', 'U001', '2015-12-24 00:00:00'),
(19, 'Fs3', 'Na', '1346887433', 'U008', 'C001', 'fs3', 'fs3', 'N', 'Y', 'FS', 'attendance', 'Question', 'Answer', 'U001', '2015-12-24 00:00:00', 'U001', '2015-12-24 00:00:00'),
(20, 'Fs4', 'Na', '1346887433', 'U009', 'C001', 'fs4', 'fs4', 'N', 'Y', 'FS', 'attendance', 'Question', 'Answer', 'U001', '2015-12-24 00:00:00', 'U001', '2015-12-24 00:00:00'),
(21, 'Fs5', 'Na', '1346887433', 'U0010', 'C001', 'fs5', 'fs5', 'N', 'Y', 'SU', 'attendance', 'whats ur first mobile number ?', 'Answer', 'U003', '2015-12-24 00:00:00', 'U001', '2016-02-17 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_master_meta`
--

CREATE TABLE IF NOT EXISTS `user_master_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_master_meta`
--

INSERT INTO `user_master_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'user_id', 'User id', 12, 1, 1, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(2, 'user_first_name', 'User first name', 1, 1, 4, '', '4', 'required|alpha', 1, 1, '', '', ''),
(3, 'user_last_name', 'User last name', 1, 1, 5, '', '4', 'required|alpha', 1, 1, '', '', ''),
(4, 'user_mobile_no', 'User mobile no', 1, 1, 6, '', '4', '|', 1, 1, '', '', ''),
(5, 'user_code', 'User code', 9, 1, 2, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(6, 'user_client_code', 'User client code', 15, 1, 3, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '4', 'required', 1, 1, '', '', ''),
(7, 'user_name', 'User name', 1, 1, 7, NULL, '6', 'required|callback_duplicate[user_name]', 1, 1, NULL, NULL, NULL),
(8, 'user_pass', 'User pass', 1, 1, 8, '', '6', 'required', 1, 1, '', '', ''),
(9, 'user_login_flag', 'User login flag', 3, 1, 9, '1-Yes,2-No', '3', '', 1, 1, '', '', ''),
(10, 'user_status', 'User status', 3, 1, 10, '1-Yes,2-No', '3', '', 1, 1, '', '', ''),
(11, 'user_role_code', 'User role code', 15, 1, 11, 'select distinct(CONCAT(role_code,''-'',role_name)) as options from user_role_master', '3', 'required', 1, 1, '', '', ''),
(12, 'user_product_names', 'User product names', 16, 1, 12, NULL, '3', NULL, 1, 1, NULL, NULL, 'Attendance'),
(13, 'user_sec_question', 'User sec question', 3, 1, 13, '1-whats ur first mobile number ?,2-whats ur school name ?,3-From where u have completed ur graduation', '6', NULL, 1, 1, NULL, NULL, NULL),
(14, 'user_sec_answer', 'User sec answer', 1, 1, 14, NULL, '6', NULL, 1, 1, NULL, NULL, NULL),
(15, 'user_created_by', 'User created by', 9, 2, 15, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(16, 'user_created_date', 'User created date', 1, 2, 16, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(17, 'user_modified_by', 'User modified by', 9, 2, 17, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(18, 'user_modified_date', 'User modified date', 1, 2, 18, NULL, '4', NULL, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_role_master`
--

CREATE TABLE IF NOT EXISTS `user_role_master` (
`role_id` int(11) NOT NULL,
  `role_name` varchar(250) NOT NULL,
  `role_code` varchar(10) NOT NULL,
  `role_url` varchar(500) NOT NULL,
  `role_menu_ids` int(11) NOT NULL,
  `role_menu_insert` varchar(1) NOT NULL,
  `role_menu_update` varchar(1) NOT NULL,
  `role_menu_delete` varchar(1) NOT NULL,
  `role_menu_export` varchar(1) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role_master`
--

INSERT INTO `user_role_master` (`role_id`, `role_name`, `role_code`, `role_url`, `role_menu_ids`, `role_menu_insert`, `role_menu_update`, `role_menu_delete`, `role_menu_export`, `user_created_by`, `user_created_date`, `user_modified_by`, `user_modified_date`) VALUES
(58, 'Field Staff', 'FS', 'attendance/markattendance', 8, 'N', 'N', 'N', 'N', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(59, 'Field Staff', 'FS', 'attendance/markattendance', 35, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(60, 'Cluster Head', 'CH', 'attendance/markgroupattendance', 34, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(61, 'Cluster Head', 'CH', 'attendance/markgroupattendance', 8, 'N', 'N', 'N', 'N', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(62, 'Cluster Head', 'CH', 'attendance/markgroupattendance', 36, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(63, 'Client', 'C', 'attendance/markgroupattendance', 34, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(64, 'Client', 'C', 'attendance/markgroupattendance', 8, 'N', 'N', 'N', 'N', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(65, 'Client', 'C', 'attendance/markgroupattendance', 36, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(156, 'Super Admin', 'SU', 'admin/usermaster', 1, 'N', 'N', 'N', 'N', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(157, 'Super Admin', 'SU', 'admin/usermaster', 11, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(158, 'Super Admin', 'SU', 'admin/usermaster', 12, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(159, 'Super Admin', 'SU', 'admin/usermaster', 13, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(160, 'Super Admin', 'SU', 'admin/usermaster', 14, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(161, 'Super Admin', 'SU', 'admin/usermaster', 15, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(162, 'Super Admin', 'SU', 'admin/usermaster', 16, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(163, 'Super Admin', 'SU', 'admin/usermaster', 2, 'N', 'N', 'N', 'N', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(164, 'Super Admin', 'SU', 'admin/usermaster', 17, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(165, 'Super Admin', 'SU', 'admin/usermaster', 18, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(166, 'Super Admin', 'SU', 'admin/usermaster', 3, 'N', 'N', 'N', 'N', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(167, 'Super Admin', 'SU', 'admin/usermaster', 19, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(168, 'Super Admin', 'SU', 'admin/usermaster', 20, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(169, 'Super Admin', 'SU', 'admin/usermaster', 4, 'N', 'N', 'N', 'N', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(170, 'Super Admin', 'SU', 'admin/usermaster', 21, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(171, 'Super Admin', 'SU', 'admin/usermaster', 22, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(172, 'Super Admin', 'SU', 'admin/usermaster', 23, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(173, 'Super Admin', 'SU', 'admin/usermaster', 5, 'N', 'N', 'N', 'N', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(174, 'Super Admin', 'SU', 'admin/usermaster', 24, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(175, 'Super Admin', 'SU', 'admin/usermaster', 25, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(176, 'Super Admin', 'SU', 'admin/usermaster', 26, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(177, 'Super Admin', 'SU', 'admin/usermaster', 27, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(178, 'Super Admin', 'SU', 'admin/usermaster', 28, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(179, 'Super Admin', 'SU', 'admin/usermaster', 6, 'N', 'N', 'N', 'N', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(180, 'Super Admin', 'SU', 'admin/usermaster', 29, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(181, 'Super Admin', 'SU', 'admin/usermaster', 30, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(182, 'Super Admin', 'SU', 'admin/usermaster', 31, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(183, 'Super Admin', 'SU', 'admin/usermaster', 32, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(184, 'Super Admin', 'SU', 'admin/usermaster', 33, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(185, 'Super Admin', 'SU', 'admin/usermaster', 34, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(186, 'Super Admin', 'SU', 'admin/usermaster', 7, 'N', 'N', 'N', 'N', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(187, 'Super Admin', 'SU', 'admin/usermaster', 35, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(188, 'Super Admin', 'SU', 'admin/usermaster', 36, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(189, 'Super Admin', 'SU', 'admin/usermaster', 8, 'N', 'N', 'N', 'N', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(190, 'Super Admin', 'SU', 'admin/usermaster', 37, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(191, 'Super Admin', 'SU', 'admin/usermaster', 38, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(192, 'Super Admin', 'SU', 'admin/usermaster', 39, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(193, 'Super Admin', 'SU', 'admin/usermaster', 9, 'N', 'N', 'N', 'N', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(194, 'Super Admin', 'SU', 'admin/usermaster', 40, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(195, 'Super Admin', 'SU', 'admin/usermaster', 41, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(196, 'Super Admin', 'SU', 'admin/usermaster', 42, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(197, 'Super Admin', 'SU', 'admin/usermaster', 43, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(198, 'Super Admin', 'SU', 'admin/usermaster', 44, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(199, 'Super Admin', 'SU', 'admin/usermaster', 45, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(200, 'Super Admin', 'SU', 'admin/usermaster', 46, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(201, 'Super Admin', 'SU', 'admin/usermaster', 47, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(202, 'Super Admin', 'SU', 'admin/usermaster', 10, 'N', 'N', 'N', 'N', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(203, 'Super Admin', 'SU', 'admin/usermaster', 48, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(204, 'Super Admin', 'SU', 'admin/usermaster', 49, 'Y', 'Y', 'Y', 'Y', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_role_master_meta`
--

CREATE TABLE IF NOT EXISTS `user_role_master_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role_master_meta`
--

INSERT INTO `user_role_master_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'role_id', 'Role id', 12, 2, 1, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(2, 'role_name', 'Role name', 9, 1, 2, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(3, 'role_code', 'Role code', NULL, 1, 3, 'select CONCAT(menu_navigate_url,''-'',menu_text) as options from menu_master\nwhere menu_parent_id !=0;', '4', NULL, 1, 1, NULL, NULL, NULL),
(4, 'role_url', 'Role url', 15, 1, 4, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(5, 'role_menu_ids', 'Role menu ids', NULL, 2, 5, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(6, 'role_menu_insert', 'Role menu insert', NULL, 2, 6, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(7, 'role_menu_update', 'Role menu update', NULL, 2, 7, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(8, 'role_menu_delete', 'Role menu delete', NULL, 2, 8, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(9, 'role_menu_export', 'Role menu export', NULL, 2, 9, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(10, 'user_created_by', 'User created by', 9, 2, 10, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(11, 'user_created_date', 'User created date', NULL, 2, 11, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(12, 'user_modified_by', 'User modified by', 9, 2, 12, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(13, 'user_modified_date', 'User modified date', NULL, 2, 13, NULL, '4', NULL, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_structure`
--

CREATE TABLE IF NOT EXISTS `user_structure` (
`user_struct_id` int(11) NOT NULL,
  `user_parent_id` int(11) NOT NULL,
  `user_position_name` varchar(200) NOT NULL,
  `user_emp_code` varchar(200) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_structure`
--

INSERT INTO `user_structure` (`user_struct_id`, `user_parent_id`, `user_position_name`, `user_emp_code`, `user_created_by`, `user_created_date`, `user_modified_by`, `user_modified_date`) VALUES
(1, 0, 'Director', 'E001', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(2, 1, 'Admin', 'C001', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(3, 2, 'Admin Head', 'C002', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_structure_meta`
--

CREATE TABLE IF NOT EXISTS `user_structure_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_structure_meta`
--

INSERT INTO `user_structure_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'user_struct_id', 'User struct id', 12, 1, 1, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(2, 'user_parent_id', 'User parent id', 15, 1, 2, 'select CONCAT(user_struct_id,''-'',user_position_name) as options from user_structure', '3', NULL, 1, 1, NULL, NULL, NULL),
(3, 'user_position_name', 'User position name', 1, 1, 3, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(4, 'user_emp_code', 'User emp code', 15, 1, 4, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '3', NULL, 1, 1, NULL, NULL, NULL),
(5, 'user_created_by', 'User created by', 9, 2, 5, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(6, 'user_created_date', 'User created date', NULL, 2, 6, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(7, 'user_modified_by', 'User modified by', 9, 2, 7, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(8, 'user_modified_date', 'User modified date', NULL, 2, 8, NULL, '4', NULL, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_sup_assign_master`
--

CREATE TABLE IF NOT EXISTS `user_sup_assign_master` (
`user_sup_assign_id` int(11) unsigned NOT NULL,
  `user_client_code` varchar(300) NOT NULL,
  `user_client_branch_code` varchar(300) NOT NULL,
  `user_code` varchar(100) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_sup_assign_master`
--

INSERT INTO `user_sup_assign_master` (`user_sup_assign_id`, `user_client_code`, `user_client_branch_code`, `user_code`, `user_created_by`, `user_created_date`, `user_modified_by`, `user_modified_date`) VALUES
(1, 'C001', 'CB01', 'U004', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_sup_assign_master_meta`
--

CREATE TABLE IF NOT EXISTS `user_sup_assign_master_meta` (
`meta_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `field_options` varchar(255) DEFAULT NULL,
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_sup_assign_master_meta`
--

INSERT INTO `user_sup_assign_master_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `form_show`, `form_order`, `field_options`, `field_col_sm_`, `field_validations`, `form_app_show`, `form_import_show`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'user_sup_assign_id', 'User sup assign id', 12, 1, 1, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(2, 'user_client_code', 'User client code', 19, 1, 2, 'select CONCAT(client_code,''-'',client_name) as options from client_master', '3', NULL, 1, 1, NULL, NULL, NULL),
(3, 'user_client_branch_code', 'User client branch code', 18, 1, 4, NULL, '3', NULL, 1, 1, NULL, NULL, NULL),
(4, 'user_code', 'User code', 18, 1, 3, '', '3', NULL, 1, 1, '', '', ''),
(5, 'user_created_by', 'User created by', 9, 2, 5, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(6, 'user_created_date', 'User created date', NULL, 2, 6, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(7, 'user_modified_by', 'User modified by', 9, 2, 7, NULL, '4', NULL, 1, 1, NULL, NULL, NULL),
(8, 'user_modified_date', 'User modified date', NULL, 2, 8, NULL, '4', NULL, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `z_tbl_product_1_1_1`
--

CREATE TABLE IF NOT EXISTS `z_tbl_product_1_1_1` (
  `product_id` varchar(300) NOT NULL,
  `product_item_id` int(11) NOT NULL,
  `sadsad` varchar(300) NOT NULL,
  `sdaasd` varchar(300) NOT NULL,
  `sadsa` varchar(300) NOT NULL,
  `sdas` varchar(300) NOT NULL,
  `sdass` varchar(300) NOT NULL,
  `sdasssadasdsa` varchar(300) NOT NULL,
  `asdsasadasdsadas` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `backup_master`
--
ALTER TABLE `backup_master`
 ADD PRIMARY KEY (`backup_id`);

--
-- Indexes for table `backup_master_meta`
--
ALTER TABLE `backup_master_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `client_branch`
--
ALTER TABLE `client_branch`
 ADD PRIMARY KEY (`client_branch_id`);

--
-- Indexes for table `client_branch_meta`
--
ALTER TABLE `client_branch_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `client_master`
--
ALTER TABLE `client_master`
 ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `client_master_meta`
--
ALTER TABLE `client_master_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
 ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `country_city`
--
ALTER TABLE `country_city`
 ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `country_city_meta`
--
ALTER TABLE `country_city_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `country_meta`
--
ALTER TABLE `country_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `country_state`
--
ALTER TABLE `country_state`
 ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `country_state_meta`
--
ALTER TABLE `country_state_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `country_subcenter`
--
ALTER TABLE `country_subcenter`
 ADD PRIMARY KEY (`subcenter_id`);

--
-- Indexes for table `country_subcenter_meta`
--
ALTER TABLE `country_subcenter_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `country_zone`
--
ALTER TABLE `country_zone`
 ADD PRIMARY KEY (`zone_id`);

--
-- Indexes for table `country_zone_meta`
--
ALTER TABLE `country_zone_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `emp`
--
ALTER TABLE `emp`
 ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `emp_dept`
--
ALTER TABLE `emp_dept`
 ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `emp_dept_meta`
--
ALTER TABLE `emp_dept_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `emp_design`
--
ALTER TABLE `emp_design`
 ADD PRIMARY KEY (`design_id`);

--
-- Indexes for table `emp_design_meta`
--
ALTER TABLE `emp_design_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `emp_meta`
--
ALTER TABLE `emp_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `field_master`
--
ALTER TABLE `field_master`
 ADD PRIMARY KEY (`field_id`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
 ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `file_meta`
--
ALTER TABLE `file_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `form`
--
ALTER TABLE `form`
 ADD PRIMARY KEY (`form_id`);

--
-- Indexes for table `form_edit`
--
ALTER TABLE `form_edit`
 ADD PRIMARY KEY (`form_edit_id`);

--
-- Indexes for table `form_edit_meta`
--
ALTER TABLE `form_edit_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `form_meta`
--
ALTER TABLE `form_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `holiday`
--
ALTER TABLE `holiday`
 ADD PRIMARY KEY (`holiday_id`);

--
-- Indexes for table `holiday_meta`
--
ALTER TABLE `holiday_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `import_master`
--
ALTER TABLE `import_master`
 ADD PRIMARY KEY (`import_id`);

--
-- Indexes for table `import_master_meta`
--
ALTER TABLE `import_master_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `menu_category`
--
ALTER TABLE `menu_category`
 ADD PRIMARY KEY (`menu_category_id`);

--
-- Indexes for table `menu_category_meta`
--
ALTER TABLE `menu_category_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `menu_master`
--
ALTER TABLE `menu_master`
 ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `menu_master_meta`
--
ALTER TABLE `menu_master_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `menu_sub_category`
--
ALTER TABLE `menu_sub_category`
 ADD PRIMARY KEY (`menu_sub_category_id`);

--
-- Indexes for table `menu_sub_category_meta`
--
ALTER TABLE `menu_sub_category_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
 ADD PRIMARY KEY (`product_item_id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
 ADD PRIMARY KEY (`product_category_id`);

--
-- Indexes for table `product_category_meta`
--
ALTER TABLE `product_category_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `product_feature_field_meta`
--
ALTER TABLE `product_feature_field_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `product_master`
--
ALTER TABLE `product_master`
 ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_master_meta`
--
ALTER TABLE `product_master_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `product_meta`
--
ALTER TABLE `product_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `product_sub_category`
--
ALTER TABLE `product_sub_category`
 ADD PRIMARY KEY (`product_sub_category_id`);

--
-- Indexes for table `product_sub_category_meta`
--
ALTER TABLE `product_sub_category_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `sql_master`
--
ALTER TABLE `sql_master`
 ADD PRIMARY KEY (`sql_id`);

--
-- Indexes for table `sql_master_meta`
--
ALTER TABLE `sql_master_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `user_assign_master`
--
ALTER TABLE `user_assign_master`
 ADD PRIMARY KEY (`user_assign_id`);

--
-- Indexes for table `user_assign_master_meta`
--
ALTER TABLE `user_assign_master_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `user_att_master`
--
ALTER TABLE `user_att_master`
 ADD PRIMARY KEY (`att_id`);

--
-- Indexes for table `user_master`
--
ALTER TABLE `user_master`
 ADD PRIMARY KEY (`user_id`), ADD UNIQUE KEY `user_name` (`user_name`);

--
-- Indexes for table `user_master_meta`
--
ALTER TABLE `user_master_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `user_role_master`
--
ALTER TABLE `user_role_master`
 ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `user_role_master_meta`
--
ALTER TABLE `user_role_master_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `user_structure`
--
ALTER TABLE `user_structure`
 ADD PRIMARY KEY (`user_struct_id`);

--
-- Indexes for table `user_structure_meta`
--
ALTER TABLE `user_structure_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `user_sup_assign_master`
--
ALTER TABLE `user_sup_assign_master`
 ADD PRIMARY KEY (`user_sup_assign_id`);

--
-- Indexes for table `user_sup_assign_master_meta`
--
ALTER TABLE `user_sup_assign_master_meta`
 ADD PRIMARY KEY (`meta_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `backup_master`
--
ALTER TABLE `backup_master`
MODIFY `backup_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `backup_master_meta`
--
ALTER TABLE `backup_master_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `client_branch`
--
ALTER TABLE `client_branch`
MODIFY `client_branch_id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `client_branch_meta`
--
ALTER TABLE `client_branch_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `client_master`
--
ALTER TABLE `client_master`
MODIFY `client_id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `client_master_meta`
--
ALTER TABLE `client_master_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `country_city`
--
ALTER TABLE `country_city`
MODIFY `city_id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `country_city_meta`
--
ALTER TABLE `country_city_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `country_meta`
--
ALTER TABLE `country_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `country_state`
--
ALTER TABLE `country_state`
MODIFY `state_id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `country_state_meta`
--
ALTER TABLE `country_state_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `country_subcenter`
--
ALTER TABLE `country_subcenter`
MODIFY `subcenter_id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `country_subcenter_meta`
--
ALTER TABLE `country_subcenter_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `country_zone`
--
ALTER TABLE `country_zone`
MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `country_zone_meta`
--
ALTER TABLE `country_zone_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `emp`
--
ALTER TABLE `emp`
MODIFY `emp_id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `emp_dept`
--
ALTER TABLE `emp_dept`
MODIFY `dept_id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `emp_dept_meta`
--
ALTER TABLE `emp_dept_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `emp_design`
--
ALTER TABLE `emp_design`
MODIFY `design_id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `emp_design_meta`
--
ALTER TABLE `emp_design_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `emp_meta`
--
ALTER TABLE `emp_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `field_master`
--
ALTER TABLE `field_master`
MODIFY `field_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
MODIFY `file_id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `file_meta`
--
ALTER TABLE `file_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `form_edit`
--
ALTER TABLE `form_edit`
MODIFY `form_edit_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=418;
--
-- AUTO_INCREMENT for table `form_edit_meta`
--
ALTER TABLE `form_edit_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `form_meta`
--
ALTER TABLE `form_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `holiday_meta`
--
ALTER TABLE `holiday_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `import_master`
--
ALTER TABLE `import_master`
MODIFY `import_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `import_master_meta`
--
ALTER TABLE `import_master_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `menu_category`
--
ALTER TABLE `menu_category`
MODIFY `menu_category_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `menu_category_meta`
--
ALTER TABLE `menu_category_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `menu_master`
--
ALTER TABLE `menu_master`
MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `menu_master_meta`
--
ALTER TABLE `menu_master_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `menu_sub_category`
--
ALTER TABLE `menu_sub_category`
MODIFY `menu_sub_category_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `menu_sub_category_meta`
--
ALTER TABLE `menu_sub_category_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
MODIFY `product_item_id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
MODIFY `product_category_id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `product_category_meta`
--
ALTER TABLE `product_category_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `product_feature_field_meta`
--
ALTER TABLE `product_feature_field_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `product_master`
--
ALTER TABLE `product_master`
MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `product_master_meta`
--
ALTER TABLE `product_master_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `product_meta`
--
ALTER TABLE `product_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `product_sub_category`
--
ALTER TABLE `product_sub_category`
MODIFY `product_sub_category_id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `product_sub_category_meta`
--
ALTER TABLE `product_sub_category_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `sql_master`
--
ALTER TABLE `sql_master`
MODIFY `sql_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sql_master_meta`
--
ALTER TABLE `sql_master_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `user_assign_master`
--
ALTER TABLE `user_assign_master`
MODIFY `user_assign_id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user_assign_master_meta`
--
ALTER TABLE `user_assign_master_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `user_att_master`
--
ALTER TABLE `user_att_master`
MODIFY `att_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_master`
--
ALTER TABLE `user_master`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `user_master_meta`
--
ALTER TABLE `user_master_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `user_role_master`
--
ALTER TABLE `user_role_master`
MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=205;
--
-- AUTO_INCREMENT for table `user_role_master_meta`
--
ALTER TABLE `user_role_master_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `user_structure`
--
ALTER TABLE `user_structure`
MODIFY `user_struct_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user_structure_meta`
--
ALTER TABLE `user_structure_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `user_sup_assign_master`
--
ALTER TABLE `user_sup_assign_master`
MODIFY `user_sup_assign_id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_sup_assign_master_meta`
--
ALTER TABLE `user_sup_assign_master_meta`
MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
