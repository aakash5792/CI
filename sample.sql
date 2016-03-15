-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 29, 2016 at 07:38 PM
-- Server version: 5.6.28-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sample`
--

-- --------------------------------------------------------

--
-- Table structure for table `client_branch_master`
--

CREATE TABLE IF NOT EXISTS `client_branch_master` (
  `client_branch_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_name` varchar(250) NOT NULL,
  `client_branch_code` varchar(10) NOT NULL,
  `client_branch_name` varchar(250) NOT NULL,
  `client_branch_process` varchar(150) NOT NULL,
  `client_latitude` float NOT NULL,
  `client_longitude` float NOT NULL,
  `client_address` varchar(500) NOT NULL,
  `client_accuracy` float NOT NULL,
  `client_radius` float NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` date NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` date NOT NULL,
  PRIMARY KEY (`client_branch_id`),
  UNIQUE KEY `client_branch_name` (`client_branch_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `client_branch_master`
--

INSERT INTO `client_branch_master` (`client_branch_id`, `client_name`, `client_branch_code`, `client_branch_name`, `client_branch_process`, `client_latitude`, `client_longitude`, `client_address`, `client_accuracy`, `client_radius`, `user_created_by`, `user_created_date`, `user_modified_by`, `user_modified_date`) VALUES
(1, 'C001', 'CB01', 'Wadala', '2 WHEELER', 19.0125, 72.8495, '325, MMGS Marg, Old bdd chawl, Naigaon, Dadar, Mumbai, Maharashtra 400014, India', 30.103, 100, 'U001', '2015-12-24', '', '0000-00-00'),
(2, 'C001', 'CB02', 'Borivali', '2 WHEELER', 19.2372, 72.8441, '66, Yogi Nagar, Borivali West, Mumbai, Maharashtra 400091, India', 40.5, 100, 'U001', '2015-12-24', '', '0000-00-00'),
(3, 'C001', 'CB03', 'Andheri', '2 WHEELER', 19.1136, 72.8697, 'Ram Krishna Mandir Rd, MIDC Industrial Estate, Bhim Nagar, Andheri East, Mumbai, Maharashtra 400069, India', 42, 100, 'U001', '2015-12-24', '', '0000-00-00'),
(4, 'C001', 'CB04', 'Dadar', '2 WHEELER', 19.0142, 72.8426, '202, Dada Saheb Phalke Marg, Gautam Nagar, Dadar, Mumbai, Maharashtra 400014, India', 36, 100, 'U001', '2015-12-24', '', '0000-00-00'),
(5, 'C001', 'CB05', 'Goregaon', '2 WHEELER', 19.1551, 72.8679, '13, Aarey Colony, Goregaon, Mumbai, Maharashtra 400065, India', 39, 100, 'U004', '2015-12-24', '', '0000-00-00'),
(6, 'C001', 'CB06', 'Parel', '2 WHEELER', 19.0022, 72.8416, 'GSMC, Parel, Mumbai, Maharashtra 400012, India', 40.5, 100, 'U005', '2015-12-24', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `client_master`
--

CREATE TABLE IF NOT EXISTS `client_master` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_code` varchar(10) NOT NULL,
  `client_name` varchar(100) NOT NULL,
  `client_country` varchar(100) NOT NULL,
  `client_state` varchar(100) NOT NULL,
  `client_city` varchar(100) NOT NULL,
  `client_Address` varchar(500) NOT NULL,
  `client_pincode` varchar(10) NOT NULL,
  `client_person_nm` varchar(100) NOT NULL,
  `client_cont_no1` varchar(15) NOT NULL,
  `client_cont_no2` varchar(15) NOT NULL,
  `client_email_id` varchar(100) NOT NULL,
  `client_website` varchar(200) NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `client_master`
--

INSERT INTO `client_master` (`client_id`, `client_code`, `client_name`, `client_country`, `client_state`, `client_city`, `client_Address`, `client_pincode`, `client_person_nm`, `client_cont_no1`, `client_cont_no2`, `client_email_id`, `client_website`) VALUES
(1, 'C001', 'HDFC', 'India', 'India', 'Mumbai', 'Client address', '400031', 'Hdfc poc', '12334', '12345', 'hdfcpoc@hdfc.com', 'Www.hdfc.com'),
(2, 'C002', 'PAMAC', 'India', 'Maharashtra', 'Mumbai', 'Client address', '400031', 'Pamac poc', '3141623', '314173', 'pamacpoc@pamac.com', 'Www.Pamac.com');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) DEFAULT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `isd_code` varchar(50) DEFAULT NULL,
  `currancy` varchar(20) DEFAULT NULL,
  `country_order` int(11) DEFAULT NULL,
  `country_status` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_id` int(11) DEFAULT NULL,
  `modified_id` int(11) DEFAULT NULL,
  `time_zone` varchar(100) DEFAULT NULL,
  `emp_prefix` varchar(100) DEFAULT NULL,
  `emp_startfrom` varchar(100) DEFAULT NULL,
  `emp` varchar(100) DEFAULT NULL,
  `cluster` varchar(100) DEFAULT NULL,
  `centre` varchar(100) DEFAULT NULL,
  `subcentre` varchar(100) DEFAULT NULL,
  `product` varchar(100) DEFAULT NULL,
  `verification_type` varchar(100) DEFAULT NULL,
  `cmp_name` varchar(100) DEFAULT NULL,
  `cmp_logo` varchar(255) DEFAULT NULL,
  `cmp_seal` varchar(255) DEFAULT NULL,
  `cmp_addr` text,
  `cmp_phone_no` varchar(20) DEFAULT NULL,
  `cmp_seal2` varchar(255) DEFAULT NULL,
  `show_only_close_cases` int(11) DEFAULT NULL,
  PRIMARY KEY (`country_id`),
  KEY `country_name` (`country_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_name`, `country_code`, `isd_code`, `currancy`, `country_order`, `country_status`, `created_date`, `modified_date`, `created_id`, `modified_id`, `time_zone`, `emp_prefix`, `emp_startfrom`, `emp`, `cluster`, `centre`, `subcentre`, `product`, `verification_type`, `cmp_name`, `cmp_logo`, `cmp_seal`, `cmp_addr`, `cmp_phone_no`, `cmp_seal2`, `show_only_close_cases`) VALUES
(11, 'India', 'INR', '91', 'INR', NULL, NULL, '2014-11-11 11:34:16', '2015-07-23 18:09:47', 7, 7, 'Pacific/Midway', NULL, NULL, '1', 'Region/Zone', 'Centre', 'Sub Center', 'Product', 'Verification type', NULL, '11_cmp_logo_.png', '11_cmp_seal_.png', NULL, NULL, '11_cmp_seal2_.png', 1),
(12, 'United Arab Emirates', 'UAE', '91', 'UAE', NULL, NULL, '2015-01-19 13:15:51', '2015-12-04 09:37:34', 7, 7, '\n                        Etc/GMT+10', NULL, NULL, '1', 'Region/Zone', 'Centre', 'Sub Center', 'Product', 'Verification type', NULL, '12_cmp_logo_.png', NULL, NULL, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `country_meta`
--

CREATE TABLE IF NOT EXISTS `country_meta` (
  `meta_id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `field_options` varchar(255) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `field_default` varchar(150) DEFAULT NULL COMMENT 'Default value for field',
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`meta_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `country_meta`
--

INSERT INTO `country_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `field_options`, `field_validations`, `field_default`, `field_col_sm_`, `form_show`, `form_order`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'country_id', 'Country Id', 12, NULL, NULL, NULL, '6', 1, 1, NULL, NULL, NULL),
(2, 'country_name', 'Country Name', 1, NULL, 'required|callback_duplicate[country_name]', NULL, '6', 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `country_zone`
--

CREATE TABLE IF NOT EXISTS `country_zone` (
  `country_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `country_zone_name` varchar(255) DEFAULT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` date NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` date NOT NULL,
  PRIMARY KEY (`country_zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `country_zone_meta`
--

CREATE TABLE IF NOT EXISTS `country_zone_meta` (
  `meta_id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `field_options` varchar(255) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `field_default` varchar(150) DEFAULT NULL COMMENT 'Default value for field',
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`meta_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `country_zone_meta`
--

INSERT INTO `country_zone_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `field_options`, `field_validations`, `field_default`, `field_col_sm_`, `form_show`, `form_order`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'country_zone_id', 'Country Zone Id', 12, NULL, NULL, NULL, '4', 1, 1, NULL, NULL, NULL),
(2, 'country_id', 'Country Id', 3, NULL, NULL, NULL, '4', 1, 1, NULL, NULL, NULL),
(3, 'country_zone_name', 'Country Zone Name', 1, NULL, 'required|callback_duplicate[country_name]', NULL, '4', 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `field_master`
--

CREATE TABLE IF NOT EXISTS `field_master` (
  `field_id` int(11) NOT NULL AUTO_INCREMENT,
  `field_type` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `constraint` varchar(100) NOT NULL,
  `unsigned` varchar(100) NOT NULL,
  `auto_Increment` varchar(100) NOT NULL,
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `field_master`
--

INSERT INTO `field_master` (`field_id`, `field_type`, `type`, `constraint`, `unsigned`, `auto_Increment`) VALUES
(1, 'text', 'varchar', '300', '', ''),
(2, 'select', 'varchar', '500', '', ''),
(3, 'textarea', 'text', '', '', ''),
(4, 'radio', 'varchar', '350', '', ''),
(5, 'checkbox', 'text', '400', '', ''),
(6, 'date', 'date', '', '', ''),
(7, 'datetime', 'datetime', '', '', ''),
(8, 'time', 'time', '', '', ''),
(9, 'readonly', 'varchar', '250', '', ''),
(10, 'file', 'varchar', '200', '', ''),
(11, 'multiselect', 'varchar', '600', '', ''),
(12, 'primary key', 'int', '11', 'true', 'true'),
(13, 'decimal number', 'float', '18,2', '', ''),
(14, 'number', 'int', '4', '', ''),
(15, 'select', 'varchar', '800', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `form`
--

CREATE TABLE IF NOT EXISTS `form` (
  `form_id` int(11) NOT NULL AUTO_INCREMENT,
  `form_name` varchar(300) NOT NULL,
  `form_table_name` varchar(300) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` datetime NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` datetime NOT NULL,
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `form_meta`
--

CREATE TABLE IF NOT EXISTS `form_meta` (
  `meta_id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `field_options` varchar(255) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `field_query` varchar(500) DEFAULT NULL COMMENT 'Default value for field',
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`meta_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `form_meta`
--

INSERT INTO `form_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `field_options`, `field_validations`, `field_query`, `field_col_sm_`, `form_show`, `form_app_show`, `form_import_show`, `form_order`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'form_name', 'Form name', 1, NULL, NULL, NULL, '4', 1, 1, 1, 2, NULL, NULL, NULL),
(2, 'form_table_name', 'Form table name', 1, NULL, NULL, NULL, '4', 1, 1, 1, 3, NULL, NULL, NULL),
(3, 'user_created_by', 'User created by', 9, NULL, NULL, NULL, '4', 2, 1, 2, 4, NULL, NULL, NULL),
(4, 'user_modified_by', 'User modified by', 9, NULL, NULL, NULL, '4', 2, 1, 2, 6, NULL, NULL, NULL),
(5, 'form_id', 'Form id', 12, NULL, NULL, NULL, '4', 1, 1, 1, 1, NULL, NULL, NULL),
(6, 'user_created_date', 'User created date', NULL, NULL, NULL, NULL, '4', 2, 1, 2, 5, NULL, NULL, NULL),
(7, 'user_modified_date', 'User modified date', NULL, NULL, NULL, NULL, '4', 2, 1, 2, 7, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu_category`
--

CREATE TABLE IF NOT EXISTS `menu_category` (
  `menu_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_category_name` varchar(100) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` date NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` date NOT NULL,
  PRIMARY KEY (`menu_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `menu_category`
--

INSERT INTO `menu_category` (`menu_category_id`, `menu_category_name`, `user_created_by`, `user_created_date`, `user_modified_by`, `user_modified_date`) VALUES
(1, 'Admin', '', '0000-00-00', '', '0000-00-00'),
(2, 'Menu', '', '0000-00-00', '', '0000-00-00'),
(3, 'Assign', '', '0000-00-00', '', '0000-00-00'),
(4, 'Client', '', '0000-00-00', '', '0000-00-00'),
(5, 'Attendance', '', '0000-00-00', '', '0000-00-00'),
(6, 'Location', '', '0000-00-00', '', '0000-00-00'),
(7, 'Form', '', '0000-00-00', '', '0000-00-00'),
(8, 'Products', '', '0000-00-00', '', '0000-00-00'),
(9, 'Files', '', '0000-00-00', '', '0000-00-00'),
(10, 'Template', '', '0000-00-00', '', '0000-00-00'),
(11, 'Reports', '', '0000-00-00', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `menu_category_meta`
--

CREATE TABLE IF NOT EXISTS `menu_category_meta` (
  `meta_id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `field_options` varchar(255) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `field_default` varchar(150) DEFAULT NULL COMMENT 'Default value for field',
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`meta_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `menu_category_meta`
--

INSERT INTO `menu_category_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `field_options`, `field_validations`, `field_default`, `field_col_sm_`, `form_show`, `form_order`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'menu_category_id', 'Menu Category Id', 12, NULL, NULL, NULL, '6', 1, 1, NULL, NULL, 'readonly'),
(2, 'menu_category_name', 'Menu Category Name', 1, NULL, 'required|callback_duplicate[menu_category_name]', NULL, '6', 1, 2, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `menu_master`
--

CREATE TABLE IF NOT EXISTS `menu_master` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_text` varchar(100) DEFAULT NULL,
  `menu_parent_id` int(11) DEFAULT NULL,
  `menu_navigate_url` varchar(2000) DEFAULT NULL,
  `menu_sequence` int(11) DEFAULT NULL,
  `menu_product` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=69 ;

--
-- Dumping data for table `menu_master`
--

INSERT INTO `menu_master` (`menu_id`, `menu_text`, `menu_parent_id`, `menu_navigate_url`, `menu_sequence`, `menu_product`) VALUES
(1, 'Admin', 0, '#', 1, 'attendance'),
(2, 'Menu', 0, '#', 2, 'attendance'),
(3, 'Assign', 0, '#', 3, 'attendance'),
(4, 'Client', 0, '#', 4, 'attendance'),
(5, 'Attendance', 0, '#', 5, 'attendance'),
(6, 'Location', 0, '#', 6, 'attendance'),
(7, 'Form', 0, '#', 7, 'attendance'),
(8, 'Products', 0, '#', 8, 'attendance'),
(9, 'Files', 0, '#', 9, 'attendance'),
(10, 'Template', 0, '#', 10, 'attendance'),
(11, 'Reports', 0, '#', 11, 'attendance'),
(12, 'User Master', 1, 'admin/usermaster', 1, 'attendance'),
(13, 'Role Master', 1, 'admin/rolemaster', 2, 'attendance'),
(14, 'Menu Category Master', 2, 'menu/menucat', 1, 'attendance'),
(15, 'Menu Sub Category Master', 2, 'menu/menusubcat', 2, 'attendance'),
(16, 'Menu Master', 2, 'menu/menumaster', 3, 'attendance'),
(17, 'Mark Attendance', 5, 'attendance/markattendance', 1, 'attendance'),
(18, 'Review Attendance', 5, 'attendance/markattendance/viewattendance', 2, 'attendance'),
(19, 'Client Branch Master', 4, 'client/clientbranchmaster/', 1, 'attendance'),
(20, 'Client Branch Registeration', 4, 'client/clientbranchmaster/regclient', 2, 'attendance'),
(21, 'Client Master', 4, 'client/clientmaster', 1, 'attendance'),
(22, 'Mark Group Attendance', 5, 'attendance/markgroupattendance/', 3, 'attendance'),
(23, 'User Structure Master', 1, 'admin/userstructure/', 5, 'attendance'),
(24, 'Table Backup', 1, 'admin/db/', 6, 'attendance'),
(25, 'Sql Query', 1, 'admin/sql', 7, 'attendance'),
(26, 'Import Master', 1, 'admin/import', 8, 'attendance'),
(27, 'File Upload', 9, 'file/fileupload', 1, 'attendance'),
(28, 'File View', 9, 'file/fileview', 2, 'attendance'),
(29, 'Product Category', 8, 'product/productcategory/', 1, 'attendance'),
(30, 'Product Sub Category', 8, 'product/productsubcategory/', 2, 'attendance'),
(31, 'Products master ', 8, 'product/productmaster/', 3, 'attendance'),
(32, 'Product Feature Master', 8, 'product/productfeaturemaster/', 6, 'attendance'),
(33, 'Add Product Details', 8, 'product/productdetails/', 5, 'attendance'),
(34, 'Country Master', 6, 'location/country', 1, 'attendance'),
(36, 'Form Create', 7, 'form/form', 1, 'attendance'),
(37, 'User Assign Master', 3, 'admin/userassignmaster', 1, 'attendance'),
(38, 'User Sup Assign Master', 3, 'admin/usersupassignmaster', 2, 'attendance'),
(64, 'Zone', 6, 'location/zone', 2, 'attendance'),
(65, 'State', 6, 'location/state', 3, 'attendance'),
(66, 'City', 6, 'location/city', 4, 'attendance'),
(67, 'Sub Center', 6, 'location/subcenter', 5, 'attendance'),
(68, 'Form Edit', 7, 'form/formedit', 2, 'attendance');

-- --------------------------------------------------------

--
-- Table structure for table `menu_master_meta`
--

CREATE TABLE IF NOT EXISTS `menu_master_meta` (
  `meta_id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `field_options` varchar(255) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `field_query` varchar(500) DEFAULT NULL COMMENT 'Default value for field',
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`meta_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `menu_master_meta`
--

INSERT INTO `menu_master_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `field_options`, `field_validations`, `field_query`, `field_col_sm_`, `form_show`, `form_app_show`, `form_import_show`, `form_order`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'menu_id', 'Menu id', 12, NULL, NULL, NULL, '2', 1, 1, 1, 1, NULL, NULL, NULL),
(2, 'menu_text', 'Menu text', 9, NULL, NULL, NULL, '5', 1, 1, 1, 3, NULL, NULL, NULL),
(3, 'menu_parent_id', 'Menu parent id', 3, NULL, NULL, NULL, '5', 1, 1, 1, 2, NULL, NULL, NULL),
(4, 'menu_navigate_url', 'Menu navigate url', 9, NULL, NULL, NULL, '12', 1, 1, 1, 4, NULL, NULL, NULL),
(5, 'menu_sequence', 'Menu sequence', 9, NULL, NULL, NULL, '6', 1, 1, 1, 5, NULL, NULL, NULL),
(6, 'menu_product', 'Menu product', 9, NULL, NULL, NULL, '6', 1, 1, 1, 6, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu_sub_category`
--

CREATE TABLE IF NOT EXISTS `menu_sub_category` (
  `menu_sub_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_category_id` int(11) NOT NULL,
  `menu_sub_category_name` varchar(100) NOT NULL,
  `menu_sub_category_url` varchar(1000) NOT NULL,
  `menu_sub_category_seq` int(11) NOT NULL,
  PRIMARY KEY (`menu_sub_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `menu_sub_category`
--

INSERT INTO `menu_sub_category` (`menu_sub_category_id`, `menu_category_id`, `menu_sub_category_name`, `menu_sub_category_url`, `menu_sub_category_seq`) VALUES
(1, 1, 'User Master', 'admin/usermaster', 1),
(2, 1, 'Role Master', 'admin/rolemaster', 2),
(5, 2, 'Menu Category Master', 'menu/menucat', 1),
(6, 2, 'Menu Sub Category Master', 'menu/menusubcat', 2),
(7, 2, 'Menu Master', 'menu/menumaster', 3),
(8, 5, 'Mark Attendance', 'attendance/markattendance', 1),
(9, 5, 'Review Attendance', 'attendance/markattendance/viewattendance', 2),
(10, 4, 'Client Branch Master', 'client/clientbranchmaster/', 1),
(11, 4, 'Client Branch Registeration', 'client/clientbranchmaster/regclient', 2),
(12, 4, 'Client Master', 'client/clientmaster', 1),
(13, 5, 'Mark Group Attendance', 'attendance/markgroupattendance/', 3),
(15, 1, 'User Structure Master', 'admin/userstructure/', 5),
(16, 1, 'Table Backup', 'admin/db/', 6),
(19, 1, 'Sql Query', 'admin/sql', 7),
(20, 1, 'Import Master', 'admin/import', 8),
(21, 9, 'File Upload', 'file/fileupload', 1),
(22, 9, 'File View', 'file/fileview', 2),
(23, 8, 'Product Category', 'product/productcategory/', 1),
(24, 8, 'Product Sub Category', 'product/productsubcategory/', 2),
(25, 8, 'Products master ', 'product/productmaster/', 3),
(28, 8, 'Product Feature Master', 'product/productfeaturemaster/', 6),
(29, 8, 'Add Product Details', 'product/productdetails/', 5),
(30, 6, 'Country Master', 'location/country', 1),
(31, 7, 'Form Edit', 'form/formedit', 2),
(32, 7, 'Form Create', 'form/form', 1),
(33, 3, 'User Assign Master', 'admin/userassignmaster', 1),
(34, 3, 'User Sup Assign Master', 'admin/usersupassignmaster', 2),
(35, 6, 'State', 'location/state', 3),
(36, 6, 'Zone', 'location/zone', 2),
(37, 6, 'City', 'location/city', 4),
(38, 6, 'Sub Center', 'location/subcenter', 5);

-- --------------------------------------------------------

--
-- Table structure for table `menu_sub_category_meta`
--

CREATE TABLE IF NOT EXISTS `menu_sub_category_meta` (
  `meta_id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `field_options` varchar(255) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `field_query` varchar(500) DEFAULT NULL COMMENT 'Default value for field',
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`meta_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `menu_sub_category_meta`
--

INSERT INTO `menu_sub_category_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `field_options`, `field_validations`, `field_query`, `field_col_sm_`, `form_show`, `form_app_show`, `form_import_show`, `form_order`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'menu_sub_category_id', 'Menu sub category id', 12, NULL, NULL, NULL, '4', 1, 1, 1, 1, NULL, NULL, NULL),
(2, 'menu_category_id', 'Menu category id', 3, NULL, NULL, NULL, '4', 1, 1, 1, 2, NULL, NULL, NULL),
(3, 'menu_sub_category_name', 'Menu sub category name', 1, NULL, NULL, NULL, '4', 1, 1, 1, 3, NULL, NULL, NULL),
(4, 'menu_sub_category_url', 'Menu sub category url', 1, NULL, NULL, NULL, '4', 1, 1, 1, 4, NULL, NULL, NULL),
(5, 'menu_sub_category_seq', 'Menu sub category seq', 1, NULL, NULL, NULL, '4', 1, 1, 1, 5, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE IF NOT EXISTS `product_category` (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category_name` varchar(100) NOT NULL,
  PRIMARY KEY (`product_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`product_category_id`, `product_category_name`) VALUES
(1, 'Mobile & Accessories'),
(2, 'Mens');

-- --------------------------------------------------------

--
-- Table structure for table `product_category_meta`
--

CREATE TABLE IF NOT EXISTS `product_category_meta` (
  `meta_id` int(11) NOT NULL DEFAULT '0',
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `field_options` varchar(255) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `field_query` varchar(500) DEFAULT NULL COMMENT 'Default value for field',
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_feature_field_master`
--

CREATE TABLE IF NOT EXISTS `product_feature_field_master` (
  `field_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `field_name` varchar(150) DEFAULT NULL,
  `field_col_sm_` varchar(5) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` varchar(50) NOT NULL COMMENT '1-input, 2-textarea, 3-select, 4-checkbox, 5-radio, 6-upload, 7-primary_key, 8-\r\n\r\ntbl_name, 9-fix, 10-date, 11-datetime',
  `field_options` varchar(255) DEFAULT NULL,
  `field_default` varchar(150) DEFAULT NULL COMMENT 'Default value for field',
  `field_validations` varchar(255) DEFAULT NULL,
  `onchange` varchar(250) DEFAULT NULL,
  `created_by` varchar(250) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(250) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `product_feature_field_master`
--

INSERT INTO `product_feature_field_master` (`field_id`, `product_id`, `field_name`, `field_col_sm_`, `field_label`, `field_type`, `field_options`, `field_default`, `field_validations`, `onchange`, `created_by`, `created_date`, `modified_by`, `modified_date`) VALUES
(1, 0, 'product_id', '4', 'Product Id', 'number', '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(2, 0, 'product_name', '4', 'Product Name', 'text', '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(3, 0, 'product_sku', '4', 'Product Sku Code', 'text', '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(4, 0, 'product_desc', '12', 'Product Description', 'textarea', '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(5, 0, 'product_price', '3', 'Product Price', 'text', '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(6, 0, 'product_brand', '3', 'Product Brand', 'text', '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(7, 0, 'product_quatity_avail', '3', 'Product Available Quantity', 'text', '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(8, 0, 'product_discount', '3', 'Product Discount', 'text', '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(9, 0, 'supplier_id', '6', 'Supplier Name', 'number', '1-Sony,2-Samsung', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(10, 0, 'product_status', '6', 'Product Status', 'text', '1-yes,2-No', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_master`
--

CREATE TABLE IF NOT EXISTS `product_master` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category_id` int(11) NOT NULL,
  `product_sub_category_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `product_master`
--

INSERT INTO `product_master` (`product_id`, `product_category_id`, `product_sub_category_id`, `product_name`) VALUES
(5, 1, 1, 'smart');

-- --------------------------------------------------------

--
-- Table structure for table `product_sub_category`
--

CREATE TABLE IF NOT EXISTS `product_sub_category` (
  `product_sub_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category_id` int(11) NOT NULL,
  `product_sub_category_name` varchar(100) NOT NULL,
  `product_sub_category_seq` int(11) NOT NULL,
  PRIMARY KEY (`product_sub_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `product_sub_category`
--

INSERT INTO `product_sub_category` (`product_sub_category_id`, `product_category_id`, `product_sub_category_name`, `product_sub_category_seq`) VALUES
(1, 1, 'Mobile', 1),
(2, 1, 'Tablet', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_assign_master`
--

CREATE TABLE IF NOT EXISTS `user_assign_master` (
  `user_assign_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_code` varchar(10) NOT NULL,
  `client_branch_code` varchar(10) NOT NULL,
  `user_code` varchar(10) NOT NULL,
  `user_role_code` varchar(10) NOT NULL,
  PRIMARY KEY (`user_assign_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `user_assign_master`
--

INSERT INTO `user_assign_master` (`user_assign_id`, `client_code`, `client_branch_code`, `user_code`, `user_role_code`) VALUES
(1, 'C001', 'CB01', 'U006', 'FS'),
(2, 'C001', 'CB02', 'U007', 'FS'),
(3, 'C001', 'CB03', 'U008', 'FS'),
(4, 'C001', 'CB04', 'U009', 'FS'),
(5, 'C001', 'CB05', 'U0010', 'FS'),
(6, 'C001', 'CB06', 'U0011', 'FS');

-- --------------------------------------------------------

--
-- Table structure for table `user_att_master`
--

CREATE TABLE IF NOT EXISTS `user_att_master` (
  `att_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `user_created_date` date NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` date NOT NULL,
  PRIMARY KEY (`att_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user_att_master`
--

INSERT INTO `user_att_master` (`att_id`, `att_date`, `client_name`, `client_branch_code`, `client_branch_name`, `client_branch_process`, `client_latitude`, `client_longitude`, `user_code`, `field_executive`, `attendance_status`, `user_name`, `user_latitude`, `user_longitude`, `user_accuracy`, `user_radius`, `user_address`, `user_reason`, `user_visit_branch`, `user_created_by`, `user_created_date`, `user_modified_by`, `user_modified_date`) VALUES
(1, '2015-12-24 00:24:56', 'C001', 'CB01', 'Wadala', '2 WHEELER', 19.0125, 72.8495, 'U006', 'Fs1 Na', 'P', 'fs1', 19.0125, 72.8495, 43.5, 100, '325, MMGS Marg, Old bdd chawl, Naigaon, Dadar, Mumbai, Maharashtra 400014, India', '', '', 'U006', '2015-12-24', 'U006', '2015-12-24'),
(2, '2015-12-24 00:25:25', 'C001', 'CB02', 'Borivali', '2 WHEELER', 19.2372, 72.8441, 'U007', 'Fs2 Na', 'P', 'fs2', 19.0125, 72.8495, 37.5, 100, '325, MMGS Marg, Old bdd chawl, Naigaon, Dadar, Mumbai, Maharashtra 400014, India', 'Field Activity for the day', '', 'U007', '2015-12-24', 'U007', '2015-12-24'),
(3, '2015-12-24 00:26:33', 'C001', 'CB03', 'Andheri', '2 WHEELER', 19.1136, 72.8697, 'U008', 'Fs3 Na', 'P', 'fs3', 19.0125, 72.8495, 45, 100, '325, MMGS Marg, Old bdd chawl, Naigaon, Dadar, Mumbai, Maharashtra 400014, India', 'Deputed At Other Location', 'Hdfc wadala branch', 'U008', '2015-12-24', 'U008', '2015-12-24'),
(4, '2015-12-24 00:27:19', 'C001', 'CB04', 'Dadar', '2 WHEELER', 19.0142, 72.8426, 'U009', 'Fs4 Na', 'P', 'fs4', 19.0125, 72.8495, 45, 100, '325, MMGS Marg, Old bdd chawl, Naigaon, Dadar, Mumbai, Maharashtra 400014, India', 'Location Error', '', 'U009', '2015-12-24', 'U009', '2015-12-24');

-- --------------------------------------------------------

--
-- Table structure for table `user_master`
--

CREATE TABLE IF NOT EXISTS `user_master` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_first_name` varchar(100) NOT NULL,
  `user_last_name` varchar(100) NOT NULL,
  `user_mobile_no` varchar(15) NOT NULL,
  `user_code` varchar(50) NOT NULL,
  `user_client_code` varchar(15) NOT NULL,
  `user_name` varchar(250) NOT NULL,
  `user_pass` varchar(250) NOT NULL,
  `user_login_flag` varchar(1) NOT NULL,
  `user_status` varchar(1) NOT NULL,
  `user_role_code` varchar(10) NOT NULL,
  `user_product_names` varchar(1000) NOT NULL,
  `user_sec_question` varchar(250) NOT NULL,
  `user_sec_answer` varchar(250) NOT NULL,
  `user_created_by` varchar(250) NOT NULL,
  `user_created_date` date NOT NULL,
  `user_modified_by` varchar(250) NOT NULL,
  `user_modified_date` date NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `user_master`
--

INSERT INTO `user_master` (`user_id`, `user_first_name`, `user_last_name`, `user_mobile_no`, `user_code`, `user_client_code`, `user_name`, `user_pass`, `user_login_flag`, `user_status`, `user_role_code`, `user_product_names`, `user_sec_question`, `user_sec_answer`, `user_created_by`, `user_created_date`, `user_modified_by`, `user_modified_date`) VALUES
(1, 'Super', 'admin', '54656446', 'U001', 'C001', 'admin', 'admin', 'N', 'Y', 'SU', 'attendance', 'whats ur first mobile number ?', '7738651907', 'U001', '2015-12-11', 'U001', '2016-01-15'),
(2, 'Hdfc head', 'Na', '1346887433', 'U002', 'C001', 'hdfchead', 'hdfchead', 'N', 'Y', 'C', 'attendance', 'Question', 'Answer', 'U001', '2015-12-24', 'U001', '2015-12-24'),
(3, 'Pamac user', 'Na', '123457788', 'U003', 'C002', 'pamacuser', 'pamacuser', 'N', 'Y', 'SU', 'attendance', 'Question', 'Answer', 'U001', '2015-12-24', 'U001', '2015-12-24'),
(4, 'Hdfc ch1', 'Na', '1346887433', 'U004', 'C001', 'hdfcch1', 'hdfcch1', 'N', 'Y', 'CH', 'attendance', 'Question', 'Answer', 'U001', '2015-12-24', 'U001', '2015-12-24'),
(5, 'Hdfc ch2', 'Na', '1346887433', 'U005', 'C001', 'hdfcch2', 'hdfcch2', 'N', 'Y', 'CH', 'attendance', 'Question', 'Answer', 'U001', '2015-12-24', 'U001', '2015-12-24'),
(6, 'Fs1', 'Na', '1346887433', 'U006', 'C001', 'fs1', 'fs1', 'N', 'Y', 'FS', 'attendance', 'Question', 'Answer', 'U001', '2015-12-24', 'U001', '2015-12-24'),
(7, 'Fs2', 'Na', '1346887433', 'U007', 'C001', 'fs2', 'fs2', 'N', 'Y', 'FS', 'attendance', 'Question', 'Answer', 'U001', '2015-12-24', 'U001', '2015-12-24'),
(8, 'Fs3', 'Na', '1346887433', 'U008', 'C001', 'fs3', 'fs3', 'N', 'Y', 'FS', 'attendance', 'Question', 'Answer', 'U001', '2015-12-24', 'U001', '2015-12-24'),
(9, 'Fs4', 'Na', '1346887433', 'U009', 'C001', 'fs4', 'fs4', 'N', 'Y', 'FS', 'attendance', 'Question', 'Answer', 'U001', '2015-12-24', 'U001', '2015-12-24'),
(10, 'Fs5', 'Na', '1346887433', 'U0010', 'C001', 'fs5', 'fs5', 'N', 'Y', 'SU', 'attendance', 'whats ur first mobile number ?', 'Answer', 'U003', '2015-12-24', 'U001', '2016-02-17'),
(11, 'Fs6', 'Na', '1346887433', 'U0011', 'C001', 'fs6', 'fs6', 'N', 'Y', 'SU', 'attendance', 'whats ur first mobile number ?', 'Answer', 'U003', '2015-12-24', 'U001', '2016-02-17');

-- --------------------------------------------------------

--
-- Table structure for table `user_master_meta`
--

CREATE TABLE IF NOT EXISTS `user_master_meta` (
  `meta_id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `field_options` varchar(255) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `field_query` varchar(500) DEFAULT NULL COMMENT 'Default value for field',
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`meta_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `user_master_meta`
--

INSERT INTO `user_master_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `field_options`, `field_validations`, `field_query`, `field_col_sm_`, `form_show`, `form_app_show`, `form_import_show`, `form_order`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'user_id', 'User id', 12, NULL, NULL, NULL, '4', 1, 1, 1, 1, NULL, NULL, NULL),
(2, 'user_first_name', 'User first name', 1, NULL, NULL, NULL, '4', 1, 1, 1, 5, NULL, NULL, NULL),
(3, 'user_last_name', 'User last name', 1, NULL, NULL, NULL, '4', 1, 1, 1, 3, NULL, NULL, NULL),
(4, 'user_mobile_no', 'User mobile no', 1, NULL, NULL, NULL, '4', 1, 1, 1, 4, NULL, NULL, NULL),
(5, 'user_code', 'User code', 9, NULL, NULL, NULL, '4', 1, 1, 1, 2, NULL, NULL, NULL),
(6, 'user_client_code', 'User client code', 1, NULL, NULL, NULL, '4', 1, 1, 1, 6, NULL, NULL, NULL),
(7, 'user_name', 'User name', 1, NULL, 'required|callback_duplicate[user_name]', NULL, '4', 1, 1, 1, 7, NULL, NULL, NULL),
(8, 'user_pass', 'User pass', 1, NULL, NULL, NULL, '4', 1, 1, 1, 8, NULL, NULL, NULL),
(9, 'user_login_flag', 'User login flag', 3, NULL, NULL, NULL, '4', 1, 1, 1, 9, NULL, NULL, NULL),
(10, 'user_status', 'User status', 3, NULL, NULL, NULL, '4', 1, 1, 1, 10, NULL, NULL, NULL),
(11, 'user_role_code', 'User role code', 3, NULL, NULL, NULL, '4', 1, 1, 1, 11, NULL, NULL, NULL),
(12, 'user_product_names', 'User product names', 1, NULL, NULL, NULL, '4', 1, 1, 1, 12, NULL, NULL, NULL),
(13, 'user_sec_question', 'User sec question', 3, NULL, NULL, NULL, '4', 1, 1, 1, 13, NULL, NULL, NULL),
(14, 'user_sec_answer', 'User sec answer', 1, NULL, NULL, NULL, '4', 1, 1, 1, 14, NULL, NULL, NULL),
(15, 'user_created_by', 'User created by', 9, NULL, NULL, NULL, '4', 2, 1, 1, 15, NULL, NULL, NULL),
(16, 'user_created_date', 'User created date', NULL, NULL, NULL, NULL, '4', 2, 1, 1, 16, NULL, NULL, NULL),
(17, 'user_modified_by', 'User modified by', 9, NULL, NULL, NULL, '4', 2, 1, 1, 17, NULL, NULL, NULL),
(18, 'user_modified_date', 'User modified date', NULL, NULL, NULL, NULL, '4', 2, 1, 1, 18, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_role_master`
--

CREATE TABLE IF NOT EXISTS `user_role_master` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(250) NOT NULL,
  `role_code` varchar(10) NOT NULL,
  `role_url` varchar(500) NOT NULL,
  `role_menu_ids` int(11) NOT NULL,
  `role_menu_insert` varchar(1) NOT NULL,
  `role_menu_update` varchar(1) NOT NULL,
  `role_menu_delete` varchar(1) NOT NULL,
  `role_menu_export` varchar(1) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1179 ;

--
-- Dumping data for table `user_role_master`
--

INSERT INTO `user_role_master` (`role_id`, `role_name`, `role_code`, `role_url`, `role_menu_ids`, `role_menu_insert`, `role_menu_update`, `role_menu_delete`, `role_menu_export`) VALUES
(1137, 'Super Admin', 'SU', 'admin/usermaster', 1, 'N', 'N', 'N', 'N'),
(1138, 'Super Admin', 'SU', 'admin/usermaster', 12, 'Y', 'Y', 'Y', 'Y'),
(1139, 'Super Admin', 'SU', 'admin/usermaster', 13, 'Y', 'Y', 'Y', 'Y'),
(1140, 'Super Admin', 'SU', 'admin/usermaster', 23, 'Y', 'Y', 'Y', 'Y'),
(1141, 'Super Admin', 'SU', 'admin/usermaster', 24, 'Y', 'Y', 'Y', 'Y'),
(1142, 'Super Admin', 'SU', 'admin/usermaster', 25, 'Y', 'Y', 'Y', 'Y'),
(1143, 'Super Admin', 'SU', 'admin/usermaster', 26, 'Y', 'Y', 'Y', 'Y'),
(1144, 'Super Admin', 'SU', 'admin/usermaster', 2, 'N', 'N', 'N', 'N'),
(1145, 'Super Admin', 'SU', 'admin/usermaster', 14, 'Y', 'Y', 'Y', 'Y'),
(1146, 'Super Admin', 'SU', 'admin/usermaster', 15, 'Y', 'Y', 'Y', 'Y'),
(1147, 'Super Admin', 'SU', 'admin/usermaster', 16, 'Y', 'Y', 'Y', 'Y'),
(1148, 'Super Admin', 'SU', 'admin/usermaster', 3, 'N', 'N', 'N', 'N'),
(1149, 'Super Admin', 'SU', 'admin/usermaster', 37, 'Y', 'Y', 'Y', 'Y'),
(1150, 'Super Admin', 'SU', 'admin/usermaster', 38, 'Y', 'Y', 'Y', 'Y'),
(1151, 'Super Admin', 'SU', 'admin/usermaster', 4, 'N', 'N', 'N', 'N'),
(1152, 'Super Admin', 'SU', 'admin/usermaster', 19, 'Y', 'Y', 'Y', 'Y'),
(1153, 'Super Admin', 'SU', 'admin/usermaster', 20, 'Y', 'Y', 'Y', 'Y'),
(1154, 'Super Admin', 'SU', 'admin/usermaster', 21, 'Y', 'Y', 'Y', 'Y'),
(1155, 'Super Admin', 'SU', 'admin/usermaster', 5, 'N', 'N', 'N', 'N'),
(1156, 'Super Admin', 'SU', 'admin/usermaster', 17, 'Y', 'Y', 'Y', 'Y'),
(1157, 'Super Admin', 'SU', 'admin/usermaster', 18, 'Y', 'Y', 'Y', 'Y'),
(1158, 'Super Admin', 'SU', 'admin/usermaster', 22, 'Y', 'Y', 'Y', 'Y'),
(1159, 'Super Admin', 'SU', 'admin/usermaster', 6, 'N', 'N', 'N', 'N'),
(1160, 'Super Admin', 'SU', 'admin/usermaster', 34, 'Y', 'Y', 'Y', 'Y'),
(1161, 'Super Admin', 'SU', 'admin/usermaster', 64, 'Y', 'Y', 'Y', 'Y'),
(1162, 'Super Admin', 'SU', 'admin/usermaster', 65, 'Y', 'Y', 'Y', 'Y'),
(1163, 'Super Admin', 'SU', 'admin/usermaster', 66, 'Y', 'Y', 'Y', 'Y'),
(1164, 'Super Admin', 'SU', 'admin/usermaster', 67, 'Y', 'Y', 'Y', 'Y'),
(1165, 'Super Admin', 'SU', 'admin/usermaster', 7, 'N', 'N', 'N', 'N'),
(1166, 'Super Admin', 'SU', 'admin/usermaster', 36, 'Y', 'Y', 'Y', 'Y'),
(1167, 'Super Admin', 'SU', 'admin/usermaster', 68, 'Y', 'Y', 'Y', 'Y'),
(1168, 'Super Admin', 'SU', 'admin/usermaster', 8, 'N', 'N', 'N', 'N'),
(1169, 'Super Admin', 'SU', 'admin/usermaster', 29, 'Y', 'Y', 'Y', 'Y'),
(1170, 'Super Admin', 'SU', 'admin/usermaster', 30, 'Y', 'Y', 'Y', 'Y'),
(1171, 'Super Admin', 'SU', 'admin/usermaster', 31, 'Y', 'Y', 'Y', 'Y'),
(1172, 'Super Admin', 'SU', 'admin/usermaster', 32, 'Y', 'Y', 'Y', 'Y'),
(1173, 'Super Admin', 'SU', 'admin/usermaster', 33, 'Y', 'Y', 'Y', 'Y'),
(1174, 'Super Admin', 'SU', 'admin/usermaster', 9, 'N', 'N', 'N', 'N'),
(1175, 'Super Admin', 'SU', 'admin/usermaster', 27, 'Y', 'Y', 'Y', 'Y'),
(1176, 'Super Admin', 'SU', 'admin/usermaster', 28, 'Y', 'Y', 'Y', 'Y'),
(1177, 'Super Admin', 'SU', 'admin/usermaster', 10, 'N', 'N', 'N', 'N'),
(1178, 'Super Admin', 'SU', 'admin/usermaster', 11, 'N', 'N', 'N', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `user_structure`
--

CREATE TABLE IF NOT EXISTS `user_structure` (
  `user_struct_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_parent_id` int(11) NOT NULL,
  `user_position_name` varchar(200) NOT NULL,
  `user_emp_code` varchar(200) NOT NULL,
  PRIMARY KEY (`user_struct_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `user_structure`
--

INSERT INTO `user_structure` (`user_struct_id`, `user_parent_id`, `user_position_name`, `user_emp_code`) VALUES
(1, 0, 'Director', ''),
(2, 1, 'Admin', ''),
(3, 1, 'Hr', ''),
(4, 1, 'Operation', ''),
(5, 2, 'Admin Head', ''),
(6, 3, 'Hr Head', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_structure_meta`
--

CREATE TABLE IF NOT EXISTS `user_structure_meta` (
  `meta_id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `field_options` varchar(255) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `field_query` varchar(500) DEFAULT NULL COMMENT 'Default value for field',
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`meta_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `user_structure_meta`
--

INSERT INTO `user_structure_meta` (`meta_id`, `field_name`, `field_label`, `field_type`, `field_options`, `field_validations`, `field_query`, `field_col_sm_`, `form_show`, `form_app_show`, `form_import_show`, `form_order`, `onchange`, `dependon`, `field_property`) VALUES
(1, 'user_struct_id', 'User struct id', 12, NULL, NULL, NULL, '3', 1, 1, 1, 1, NULL, NULL, NULL),
(2, 'user_parent_id', 'User parent id', 15, 'select user_struct_id,user_position_name from user_structure', NULL, NULL, '3', 1, 1, 1, 2, NULL, NULL, NULL),
(3, 'user_position_name', 'User position name', 1, NULL, NULL, NULL, '3', 1, 1, 1, 3, NULL, NULL, NULL),
(4, 'user_emp_code', 'User emp code', 1, NULL, NULL, NULL, '3', 1, 1, 1, 4, NULL, NULL, NULL),
(5, 'user_struct_id', 'User struct id', 12, NULL, NULL, NULL, '4', 1, 1, 1, 1, NULL, NULL, NULL),
(6, 'user_parent_id', 'User parent id', NULL, NULL, NULL, NULL, '4', 1, 1, 1, 2, NULL, NULL, NULL),
(7, 'user_position_name', 'User position name', 10, NULL, NULL, NULL, '4', 1, 1, 1, 3, NULL, NULL, NULL),
(8, 'user_emp_code', 'User emp code', 10, NULL, NULL, NULL, '4', 1, 1, 1, 4, NULL, NULL, NULL),
(9, 'user_created_by', 'User created by', 9, NULL, NULL, NULL, '4', 1, 1, 1, 5, NULL, NULL, NULL),
(10, 'user_created_date', 'User created date', NULL, NULL, NULL, NULL, '4', 1, 1, 1, 6, NULL, NULL, NULL),
(11, 'user_modified_by', 'User modified by', 9, NULL, NULL, NULL, '4', 1, 1, 1, 7, NULL, NULL, NULL),
(12, 'user_modified_date', 'User modified date', NULL, NULL, NULL, NULL, '4', 1, 1, 1, 8, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_sup_assign_master`
--

CREATE TABLE IF NOT EXISTS `user_sup_assign_master` (
  `user_sup_assign_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_client_code` varchar(10) NOT NULL,
  `user_client_branch_code` varchar(10) NOT NULL,
  `user_code` varchar(10) NOT NULL,
  PRIMARY KEY (`user_sup_assign_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user_sup_assign_master`
--

INSERT INTO `user_sup_assign_master` (`user_sup_assign_id`, `user_client_code`, `user_client_branch_code`, `user_code`) VALUES
(1, 'C001', 'CB01', 'U004'),
(2, 'C001', 'CB02', 'U004'),
(3, 'C001', 'CB03', 'U005'),
(4, 'C001', 'CB04', 'U005');

-- --------------------------------------------------------

--
-- Table structure for table `_meta`
--

CREATE TABLE IF NOT EXISTS `_meta` (
  `meta_id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(150) DEFAULT NULL,
  `field_label` varchar(150) DEFAULT NULL,
  `field_type` int(11) DEFAULT NULL,
  `field_options` varchar(255) DEFAULT NULL,
  `field_validations` varchar(255) DEFAULT NULL,
  `field_query` varchar(500) DEFAULT NULL COMMENT 'Default value for field',
  `field_col_sm_` varchar(150) DEFAULT NULL,
  `form_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_app_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_import_show` tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  `form_order` tinyint(1) DEFAULT NULL COMMENT '1=search field',
  `onchange` varchar(250) DEFAULT NULL,
  `dependon` varchar(250) DEFAULT NULL,
  `field_property` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`meta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
