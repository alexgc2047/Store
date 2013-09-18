-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2013 at 06:49 AM
-- Server version: 5.5.32
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tienda`
--
CREATE DATABASE IF NOT EXISTS `tienda` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `tienda`;

-- --------------------------------------------------------

--
-- Table structure for table `action_recorder`
--

CREATE TABLE IF NOT EXISTS `action_recorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `success` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_action_recorder_module` (`module`),
  KEY `idx_action_recorder_user_id` (`user_id`),
  KEY `idx_action_recorder_identifier` (`identifier`),
  KEY `idx_action_recorder_date_added` (`date_added`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `action_recorder`
--

INSERT INTO `action_recorder` (`id`, `module`, `user_id`, `user_name`, `identifier`, `success`, `date_added`) VALUES
(1, 'ar_admin_login', 1, 'Alexis', '', '1', '2013-08-26 23:40:23'),
(2, 'ar_admin_login', 1, 'Alexis', '', '1', '2013-08-27 21:52:45'),
(3, 'ar_admin_login', 1, 'Alexis', '127.0.0.1', '1', '2013-08-28 17:31:44'),
(4, 'ar_admin_login', 1, 'Alexis', '127.0.0.1', '1', '2013-08-28 18:52:15'),
(5, 'ar_admin_login', 1, 'Alexis', '', '1', '2013-08-30 17:26:23'),
(6, 'ar_admin_login', 1, 'Alexis', '', '1', '2013-08-30 17:56:54'),
(7, 'ar_admin_login', 1, 'Alexis', '', '1', '2013-09-04 18:01:52'),
(8, 'ar_admin_login', 1, 'Alexis', '', '1', '2013-09-09 17:25:23'),
(9, 'ar_admin_login', 1, 'Alexis', '', '1', '2013-09-11 17:53:19');

-- --------------------------------------------------------

--
-- Table structure for table `address_book`
--

CREATE TABLE IF NOT EXISTS `address_book` (
  `address_book_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL,
  `entry_gender` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `entry_company` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `entry_firstname` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `entry_lastname` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `entry_street_address` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `entry_suburb` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `entry_postcode` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `entry_city` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `entry_state` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `entry_country_id` int(11) NOT NULL DEFAULT '0',
  `entry_zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_book_id`),
  KEY `idx_address_book_customers_id` (`customers_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `address_book`
--

INSERT INTO `address_book` (`address_book_id`, `customers_id`, `entry_gender`, `entry_company`, `entry_firstname`, `entry_lastname`, `entry_street_address`, `entry_suburb`, `entry_postcode`, `entry_city`, `entry_state`, `entry_country_id`, `entry_zone_id`) VALUES
(1, 1, 'm', '', 'Alejandro', 'GÃ³mez', 'Leandro Valle 403', '', '38500', 'Apaseo el Alto', 'Guanajuato', 138, 0);

-- --------------------------------------------------------

--
-- Table structure for table `address_format`
--

CREATE TABLE IF NOT EXISTS `address_format` (
  `address_format_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_format` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `address_summary` varchar(48) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`address_format_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `address_format`
--

INSERT INTO `address_format` (`address_format_id`, `address_format`, `address_summary`) VALUES
(1, '$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country', '$city / $country'),
(2, '$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country', '$city, $state / $country'),
(3, '$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country', '$state / $country'),
(4, '$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country', '$postcode / $country'),
(5, '$firstname $lastname$cr$streets$cr$postcode $city$cr$country', '$city / $country');

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--

CREATE TABLE IF NOT EXISTS `administrators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_password` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `administrators`
--

INSERT INTO `administrators` (`id`, `user_name`, `user_password`) VALUES
(1, 'Alexis', '$P$DaYMDCDqLrmCapYQ.k3pO/zzYJpJLm1');

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `articles_id` int(11) NOT NULL AUTO_INCREMENT,
  `articles_date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `articles_last_modified` datetime DEFAULT NULL,
  `articles_date_available` datetime DEFAULT NULL,
  `articles_status` tinyint(1) NOT NULL DEFAULT '0',
  `articles_is_blog` tinyint(1) NOT NULL DEFAULT '0',
  `articles_sort_order` tinyint(5) NOT NULL DEFAULT '0',
  `authors_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`articles_id`),
  KEY `idx_articles_date_added` (`articles_date_added`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `articles_blog`
--

CREATE TABLE IF NOT EXISTS `articles_blog` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `articles_id` int(11) NOT NULL DEFAULT '0',
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `commenters_name` varchar(54) COLLATE utf8_spanish_ci DEFAULT NULL,
  `comment_date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comments_status` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_spanish_ci NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`unique_id`),
  KEY `idx_articles_id` (`articles_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `articles_description`
--

CREATE TABLE IF NOT EXISTS `articles_description` (
  `articles_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `articles_name` varchar(64) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `articles_description` text COLLATE utf8_spanish_ci,
  `articles_image` varchar(64) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `articles_head_desc_tag` text COLLATE utf8_spanish_ci,
  `articles_url` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `articles_viewed` int(5) DEFAULT '0',
  PRIMARY KEY (`articles_id`,`language_id`),
  KEY `articles_name` (`articles_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `articles_to_topics`
--

CREATE TABLE IF NOT EXISTS `articles_to_topics` (
  `articles_id` int(11) NOT NULL DEFAULT '0',
  `topics_id` int(11) NOT NULL DEFAULT '0',
  KEY `idx_a2t_articles_id` (`articles_id`),
  KEY `idx_a2t_topics_id` (`topics_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `articles_xsell`
--

CREATE TABLE IF NOT EXISTS `articles_xsell` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `articles_id` int(10) unsigned NOT NULL DEFAULT '1',
  `xsell_id` int(10) unsigned NOT NULL DEFAULT '1',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `article_reviews`
--

CREATE TABLE IF NOT EXISTS `article_reviews` (
  `reviews_id` int(11) NOT NULL AUTO_INCREMENT,
  `articles_id` int(11) NOT NULL DEFAULT '0',
  `customers_id` int(11) DEFAULT NULL,
  `customers_name` varchar(64) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `reviews_rating` int(1) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reviews_read` int(5) NOT NULL DEFAULT '0',
  `approved` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`reviews_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `article_reviews_description`
--

CREATE TABLE IF NOT EXISTS `article_reviews_description` (
  `reviews_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `reviews_text` text COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`reviews_id`,`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE IF NOT EXISTS `authors` (
  `authors_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL,
  `authors_name` varchar(32) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `authors_image` varchar(64) COLLATE utf8_spanish_ci DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`authors_id`),
  KEY `IDX_AUTHORS_NAME` (`authors_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`authors_id`, `customers_id`, `authors_name`, `authors_image`, `date_added`, `last_modified`) VALUES
(1, 0, 'Alejandro', '', '2013-09-04 18:02:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `authors_info`
--

CREATE TABLE IF NOT EXISTS `authors_info` (
  `authors_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `authors_description` text COLLATE utf8_spanish_ci,
  `authors_url` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`authors_id`,`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `authors_info`
--

INSERT INTO `authors_info` (`authors_id`, `languages_id`, `authors_description`, `authors_url`, `url_clicked`, `date_last_click`) VALUES
(1, 1, 'Hi', '', 0, NULL),
(1, 2, 'Hola', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE IF NOT EXISTS `banners` (
  `banners_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_title` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `banners_url` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `banners_image` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `banners_group` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `banners_html_text` text COLLATE utf8_spanish_ci,
  `expires_impressions` int(7) DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `date_scheduled` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`banners_id`),
  KEY `idx_banners_group` (`banners_group`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`banners_id`, `banners_title`, `banners_url`, `banners_image`, `banners_group`, `banners_html_text`, `expires_impressions`, `expires_date`, `date_scheduled`, `date_added`, `date_status_change`, `status`) VALUES
(1, 'osCommerce', 'http://www.oscommerce.com', 'banners/oscommerce.gif', '468x50', '', 0, NULL, NULL, '2013-08-26 23:38:55', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `banners_history`
--

CREATE TABLE IF NOT EXISTS `banners_history` (
  `banners_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_id` int(11) NOT NULL,
  `banners_shown` int(5) NOT NULL DEFAULT '0',
  `banners_clicked` int(5) NOT NULL DEFAULT '0',
  `banners_history_date` datetime NOT NULL,
  PRIMARY KEY (`banners_history_id`),
  KEY `idx_banners_history_banners_id` (`banners_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `banners_history`
--

INSERT INTO `banners_history` (`banners_history_id`, `banners_id`, `banners_shown`, `banners_clicked`, `banners_history_date`) VALUES
(1, 1, 5, 0, '2013-08-26 23:41:19'),
(2, 1, 1, 0, '2013-08-27 21:52:21'),
(3, 1, 79, 0, '2013-08-28 16:42:17'),
(4, 1, 53, 0, '2013-08-30 17:30:09'),
(5, 1, 1, 0, '2013-09-02 17:53:41'),
(6, 1, 12, 0, '2013-09-04 14:29:04'),
(7, 1, 1, 0, '2013-09-09 17:20:56');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `categories_id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_image` varchar(64) COLLATE utf8_spanish_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`categories_id`),
  KEY `idx_categories_parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=22 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_image`, `parent_id`, `sort_order`, `date_added`, `last_modified`) VALUES
(1, 'category_hardware.gif', 0, 1, '2013-08-26 23:38:55', NULL),
(2, 'category_software.gif', 0, 2, '2013-08-26 23:38:55', NULL),
(3, 'category_dvd_movies.gif', 0, 3, '2013-08-26 23:38:55', '2013-08-28 17:39:04'),
(4, 'subcategory_graphic_cards.gif', 1, 0, '2013-08-26 23:38:55', '2013-08-28 17:43:56'),
(5, 'subcategory_printers.gif', 1, 0, '2013-08-26 23:38:55', NULL),
(6, 'subcategory_monitors.gif', 1, 0, '2013-08-26 23:38:55', NULL),
(7, 'subcategory_speakers.gif', 1, 0, '2013-08-26 23:38:55', NULL),
(8, 'subcategory_keyboards.gif', 1, 0, '2013-08-26 23:38:55', NULL),
(9, 'subcategory_mice.gif', 1, 0, '2013-08-26 23:38:55', NULL),
(10, 'subcategory_action.gif', 3, 0, '2013-08-26 23:38:55', NULL),
(11, 'subcategory_science_fiction.gif', 3, 0, '2013-08-26 23:38:55', NULL),
(12, 'subcategory_comedy.gif', 3, 0, '2013-08-26 23:38:55', NULL),
(13, 'subcategory_cartoons.gif', 3, 0, '2013-08-26 23:38:55', NULL),
(14, 'subcategory_thriller.gif', 3, 0, '2013-08-26 23:38:55', NULL),
(15, 'subcategory_drama.gif', 3, 0, '2013-08-26 23:38:55', NULL),
(16, 'subcategory_memory.gif', 1, 0, '2013-08-26 23:38:55', NULL),
(17, 'subcategory_cdrom_drives.gif', 1, 0, '2013-08-26 23:38:55', NULL),
(18, 'subcategory_simulation.gif', 2, 0, '2013-08-26 23:38:55', NULL),
(19, 'subcategory_action_games.gif', 2, 0, '2013-08-26 23:38:55', NULL),
(20, 'subcategory_strategy.gif', 2, 0, '2013-08-26 23:38:55', NULL),
(21, 'category_gadgets.png', 0, 4, '2013-08-26 23:38:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories_description`
--

CREATE TABLE IF NOT EXISTS `categories_description` (
  `categories_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `categories_name` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `categories_htc_title_tag` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL,
  `categories_htc_desc_tag` longtext COLLATE utf8_spanish_ci,
  `categories_htc_keywords_tag` longtext COLLATE utf8_spanish_ci,
  `categories_htc_description` longtext COLLATE utf8_spanish_ci,
  PRIMARY KEY (`categories_id`,`language_id`),
  KEY `idx_categories_name` (`categories_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `categories_description`
--

INSERT INTO `categories_description` (`categories_id`, `language_id`, `categories_name`, `categories_htc_title_tag`, `categories_htc_desc_tag`, `categories_htc_keywords_tag`, `categories_htc_description`) VALUES
(1, 1, 'Hardware', NULL, NULL, NULL, NULL),
(1, 2, 'Hardware', NULL, NULL, NULL, NULL),
(2, 1, 'Software', NULL, NULL, NULL, NULL),
(2, 2, 'Software', NULL, NULL, NULL, NULL),
(3, 1, 'DVD Movies', NULL, NULL, NULL, NULL),
(3, 2, 'Peliculas DVD', NULL, NULL, NULL, NULL),
(4, 1, 'Graphics Cards', NULL, NULL, NULL, NULL),
(4, 2, 'Tarjetas GrÃ¡ficas', NULL, NULL, NULL, NULL),
(5, 1, 'Printers', NULL, NULL, NULL, NULL),
(5, 2, 'Printers', NULL, NULL, NULL, NULL),
(6, 1, 'Monitors', NULL, NULL, NULL, NULL),
(6, 2, 'Monitors', NULL, NULL, NULL, NULL),
(7, 1, 'Speakers', NULL, NULL, NULL, NULL),
(7, 2, 'Speakers', NULL, NULL, NULL, NULL),
(8, 1, 'Keyboards', NULL, NULL, NULL, NULL),
(8, 2, 'Keyboards', NULL, NULL, NULL, NULL),
(9, 1, 'Mice', NULL, NULL, NULL, NULL),
(9, 2, 'Mice', NULL, NULL, NULL, NULL),
(10, 1, 'Action', NULL, NULL, NULL, NULL),
(10, 2, 'Action', NULL, NULL, NULL, NULL),
(11, 1, 'Science Fiction', NULL, NULL, NULL, NULL),
(11, 2, 'Science Fiction', NULL, NULL, NULL, NULL),
(12, 1, 'Comedy', NULL, NULL, NULL, NULL),
(12, 2, 'Comedy', NULL, NULL, NULL, NULL),
(13, 1, 'Cartoons', NULL, NULL, NULL, NULL),
(13, 2, 'Cartoons', NULL, NULL, NULL, NULL),
(14, 1, 'Thriller', NULL, NULL, NULL, NULL),
(14, 2, 'Thriller', NULL, NULL, NULL, NULL),
(15, 1, 'Drama', NULL, NULL, NULL, NULL),
(15, 2, 'Drama', NULL, NULL, NULL, NULL),
(16, 1, 'Memory', NULL, NULL, NULL, NULL),
(16, 2, 'Memory', NULL, NULL, NULL, NULL),
(17, 1, 'CDROM Drives', NULL, NULL, NULL, NULL),
(17, 2, 'CDROM Drives', NULL, NULL, NULL, NULL),
(18, 1, 'Simulation', NULL, NULL, NULL, NULL),
(18, 2, 'Simulation', NULL, NULL, NULL, NULL),
(19, 1, 'Action', NULL, NULL, NULL, NULL),
(19, 2, 'Action', NULL, NULL, NULL, NULL),
(20, 1, 'Strategy', NULL, NULL, NULL, NULL),
(20, 2, 'Strategy', NULL, NULL, NULL, NULL),
(21, 1, 'Gadgets', NULL, NULL, NULL, NULL),
(21, 2, 'Gadgets', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

CREATE TABLE IF NOT EXISTS `configuration` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_title` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `configuration_key` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `configuration_value` text COLLATE utf8_spanish_ci NOT NULL,
  `configuration_description` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `configuration_group_id` int(11) NOT NULL,
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `use_function` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `set_function` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`configuration_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=389 ;

--
-- Dumping data for table `configuration`
--

INSERT INTO `configuration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(1, 'Store Name', 'STORE_NAME', 'Online Store', 'The name of my store', 1, 1, NULL, '2013-08-26 23:38:55', NULL, NULL),
(2, 'Store Owner', 'STORE_OWNER', 'Alejandro GÃ³mez', 'The name of my store owner', 1, 2, NULL, '2013-08-26 23:38:55', NULL, NULL),
(3, 'E-Mail Address', 'STORE_OWNER_EMAIL_ADDRESS', 'sprtn_link.hrdy@hotmail.com', 'The e-mail address of my store owner', 1, 3, NULL, '2013-08-26 23:38:55', NULL, NULL),
(4, 'E-Mail From', 'EMAIL_FROM', '"Alejandro GÃ³mez" <sprtn_link.hrdy@hotmail.com>', 'The e-mail address used in (sent) e-mails', 1, 4, NULL, '2013-08-26 23:38:55', NULL, NULL),
(5, 'Country', 'STORE_COUNTRY', '223', 'The country my store is located in <br /><br /><strong>Note: Please remember to update the store zone.</strong>', 1, 6, NULL, '2013-08-26 23:38:55', 'tep_get_country_name', 'tep_cfg_pull_down_country_list('),
(6, 'Zone', 'STORE_ZONE', '18', 'The zone my store is located in', 1, 7, NULL, '2013-08-26 23:38:55', 'tep_cfg_get_zone_name', 'tep_cfg_pull_down_zone_list('),
(7, 'Expected Sort Order', 'EXPECTED_PRODUCTS_SORT', 'desc', 'This is the sort order used in the expected products box.', 1, 8, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''asc'', ''desc''), '),
(8, 'Expected Sort Field', 'EXPECTED_PRODUCTS_FIELD', 'date_expected', 'The column to sort by in the expected products box.', 1, 9, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''products_name'', ''date_expected''), '),
(9, 'Switch To Default Language Currency', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'false', 'Automatically switch to the language''s currency when it is changed', 1, 10, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(10, 'Send Extra Order Emails To', 'SEND_EXTRA_ORDER_EMAILS_TO', '', 'Send extra order emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 1, 11, NULL, '2013-08-26 23:38:55', NULL, NULL),
(11, 'Use Search-Engine Safe URLs', 'SEARCH_ENGINE_FRIENDLY_URLS', 'false', 'Use search-engine safe urls for all site links', 1, 12, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(12, 'Display Cart After Adding Product', 'DISPLAY_CART', 'true', 'Display the shopping cart after adding a product (or return back to their origin)', 1, 14, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(13, 'Allow Guest To Tell A Friend', 'ALLOW_GUEST_TO_TELL_A_FRIEND', 'false', 'Allow guests to tell a friend about a product', 1, 15, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(14, 'Default Search Operator', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', 'Default search operators', 1, 17, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''and'', ''or''), '),
(15, 'Store Address and Phone', 'STORE_NAME_ADDRESS', 'Store Name\nAddress\nCountry\nPhone', 'This is the Store Name, Address and Phone used on printable documents and displayed online', 1, 18, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_textarea('),
(16, 'Show Category Counts', 'SHOW_COUNTS', 'true', 'Count recursively how many products are in each category', 1, 19, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(17, 'Tax Decimal Places', 'TAX_DECIMAL_PLACES', '0', 'Pad the tax value this amount of decimal places', 1, 20, NULL, '2013-08-26 23:38:55', NULL, NULL),
(18, 'Display Prices with Tax', 'DISPLAY_PRICE_WITH_TAX', 'false', 'Display prices with tax included (true) or add the tax at the end (false)', 1, 21, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(19, 'First Name', 'ENTRY_FIRST_NAME_MIN_LENGTH', '2', 'Minimum length of first name', 2, 1, NULL, '2013-08-26 23:38:55', NULL, NULL),
(20, 'Last Name', 'ENTRY_LAST_NAME_MIN_LENGTH', '2', 'Minimum length of last name', 2, 2, NULL, '2013-08-26 23:38:55', NULL, NULL),
(21, 'Date of Birth', 'ENTRY_DOB_MIN_LENGTH', '10', 'Minimum length of date of birth', 2, 3, NULL, '2013-08-26 23:38:55', NULL, NULL),
(22, 'E-Mail Address', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6', 'Minimum length of e-mail address', 2, 4, NULL, '2013-08-26 23:38:55', NULL, NULL),
(23, 'Street Address', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '5', 'Minimum length of street address', 2, 5, NULL, '2013-08-26 23:38:55', NULL, NULL),
(24, 'Company', 'ENTRY_COMPANY_MIN_LENGTH', '2', 'Minimum length of company name', 2, 6, NULL, '2013-08-26 23:38:55', NULL, NULL),
(25, 'Post Code', 'ENTRY_POSTCODE_MIN_LENGTH', '4', 'Minimum length of post code', 2, 7, NULL, '2013-08-26 23:38:55', NULL, NULL),
(26, 'City', 'ENTRY_CITY_MIN_LENGTH', '3', 'Minimum length of city', 2, 8, NULL, '2013-08-26 23:38:55', NULL, NULL),
(27, 'State', 'ENTRY_STATE_MIN_LENGTH', '2', 'Minimum length of state', 2, 9, NULL, '2013-08-26 23:38:55', NULL, NULL),
(28, 'Telephone Number', 'ENTRY_TELEPHONE_MIN_LENGTH', '3', 'Minimum length of telephone number', 2, 10, NULL, '2013-08-26 23:38:55', NULL, NULL),
(29, 'Password', 'ENTRY_PASSWORD_MIN_LENGTH', '5', 'Minimum length of password', 2, 11, NULL, '2013-08-26 23:38:55', NULL, NULL),
(30, 'Credit Card Owner Name', 'CC_OWNER_MIN_LENGTH', '3', 'Minimum length of credit card owner name', 2, 12, NULL, '2013-08-26 23:38:55', NULL, NULL),
(31, 'Credit Card Number', 'CC_NUMBER_MIN_LENGTH', '10', 'Minimum length of credit card number', 2, 13, NULL, '2013-08-26 23:38:55', NULL, NULL),
(32, 'Review Text', 'REVIEW_TEXT_MIN_LENGTH', '50', 'Minimum length of review text', 2, 14, NULL, '2013-08-26 23:38:55', NULL, NULL),
(33, 'Best Sellers', 'MIN_DISPLAY_BESTSELLERS', '1', 'Minimum number of best sellers to display', 2, 15, NULL, '2013-08-26 23:38:55', NULL, NULL),
(34, 'Also Purchased', 'MIN_DISPLAY_ALSO_PURCHASED', '1', 'Minimum number of products to display in the ''This Customer Also Purchased'' box', 2, 16, NULL, '2013-08-26 23:38:55', NULL, NULL),
(35, 'Address Book Entries', 'MAX_ADDRESS_BOOK_ENTRIES', '5', 'Maximum address book entries a customer is allowed to have', 3, 1, NULL, '2013-08-26 23:38:55', NULL, NULL),
(36, 'Search Results', 'MAX_DISPLAY_SEARCH_RESULTS', '20', 'Amount of products to list', 3, 2, NULL, '2013-08-26 23:38:55', NULL, NULL),
(37, 'Page Links', 'MAX_DISPLAY_PAGE_LINKS', '5', 'Number of ''number'' links use for page-sets', 3, 3, NULL, '2013-08-26 23:38:55', NULL, NULL),
(38, 'Special Products', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '9', 'Maximum number of products on special to display', 3, 4, NULL, '2013-08-26 23:38:55', NULL, NULL),
(39, 'New Products Module', 'MAX_DISPLAY_NEW_PRODUCTS', '9', 'Maximum number of new products to display in a category', 3, 5, NULL, '2013-08-26 23:38:55', NULL, NULL),
(40, 'Products Expected', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '10', 'Maximum number of products expected to display', 3, 6, NULL, '2013-08-26 23:38:55', NULL, NULL),
(41, 'Manufacturers List', 'MAX_DISPLAY_MANUFACTURERS_IN_A_LIST', '0', 'Used in manufacturers box; when the number of manufacturers exceeds this number, a drop-down list will be displayed instead of the default list', 3, 7, NULL, '2013-08-26 23:38:55', NULL, NULL),
(42, 'Manufacturers Select Size', 'MAX_MANUFACTURERS_LIST', '1', 'Used in manufacturers box; when this value is ''1'' the classic drop-down list will be used for the manufacturers box. Otherwise, a list-box with the specified number of rows will be displayed.', 3, 7, NULL, '2013-08-26 23:38:55', NULL, NULL),
(43, 'Length of Manufacturers Name', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '15', 'Used in manufacturers box; maximum length of manufacturers name to display', 3, 8, NULL, '2013-08-26 23:38:55', NULL, NULL),
(44, 'New Reviews', 'MAX_DISPLAY_NEW_REVIEWS', '6', 'Maximum number of new reviews to display', 3, 9, NULL, '2013-08-26 23:38:55', NULL, NULL),
(45, 'Selection of Random Reviews', 'MAX_RANDOM_SELECT_REVIEWS', '10', 'How many records to select from to choose one random product review', 3, 10, NULL, '2013-08-26 23:38:55', NULL, NULL),
(46, 'Selection of Random New Products', 'MAX_RANDOM_SELECT_NEW', '10', 'How many records to select from to choose one random new product to display', 3, 11, NULL, '2013-08-26 23:38:55', NULL, NULL),
(47, 'Selection of Products on Special', 'MAX_RANDOM_SELECT_SPECIALS', '10', 'How many records to select from to choose one random product special to display', 3, 12, NULL, '2013-08-26 23:38:55', NULL, NULL),
(48, 'Categories To List Per Row', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '3', 'How many categories to list per row', 3, 13, NULL, '2013-08-26 23:38:55', NULL, NULL),
(49, 'New Products Listing', 'MAX_DISPLAY_PRODUCTS_NEW', '10', 'Maximum number of new products to display in new products page', 3, 14, NULL, '2013-08-26 23:38:55', NULL, NULL),
(50, 'Best Sellers', 'MAX_DISPLAY_BESTSELLERS', '10', 'Maximum number of best sellers to display', 3, 15, NULL, '2013-08-26 23:38:55', NULL, NULL),
(51, 'Also Purchased', 'MAX_DISPLAY_ALSO_PURCHASED', '6', 'Maximum number of products to display in the ''This Customer Also Purchased'' box', 3, 16, NULL, '2013-08-26 23:38:55', NULL, NULL),
(52, 'Customer Order History Box', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6', 'Maximum number of products to display in the customer order history box', 3, 17, NULL, '2013-08-26 23:38:55', NULL, NULL),
(53, 'Order History', 'MAX_DISPLAY_ORDER_HISTORY', '10', 'Maximum number of orders to display in the order history page', 3, 18, NULL, '2013-08-26 23:38:55', NULL, NULL),
(54, 'Product Quantities In Shopping Cart', 'MAX_QTY_IN_CART', '99', 'Maximum number of product quantities that can be added to the shopping cart (0 for no limit)', 3, 19, NULL, '2013-08-26 23:38:55', NULL, NULL),
(55, 'Small Image Width', 'SMALL_IMAGE_WIDTH', '100', 'The pixel width of small images', 4, 1, NULL, '2013-08-26 23:38:55', NULL, NULL),
(56, 'Small Image Height', 'SMALL_IMAGE_HEIGHT', '80', 'The pixel height of small images', 4, 2, NULL, '2013-08-26 23:38:55', NULL, NULL),
(57, 'Heading Image Width', 'HEADING_IMAGE_WIDTH', '57', 'The pixel width of heading images', 4, 3, NULL, '2013-08-26 23:38:55', NULL, NULL),
(58, 'Heading Image Height', 'HEADING_IMAGE_HEIGHT', '40', 'The pixel height of heading images', 4, 4, NULL, '2013-08-26 23:38:55', NULL, NULL),
(59, 'Subcategory Image Width', 'SUBCATEGORY_IMAGE_WIDTH', '100', 'The pixel width of subcategory images', 4, 5, NULL, '2013-08-26 23:38:55', NULL, NULL),
(60, 'Subcategory Image Height', 'SUBCATEGORY_IMAGE_HEIGHT', '57', 'The pixel height of subcategory images', 4, 6, NULL, '2013-08-26 23:38:55', NULL, NULL),
(61, 'Calculate Image Size', 'CONFIG_CALCULATE_IMAGE_SIZE', 'true', 'Calculate the size of images?', 4, 7, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(62, 'Image Required', 'IMAGE_REQUIRED', 'true', 'Enable to display broken images. Good for development.', 4, 8, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(63, 'Gender', 'ACCOUNT_GENDER', 'true', 'Display gender in the customers account', 5, 1, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(64, 'Date of Birth', 'ACCOUNT_DOB', 'true', 'Display date of birth in the customers account', 5, 2, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(65, 'Company', 'ACCOUNT_COMPANY', 'true', 'Display company in the customers account', 5, 3, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(66, 'Suburb', 'ACCOUNT_SUBURB', 'true', 'Display suburb in the customers account', 5, 4, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(67, 'State', 'ACCOUNT_STATE', 'true', 'Display state in the customers account', 5, 5, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(68, 'Installed Modules', 'MODULE_PAYMENT_INSTALLED', 'cod.php;paypal_express.php;paypal_standard.php', 'List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: cod.php;paypal_express.php)', 6, 0, NULL, '2013-08-26 23:38:55', NULL, NULL),
(69, 'Installed Modules', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php', 'List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)', 6, 0, NULL, '2013-08-26 23:38:55', NULL, NULL),
(70, 'Installed Modules', 'MODULE_SHIPPING_INSTALLED', 'flat.php', 'List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)', 6, 0, NULL, '2013-08-26 23:38:55', NULL, NULL),
(71, 'Installed Modules', 'MODULE_ACTION_RECORDER_INSTALLED', 'ar_admin_login.php;ar_contact_us.php;ar_reset_password.php;ar_tell_a_friend.php', 'List of action recorder module filenames separated by a semi-colon. This is automatically updated. No need to edit.', 6, 0, NULL, '2013-08-26 23:38:55', NULL, NULL),
(72, 'Installed Modules', 'MODULE_SOCIAL_BOOKMARKS_INSTALLED', 'sb_email.php;sb_facebook.php;sb_google_plus_share.php;sb_pinterest.php;sb_twitter.php', 'List of social bookmark module filenames separated by a semi-colon. This is automatically updated. No need to edit.', 6, 0, NULL, '2013-08-26 23:38:55', NULL, NULL),
(73, 'Enable Cash On Delivery Module', 'MODULE_PAYMENT_COD_STATUS', 'True', 'Do you want to accept Cash On Delevery payments?', 6, 1, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(74, 'Payment Zone', 'MODULE_PAYMENT_COD_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2013-08-26 23:38:55', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes('),
(75, 'Sort order of display.', 'MODULE_PAYMENT_COD_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:55', NULL, NULL),
(76, 'Set Order Status', 'MODULE_PAYMENT_COD_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2013-08-26 23:38:55', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses('),
(77, 'Enable Flat Shipping', 'MODULE_SHIPPING_FLAT_STATUS', 'True', 'Do you want to offer flat rate shipping?', 6, 0, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(78, 'Shipping Cost', 'MODULE_SHIPPING_FLAT_COST', '0', 'The shipping cost for all orders using this shipping method.', 6, 0, NULL, '2013-08-26 23:38:55', NULL, NULL),
(79, 'Tax Class', 'MODULE_SHIPPING_FLAT_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2013-08-26 23:38:55', 'tep_get_tax_class_title', 'tep_cfg_pull_down_tax_classes('),
(80, 'Shipping Zone', 'MODULE_SHIPPING_FLAT_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2013-08-26 23:38:55', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes('),
(81, 'Sort Order', 'MODULE_SHIPPING_FLAT_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2013-08-26 23:38:55', NULL, NULL),
(82, 'Default Currency', 'DEFAULT_CURRENCY', 'USD', 'Default Currency', 6, 0, NULL, '2013-08-26 23:38:55', NULL, NULL),
(83, 'Default Language', 'DEFAULT_LANGUAGE', 'es', 'Default Language', 6, 0, NULL, '2013-08-26 23:38:55', NULL, NULL),
(84, 'Default Order Status For New Orders', 'DEFAULT_ORDERS_STATUS_ID', '1', 'When a new order is created, this order status will be assigned to it.', 6, 0, NULL, '2013-08-26 23:38:55', NULL, NULL),
(85, 'Display Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', 'Do you want to display the order shipping cost?', 6, 1, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(86, 'Sort Order', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '2', 'Sort order of display.', 6, 2, NULL, '2013-08-26 23:38:55', NULL, NULL),
(87, 'Allow Free Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'false', 'Do you want to allow free shipping?', 6, 3, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(88, 'Free Shipping For Orders Over', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50', 'Provide free shipping for orders over the set amount.', 6, 4, NULL, '2013-08-26 23:38:55', 'currencies->format', NULL),
(89, 'Provide Free Shipping For Orders Made', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'national', 'Provide free shipping for orders sent to the set destination.', 6, 5, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''national'', ''international'', ''both''), '),
(90, 'Display Sub-Total', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', 'Do you want to display the order sub-total cost?', 6, 1, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(91, 'Sort Order', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '1', 'Sort order of display.', 6, 2, NULL, '2013-08-26 23:38:55', NULL, NULL),
(92, 'Display Tax', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', 'Do you want to display the order tax value?', 6, 1, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(93, 'Sort Order', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '3', 'Sort order of display.', 6, 2, NULL, '2013-08-26 23:38:55', NULL, NULL),
(94, 'Display Total', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', 'Do you want to display the total order value?', 6, 1, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(95, 'Sort Order', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '4', 'Sort order of display.', 6, 2, NULL, '2013-08-26 23:38:55', NULL, NULL),
(96, 'Minimum Minutes Per E-Mail', 'MODULE_ACTION_RECORDER_CONTACT_US_EMAIL_MINUTES', '15', 'Minimum number of minutes to allow 1 e-mail to be sent (eg, 15 for 1 e-mail every 15 minutes)', 6, 0, NULL, '2013-08-26 23:38:55', NULL, NULL),
(97, 'Minimum Minutes Per E-Mail', 'MODULE_ACTION_RECORDER_TELL_A_FRIEND_EMAIL_MINUTES', '15', 'Minimum number of minutes to allow 1 e-mail to be sent (eg, 15 for 1 e-mail every 15 minutes)', 6, 0, NULL, '2013-08-26 23:38:55', NULL, NULL),
(98, 'Allowed Minutes', 'MODULE_ACTION_RECORDER_ADMIN_LOGIN_MINUTES', '5', 'Number of minutes to allow login attempts to occur.', 6, 0, NULL, '2013-08-26 23:38:55', NULL, NULL),
(99, 'Allowed Attempts', 'MODULE_ACTION_RECORDER_ADMIN_LOGIN_ATTEMPTS', '3', 'Number of login attempts to allow within the specified period.', 6, 0, NULL, '2013-08-26 23:38:55', NULL, NULL),
(100, 'Allowed Minutes', 'MODULE_ACTION_RECORDER_RESET_PASSWORD_MINUTES', '5', 'Number of minutes to allow password resets to occur.', 6, 0, NULL, '2013-08-26 23:38:55', NULL, NULL),
(101, 'Allowed Attempts', 'MODULE_ACTION_RECORDER_RESET_PASSWORD_ATTEMPTS', '1', 'Number of password reset attempts to allow within the specified period.', 6, 0, NULL, '2013-08-26 23:38:55', NULL, NULL),
(102, 'Enable E-Mail Module', 'MODULE_SOCIAL_BOOKMARKS_EMAIL_STATUS', 'True', 'Do you want to allow products to be shared through e-mail?', 6, 1, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(103, 'Sort Order', 'MODULE_SOCIAL_BOOKMARKS_EMAIL_SORT_ORDER', '10', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:55', NULL, NULL),
(104, 'Enable Google+ Share Module', 'MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_STATUS', 'True', 'Do you want to allow products to be shared through Google+?', 6, 1, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(105, 'Annotation', 'MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_ANNOTATION', 'None', 'The annotation to display next to the button.', 6, 1, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''Inline'', ''Bubble'', ''Vertical-Bubble'', ''None''), '),
(106, 'Width', 'MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_WIDTH', '', 'The maximum width of the button.', 6, 0, NULL, '2013-08-26 23:38:55', NULL, NULL),
(107, 'Height', 'MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_HEIGHT', '15', 'Sets the height of the button.', 6, 1, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''15'', ''20'', ''24'', ''60''), '),
(108, 'Alignment', 'MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_ALIGN', 'Left', 'The alignment of the button assets.', 6, 1, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''Left'', ''Right''), '),
(109, 'Sort Order', 'MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_SORT_ORDER', '20', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:55', NULL, NULL),
(110, 'Enable Facebook Module', 'MODULE_SOCIAL_BOOKMARKS_FACEBOOK_STATUS', 'True', 'Do you want to allow products to be shared through Facebook?', 6, 1, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(111, 'Sort Order', 'MODULE_SOCIAL_BOOKMARKS_FACEBOOK_SORT_ORDER', '30', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:55', NULL, NULL),
(112, 'Enable Twitter Module', 'MODULE_SOCIAL_BOOKMARKS_TWITTER_STATUS', 'True', 'Do you want to allow products to be shared through Twitter?', 6, 1, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(113, 'Sort Order', 'MODULE_SOCIAL_BOOKMARKS_TWITTER_SORT_ORDER', '40', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:55', NULL, NULL),
(114, 'Enable Pinterest Module', 'MODULE_SOCIAL_BOOKMARKS_PINTEREST_STATUS', 'True', 'Do you want to allow Pinterest Button?', 6, 1, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(115, 'Layout Position', 'MODULE_SOCIAL_BOOKMARKS_PINTEREST_BUTTON_COUNT_POSITION', 'None', 'Horizontal or Vertical or None', 6, 2, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''Horizontal'', ''Vertical'', ''None''), '),
(116, 'Sort Order', 'MODULE_SOCIAL_BOOKMARKS_PINTEREST_SORT_ORDER', '50', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:55', NULL, NULL),
(117, 'Country of Origin', 'SHIPPING_ORIGIN_COUNTRY', '223', 'Select the country of origin to be used in shipping quotes.', 7, 1, NULL, '2013-08-26 23:38:55', 'tep_get_country_name', 'tep_cfg_pull_down_country_list('),
(118, 'Postal Code', 'SHIPPING_ORIGIN_ZIP', 'NONE', 'Enter the Postal Code (ZIP) of the Store to be used in shipping quotes.', 7, 2, NULL, '2013-08-26 23:38:55', NULL, NULL),
(119, 'Enter the Maximum Package Weight you will ship', 'SHIPPING_MAX_WEIGHT', '50', 'Carriers have a max weight limit for a single package. This is a common one for all.', 7, 3, NULL, '2013-08-26 23:38:55', NULL, NULL),
(120, 'Package Tare weight.', 'SHIPPING_BOX_WEIGHT', '3', 'What is the weight of typical packaging of small to medium packages?', 7, 4, NULL, '2013-08-26 23:38:55', NULL, NULL),
(121, 'Larger packages - percentage increase.', 'SHIPPING_BOX_PADDING', '10', 'For 10% enter 10', 7, 5, NULL, '2013-08-26 23:38:55', NULL, NULL),
(122, 'Display Product Image', 'PRODUCT_LIST_IMAGE', '1', 'Do you want to display the Product Image?', 8, 1, NULL, '2013-08-26 23:38:55', NULL, NULL),
(123, 'Display Product Manufacturer Name', 'PRODUCT_LIST_MANUFACTURER', '0', 'Do you want to display the Product Manufacturer Name?', 8, 2, NULL, '2013-08-26 23:38:55', NULL, NULL),
(124, 'Display Product Model', 'PRODUCT_LIST_MODEL', '0', 'Do you want to display the Product Model?', 8, 3, NULL, '2013-08-26 23:38:55', NULL, NULL),
(125, 'Display Product Name', 'PRODUCT_LIST_NAME', '2', 'Do you want to display the Product Name?', 8, 4, NULL, '2013-08-26 23:38:55', NULL, NULL),
(126, 'Display Product Price', 'PRODUCT_LIST_PRICE', '3', 'Do you want to display the Product Price', 8, 5, NULL, '2013-08-26 23:38:55', NULL, NULL),
(127, 'Display Product Quantity', 'PRODUCT_LIST_QUANTITY', '0', 'Do you want to display the Product Quantity?', 8, 6, NULL, '2013-08-26 23:38:55', NULL, NULL),
(128, 'Display Product Weight', 'PRODUCT_LIST_WEIGHT', '0', 'Do you want to display the Product Weight?', 8, 7, NULL, '2013-08-26 23:38:55', NULL, NULL),
(129, 'Display Buy Now column', 'PRODUCT_LIST_BUY_NOW', '4', 'Do you want to display the Buy Now column?', 8, 8, NULL, '2013-08-26 23:38:55', NULL, NULL),
(130, 'Display Category/Manufacturer Filter (0=disable; 1=enable)', 'PRODUCT_LIST_FILTER', '1', 'Do you want to display the Category/Manufacturer Filter?', 8, 9, NULL, '2013-08-26 23:38:55', NULL, NULL),
(131, 'Location of Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 'PREV_NEXT_BAR_LOCATION', '2', 'Sets the location of the Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 8, 10, NULL, '2013-08-26 23:38:55', NULL, NULL),
(132, 'Check stock level', 'STOCK_CHECK', 'true', 'Check to see if sufficent stock is available', 9, 1, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(133, 'Subtract stock', 'STOCK_LIMITED', 'true', 'Subtract product in stock by product orders', 9, 2, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(134, 'Allow Checkout', 'STOCK_ALLOW_CHECKOUT', 'true', 'Allow customer to checkout even if there is insufficient stock', 9, 3, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(135, 'Mark product out of stock', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', 'Display something on screen so customer can see which product has insufficient stock', 9, 4, NULL, '2013-08-26 23:38:55', NULL, NULL),
(136, 'Stock Re-order level', 'STOCK_REORDER_LEVEL', '5', 'Define when stock needs to be re-ordered', 9, 5, NULL, '2013-08-26 23:38:55', NULL, NULL),
(137, 'Store Page Parse Time', 'STORE_PAGE_PARSE_TIME', 'false', 'Store the time it takes to parse a page', 10, 1, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(138, 'Log Destination', 'STORE_PAGE_PARSE_TIME_LOG', '/var/log/www/tep/page_parse_time.log', 'Directory and filename of the page parse time log', 10, 2, NULL, '2013-08-26 23:38:55', NULL, NULL),
(139, 'Log Date Format', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', 'The date format', 10, 3, NULL, '2013-08-26 23:38:55', NULL, NULL),
(140, 'Display The Page Parse Time', 'DISPLAY_PAGE_PARSE_TIME', 'true', 'Display the page parse time (store page parse time must be enabled)', 10, 4, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(141, 'Store Database Queries', 'STORE_DB_TRANSACTIONS', 'false', 'Store the database queries in the page parse time log', 10, 5, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(142, 'Use Cache', 'USE_CACHE', 'false', 'Use caching features', 11, 1, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(143, 'Cache Directory', 'DIR_FS_CACHE', 'C:/xampp/htdocs/TopicosWeb/osCommerce/catalog/includes/work/', 'The directory where the cached files are saved', 11, 2, NULL, '2013-08-26 23:38:55', NULL, NULL),
(144, 'E-Mail Transport Method', 'EMAIL_TRANSPORT', 'sendmail', 'Defines if this server uses a local connection to sendmail or uses an SMTP connection via TCP/IP. Servers running on Windows and MacOS should change this setting to SMTP.', 12, 1, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''sendmail'', ''smtp''),'),
(145, 'E-Mail Linefeeds', 'EMAIL_LINEFEED', 'LF', 'Defines the character sequence used to separate mail headers.', 12, 2, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''LF'', ''CRLF''),'),
(146, 'Use MIME HTML When Sending Emails', 'EMAIL_USE_HTML', 'false', 'Send e-mails in HTML format', 12, 3, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(147, 'Verify E-Mail Addresses Through DNS', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false', 'Verify e-mail address through a DNS server', 12, 4, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(148, 'Send E-Mails', 'SEND_EMAILS', 'true', 'Send out e-mails', 12, 5, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(149, 'Enable download', 'DOWNLOAD_ENABLED', 'false', 'Enable the products download functions.', 13, 1, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(150, 'Download by redirect', 'DOWNLOAD_BY_REDIRECT', 'false', 'Use browser redirection for download. Disable on non-Unix systems.', 13, 2, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(151, 'Expiry delay (days)', 'DOWNLOAD_MAX_DAYS', '7', 'Set number of days before the download link expires. 0 means no limit.', 13, 3, NULL, '2013-08-26 23:38:55', NULL, ''),
(152, 'Maximum number of downloads', 'DOWNLOAD_MAX_COUNT', '5', 'Set the maximum number of downloads. 0 means no download authorized.', 13, 4, NULL, '2013-08-26 23:38:55', NULL, ''),
(153, 'Enable GZip Compression', 'GZIP_COMPRESSION', 'false', 'Enable HTTP GZip compression.', 14, 1, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(154, 'Compression Level', 'GZIP_LEVEL', '5', 'Use this compression level 0-9 (0 = minimum, 9 = maximum).', 14, 2, NULL, '2013-08-26 23:38:55', NULL, NULL),
(155, 'Session Directory', 'SESSION_WRITE_DIRECTORY', 'C:/xampp/htdocs/TopicosWeb/osCommerce/catalog/includes/work/', 'If sessions are file based, store them in this directory.', 15, 1, NULL, '2013-08-26 23:38:55', NULL, NULL),
(156, 'Force Cookie Use', 'SESSION_FORCE_COOKIE_USE', 'False', 'Force the use of sessions when cookies are only enabled.', 15, 2, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(157, 'Check SSL Session ID', 'SESSION_CHECK_SSL_SESSION_ID', 'False', 'Validate the SSL_SESSION_ID on every secure HTTPS page request.', 15, 3, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(158, 'Check User Agent', 'SESSION_CHECK_USER_AGENT', 'False', 'Validate the clients browser user agent on every page request.', 15, 4, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(159, 'Check IP Address', 'SESSION_CHECK_IP_ADDRESS', 'False', 'Validate the clients IP address on every page request.', 15, 5, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(160, 'Prevent Spider Sessions', 'SESSION_BLOCK_SPIDERS', 'True', 'Prevent known spiders from starting a session.', 15, 6, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(161, 'Recreate Session', 'SESSION_RECREATE', 'True', 'Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).', 15, 7, NULL, '2013-08-26 23:38:55', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(162, 'Last Update Check Time', 'LAST_UPDATE_CHECK_TIME', '', 'Last time a check for new versions of osCommerce was run', 6, 0, NULL, '2013-08-26 23:38:55', NULL, NULL),
(163, 'Enable PayPal Express Checkout', 'MODULE_PAYMENT_PAYPAL_EXPRESS_STATUS', 'True', 'Do you want to accept PayPal Express Checkout payments?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(164, 'Seller Account', 'MODULE_PAYMENT_PAYPAL_EXPRESS_SELLER_ACCOUNT', 'sprtn_link.hrdy@hotmail.com', 'The email address of the seller account if no API credentials has been setup.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(165, 'API Username', 'MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME', '', 'The username to use for the PayPal API service', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(166, 'API Password', 'MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD', '', 'The password to use for the PayPal API service', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(167, 'API Signature', 'MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE', '', 'The signature to use for the PayPal API service', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(168, 'Transaction Server', 'MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_SERVER', 'Live', 'Use the live or testing (sandbox) gateway server to process transactions?', 6, 0, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''Live'', ''Sandbox''), '),
(169, 'Transaction Method', 'MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_METHOD', 'Sale', 'The processing method to use for each transaction.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''Authorization'', ''Sale''), '),
(170, 'PayPal Account Optional', 'MODULE_PAYMENT_PAYPAL_EXPRESS_ACCOUNT_OPTIONAL', 'False', 'This must also be enabled in your PayPal account, in Profile > Website Payment Preferences.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(171, 'PayPal Instant Update', 'MODULE_PAYMENT_PAYPAL_EXPRESS_INSTANT_UPDATE', 'True', 'Support PayPal shipping and tax calculations on the PayPal.com site during Express Checkout.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(172, 'PayPal Checkout Image', 'MODULE_PAYMENT_PAYPAL_EXPRESS_CHECKOUT_IMAGE', 'Static', 'Use static or dynamic Express Checkout image buttons. Dynamic images are used with PayPal campaigns.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''Static'', ''Dynamic''), '),
(173, 'Debug E-Mail Address', 'MODULE_PAYMENT_PAYPAL_EXPRESS_DEBUG_EMAIL', '', 'All parameters of an invalid transaction will be sent to this email address.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(174, 'Payment Zone', 'MODULE_PAYMENT_PAYPAL_EXPRESS_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2013-08-26 23:38:57', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes('),
(175, 'Sort order of display.', 'MODULE_PAYMENT_PAYPAL_EXPRESS_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(176, 'Set Order Status', 'MODULE_PAYMENT_PAYPAL_EXPRESS_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2013-08-26 23:38:57', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses('),
(177, 'PayPal Transactions Order Status Level', 'MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTIONS_ORDER_STATUS_ID', '4', 'Include PayPal transaction information in this order status level', 6, 0, NULL, '2013-08-26 23:38:57', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses('),
(178, 'cURL Program Location', 'MODULE_PAYMENT_PAYPAL_EXPRESS_CURL', '/usr/bin/curl', 'The location to the cURL program application.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(179, 'Installed Modules', 'MODULE_HEADER_TAGS_INSTALLED', 'ht_canonical.php;ht_manufacturer_title.php;ht_category_title.php;ht_product_title.php;ht_robot_noindex.php', 'List of header tag module filenames separated by a semi-colon. This is automatically updated. No need to edit.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(180, 'Enable Category Title Module', 'MODULE_HEADER_TAGS_CATEGORY_TITLE_STATUS', 'True', 'Do you want to allow category titles to be added to the page title?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(181, 'Sort Order', 'MODULE_HEADER_TAGS_CATEGORY_TITLE_SORT_ORDER', '200', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(182, 'Enable Manufacturer Title Module', 'MODULE_HEADER_TAGS_MANUFACTURER_TITLE_STATUS', 'True', 'Do you want to allow manufacturer titles to be added to the page title?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(183, 'Sort Order', 'MODULE_HEADER_TAGS_MANUFACTURER_TITLE_SORT_ORDER', '100', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(184, 'Enable Product Title Module', 'MODULE_HEADER_TAGS_PRODUCT_TITLE_STATUS', 'True', 'Do you want to allow product titles to be added to the page title?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(185, 'Sort Order', 'MODULE_HEADER_TAGS_PRODUCT_TITLE_SORT_ORDER', '300', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(186, 'Enable Canonical Module', 'MODULE_HEADER_TAGS_CANONICAL_STATUS', 'True', 'Do you want to enable the Canonical module?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(187, 'Sort Order', 'MODULE_HEADER_TAGS_CANONICAL_SORT_ORDER', '400', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(188, 'Enable Robot NoIndex Module', 'MODULE_HEADER_TAGS_ROBOT_NOINDEX_STATUS', 'True', 'Do you want to enable the Robot NoIndex module?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(189, 'Pages', 'MODULE_HEADER_TAGS_ROBOT_NOINDEX_PAGES', 'account.php;account_edit.php;account_history.php;account_history_info.php;account_newsletters.php;account_notifications.php;account_password.php;address_book.php;address_book_process.php;checkout_confirmation.php;checkout_payment.php;checkout_payment_address.php;checkout_process.php;checkout_shipping.php;checkout_shipping_address.php;checkout_success.php;cookie_usage.php;create_account.php;create_account_success.php;login.php;logoff.php;password_forgotten.php;password_reset.php;product_reviews_write.php;shopping_cart.php;ssl_check.php;tell_a_friend.php', 'The pages to add the meta robot noindex tag to.', 6, 0, NULL, '2013-08-26 23:38:57', 'ht_robot_noindex_show_pages', 'ht_robot_noindex_edit_pages('),
(190, 'Sort Order', 'MODULE_HEADER_TAGS_ROBOT_NOINDEX_SORT_ORDER', '500', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(191, 'Installed Modules', 'MODULE_ADMIN_DASHBOARD_INSTALLED', 'd_total_revenue.php;d_total_customers.php;d_orders.php;d_customers.php;d_admin_logins.php;d_security_checks.php;d_latest_news.php;d_latest_addons.php;d_version_check.php;d_reviews.php', 'List of Administration Tool Dashboard module filenames separated by a semi-colon. This is automatically updated. No need to edit.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(192, 'Enable Administrator Logins Module', 'MODULE_ADMIN_DASHBOARD_ADMIN_LOGINS_STATUS', 'True', 'Do you want to show the latest administrator logins on the dashboard?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(193, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_ADMIN_LOGINS_SORT_ORDER', '500', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(194, 'Enable Customers Module', 'MODULE_ADMIN_DASHBOARD_CUSTOMERS_STATUS', 'True', 'Do you want to show the newest customers on the dashboard?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(195, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_CUSTOMERS_SORT_ORDER', '400', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(196, 'Enable Latest Add-Ons Module', 'MODULE_ADMIN_DASHBOARD_LATEST_ADDONS_STATUS', 'True', 'Do you want to show the latest osCommerce Add-Ons on the dashboard?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(197, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_LATEST_ADDONS_SORT_ORDER', '800', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(198, 'Enable Latest News Module', 'MODULE_ADMIN_DASHBOARD_LATEST_NEWS_STATUS', 'True', 'Do you want to show the latest osCommerce News on the dashboard?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(199, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_LATEST_NEWS_SORT_ORDER', '700', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(200, 'Enable Orders Module', 'MODULE_ADMIN_DASHBOARD_ORDERS_STATUS', 'True', 'Do you want to show the latest orders on the dashboard?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(201, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_ORDERS_SORT_ORDER', '300', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(202, 'Enable Security Checks Module', 'MODULE_ADMIN_DASHBOARD_SECURITY_CHECKS_STATUS', 'True', 'Do you want to run the security checks for this installation?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(203, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_SECURITY_CHECKS_SORT_ORDER', '600', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(204, 'Enable Total Customers Module', 'MODULE_ADMIN_DASHBOARD_TOTAL_CUSTOMERS_STATUS', 'True', 'Do you want to show the total customers chart on the dashboard?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(205, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_TOTAL_CUSTOMERS_SORT_ORDER', '200', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(206, 'Enable Total Revenue Module', 'MODULE_ADMIN_DASHBOARD_TOTAL_REVENUE_STATUS', 'True', 'Do you want to show the total revenue chart on the dashboard?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(207, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_TOTAL_REVENUE_SORT_ORDER', '100', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(208, 'Enable Version Check Module', 'MODULE_ADMIN_DASHBOARD_VERSION_CHECK_STATUS', 'True', 'Do you want to show the version check results on the dashboard?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(209, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_VERSION_CHECK_SORT_ORDER', '900', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(210, 'Enable Latest Reviews Module', 'MODULE_ADMIN_DASHBOARD_REVIEWS_STATUS', 'True', 'Do you want to show the latest reviews on the dashboard?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(211, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_REVIEWS_SORT_ORDER', '1000', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(212, 'Installed Modules', 'MODULE_BOXES_INSTALLED', 'bm_categories.php;bm_manufacturers.php;bm_search.php;bm_whats_new.php;bm_information.php;bm_shopping_cart.php;bm_manufacturer_info.php;bm_order_history.php;bm_best_sellers.php;bm_product_notifications.php;bm_product_social_bookmarks.php;bm_specials.php;bm_reviews.php;bm_languages.php;bm_currencies.php', 'List of box module filenames separated by a semi-colon. This is automatically updated. No need to edit.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(213, 'Enable Best Sellers Module', 'MODULE_BOXES_BEST_SELLERS_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(214, 'Content Placement', 'MODULE_BOXES_BEST_SELLERS_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(215, 'Sort Order', 'MODULE_BOXES_BEST_SELLERS_SORT_ORDER', '5030', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(216, 'Enable Categories Module', 'MODULE_BOXES_CATEGORIES_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(217, 'Content Placement', 'MODULE_BOXES_CATEGORIES_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(218, 'Sort Order', 'MODULE_BOXES_CATEGORIES_SORT_ORDER', '1000', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(219, 'Enable Currencies Module', 'MODULE_BOXES_CURRENCIES_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(220, 'Content Placement', 'MODULE_BOXES_CURRENCIES_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(221, 'Sort Order', 'MODULE_BOXES_CURRENCIES_SORT_ORDER', '5090', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(222, 'Enable Information Module', 'MODULE_BOXES_INFORMATION_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(223, 'Content Placement', 'MODULE_BOXES_INFORMATION_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(224, 'Sort Order', 'MODULE_BOXES_INFORMATION_SORT_ORDER', '1050', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(225, 'Enable Languages Module', 'MODULE_BOXES_LANGUAGES_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(226, 'Content Placement', 'MODULE_BOXES_LANGUAGES_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(227, 'Sort Order', 'MODULE_BOXES_LANGUAGES_SORT_ORDER', '5080', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(228, 'Enable Manufacturer Info Module', 'MODULE_BOXES_MANUFACTURER_INFO_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(229, 'Content Placement', 'MODULE_BOXES_MANUFACTURER_INFO_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(230, 'Sort Order', 'MODULE_BOXES_MANUFACTURER_INFO_SORT_ORDER', '5010', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(231, 'Enable Manufacturers Module', 'MODULE_BOXES_MANUFACTURERS_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(232, 'Content Placement', 'MODULE_BOXES_MANUFACTURERS_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(233, 'Sort Order', 'MODULE_BOXES_MANUFACTURERS_SORT_ORDER', '1020', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(234, 'Enable Order History Module', 'MODULE_BOXES_ORDER_HISTORY_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(235, 'Content Placement', 'MODULE_BOXES_ORDER_HISTORY_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(236, 'Sort Order', 'MODULE_BOXES_ORDER_HISTORY_SORT_ORDER', '5020', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(237, 'Enable Product Notifications Module', 'MODULE_BOXES_PRODUCT_NOTIFICATIONS_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(238, 'Content Placement', 'MODULE_BOXES_PRODUCT_NOTIFICATIONS_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(239, 'Sort Order', 'MODULE_BOXES_PRODUCT_NOTIFICATIONS_SORT_ORDER', '5040', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(240, 'Enable Product Social Bookmarks Module', 'MODULE_BOXES_PRODUCT_SOCIAL_BOOKMARKS_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(241, 'Content Placement', 'MODULE_BOXES_PRODUCT_SOCIAL_BOOKMARKS_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(242, 'Sort Order', 'MODULE_BOXES_PRODUCT_SOCIAL_BOOKMARKS_SORT_ORDER', '5050', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(243, 'Enable Reviews Module', 'MODULE_BOXES_REVIEWS_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(244, 'Content Placement', 'MODULE_BOXES_REVIEWS_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(245, 'Sort Order', 'MODULE_BOXES_REVIEWS_SORT_ORDER', '5070', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(246, 'Enable Search Module', 'MODULE_BOXES_SEARCH_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(247, 'Content Placement', 'MODULE_BOXES_SEARCH_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(248, 'Sort Order', 'MODULE_BOXES_SEARCH_SORT_ORDER', '1030', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(249, 'Enable Shopping Cart Module', 'MODULE_BOXES_SHOPPING_CART_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(250, 'Content Placement', 'MODULE_BOXES_SHOPPING_CART_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(251, 'Sort Order', 'MODULE_BOXES_SHOPPING_CART_SORT_ORDER', '5000', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(252, 'Enable Specials Module', 'MODULE_BOXES_SPECIALS_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(253, 'Content Placement', 'MODULE_BOXES_SPECIALS_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(254, 'Sort Order', 'MODULE_BOXES_SPECIALS_SORT_ORDER', '5060', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(255, 'Enable What''s New Module', 'MODULE_BOXES_WHATS_NEW_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(256, 'Content Placement', 'MODULE_BOXES_WHATS_NEW_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2013-08-26 23:38:57', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(257, 'Sort Order', 'MODULE_BOXES_WHATS_NEW_SORT_ORDER', '1040', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(258, 'Installed Template Block Groups', 'TEMPLATE_BLOCK_GROUPS', 'boxes;header_tags', 'This is automatically updated. No need to edit.', 6, 0, NULL, '2013-08-26 23:38:57', NULL, NULL),
(259, 'Only display invoice for delivered orders?', 'DISPLAY_PDF_DELIVERED_ONLY', 'false', 'Would you like to display a PDF invoice link only if the order status has been set as delivered?<br />[ Default = true ]<br />', 16, 1, '2013-08-28 18:52:46', '2013-02-12 12:00:00', '', 'tep_cfg_select_option(array(''false'', ''true''),'),
(260, 'Force PDF download?', 'FORCE_PDF_INVOICE_DOWNLOAD', 'false', 'Choose how you want the generated invoice displayed to the customer.<br />Inline - opens within browser using plugin.<br />[ This is the default value - false ]<br />Download - force browser to offer PDF for download - set to true to enable this feature.<', 16, 2, '2013-02-12 12:00:00', '2013-02-12 12:00:00', NULL, 'tep_cfg_select_option(array(''false'', ''true''),'),
(261, 'Invoice Date', 'PDF_INV_DATE', 'order', 'Do you want the invoice date to be today''s date or the date of order?<br />[ Default = order ]<br />', 16, 3, '2013-02-12 12:00:00', '2013-02-12 12:00:00', '', 'tep_cfg_select_option(array(''order'', ''today''),'),
(262, 'Choose Logo', 'PDF_INVOICE_IMAGE', 'includes/modules/pdf_invoice/sample_logo.png', 'Path and name of store logo to insert into PDF<br />Max dimensions 600 x 180px<br />Valid formats: jpg, gif, png<br />', 16, 4, '2013-02-12 12:00:00', '2013-02-12 12:00:00', NULL, ''),
(263, 'Image Correction Factor', 'PDF_INV_IMG_CORRECTION', '0.18', 'Adjust value to fine-tune image size.<br />[ Default = 0.18 ]<br />See readme.txt for details.<br />', 16, 5, '2013-02-12 12:00:00', '2013-02-12 12:00:00', NULL, ''),
(264, 'Set Invoice Font', 'PDF_INV_CORE_FONT', 'arial', 'Choose a font for the PDF invoice.<br />Arial<br />Times<br />Courier<br />Helvetica<br />', 16, 6, '2013-02-12 12:00:00', '2013-02-12 12:00:00', NULL, 'tep_cfg_select_option(array(''arial'', ''times'',''courier'',''helvetica''),'),
(265, 'Set Default Text Colour', 'PDF_INV_STANDARD_COLOR', '#000000', 'Choose a hexidecimal colour for normal invoice text.<br />Enter as six character hex number, with or without #<br />', 16, 7, '2013-02-12 12:00:00', '2013-02-12 12:00:00', NULL, ''),
(266, 'Set Store Name Text Colour', 'PDF_INV_COM_NAME_COLOR', '#000099', 'Choose a hexidecimal colour for the company name.<br />Enter as six character hex number, with or without #<br />', 16, 8, '2013-02-12 12:00:00', '2013-02-12 12:00:00', NULL, ''),
(267, 'Set Company Address Text Colour', 'PDF_INV_COM_ADDRESS_COLOR', '#424242', 'Choose a hexidecimal colour for the company address &amp; other details.<br />Enter as six character hex number, with or without #<br />', 16, 9, '2013-02-12 12:00:00', '2013-02-12 12:00:00', NULL, ''),
(268, 'Set Company email Address Text Colour', 'PDF_INV_COM_EMAIL_COLOR', '#009999', 'Choose a hexidecimal colour for the company email address &amp; other details.<br />Enter as six character hex number, with or without #<br />', 16, 10, '2013-02-12 12:00:00', '2013-02-12 12:00:00', NULL, ''),
(269, 'Set Company Web Address Text Colour', 'PDF_INV_COM_WEB_ADDRESS_COLOR', '#009999', 'Choose a hexidecimal colour for the company web address &amp; other details.<br />Enter as six character hex number, with or without #<br />', 16, 11, '2013-02-12 12:00:00', '2013-02-12 12:00:00', NULL, ''),
(270, 'Set Invoice Number, ID &amp; Date Text Colour', 'PDF_INV_NUMIDDATE_COLOR', '#990000', 'Choose a hexidecimal colour for the invoice number, id &amp; date.<br />Enter as six character hex number, with or without #<br />', 16, 12, '2013-02-12 12:00:00', '2013-02-12 12:00:00', NULL, ''),
(271, 'Set Invoice Line &amp; Text Colour', 'PDF_INV_INVLINE_COLOR', '#808080', 'Choose a hexidecimal colour for invoice line &amp; text.<br />Enter as six character hex number, with or without #<br />', 16, 13, '2013-02-12 12:00:00', '2013-02-12 12:00:00', NULL, ''),
(272, 'Set Invoice Footer Text Colour', 'PDF_INV_FOOTER_COLOR', '#990000', 'Choose a hexidecimal colour for invoice footer text.<br />Enter as six character hex number, with or without #<br />', 16, 14, '2013-02-12 12:00:00', '2013-02-12 12:00:00', NULL, ''),
(273, 'Set Box Border Colour', 'PDF_INV_BORDER_COLOR', '#666666', 'Choose a hexidecimal colour for the box border colour.<br />Enter as six character hex number, with or without #<br />', 16, 15, '2013-02-12 12:00:00', '2013-02-12 12:00:00', NULL, ''),
(274, 'Set Box Fill Colour', 'PDF_INV_CELL_COLOR', '#EEEEEE', 'Choose a hexidecimal colour for the box fill colour.<br />Enter as six character hex number, with or without #<br />', 16, 16, '2013-02-12 12:00:00', '2013-02-12 12:00:00', NULL, ''),
(275, 'Do you want to display a text watermark?', 'PDF_SHOW_WATERMARK', 'false', 'Would you like to display a text watermark through the invoice?<br />[ Default = false ]<br />', 16, 17, '2013-02-12 12:00:00', '2013-02-12 12:00:00', '', 'tep_cfg_select_option(array(''false'', ''true''),'),
(276, 'Set Watermark Text', 'PDF_INV_WATERMARK_TEXT', 'Copy Invoice', 'Enter text for watermark. [ Default = "Copy Invoice" ]<br />', 16, 18, '2013-02-12 12:00:00', '2013-02-12 12:00:00', NULL, ''),
(277, 'Set Watermark Colour', 'PDF_INV_WATERMARK_COLOR', '#EEEEEE', 'Choose a hexidecimal colour for the watermark. KEEP IT PALE!<br />Enter as six character hex number, with or without #<br />', 16, 19, '2013-02-12 12:00:00', '2013-02-12 12:00:00', NULL, ''),
(278, 'Footer Text', 'PDF_INV_FOOTER_TEXT', 'Thank you for your order.', 'Enter some text (eg address or marketing) for the invoice footer.<br />', 16, 20, '2013-02-12 12:00:00', '2013-02-12 12:00:00', NULL, ''),
(279, 'Do you want to display a Tax reference?', 'DISPLAY_PDF_TAX_NUMBER', 'false', 'Would you like to display your VAT / Tax reference on the invoice?<br />[ Default = false ]<br />', 16, 21, '2013-02-12 12:00:00', '2013-02-12 12:00:00', '', 'tep_cfg_select_option(array(''false'', ''true''),'),
(280, 'Set Tax Number description', 'PDF_TAX_NAME', 'VAT number:', 'Choose a prefix description for your VAT / Tax reference.<br />[ Default = VAT number: ]<br />', 16, 22, '2013-02-12 12:00:00', '2013-02-12 12:00:00', NULL, ''),
(281, 'Enter Tax Number', 'PDF_TAX_NUMBER', '', 'Enter your VAT / Tax number here.<br />', 16, 23, '2013-02-12 12:00:00', '2013-02-12 12:00:00', NULL, ''),
(282, 'Remove http:// from the web address?', 'REMOVE_HTTP_WEB_ADDRESS', 'true', 'Would you like to remove http:// (if present) from the web address on the invoice?<br />[ Default = true ]<br />', 16, 24, '2013-02-12 12:00:00', '2013-02-12 12:00:00', '', 'tep_cfg_select_option(array(''false'', ''true''),'),
(283, 'Show the customer reference number?', 'DISPLAY_CUSTOMER_REFERENCE', 'false', 'Would you like to display the customer reference number on the invoice?<br />[ Default = false ]<br />', 16, 25, '2013-02-12 12:00:00', '2013-02-12 12:00:00', '', 'tep_cfg_select_option(array(''false'', ''true''),'),
(284, 'Do you want to display order comments?', 'DISPLAY_PDF_COMMENTS', 'false', 'Would you like to display comments linked to this order?<br />[ Default = false ]<br />', 16, 26, '2013-02-12 12:00:00', '2013-02-12 12:00:00', '', 'tep_cfg_select_option(array(''false'', ''true''),'),
(285, 'Show the products model?', 'DISPLAY_PRODUCT_MODEL', 'false', 'Would you like to display the product model on the invoice?<br />[ Default = false ]<br />', 16, 27, '2013-02-12 12:00:00', '2013-02-12 12:00:00', '', 'tep_cfg_select_option(array(''false'', ''true''),'),
(286, 'Choose the size of the products model box.', 'PRODUCT_MODEL_BOX_WIDTH', '24', 'If you have chosen to show the products model box how wide do you want it?<br />[ Default = 24 ]<br />', 16, 28, '2013-02-12 12:00:00', '2013-02-12 12:00:00', NULL, ''),
(287, 'Display currency symbol in product lines?', 'DISPLAY_PROD_LINE_CURRENCY', 'false', 'Would you like to display the currency symbol in the product lines on the invoice?<br />[ Default = false ]<br />', 16, 29, '2013-02-12 12:00:00', '2013-02-12 12:00:00', '', 'tep_cfg_select_option(array(''false'', ''true''),'),
(288, 'Do you want to display a page number?', 'DISPLAY_PAGE_NUMBER', 'false', 'Would you like to display the page number in the footer?<br />[ Default = false ]<br />', 0, 30, '2013-02-12 12:00:00', '2013-02-12 12:00:00', '', 'tep_cfg_select_option(array(''false'', ''true''),'),
(289, 'Enable PayPal Website Payments Standard', 'MODULE_PAYMENT_PAYPAL_STANDARD_STATUS', 'True', 'Do you want to accept PayPal Website Payments Standard payments?', 6, 3, NULL, '2013-08-30 18:13:46', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(290, 'E-Mail Address', 'MODULE_PAYMENT_PAYPAL_STANDARD_ID', 'sprtn_link.hrdy@hotmail.com', 'The PayPal seller e-mail address to accept payments for', 6, 4, NULL, '2013-08-30 18:13:46', NULL, NULL),
(291, 'Sort order of display.', 'MODULE_PAYMENT_PAYPAL_STANDARD_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2013-08-30 18:13:46', NULL, NULL),
(292, 'Payment Zone', 'MODULE_PAYMENT_PAYPAL_STANDARD_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2013-08-30 18:13:46', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes('),
(293, 'Set Preparing Order Status', 'MODULE_PAYMENT_PAYPAL_STANDARD_PREPARE_ORDER_STATUS_ID', '5', 'Set the status of prepared orders made with this payment module to this value', 6, 0, NULL, '2013-08-30 18:13:46', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses('),
(294, 'Set PayPal Acknowledged Order Status', 'MODULE_PAYMENT_PAYPAL_STANDARD_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2013-08-30 18:13:46', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses('),
(295, 'Gateway Server', 'MODULE_PAYMENT_PAYPAL_STANDARD_GATEWAY_SERVER', 'Live', 'Use the testing (sandbox) or live gateway server for transactions?', 6, 6, NULL, '2013-08-30 18:13:46', NULL, 'tep_cfg_select_option(array(''Live'', ''Sandbox''), '),
(296, 'Transaction Method', 'MODULE_PAYMENT_PAYPAL_STANDARD_TRANSACTION_METHOD', 'Sale', 'The processing method to use for each transaction.', 6, 0, NULL, '2013-08-30 18:13:46', NULL, 'tep_cfg_select_option(array(''Authorization'', ''Sale''), '),
(297, 'Page Style', 'MODULE_PAYMENT_PAYPAL_STANDARD_PAGE_STYLE', '', 'The page style to use for the transaction procedure (defined at your PayPal Profile page)', 6, 4, NULL, '2013-08-30 18:13:46', NULL, NULL),
(298, 'Debug E-Mail Address', 'MODULE_PAYMENT_PAYPAL_STANDARD_DEBUG_EMAIL', '', 'All parameters of an Invalid IPN notification will be sent to this email address if one is entered.', 6, 4, NULL, '2013-08-30 18:13:46', NULL, NULL),
(299, 'Enable Encrypted Web Payments', 'MODULE_PAYMENT_PAYPAL_STANDARD_EWP_STATUS', 'False', 'Do you want to enable Encrypted Web Payments?', 6, 3, NULL, '2013-08-30 18:13:46', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(300, 'Your Private Key', 'MODULE_PAYMENT_PAYPAL_STANDARD_EWP_PRIVATE_KEY', '', 'The location of your Private Key to use for signing the data. (*.pem)', 6, 4, NULL, '2013-08-30 18:13:46', NULL, NULL),
(301, 'Your Public Certificate', 'MODULE_PAYMENT_PAYPAL_STANDARD_EWP_PUBLIC_KEY', '', 'The location of your Public Certificate to use for signing the data. (*.pem)', 6, 4, NULL, '2013-08-30 18:13:46', NULL, NULL),
(302, 'PayPals Public Certificate', 'MODULE_PAYMENT_PAYPAL_STANDARD_EWP_PAYPAL_KEY', '', 'The location of the PayPal Public Certificate for encrypting the data.', 6, 4, NULL, '2013-08-30 18:13:46', NULL, NULL),
(303, 'Your PayPal Public Certificate ID', 'MODULE_PAYMENT_PAYPAL_STANDARD_EWP_CERT_ID', '', 'The Certificate ID to use from your PayPal Encrypted Payment Settings Profile.', 6, 4, NULL, '2013-08-30 18:13:46', NULL, NULL),
(304, 'Working Directory', 'MODULE_PAYMENT_PAYPAL_STANDARD_EWP_WORKING_DIRECTORY', '', 'The working directory to use for temporary files. (trailing slash needed)', 6, 4, NULL, '2013-08-30 18:13:46', NULL, NULL),
(305, 'OpenSSL Location', 'MODULE_PAYMENT_PAYPAL_STANDARD_EWP_OPENSSL', '/usr/bin/openssl', 'The location of the openssl binary file.', 6, 4, NULL, '2013-08-30 18:13:46', NULL, NULL),
(306, 'Automatically Add New Pages', 'HEADER_TAGS_AUTO_ADD_PAGES', 'true', 'Adds any new pages when Page Control is accessed<br>(true=on false=off)', 17, 1, NULL, '2013-08-30 18:52:01', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(307, 'Check for Missing Tags', 'HEADER_TAGS_CHECK_TAGS', 'true', 'Check to see if any products, categories or manufacturers contain empty meta tag fields<br>(true=on false=off)', 17, 2, NULL, '2013-08-30 18:52:01', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(308, 'Clear Cache', 'HEADER_TAGS_CLEAR_CACHE', 'false', 'Remove all Header Tags cache entries from the database.', 17, 3, NULL, '2013-08-30 18:52:01', 'header_tags_reset_cache', 'tep_cfg_select_option(array(''clear'', ''false''), '),
(309, '<font color=purple>Display Category Parents in Title and Tags</font>', 'HEADER_TAGS_ADD_CATEGORY_PARENTS', 'Standard', 'Adds all categories in the current path (Full), all immediate categories if the product is in more than one category (Duplicate) or only the immediate category (Standard). These settings only work if the Category checkbox is enabled in Page Control.', 17, 4, NULL, '2013-08-30 18:52:01', NULL, 'tep_cfg_select_option(array(''Full Category Path'', ''Duplicate Categories'', ''Standard''), '),
(310, '<font color=purple>Display Column Box</font>', 'HEADER_TAGS_DISPLAY_COLUMN_BOX', 'false', 'Display product box in column while on product page<br>(true=on false=off)', 17, 5, NULL, '2013-08-30 18:52:01', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(311, '<font color=purple>Display Currently Viewing</font>', 'HEADER_TAGS_DISPLAY_CURRENTLY_VIEWING', 'true', 'Display a link near the bottom of the product page.<br>(true=on false=off)', 17, 6, NULL, '2013-08-30 18:52:01', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(312, '<font color=purple>Display Help Popups</font>', 'HEADER_TAGS_DISPLAY_HELP_POPUPS', 'true', 'Display short popup messages that describes a feature<br>(true=on false=off)', 17, 7, NULL, '2013-08-30 18:52:01', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(313, '<font color=purple>Disable Permission Warning</font>', 'HEADER_TAGS_DIABLE_PERMISSION_WARNING', 'false', 'Prevent the warning that appears if the permissions for the includes/header_tags.php file appear to be incoorect.<br>(true=on false=off)', 17, 8, NULL, '2013-08-30 18:52:01', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(314, '<font color=purple>Display Page Top Title</font>', 'HEADER_TAGS_DISPLAY_PAGE_TOP_TITLE', 'true', 'Displays the page title at the very top of the page<br>(true=on false=off)', 17, 9, NULL, '2013-08-30 18:52:01', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(315, '<font color=purple>Display Silo Links</font>', 'HEADER_TAGS_DISPLAY_SILO_BOX', 'false', 'Display a box displaying links based on the settings in Silo Control<br>(true=on false=off)', 17, 10, NULL, '2013-08-30 18:52:01', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(316, '<font color=purple>Display Social Bookmark</font>', 'HEADER_TAGS_DISPLAY_SOCIAL_BOOKMARKS', 'true', 'Display social bookmarks on the product page<br>(true=on false=off)', 17, 11, NULL, '2013-08-30 18:52:01', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(317, '<font color=purple>Display Tag Cloud</font>', 'HEADER_TAGS_DISPLAY_TAG_CLOUD', 'false', 'Display the Tag Cloud infobox<br>(true=on false=off)', 17, 12, NULL, '2013-08-30 18:52:01', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(318, '<font color=blue>Enable AutoFill - Listing Text</font>', 'HEADER_TAGS_ENABLE_AUTOFILL_LISTING_TEXT', 'false', 'If true, text will be shown on the product listing page automatically. If false, the text only shows if the field has text in it.', 17, 13, NULL, '2013-08-30 18:52:01', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(319, '<font color=blue>Enable Cache</font>', 'HEADER_TAGS_ENABLE_CACHE', 'None', 'Enables cache for Header Tags. The GZip option will use gzip to try to increase speed but may be a little slower if the Header Tags data is small.', 17, 14, NULL, '2013-08-30 18:52:01', NULL, 'tep_cfg_select_option(array(''None'', ''Normal'', ''GZip''),'),
(320, '<font color=blue>Enable an HTML Editor</font>', 'HEADER_TAGS_ENABLE_HTML_EDITOR', 'No Editor', 'Use an HTML editor, if selected. !!! Warning !!! The selected editor must be installed for it to work!!!)', 17, 15, NULL, '2013-08-30 18:52:01', NULL, 'tep_cfg_select_option(array(''CKEditor'', ''FCKEditor'', ''TinyMCE'', ''No Editor''),'),
(321, '<font color=blue>Enable HTML Editor for Category Descriptions</font>', 'HEADER_TAGS_ENABLE_EDITOR_CATEGORIES', 'false', 'Enables the selected HTML editor for the categories description box. The editor must be installed for this to work.', 17, 16, NULL, '2013-08-30 18:52:01', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(322, '<font color=blue>Enable HTML Editor for Products Descriptions</font>', 'HEADER_TAGS_ENABLE_EDITOR_PRODUCTS', 'false', 'Enables the selected HTML editor for the products description box. The editor must be installed for this to work.', 17, 17, NULL, '2013-08-30 18:52:01', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(323, '<font color=blue>Enable HTML Editor for Product Listing text</font>', 'HEADER_TAGS_ENABLE_EDITOR_LISTING_TEXT', 'false', 'Enables the selected HTML editor for the Header Tags text on the product listing page. The editor must be installed for this to work.', 17, 18, NULL, '2013-08-30 18:52:01', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(324, '<font color=blue>Enable HTML Editor for Product Sub Text</font>', 'HEADER_TAGS_ENABLE_EDITOR_SUB_TEXT', 'false', 'Enables the selected HTML editor for the sub text on the products page. The editor must be installed for this to work.', 17, 19, NULL, '2013-08-30 18:52:01', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(325, '<font color=blue>Enable Version Checker</font>', 'HEADER_TAGS_ENABLE_VERSION_CHECKER', 'true', 'Enables the code that checks if updates are available.', 17, 20, NULL, '2013-08-30 18:52:01', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(326, 'Keyword Density Range', 'HEADER_TAGS_KEYWORD_DENSITY_RANGE', '0.02,0.06', 'Set the limits for the keyword density use to dynamically select the keywords. Enter two figures, separated by a comma.', 17, 21, NULL, '2013-08-30 18:52:01', NULL, NULL),
(327, 'Position Domain', 'HEADER_TAGS_POSITION_DOMAIN', '', 'Set the domain name to be used in the keyword position checking code, like www.domain_name.com or domain_name.com/shop.', 17, 22, NULL, '2013-08-30 18:52:01', NULL, NULL),
(328, 'Position Page Count', 'HEADER_TAGS_POSITION_PAGE_COUNT', '2', 'Set the number of pages to search when checking keyword positions (10 urls per page).', 17, 23, NULL, '2013-08-30 18:52:01', NULL, NULL),
(329, 'Separator - Description', 'HEADER_TAGS_SEPARATOR_DESCRIPTION', '-', 'Set the separator to be used for the description (and titles and logo).', 17, 24, NULL, '2013-08-30 18:52:01', NULL, NULL),
(330, 'Separator - Keywords', 'HEADER_TAGS_SEPARATOR_KEYWORD', ',', 'Set the separator to be used for the keywords.', 17, 25, NULL, '2013-08-30 18:52:01', NULL, NULL),
(331, 'Search Keywords', 'HEADER_TAGS_SEARCH_KEYWORDS', 'false', 'This option allows keywords stored in the Header Tags SEO search table to be searched when a search is performed on the site.', 17, 26, NULL, '2013-08-30 18:52:01', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(332, 'Store Keywords', 'HEADER_TAGS_STORE_KEYWORDS', 'true', 'This option stores the searched for keywords so they can be used by other parts of Header Tags, like in the Tag Cloud option.', 17, 27, NULL, '2013-08-30 18:52:01', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(333, 'Tag Cloud Column Count', 'HEADER_TAGS_TAG_CLOUD_COLUMN_COUNT', '8', 'Set the number of keywords to display in a row in the Tag Cloud box.', 17, 28, NULL, '2013-08-30 18:52:01', NULL, NULL),
(334, 'Article Image Width', 'ARTICLES_IMAGE_WIDTH', '100', 'Set the width of the image displayed in an article.', 456, 5, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, NULL),
(335, 'Article Image Height', 'ARTICLES_IMAGE_HEIGHT', '100', 'Set the height of the image displayed in an article.', 456, 6, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, NULL),
(336, 'Authors List Style', 'MAX_DISPLAY_AUTHORS_IN_A_LIST', '1', 'Used in Authors box. When the number of authors exceeds this number, a drop-down list will be displayed instead of the default list', 456, 9, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, NULL),
(337, 'Authors Select Box Size', 'MAX_AUTHORS_LIST', '1', 'Used in Authors box. When this value is 1 the classic drop-down list will be used for the authors box. Otherwise, a list-box with the specified number of rows will be displayed.', 456, 10, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, NULL),
(338, 'Maximum New Articles Per Page', 'MAX_NEW_ARTICLES_PER_PAGE', '10', 'The maximum number of New Articles to display per page<br>(New Articles page)', 456, 15, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, NULL),
(339, 'Maximum Article Abstract Length', 'MAX_ARTICLE_ABSTRACT_LENGTH', '300', 'Sets the maximum length of the Article Abstract to be displayed<br><br>(No. of characters)', 456, 20, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, NULL),
(340, 'Maximum Articles Per Page', 'MAX_ARTICLES_PER_PAGE', '10', 'The maximum number of Articles to display per page<br>(All Articles and Topic/Author pages)', 456, 25, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, NULL),
(341, 'Maximum Display Upcoming Articles', 'MAX_DISPLAY_UPCOMING_ARTICLES', '5', 'Maximum number of articles to display in the Upcoming Articles module', 456, 30, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, NULL),
(342, 'Minimum Number Cross-Sell Products', 'MIN_DISPLAY_ARTICLES_XSELL', '1', 'Minimum number of products to display in the articles Cross-Sell listing.', 456, 35, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, NULL),
(343, 'Maximum Number Cross-Sell Products', 'MAX_DISPLAY_ARTICLES_XSELL', '6', 'Maximum number of products to display in the articles Cross-Sell listing.', 456, 40, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, NULL),
(344, 'Maximum Length of Author Name', 'MAX_DISPLAY_AUTHOR_NAME_LEN', '20', 'The maximum length of the author''s name for display in the Author box', 456, 45, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, NULL),
(345, 'Number of Days Display New Articles', 'NEW_ARTICLES_DAYS_DISPLAY', '30', 'The number of days to display New Articles?', 456, 50, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, NULL),
(346, 'Display Author in Article Listing', 'DISPLAY_AUTHOR_ARTICLE_LISTING', 'true', 'Display the Author in the Article Listing?', 456, 55, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(347, 'Display Topic in Article Listing', 'DISPLAY_TOPIC_ARTICLE_LISTING', 'true', 'Display the Topic in the Article Listing?', 456, 60, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(348, 'Display Abstract in Article Listing', 'DISPLAY_ABSTRACT_ARTICLE_LISTING', 'true', 'Display the Abstract in the Article Listing?', 456, 65, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(349, 'Display Date Added in Article Listing', 'DISPLAY_DATE_ADDED_ARTICLE_LISTING', 'true', 'Display the Date Added in the Article Listing?', 456, 70, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(350, 'Display Topic/Author Filter', 'ARTICLE_LIST_FILTER', 'true', 'Do you want to display the Topic/Author Filter?', 456, 75, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(351, 'Display Box Authors', 'AUTHOR_BOX_DISPLAY', 'true', 'Display the Author box in the destination column', 456, 80, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(352, 'Display Box Articles', 'ARTICLE_BOX_DISPLAY', 'true', 'Display the Articles box in the destination column', 456, 85, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(353, '<font color=steelblue>Display Box Articles - All Articles Section</font>', 'ARTICLE_BOX_DISPLAY_ALL_ARTICLES_SECTION', 'true', 'Display an All Articles section in the articles box', 456, 90, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(354, '<font color=steelblue>Display Box Articles - All Articles Sort Order</font>', 'ARTICLE_BOX_DISPLAY_ALL_ARTICLES_SECTION_SORT_ORDER', '2', 'Determines the where the All Articles section will be displayed in the infobox.', 456, 95, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, NULL),
(355, '<font color=steelblue>Display Box Articles - All Articles Links?</font>', 'ARTICLE_BOX_DISPLAY_All_ARTICLES_LINKS', 'true', 'Display links to individual articles. Requires the Display Box Articles - All Articles Section option to be true. ', 456, 100, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(356, '<font color=steelblue>Display Box Articles - All Articles Links Limit</font>', 'ARTICLE_BOX_DISPLAY_ALL_ARTICLES_LINKS_LIMIT', '', 'Maximum number of article links to display in the articles infobox. Leave blank for no limit.', 456, 101, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, NULL),
(357, 'Display Box Articles - All Blog Section', 'ARTICLE_BOX_DISPLAY_ALL_BLOG_SECTION', 'true', 'Display an All Blog Articles section in the articles box', 456, 105, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(358, 'Display Box Articles - All Blog Sort Order', 'ARTICLE_BOX_DISPLAY_ALL_BLOG_SECTION_SORT_ORDER', '1', 'Determines the where the All Blog Articles section will be displayed in the infobox.', 456, 106, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, NULL),
(359, 'Display Box Articles - All Blog Links?', 'ARTICLE_BOX_DISPLAY_All_BLOG_LINKS', 'true', 'Display links to individual articles. Requires the Display Box Articles - All Blog Articles Section option to be true. ', 456, 107, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(360, 'Display Box Articles - All Blog Links Limit', 'ARTICLE_BOX_DISPLAY_ALL_BLOG_LINKS_LIMIT', '', 'Maximum number of blog article links to display in the articles infobox. Leave blank for no limit.', 456, 108, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, NULL),
(361, '<font color=steelblue>Display Box Articles - All Topics Section</font>', 'ARTICLE_BOX_DISPLAY_TOPICS_SECTION', 'true', 'Display an All Topics section in the articles box', 456, 110, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(362, '<font color=steelblue>Display Box Articles - All Topics Sort Order</font>', 'ARTICLE_BOX_DISPLAY_TOPICS_SECTION_SORT_ORDER', '3', 'Determines the where the All Topics section will be displayed in the infobox.', 456, 111, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, NULL),
(363, '<font color=steelblue>Display Box Articles - All Topics Links?</font>', 'ARTICLE_BOX_DISPLAY_TOPICS_LINKS', 'true', 'Display links to individual topics. Requires the Display Box Articles - All Topics Section option to be true. ', 456, 112, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(364, '<font color=steelblue>Display Box Articles - All Topics Links Limit</font>', 'ARTICLE_BOX_DISPLAY_TOPICS_LINKS_LIMIT', '', 'Maximum number of topics links to display in the articles infobox. Leave blank for no limit.', 456, 113, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, NULL),
(365, 'Display Box Articles - New Articles Section', 'ARTICLE_BOX_DISPLAY_NEW_ARTICLES_SECTION', 'true', 'Display a New Articles section in the articles box', 456, 120, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(366, 'Display Box Articles - New Articles Sort Order', 'ARTICLE_BOX_DISPLAY_NEW_ARTICLES_SECTION_SORT_ORDER', '4', 'Determines the where the New Articles section will be displayed in the infobox.', 456, 125, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, NULL),
(367, 'Display Box Articles - New Articles Links?', 'ARTICLE_BOX_DISPLAY_NEW_ARTICLES_LINKS', 'true', 'Display links to individual articles. Requires the Display Box Articles - New Articles Section option to be true. ', 456, 130, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(368, 'Display Box Articles - New Articles Links Limit', 'ARTICLE_BOX_DISPLAY_NEW_ARTICLES_LINKS_LIMIT', '', 'Maximum number of new article links to display in the articles infobox. Leave blank for no limit.', 456, 132, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, NULL),
(369, '<font color=steelblue>Display Box Articles - RSS Feed Section</font>', 'ARTICLE_BOX_DISPLAY_RSS_FEED_SECTION', 'true', 'Display an RSS Feed section in the articles box', 456, 135, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(370, '<font color=steelblue>Display Box Articles - RSS Feed Sort Order</font>', 'ARTICLE_BOX_DISPLAY_RSS_FEED_SECTION_SORT_ORDER', '5', 'Determines the where the RSS Feed section will be displayed in the infobox.', 456, 140, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, NULL),
(371, 'Display Box Articles - Search Articles Section', 'ARTICLE_BOX_DISPLAY_SEARCH_ARTICLES_SECTION', 'true', 'Display a Search Box in the articles box', 456, 142, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(372, 'Display Box Articles - Search Articles Sort Order', 'ARTICLE_BOX_DISPLAY_SEARCH_ARTICLES_SECTION_SORT_ORDER', '8', 'Determines the where the Search Box will be displayed in the infobox.', 456, 143, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, NULL),
(373, '<font color=steelblue>Display Box Articles - Submit Article Section</font>', 'ARTICLE_BOX_DISPLAY_SUBMIT_ARTICLE_SECTION', 'true', 'Display a Submit Article section in the articles box', 456, 149, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(374, '<font color=steelblue>Display Box Articles - Submit Article Sort Order</font>', 'ARTICLE_BOX_DISPLAY_SUBMIT_ARTICLE_SECTION_SORT_ORDER', '6', 'Determines the where the Submit Article section will be displayed in the infobox.', 456, 150, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, NULL),
(375, 'Display Box Articles - Upcoming Articles Section', 'ARTICLE_BOX_DISPLAY_UPCOMING_SECTION', 'true', 'Display an Upcoming Articles section in the articles box', 456, 155, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(376, 'Display Box Articles - Upcoming Articles Sort Order', 'ARTICLE_BOX_DISPLAY_UPCOMING_SECTION_SORT_ORDER', '6', 'Determines the where the Upcoming Articles section will be displayed in the infobox.', 456, 160, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, NULL),
(377, '<font color=steelblue>Display Box Articles - Separate Articles</font>', 'SEPARATE_ARTICLES', 'false', 'Separate each article in the article infobox with a line.', 456, 162, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(378, '<font color=steelblue>Display Box Articles - Separate Blog Articles</font>', 'SEPARATE_BLOG_ARTICLES', 'false', 'Separate each blog article in the article infobox with a line.', 456, 163, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(379, '<font color=steelblue>Display Box Articles - Separate New Articles</font>', 'SEPARATE_NEW_ARTICLES', 'false', 'Separate each new article in the article infobox with a line.', 456, 164, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(380, '<font color=steelblue>Display Box Articles - Separate Topics</font>', 'SEPARATE_TOPICS', 'false', 'Separate each topic in the article infobox with a line.', 456, 165, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(381, 'Number of articles to display in the RSS Feed.', 'NEWS_RSS_ARTICLE', '10', 'If you want all of your articles to display in the RSS type in something like 2000.  The default is 10', 456, 165, NULL, '2013-09-04 17:30:31', NULL, NULL),
(382, 'Number of characters to display in each RSS article.', 'NEWS_RSS_CHARACTERS', '250', 'If you keep this at 250 it will hide a little bit of each of article from your viewers. They will have to come to your store to finish.  The default is 250', 456, 170, NULL, '2013-09-04 17:30:31', NULL, NULL),
(383, 'Enable Article Reviews', 'ENABLE_ARTICLE_REVIEWS', 'true', 'Enable registered users to review articles?', 456, 175, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(384, 'Enable an HTML Editor', 'ARTICLE_ENABLE_HTML_EDITOR', 'No Editor', 'Use an HTML editor, if selected. !!! Warning !!! The selected editor must be installed for it to work!!!)', 456, 180, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''CKEditor'', ''FCKEditor'', ''TinyMCE'', ''No Editor''),'),
(385, 'Enable Tell a Friend About Article', 'ENABLE_TELL_A_FRIEND_ARTICLE', 'true', 'Enable Tell a Friend option in the Article Information page?', 456, 185, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(386, 'Enable Version Checker', 'ARTICLE_ENABLE_VERSION_CHECKER', 'false', 'Enables the version checking code to automatically check if an update is available.', 456, 190, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(387, 'Location of Prev/Next Navigation Bar', 'ARTICLE_PREV_NEXT_BAR_LOCATION', 'bottom', 'Sets the location of the Previous/Next Navigation Bar<br><br>(top; bottom; both)', 456, 195, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''top'', ''bottom'', ''both''),'),
(388, 'Show Article Counts', 'SHOW_ARTICLE_COUNTS', 'true', 'Count recursively how many articles are in each topic.', 456, 215, '2013-09-04 17:30:31', '2013-09-04 17:30:31', NULL, 'tep_cfg_select_option(array(''true'', ''false''),');

-- --------------------------------------------------------

--
-- Table structure for table `configuration_group`
--

CREATE TABLE IF NOT EXISTS `configuration_group` (
  `configuration_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_group_title` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `configuration_group_description` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `sort_order` int(5) DEFAULT NULL,
  `visible` int(1) DEFAULT '1',
  PRIMARY KEY (`configuration_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=457 ;

--
-- Dumping data for table `configuration_group`
--

INSERT INTO `configuration_group` (`configuration_group_id`, `configuration_group_title`, `configuration_group_description`, `sort_order`, `visible`) VALUES
(1, 'My Store', 'General information about my store', 1, 1),
(2, 'Minimum Values', 'The minimum values for functions / data', 2, 1),
(3, 'Maximum Values', 'The maximum values for functions / data', 3, 1),
(4, 'Images', 'Image parameters', 4, 1),
(5, 'Customer Details', 'Customer account configuration', 5, 1),
(6, 'Module Options', 'Hidden from configuration', 6, 0),
(7, 'Shipping/Packaging', 'Shipping options available at my store', 7, 1),
(8, 'Product Listing', 'Product Listing    configuration options', 8, 1),
(9, 'Stock', 'Stock configuration options', 9, 1),
(10, 'Logging', 'Logging configuration options', 10, 1),
(11, 'Cache', 'Caching configuration options', 11, 1),
(12, 'E-Mail Options', 'General setting for E-Mail transport and HTML E-Mails', 12, 1),
(13, 'Download', 'Downloadable products options', 13, 1),
(14, 'GZip Compression', 'GZip compression options', 14, 1),
(15, 'Sessions', 'Session options', 15, 1),
(16, 'PDF Invoices', 'Options for configuring PDF invoices', 16, 1),
(17, 'Header Tags SEO', 'Header Tags SEO site wide options', 22, 1),
(456, 'Article Manager', 'Article Manager site wide options', 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

CREATE TABLE IF NOT EXISTS `counter` (
  `startdate` char(8) COLLATE utf8_spanish_ci DEFAULT NULL,
  `counter` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `counter`
--

INSERT INTO `counter` (`startdate`, `counter`) VALUES
('20130826', 152);

-- --------------------------------------------------------

--
-- Table structure for table `counter_history`
--

CREATE TABLE IF NOT EXISTS `counter_history` (
  `month` char(8) COLLATE utf8_spanish_ci DEFAULT NULL,
  `counter` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `countries_id` int(11) NOT NULL AUTO_INCREMENT,
  `countries_name` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `countries_iso_code_2` char(2) COLLATE utf8_spanish_ci NOT NULL,
  `countries_iso_code_3` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `address_format_id` int(11) NOT NULL,
  PRIMARY KEY (`countries_id`),
  KEY `IDX_COUNTRIES_NAME` (`countries_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=240 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`countries_id`, `countries_name`, `countries_iso_code_2`, `countries_iso_code_3`, `address_format_id`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', 1),
(2, 'Albania', 'AL', 'ALB', 1),
(3, 'Algeria', 'DZ', 'DZA', 1),
(4, 'American Samoa', 'AS', 'ASM', 1),
(5, 'Andorra', 'AD', 'AND', 1),
(6, 'Angola', 'AO', 'AGO', 1),
(7, 'Anguilla', 'AI', 'AIA', 1),
(8, 'Antarctica', 'AQ', 'ATA', 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', 1),
(10, 'Argentina', 'AR', 'ARG', 1),
(11, 'Armenia', 'AM', 'ARM', 1),
(12, 'Aruba', 'AW', 'ABW', 1),
(13, 'Australia', 'AU', 'AUS', 1),
(14, 'Austria', 'AT', 'AUT', 5),
(15, 'Azerbaijan', 'AZ', 'AZE', 1),
(16, 'Bahamas', 'BS', 'BHS', 1),
(17, 'Bahrain', 'BH', 'BHR', 1),
(18, 'Bangladesh', 'BD', 'BGD', 1),
(19, 'Barbados', 'BB', 'BRB', 1),
(20, 'Belarus', 'BY', 'BLR', 1),
(21, 'Belgium', 'BE', 'BEL', 1),
(22, 'Belize', 'BZ', 'BLZ', 1),
(23, 'Benin', 'BJ', 'BEN', 1),
(24, 'Bermuda', 'BM', 'BMU', 1),
(25, 'Bhutan', 'BT', 'BTN', 1),
(26, 'Bolivia', 'BO', 'BOL', 1),
(27, 'Bosnia and Herzegowina', 'BA', 'BIH', 1),
(28, 'Botswana', 'BW', 'BWA', 1),
(29, 'Bouvet Island', 'BV', 'BVT', 1),
(30, 'Brazil', 'BR', 'BRA', 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', 1),
(33, 'Bulgaria', 'BG', 'BGR', 1),
(34, 'Burkina Faso', 'BF', 'BFA', 1),
(35, 'Burundi', 'BI', 'BDI', 1),
(36, 'Cambodia', 'KH', 'KHM', 1),
(37, 'Cameroon', 'CM', 'CMR', 1),
(38, 'Canada', 'CA', 'CAN', 1),
(39, 'Cape Verde', 'CV', 'CPV', 1),
(40, 'Cayman Islands', 'KY', 'CYM', 1),
(41, 'Central African Republic', 'CF', 'CAF', 1),
(42, 'Chad', 'TD', 'TCD', 1),
(43, 'Chile', 'CL', 'CHL', 1),
(44, 'China', 'CN', 'CHN', 1),
(45, 'Christmas Island', 'CX', 'CXR', 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', 1),
(47, 'Colombia', 'CO', 'COL', 1),
(48, 'Comoros', 'KM', 'COM', 1),
(49, 'Congo', 'CG', 'COG', 1),
(50, 'Cook Islands', 'CK', 'COK', 1),
(51, 'Costa Rica', 'CR', 'CRI', 1),
(52, 'Cote D''Ivoire', 'CI', 'CIV', 1),
(53, 'Croatia', 'HR', 'HRV', 1),
(54, 'Cuba', 'CU', 'CUB', 1),
(55, 'Cyprus', 'CY', 'CYP', 1),
(56, 'Czech Republic', 'CZ', 'CZE', 1),
(57, 'Denmark', 'DK', 'DNK', 1),
(58, 'Djibouti', 'DJ', 'DJI', 1),
(59, 'Dominica', 'DM', 'DMA', 1),
(60, 'Dominican Republic', 'DO', 'DOM', 1),
(61, 'East Timor', 'TP', 'TMP', 1),
(62, 'Ecuador', 'EC', 'ECU', 1),
(63, 'Egypt', 'EG', 'EGY', 1),
(64, 'El Salvador', 'SV', 'SLV', 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', 1),
(66, 'Eritrea', 'ER', 'ERI', 1),
(67, 'Estonia', 'EE', 'EST', 1),
(68, 'Ethiopia', 'ET', 'ETH', 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', 1),
(70, 'Faroe Islands', 'FO', 'FRO', 1),
(71, 'Fiji', 'FJ', 'FJI', 1),
(72, 'Finland', 'FI', 'FIN', 1),
(73, 'France', 'FR', 'FRA', 1),
(74, 'France, Metropolitan', 'FX', 'FXX', 1),
(75, 'French Guiana', 'GF', 'GUF', 1),
(76, 'French Polynesia', 'PF', 'PYF', 1),
(77, 'French Southern Territories', 'TF', 'ATF', 1),
(78, 'Gabon', 'GA', 'GAB', 1),
(79, 'Gambia', 'GM', 'GMB', 1),
(80, 'Georgia', 'GE', 'GEO', 1),
(81, 'Germany', 'DE', 'DEU', 5),
(82, 'Ghana', 'GH', 'GHA', 1),
(83, 'Gibraltar', 'GI', 'GIB', 1),
(84, 'Greece', 'GR', 'GRC', 1),
(85, 'Greenland', 'GL', 'GRL', 1),
(86, 'Grenada', 'GD', 'GRD', 1),
(87, 'Guadeloupe', 'GP', 'GLP', 1),
(88, 'Guam', 'GU', 'GUM', 1),
(89, 'Guatemala', 'GT', 'GTM', 1),
(90, 'Guinea', 'GN', 'GIN', 1),
(91, 'Guinea-bissau', 'GW', 'GNB', 1),
(92, 'Guyana', 'GY', 'GUY', 1),
(93, 'Haiti', 'HT', 'HTI', 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', 1),
(95, 'Honduras', 'HN', 'HND', 1),
(96, 'Hong Kong', 'HK', 'HKG', 1),
(97, 'Hungary', 'HU', 'HUN', 1),
(98, 'Iceland', 'IS', 'ISL', 1),
(99, 'India', 'IN', 'IND', 1),
(100, 'Indonesia', 'ID', 'IDN', 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', 1),
(102, 'Iraq', 'IQ', 'IRQ', 1),
(103, 'Ireland', 'IE', 'IRL', 1),
(104, 'Israel', 'IL', 'ISR', 1),
(105, 'Italy', 'IT', 'ITA', 1),
(106, 'Jamaica', 'JM', 'JAM', 1),
(107, 'Japan', 'JP', 'JPN', 1),
(108, 'Jordan', 'JO', 'JOR', 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', 1),
(110, 'Kenya', 'KE', 'KEN', 1),
(111, 'Kiribati', 'KI', 'KIR', 1),
(112, 'Korea, Democratic People''s Republic of', 'KP', 'PRK', 1),
(113, 'Korea, Republic of', 'KR', 'KOR', 1),
(114, 'Kuwait', 'KW', 'KWT', 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', 1),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', 1),
(117, 'Latvia', 'LV', 'LVA', 1),
(118, 'Lebanon', 'LB', 'LBN', 1),
(119, 'Lesotho', 'LS', 'LSO', 1),
(120, 'Liberia', 'LR', 'LBR', 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', 1),
(122, 'Liechtenstein', 'LI', 'LIE', 1),
(123, 'Lithuania', 'LT', 'LTU', 1),
(124, 'Luxembourg', 'LU', 'LUX', 1),
(125, 'Macau', 'MO', 'MAC', 1),
(126, 'Macedonia, The Former Yugoslav Republic of', 'MK', 'MKD', 1),
(127, 'Madagascar', 'MG', 'MDG', 1),
(128, 'Malawi', 'MW', 'MWI', 1),
(129, 'Malaysia', 'MY', 'MYS', 1),
(130, 'Maldives', 'MV', 'MDV', 1),
(131, 'Mali', 'ML', 'MLI', 1),
(132, 'Malta', 'MT', 'MLT', 1),
(133, 'Marshall Islands', 'MH', 'MHL', 1),
(134, 'Martinique', 'MQ', 'MTQ', 1),
(135, 'Mauritania', 'MR', 'MRT', 1),
(136, 'Mauritius', 'MU', 'MUS', 1),
(137, 'Mayotte', 'YT', 'MYT', 1),
(138, 'Mexico', 'MX', 'MEX', 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', 1),
(140, 'Moldova, Republic of', 'MD', 'MDA', 1),
(141, 'Monaco', 'MC', 'MCO', 1),
(142, 'Mongolia', 'MN', 'MNG', 1),
(143, 'Montserrat', 'MS', 'MSR', 1),
(144, 'Morocco', 'MA', 'MAR', 1),
(145, 'Mozambique', 'MZ', 'MOZ', 1),
(146, 'Myanmar', 'MM', 'MMR', 1),
(147, 'Namibia', 'NA', 'NAM', 1),
(148, 'Nauru', 'NR', 'NRU', 1),
(149, 'Nepal', 'NP', 'NPL', 1),
(150, 'Netherlands', 'NL', 'NLD', 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', 1),
(152, 'New Caledonia', 'NC', 'NCL', 1),
(153, 'New Zealand', 'NZ', 'NZL', 1),
(154, 'Nicaragua', 'NI', 'NIC', 1),
(155, 'Niger', 'NE', 'NER', 1),
(156, 'Nigeria', 'NG', 'NGA', 1),
(157, 'Niue', 'NU', 'NIU', 1),
(158, 'Norfolk Island', 'NF', 'NFK', 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', 1),
(160, 'Norway', 'NO', 'NOR', 1),
(161, 'Oman', 'OM', 'OMN', 1),
(162, 'Pakistan', 'PK', 'PAK', 1),
(163, 'Palau', 'PW', 'PLW', 1),
(164, 'Panama', 'PA', 'PAN', 1),
(165, 'Papua New Guinea', 'PG', 'PNG', 1),
(166, 'Paraguay', 'PY', 'PRY', 1),
(167, 'Peru', 'PE', 'PER', 1),
(168, 'Philippines', 'PH', 'PHL', 1),
(169, 'Pitcairn', 'PN', 'PCN', 1),
(170, 'Poland', 'PL', 'POL', 1),
(171, 'Portugal', 'PT', 'PRT', 1),
(172, 'Puerto Rico', 'PR', 'PRI', 1),
(173, 'Qatar', 'QA', 'QAT', 1),
(174, 'Reunion', 'RE', 'REU', 1),
(175, 'Romania', 'RO', 'ROM', 1),
(176, 'Russian Federation', 'RU', 'RUS', 1),
(177, 'Rwanda', 'RW', 'RWA', 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', 1),
(179, 'Saint Lucia', 'LC', 'LCA', 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', 1),
(181, 'Samoa', 'WS', 'WSM', 1),
(182, 'San Marino', 'SM', 'SMR', 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', 1),
(184, 'Saudi Arabia', 'SA', 'SAU', 1),
(185, 'Senegal', 'SN', 'SEN', 1),
(186, 'Seychelles', 'SC', 'SYC', 1),
(187, 'Sierra Leone', 'SL', 'SLE', 1),
(188, 'Singapore', 'SG', 'SGP', 4),
(189, 'Slovakia (Slovak Republic)', 'SK', 'SVK', 1),
(190, 'Slovenia', 'SI', 'SVN', 1),
(191, 'Solomon Islands', 'SB', 'SLB', 1),
(192, 'Somalia', 'SO', 'SOM', 1),
(193, 'South Africa', 'ZA', 'ZAF', 1),
(194, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', 1),
(195, 'Spain', 'ES', 'ESP', 3),
(196, 'Sri Lanka', 'LK', 'LKA', 1),
(197, 'St. Helena', 'SH', 'SHN', 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', 1),
(199, 'Sudan', 'SD', 'SDN', 1),
(200, 'Suriname', 'SR', 'SUR', 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', 1),
(202, 'Swaziland', 'SZ', 'SWZ', 1),
(203, 'Sweden', 'SE', 'SWE', 1),
(204, 'Switzerland', 'CH', 'CHE', 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', 1),
(206, 'Taiwan', 'TW', 'TWN', 1),
(207, 'Tajikistan', 'TJ', 'TJK', 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', 1),
(209, 'Thailand', 'TH', 'THA', 1),
(210, 'Togo', 'TG', 'TGO', 1),
(211, 'Tokelau', 'TK', 'TKL', 1),
(212, 'Tonga', 'TO', 'TON', 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', 1),
(214, 'Tunisia', 'TN', 'TUN', 1),
(215, 'Turkey', 'TR', 'TUR', 1),
(216, 'Turkmenistan', 'TM', 'TKM', 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', 1),
(218, 'Tuvalu', 'TV', 'TUV', 1),
(219, 'Uganda', 'UG', 'UGA', 1),
(220, 'Ukraine', 'UA', 'UKR', 1),
(221, 'United Arab Emirates', 'AE', 'ARE', 1),
(222, 'United Kingdom', 'GB', 'GBR', 1),
(223, 'United States', 'US', 'USA', 2),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', 1),
(225, 'Uruguay', 'UY', 'URY', 1),
(226, 'Uzbekistan', 'UZ', 'UZB', 1),
(227, 'Vanuatu', 'VU', 'VUT', 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', 1),
(229, 'Venezuela', 'VE', 'VEN', 1),
(230, 'Viet Nam', 'VN', 'VNM', 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', 1),
(234, 'Western Sahara', 'EH', 'ESH', 1),
(235, 'Yemen', 'YE', 'YEM', 1),
(236, 'Yugoslavia', 'YU', 'YUG', 1),
(237, 'Zaire', 'ZR', 'ZAR', 1),
(238, 'Zambia', 'ZM', 'ZMB', 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', 1);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE IF NOT EXISTS `currencies` (
  `currencies_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `code` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `symbol_left` varchar(12) COLLATE utf8_spanish_ci DEFAULT NULL,
  `symbol_right` varchar(12) COLLATE utf8_spanish_ci DEFAULT NULL,
  `decimal_point` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `thousands_point` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `decimal_places` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `value` float(13,8) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`currencies_id`),
  KEY `idx_currencies_code` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`currencies_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_point`, `thousands_point`, `decimal_places`, `value`, `last_updated`) VALUES
(1, 'U.S. Dollar', 'USD', '$', '', '.', ',', '2', 1.00000000, '2013-08-28 17:48:23'),
(2, 'Euro', 'EUR', '', 'â‚¬', '.', ',', '2', 0.74790001, '2013-08-28 17:47:14'),
(3, 'Mexican Peso', 'MXN', '$', '', '.', ',', '2', 13.26089954, '2013-08-28 17:47:00');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `customers_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_gender` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `customers_firstname` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `customers_lastname` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `customers_dob` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `customers_email_address` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `customers_default_address_id` int(11) DEFAULT NULL,
  `customers_telephone` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `customers_fax` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `customers_password` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `customers_newsletter` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`customers_id`),
  KEY `idx_customers_email_address` (`customers_email_address`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customers_id`, `customers_gender`, `customers_firstname`, `customers_lastname`, `customers_dob`, `customers_email_address`, `customers_default_address_id`, `customers_telephone`, `customers_fax`, `customers_password`, `customers_newsletter`) VALUES
(1, 'm', 'Alejandro', 'GÃ³mez', '1992-04-07 00:00:00', 'sprtn_link.hrdy@hotmail.com', 1, '4611978553', '', '$P$D2isB0Bfvlnf6DZ.hqDutHUl.MUeMs/', '');

-- --------------------------------------------------------

--
-- Table structure for table `customers_basket`
--

CREATE TABLE IF NOT EXISTS `customers_basket` (
  `customers_basket_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL,
  `products_id` tinytext COLLATE utf8_spanish_ci NOT NULL,
  `customers_basket_quantity` int(2) NOT NULL,
  `final_price` decimal(15,4) DEFAULT NULL,
  `customers_basket_date_added` char(8) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`customers_basket_id`),
  KEY `idx_customers_basket_customers_id` (`customers_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `customers_basket`
--

INSERT INTO `customers_basket` (`customers_basket_id`, `customers_id`, `products_id`, `customers_basket_quantity`, `final_price`, `customers_basket_date_added`) VALUES
(1, 1, '29', 1, NULL, '20130830');

-- --------------------------------------------------------

--
-- Table structure for table `customers_basket_attributes`
--

CREATE TABLE IF NOT EXISTS `customers_basket_attributes` (
  `customers_basket_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL,
  `products_id` tinytext COLLATE utf8_spanish_ci NOT NULL,
  `products_options_id` int(11) NOT NULL,
  `products_options_value_id` int(11) NOT NULL,
  PRIMARY KEY (`customers_basket_attributes_id`),
  KEY `idx_customers_basket_att_customers_id` (`customers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customers_info`
--

CREATE TABLE IF NOT EXISTS `customers_info` (
  `customers_info_id` int(11) NOT NULL,
  `customers_info_date_of_last_logon` datetime DEFAULT NULL,
  `customers_info_number_of_logons` int(5) DEFAULT NULL,
  `customers_info_date_account_created` datetime DEFAULT NULL,
  `customers_info_date_account_last_modified` datetime DEFAULT NULL,
  `global_product_notifications` int(1) DEFAULT '0',
  `password_reset_key` char(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `password_reset_date` datetime DEFAULT NULL,
  PRIMARY KEY (`customers_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `customers_info`
--

INSERT INTO `customers_info` (`customers_info_id`, `customers_info_date_of_last_logon`, `customers_info_number_of_logons`, `customers_info_date_account_created`, `customers_info_date_account_last_modified`, `global_product_notifications`, `password_reset_key`, `password_reset_date`) VALUES
(1, '2013-09-04 18:10:53', 5, '2013-08-28 17:55:02', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `geo_zones`
--

CREATE TABLE IF NOT EXISTS `geo_zones` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_name` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `geo_zone_description` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `geo_zones`
--

INSERT INTO `geo_zones` (`geo_zone_id`, `geo_zone_name`, `geo_zone_description`, `last_modified`, `date_added`) VALUES
(1, 'Florida', 'Florida local sales tax zone', NULL, '2013-08-26 23:38:56');

-- --------------------------------------------------------

--
-- Table structure for table `headertags`
--

CREATE TABLE IF NOT EXISTS `headertags` (
  `page_name` varchar(64) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `page_title` varchar(120) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `page_description` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `page_keywords` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `page_logo` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `page_logo_1` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `page_logo_2` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `page_logo_3` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `page_logo_4` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `append_default_title` tinyint(1) NOT NULL DEFAULT '0',
  `append_default_description` tinyint(1) NOT NULL DEFAULT '0',
  `append_default_keywords` tinyint(1) NOT NULL DEFAULT '0',
  `append_default_logo` tinyint(1) NOT NULL DEFAULT '0',
  `append_category` tinyint(1) NOT NULL DEFAULT '0',
  `append_manufacturer` tinyint(1) NOT NULL DEFAULT '0',
  `append_model` tinyint(1) NOT NULL DEFAULT '0',
  `append_product` tinyint(1) NOT NULL DEFAULT '1',
  `append_root` tinyint(1) NOT NULL DEFAULT '1',
  `sortorder_title` tinyint(2) NOT NULL DEFAULT '0',
  `sortorder_description` tinyint(2) NOT NULL DEFAULT '0',
  `sortorder_keywords` tinyint(2) NOT NULL DEFAULT '0',
  `sortorder_logo` tinyint(2) NOT NULL DEFAULT '0',
  `sortorder_logo_1` tinyint(2) NOT NULL DEFAULT '0',
  `sortorder_logo_2` tinyint(2) NOT NULL DEFAULT '0',
  `sortorder_logo_3` tinyint(2) NOT NULL DEFAULT '0',
  `sortorder_logo_4` tinyint(2) NOT NULL DEFAULT '0',
  `sortorder_category` tinyint(2) NOT NULL DEFAULT '0',
  `sortorder_manufacturer` tinyint(2) NOT NULL DEFAULT '0',
  `sortorder_model` tinyint(2) NOT NULL DEFAULT '0',
  `sortorder_product` tinyint(2) NOT NULL DEFAULT '10',
  `sortorder_root` tinyint(2) NOT NULL DEFAULT '1',
  `sortorder_root_1` tinyint(2) NOT NULL DEFAULT '1',
  `sortorder_root_2` tinyint(2) NOT NULL DEFAULT '1',
  `sortorder_root_3` tinyint(2) NOT NULL DEFAULT '1',
  `sortorder_root_4` tinyint(2) NOT NULL DEFAULT '1',
  `language_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`page_name`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `headertags`
--

INSERT INTO `headertags` (`page_name`, `page_title`, `page_description`, `page_keywords`, `page_logo`, `page_logo_1`, `page_logo_2`, `page_logo_3`, `page_logo_4`, `append_default_title`, `append_default_description`, `append_default_keywords`, `append_default_logo`, `append_category`, `append_manufacturer`, `append_model`, `append_product`, `append_root`, `sortorder_title`, `sortorder_description`, `sortorder_keywords`, `sortorder_logo`, `sortorder_logo_1`, `sortorder_logo_2`, `sortorder_logo_3`, `sortorder_logo_4`, `sortorder_category`, `sortorder_manufacturer`, `sortorder_model`, `sortorder_product`, `sortorder_root`, `sortorder_root_1`, `sortorder_root_2`, `sortorder_root_3`, `sortorder_root_4`, `language_id`) VALUES
('index.php', 'Replace me in Page Control under index.php - oscommerce-solution.com', 'Replace me in Page Control under index.php - oscommerce-solution.com', 'Replace me in Page Control under index.php - oscommerce-solution.com', 'Replace me in Page Control under index.php - oscommerce-solution.com', '', '', '', '', 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 10, 0, 1, 1, 1, 1, 1),
('index.php', 'Replace me in Page Control under index.php - oscommerce-solution.com', 'Replace me in Page Control under index.php - oscommerce-solution.com', 'Replace me in Page Control under index.php - oscommerce-solution.com', 'Replace me in Page Control under index.php - oscommerce-solution.com', '', '', '', '', 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 10, 0, 1, 1, 1, 1, 2),
('product_info.php', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 1, 1, 1, 1, 1, 1),
('product_info.php', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 1, 1, 1, 1, 1, 2),
('product_reviews_info.php', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 1, 1, 1, 1, 1, 1),
('product_reviews_info.php', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 1, 1, 1, 1, 1, 2),
('product_reviews_write.php', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 1, 1, 1, 1, 1, 1),
('product_reviews_write.php', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 1, 1, 1, 1, 1, 2),
('product_reviews.php', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 1, 1, 1, 1, 1, 1),
('product_reviews.php', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 1, 1, 1, 1, 1, 2),
('specials.php', 'specials', 'specials', 'specials', 'Specials', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 1, 1, 1, 1, 1, 1),
('specials.php', 'specials', 'specials', 'specials', 'Specials', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 1, 1, 1, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `headertags_cache`
--

CREATE TABLE IF NOT EXISTS `headertags_cache` (
  `title` text COLLATE utf8_spanish_ci,
  `data` text COLLATE utf8_spanish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `headertags_default`
--

CREATE TABLE IF NOT EXISTS `headertags_default` (
  `default_title` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `default_description` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `default_keywords` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `default_logo_text` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `default_logo_append_group` tinyint(1) NOT NULL DEFAULT '1',
  `default_logo_append_category` tinyint(1) NOT NULL DEFAULT '1',
  `default_logo_append_manufacturer` tinyint(1) NOT NULL DEFAULT '1',
  `default_logo_append_product` tinyint(1) NOT NULL DEFAULT '1',
  `meta_google` tinyint(1) NOT NULL DEFAULT '0',
  `meta_language` tinyint(1) NOT NULL DEFAULT '0',
  `meta_noodp` tinyint(1) NOT NULL DEFAULT '1',
  `meta_noydir` tinyint(1) NOT NULL DEFAULT '1',
  `meta_replyto` tinyint(1) NOT NULL DEFAULT '0',
  `meta_revisit` tinyint(1) NOT NULL DEFAULT '0',
  `meta_robots` tinyint(1) NOT NULL DEFAULT '0',
  `meta_unspam` tinyint(1) NOT NULL DEFAULT '0',
  `meta_canonical` tinyint(1) NOT NULL DEFAULT '1',
  `language_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`default_title`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `headertags_default`
--

INSERT INTO `headertags_default` (`default_title`, `default_description`, `default_keywords`, `default_logo_text`, `default_logo_append_group`, `default_logo_append_category`, `default_logo_append_manufacturer`, `default_logo_append_product`, `meta_google`, `meta_language`, `meta_noodp`, `meta_noydir`, `meta_replyto`, `meta_revisit`, `meta_robots`, `meta_unspam`, `meta_canonical`, `language_id`) VALUES
('Default title', 'Default description', 'Default Keywords', 'Default Logo Text', 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1),
('Default title', 'Default description', 'Default Keywords', 'Default Logo Text', 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `headertags_keywords`
--

CREATE TABLE IF NOT EXISTS `headertags_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(120) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `counter` int(11) NOT NULL DEFAULT '1',
  `last_search` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `google_last_position` tinyint(4) NOT NULL,
  `google_date_position_check` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `found` tinyint(1) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `keyword` (`keyword`),
  KEY `found` (`found`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `headertags_search`
--

CREATE TABLE IF NOT EXISTS `headertags_search` (
  `product_id` int(11) NOT NULL,
  `keyword` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  KEY `keyword` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `headertags_silo`
--

CREATE TABLE IF NOT EXISTS `headertags_silo` (
  `category_id` int(11) NOT NULL DEFAULT '0',
  `box_heading` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `max_links` int(11) NOT NULL DEFAULT '6',
  `sorton` tinyint(2) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`category_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `languages_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `code` char(2) COLLATE utf8_spanish_ci NOT NULL,
  `image` varchar(64) COLLATE utf8_spanish_ci DEFAULT NULL,
  `directory` varchar(32) COLLATE utf8_spanish_ci DEFAULT NULL,
  `sort_order` int(3) DEFAULT NULL,
  PRIMARY KEY (`languages_id`),
  KEY `IDX_LANGUAGES_NAME` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`languages_id`, `name`, `code`, `image`, `directory`, `sort_order`) VALUES
(1, 'English', 'en', 'icon.gif', 'english', 1),
(2, 'Espanol', 'es', 'icon.gif', 'espanol', 2);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE IF NOT EXISTS `manufacturers` (
  `manufacturers_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturers_name` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `manufacturers_image` varchar(64) COLLATE utf8_spanish_ci DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`),
  KEY `IDX_MANUFACTURERS_NAME` (`manufacturers_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`manufacturers_id`, `manufacturers_name`, `manufacturers_image`, `date_added`, `last_modified`) VALUES
(1, 'Matrox', 'manufacturer_matrox.gif', '2013-08-26 23:38:56', NULL),
(2, 'Microsoft', 'manufacturer_microsoft.gif', '2013-08-26 23:38:56', NULL),
(3, 'Warner', 'manufacturer_warner.gif', '2013-08-26 23:38:56', NULL),
(4, 'Fox', 'manufacturer_fox.gif', '2013-08-26 23:38:56', NULL),
(5, 'Logitech', 'manufacturer_logitech.gif', '2013-08-26 23:38:56', NULL),
(6, 'Canon', 'manufacturer_canon.gif', '2013-08-26 23:38:56', NULL),
(7, 'Sierra', 'manufacturer_sierra.gif', '2013-08-26 23:38:56', NULL),
(8, 'GT Interactive', 'manufacturer_gt_interactive.gif', '2013-08-26 23:38:56', NULL),
(9, 'Hewlett Packard', 'manufacturer_hewlett_packard.gif', '2013-08-26 23:38:56', NULL),
(10, 'Samsung', 'manufacturer_samsung.png', '2013-08-26 23:38:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers_info`
--

CREATE TABLE IF NOT EXISTS `manufacturers_info` (
  `manufacturers_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL,
  `manufacturers_url` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  `manufacturers_htc_title_tag` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL,
  `manufacturers_htc_desc_tag` longtext COLLATE utf8_spanish_ci,
  `manufacturers_htc_keywords_tag` longtext COLLATE utf8_spanish_ci,
  `manufacturers_htc_description` longtext COLLATE utf8_spanish_ci,
  PRIMARY KEY (`manufacturers_id`,`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `manufacturers_info`
--

INSERT INTO `manufacturers_info` (`manufacturers_id`, `languages_id`, `manufacturers_url`, `url_clicked`, `date_last_click`, `manufacturers_htc_title_tag`, `manufacturers_htc_desc_tag`, `manufacturers_htc_keywords_tag`, `manufacturers_htc_description`) VALUES
(1, 1, 'http://www.matrox.com', 0, NULL, NULL, NULL, NULL, NULL),
(1, 2, 'http://www.matrox.com', 0, NULL, NULL, NULL, NULL, NULL),
(2, 1, 'http://www.microsoft.com', 0, NULL, NULL, NULL, NULL, NULL),
(2, 2, 'http://www.microsoft.com', 0, NULL, NULL, NULL, NULL, NULL),
(3, 1, 'http://www.warner.com', 0, NULL, NULL, NULL, NULL, NULL),
(3, 2, 'http://www.warner.com', 0, NULL, NULL, NULL, NULL, NULL),
(4, 1, 'http://www.fox.com', 0, NULL, NULL, NULL, NULL, NULL),
(4, 2, 'http://www.fox.com', 0, NULL, NULL, NULL, NULL, NULL),
(5, 1, 'http://www.logitech.com', 0, NULL, NULL, NULL, NULL, NULL),
(5, 2, 'http://www.logitech.com', 0, NULL, NULL, NULL, NULL, NULL),
(6, 1, 'http://www.canon.com', 0, NULL, NULL, NULL, NULL, NULL),
(6, 2, 'http://www.canon.com', 0, NULL, NULL, NULL, NULL, NULL),
(7, 1, 'http://www.sierra.com', 0, NULL, NULL, NULL, NULL, NULL),
(7, 2, 'http://www.sierra.com', 0, NULL, NULL, NULL, NULL, NULL),
(8, 1, 'http://www.infogrames.com', 0, NULL, NULL, NULL, NULL, NULL),
(8, 2, 'http://www.infogrames.com', 0, NULL, NULL, NULL, NULL, NULL),
(9, 1, 'http://www.hewlettpackard.com', 0, NULL, NULL, NULL, NULL, NULL),
(9, 2, 'http://www.hewlettpackard.com', 0, NULL, NULL, NULL, NULL, NULL),
(10, 1, 'http://www.samsung.com', 0, NULL, NULL, NULL, NULL, NULL),
(10, 2, 'http://www.samsung.com', 0, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE IF NOT EXISTS `newsletters` (
  `newsletters_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `content` text COLLATE utf8_spanish_ci NOT NULL,
  `module` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `date_sent` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `locked` int(1) DEFAULT '0',
  PRIMARY KEY (`newsletters_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `orders_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL,
  `customers_name` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `customers_company` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `customers_street_address` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `customers_suburb` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `customers_city` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `customers_postcode` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `customers_state` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `customers_country` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `customers_telephone` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `customers_email_address` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `customers_address_format_id` int(5) NOT NULL,
  `delivery_name` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `delivery_company` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `delivery_street_address` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `delivery_suburb` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `delivery_city` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `delivery_postcode` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `delivery_state` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `delivery_country` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `delivery_address_format_id` int(5) NOT NULL,
  `billing_name` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `billing_company` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `billing_street_address` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `billing_suburb` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `billing_city` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `billing_postcode` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `billing_state` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `billing_country` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `billing_address_format_id` int(5) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `cc_type` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cc_owner` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cc_number` varchar(32) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cc_expires` varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_purchased` datetime DEFAULT NULL,
  `orders_status` int(5) NOT NULL,
  `orders_date_finished` datetime DEFAULT NULL,
  `currency` char(3) COLLATE utf8_spanish_ci DEFAULT NULL,
  `currency_value` decimal(14,6) DEFAULT NULL,
  PRIMARY KEY (`orders_id`),
  KEY `idx_orders_customers_id` (`customers_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orders_id`, `customers_id`, `customers_name`, `customers_company`, `customers_street_address`, `customers_suburb`, `customers_city`, `customers_postcode`, `customers_state`, `customers_country`, `customers_telephone`, `customers_email_address`, `customers_address_format_id`, `delivery_name`, `delivery_company`, `delivery_street_address`, `delivery_suburb`, `delivery_city`, `delivery_postcode`, `delivery_state`, `delivery_country`, `delivery_address_format_id`, `billing_name`, `billing_company`, `billing_street_address`, `billing_suburb`, `billing_city`, `billing_postcode`, `billing_state`, `billing_country`, `billing_address_format_id`, `payment_method`, `cc_type`, `cc_owner`, `cc_number`, `cc_expires`, `last_modified`, `date_purchased`, `orders_status`, `orders_date_finished`, `currency`, `currency_value`) VALUES
(1, 1, 'Alejandro GÃ³mez', '', 'Leandro Valle 403', '', 'Apaseo el Alto', '38500', 'Guanajuato', 'Mexico', '4611978553', 'sprtn_link.hrdy@hotmail.com', 1, 'Alejandro GÃ³mez', '', 'Leandro Valle 403', '', 'Apaseo el Alto', '38500', 'Guanajuato', 'Mexico', 1, 'Alejandro GÃ³mez', '', 'Leandro Valle 403', '', 'Apaseo el Alto', '38500', 'Guanajuato', 'Mexico', 1, 'Pago contra entrega', '', '', '', '', '2013-08-28 18:12:54', '2013-08-28 18:06:21', 2, NULL, 'MXN', '13.260900'),
(3, 1, 'Alejandro GÃ³mez', '', 'Leandro Valle 403', '', 'Apaseo el Alto', '38500', 'Guanajuato', 'Mexico', '4611978553', 'sprtn_link.hrdy@hotmail.com', 1, 'Alejandro GÃ³mez', '', 'Leandro Valle 403', '', 'Apaseo el Alto', '38500', 'Guanajuato', 'Mexico', 1, 'Alejandro GÃ³mez', '', 'Leandro Valle 403', '', 'Apaseo el Alto', '38500', 'Guanajuato', 'Mexico', 1, 'PayPal (incluye tarjetas de cr&eacute;dito y d&eacute;bito)', '', '', '', '', NULL, '2013-08-30 18:35:21', 5, NULL, 'USD', '1.000000');

-- --------------------------------------------------------

--
-- Table structure for table `orders_products`
--

CREATE TABLE IF NOT EXISTS `orders_products` (
  `orders_products_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `products_model` varchar(12) COLLATE utf8_spanish_ci DEFAULT NULL,
  `products_name` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `products_price` decimal(15,4) NOT NULL,
  `final_price` decimal(15,4) NOT NULL,
  `products_tax` decimal(7,4) NOT NULL,
  `products_quantity` int(2) NOT NULL,
  PRIMARY KEY (`orders_products_id`),
  KEY `idx_orders_products_orders_id` (`orders_id`),
  KEY `idx_orders_products_products_id` (`products_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `orders_products`
--

INSERT INTO `orders_products` (`orders_products_id`, `orders_id`, `products_id`, `products_model`, `products_name`, `products_price`, `final_price`, `products_tax`, `products_quantity`) VALUES
(1, 1, 28, 'GT-P1000', 'Samsung Galaxy Tab', '749.9900', '749.9900', '0.0000', 1),
(3, 3, 29, 'L5FF00', 'Memoria USB', '0.0100', '0.0100', '0.0000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders_products_attributes`
--

CREATE TABLE IF NOT EXISTS `orders_products_attributes` (
  `orders_products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `orders_products_id` int(11) NOT NULL,
  `products_options` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `products_options_values` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL,
  `price_prefix` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`orders_products_attributes_id`),
  KEY `idx_orders_products_att_orders_id` (`orders_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `orders_products_download`
--

CREATE TABLE IF NOT EXISTS `orders_products_download` (
  `orders_products_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_filename` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `download_maxdays` int(2) NOT NULL DEFAULT '0',
  `download_count` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`orders_products_download_id`),
  KEY `idx_orders_products_download_orders_id` (`orders_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `orders_status`
--

CREATE TABLE IF NOT EXISTS `orders_status` (
  `orders_status_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `orders_status_name` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `public_flag` int(11) DEFAULT '1',
  `downloads_flag` int(11) DEFAULT '0',
  PRIMARY KEY (`orders_status_id`,`language_id`),
  KEY `idx_orders_status_name` (`orders_status_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `orders_status`
--

INSERT INTO `orders_status` (`orders_status_id`, `language_id`, `orders_status_name`, `public_flag`, `downloads_flag`) VALUES
(1, 1, 'Pending', 1, 0),
(1, 2, 'Pending', 1, 0),
(2, 1, 'Processing', 1, 1),
(2, 2, 'Processing', 1, 0),
(3, 1, 'Delivered', 1, 1),
(3, 2, 'Delivered', 1, 0),
(4, 1, 'PayPal [Transactions]', 0, 0),
(4, 2, 'PayPal [Transactions]', 1, 0),
(5, 1, 'Preparing [PayPal Standard]', 0, 0),
(5, 2, 'Preparing [PayPal Standard]', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders_status_history`
--

CREATE TABLE IF NOT EXISTS `orders_status_history` (
  `orders_status_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `orders_status_id` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  `customer_notified` int(1) DEFAULT '0',
  `comments` text COLLATE utf8_spanish_ci,
  PRIMARY KEY (`orders_status_history_id`),
  KEY `idx_orders_status_history_orders_id` (`orders_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `orders_status_history`
--

INSERT INTO `orders_status_history` (`orders_status_history_id`, `orders_id`, `orders_status_id`, `date_added`, `customer_notified`, `comments`) VALUES
(1, 1, 1, '2013-08-28 18:06:21', 1, ''),
(2, 1, 2, '2013-08-28 18:12:54', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `orders_total`
--

CREATE TABLE IF NOT EXISTS `orders_total` (
  `orders_total_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `text` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `value` decimal(15,4) NOT NULL,
  `class` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`orders_total_id`),
  KEY `idx_orders_total_orders_id` (`orders_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `orders_total`
--

INSERT INTO `orders_total` (`orders_total_id`, `orders_id`, `title`, `text`, `value`, `class`, `sort_order`) VALUES
(1, 1, 'SubTotal:', '$9,945.54', '749.9900', 'ot_subtotal', 1),
(2, 1, 'Tarifa Plana (Mejor manera):', '$66.30', '5.0000', 'ot_shipping', 2),
(3, 1, 'Total:', '<strong>$10,011.85</strong>', '754.9900', 'ot_total', 4),
(7, 3, 'SubTotal:', '$0.01', '0.0100', 'ot_subtotal', 1),
(8, 3, 'Tarifa Plana (Mejor manera):', '$0.00', '0.0000', 'ot_shipping', 2),
(9, 3, 'Total:', '<strong>$0.01</strong>', '0.0100', 'ot_total', 4);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_quantity` int(4) NOT NULL,
  `products_model` varchar(12) COLLATE utf8_spanish_ci DEFAULT NULL,
  `products_image` varchar(64) COLLATE utf8_spanish_ci DEFAULT NULL,
  `products_price` decimal(15,4) NOT NULL,
  `products_date_added` datetime NOT NULL,
  `products_last_modified` datetime DEFAULT NULL,
  `products_date_available` datetime DEFAULT NULL,
  `products_weight` decimal(5,2) NOT NULL,
  `products_status` tinyint(1) NOT NULL,
  `products_tax_class_id` int(11) NOT NULL,
  `manufacturers_id` int(11) DEFAULT NULL,
  `products_ordered` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`),
  KEY `idx_products_model` (`products_model`),
  KEY `idx_products_date_added` (`products_date_added`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=30 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`products_id`, `products_quantity`, `products_model`, `products_image`, `products_price`, `products_date_added`, `products_last_modified`, `products_date_available`, `products_weight`, `products_status`, `products_tax_class_id`, `manufacturers_id`, `products_ordered`) VALUES
(1, 32, 'MG200MMS', 'matrox/mg200mms.gif', '299.9900', '2013-08-26 23:38:56', NULL, NULL, '23.00', 1, 1, 1, 0),
(2, 32, 'MG400-32MB', 'matrox/mg400-32mb.gif', '499.9900', '2013-08-26 23:38:56', NULL, NULL, '23.00', 1, 1, 1, 0),
(3, 2, 'MSIMPRO', 'microsoft/msimpro.gif', '49.9900', '2013-08-26 23:38:56', NULL, NULL, '7.00', 1, 1, 3, 0),
(4, 13, 'DVD-RPMK', 'dvd/replacement_killers.gif', '42.0000', '2013-08-26 23:38:56', NULL, NULL, '23.00', 1, 1, 2, 0),
(5, 17, 'DVD-BLDRNDC', 'dvd/blade_runner.gif', '35.9900', '2013-08-26 23:38:56', NULL, NULL, '7.00', 1, 1, 3, 0),
(6, 10, 'DVD-MATR', 'dvd/the_matrix.gif', '39.9900', '2013-08-26 23:38:56', NULL, NULL, '7.00', 1, 1, 3, 0),
(7, 10, 'DVD-YGEM', 'dvd/youve_got_mail.gif', '34.9900', '2013-08-26 23:38:56', NULL, NULL, '7.00', 1, 1, 3, 0),
(8, 10, 'DVD-ABUG', 'dvd/a_bugs_life.gif', '35.9900', '2013-08-26 23:38:56', NULL, NULL, '7.00', 1, 1, 3, 0),
(9, 10, 'DVD-UNSG', 'dvd/under_siege.gif', '29.9900', '2013-08-26 23:38:56', NULL, NULL, '7.00', 1, 1, 3, 0),
(10, 10, 'DVD-UNSG2', 'dvd/under_siege2.gif', '29.9900', '2013-08-26 23:38:56', NULL, NULL, '7.00', 1, 1, 3, 0),
(11, 10, 'DVD-FDBL', 'dvd/fire_down_below.gif', '29.9900', '2013-08-26 23:38:56', NULL, NULL, '7.00', 1, 1, 3, 0),
(12, 10, 'DVD-DHWV', 'dvd/die_hard_3.gif', '39.9900', '2013-08-26 23:38:56', NULL, NULL, '7.00', 1, 1, 4, 0),
(13, 10, 'DVD-LTWP', 'dvd/lethal_weapon.gif', '34.9900', '2013-08-26 23:38:56', NULL, NULL, '7.00', 1, 1, 3, 0),
(14, 10, 'DVD-REDC', 'dvd/red_corner.gif', '32.0000', '2013-08-26 23:38:56', NULL, NULL, '7.00', 1, 1, 3, 0),
(15, 10, 'DVD-FRAN', 'dvd/frantic.gif', '35.0000', '2013-08-26 23:38:56', NULL, NULL, '7.00', 1, 1, 3, 0),
(16, 10, 'DVD-CUFI', 'dvd/courage_under_fire.gif', '38.9900', '2013-08-26 23:38:56', NULL, NULL, '7.00', 1, 1, 4, 0),
(17, 10, 'DVD-SPEED', 'dvd/speed.gif', '39.9900', '2013-08-26 23:38:56', NULL, NULL, '7.00', 1, 1, 4, 0),
(18, 10, 'DVD-SPEED2', 'dvd/speed_2.gif', '42.0000', '2013-08-26 23:38:56', NULL, NULL, '7.00', 1, 1, 4, 0),
(19, 10, 'DVD-TSAB', 'dvd/theres_something_about_mary.gif', '49.9900', '2013-08-26 23:38:56', NULL, NULL, '7.00', 1, 1, 4, 0),
(20, 10, 'DVD-BELOVED', 'dvd/beloved.gif', '54.9900', '2013-08-26 23:38:56', NULL, NULL, '7.00', 1, 1, 3, 0),
(21, 16, 'PC-SWAT3', 'sierra/swat_3.gif', '79.9900', '2013-08-26 23:38:56', NULL, NULL, '7.00', 1, 1, 7, 0),
(22, 13, 'PC-UNTM', 'gt_interactive/unreal_tournament.gif', '89.9900', '2013-08-26 23:38:56', NULL, NULL, '7.00', 1, 1, 8, 0),
(23, 16, 'PC-TWOF', 'gt_interactive/wheel_of_time.gif', '99.9900', '2013-08-26 23:38:56', NULL, NULL, '10.00', 1, 1, 8, 0),
(24, 17, 'PC-DISC', 'gt_interactive/disciples.gif', '90.0000', '2013-08-26 23:38:56', NULL, NULL, '8.00', 1, 1, 8, 0),
(25, 16, 'MSINTKB', 'microsoft/intkeyboardps2.gif', '69.9900', '2013-08-26 23:38:56', NULL, NULL, '8.00', 1, 1, 2, 0),
(26, 10, 'MSIMEXP', 'microsoft/imexplorer.gif', '64.9500', '2013-08-26 23:38:56', NULL, NULL, '8.00', 1, 1, 2, 0),
(27, 8, 'HPLJ1100XI', 'hewlett_packard/lj1100xi.gif', '499.9900', '2013-08-26 23:38:56', NULL, NULL, '45.00', 1, 1, 9, 0),
(28, 99, 'GT-P1000', 'samsung/galaxy_tab.gif', '749.9900', '2013-08-26 23:38:56', NULL, NULL, '1.00', 1, 1, 10, 1),
(29, 10, 'L5FF00', NULL, '0.0100', '2013-08-30 18:18:05', NULL, NULL, '0.00', 1, 0, 9, 0);

-- --------------------------------------------------------

--
-- Table structure for table `products_attributes`
--

CREATE TABLE IF NOT EXISTS `products_attributes` (
  `products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `options_id` int(11) NOT NULL,
  `options_values_id` int(11) NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL,
  `price_prefix` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`products_attributes_id`),
  KEY `idx_products_attributes_products_id` (`products_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=28 ;

--
-- Dumping data for table `products_attributes`
--

INSERT INTO `products_attributes` (`products_attributes_id`, `products_id`, `options_id`, `options_values_id`, `options_values_price`, `price_prefix`) VALUES
(1, 1, 4, 1, '0.0000', '+'),
(2, 1, 4, 2, '50.0000', '+'),
(3, 1, 4, 3, '70.0000', '+'),
(4, 1, 3, 5, '0.0000', '+'),
(5, 1, 3, 6, '100.0000', '+'),
(6, 2, 4, 3, '10.0000', '-'),
(7, 2, 4, 4, '0.0000', '+'),
(8, 2, 3, 6, '0.0000', '+'),
(9, 2, 3, 7, '120.0000', '+'),
(10, 26, 3, 8, '0.0000', '+'),
(11, 26, 3, 9, '6.0000', '+'),
(26, 22, 5, 10, '0.0000', '+'),
(27, 22, 5, 13, '0.0000', '+');

-- --------------------------------------------------------

--
-- Table structure for table `products_attributes_download`
--

CREATE TABLE IF NOT EXISTS `products_attributes_download` (
  `products_attributes_id` int(11) NOT NULL,
  `products_attributes_filename` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `products_attributes_maxdays` int(2) DEFAULT '0',
  `products_attributes_maxcount` int(2) DEFAULT '0',
  PRIMARY KEY (`products_attributes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `products_attributes_download`
--

INSERT INTO `products_attributes_download` (`products_attributes_id`, `products_attributes_filename`, `products_attributes_maxdays`, `products_attributes_maxcount`) VALUES
(26, 'unreal.zip', 7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `products_description`
--

CREATE TABLE IF NOT EXISTS `products_description` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_name` varchar(64) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `products_description` text COLLATE utf8_spanish_ci,
  `products_url` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `products_viewed` int(5) DEFAULT '0',
  `products_head_title_tag` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL,
  `products_head_desc_tag` longtext COLLATE utf8_spanish_ci,
  `products_head_keywords_tag` longtext COLLATE utf8_spanish_ci,
  `products_head_listing_text` longtext COLLATE utf8_spanish_ci,
  `products_head_sub_text` longtext COLLATE utf8_spanish_ci,
  PRIMARY KEY (`products_id`,`language_id`),
  KEY `products_name` (`products_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=30 ;

--
-- Dumping data for table `products_description`
--

INSERT INTO `products_description` (`products_id`, `language_id`, `products_name`, `products_description`, `products_url`, `products_viewed`, `products_head_title_tag`, `products_head_desc_tag`, `products_head_keywords_tag`, `products_head_listing_text`, `products_head_sub_text`) VALUES
(1, 1, 'Matrox G200 MMS', 'Reinforcing its position as a multi-monitor trailblazer, Matrox Graphics Inc. has once again developed the most flexible and highly advanced solution in the industry. Introducing the new Matrox G200 Multi-Monitor Series; the first graphics card ever to support up to four DVI digital flat panel displays on a single 8&quot; PCI board.<br /><br />With continuing demand for digital flat panels in the financial workplace, the Matrox G200 MMS is the ultimate in flexible solutions. The Matrox G200 MMS also supports the new digital video interface (DVI) created by the Digital Display Working Group (DDWG) designed to ease the adoption of digital flat panels. Other configurations include composite video capture ability and onboard TV tuner, making the Matrox G200 MMS the complete solution for business needs.<br /><br />Based on the award-winning MGA-G200 graphics chip, the Matrox G200 Multi-Monitor Series provides superior 2D/3D graphics acceleration to meet the demanding needs of business applications such as real-time stock quotes (Versus), live video feeds (Reuters &amp; Bloombergs), multiple windows applications, word processing, spreadsheets and CAD.', 'www.matrox.com/mga/products/g200_mms/home.cfm', 0, NULL, NULL, NULL, NULL, NULL),
(1, 2, 'Matrox G200 MMS', 'Reinforcing its position as a multi-monitor trailblazer, Matrox Graphics Inc. has once again developed the most flexible and highly advanced solution in the industry. Introducing the new Matrox G200 Multi-Monitor Series; the first graphics card ever to support up to four DVI digital flat panel displays on a single 8&quot; PCI board.<br /><br />With continuing demand for digital flat panels in the financial workplace, the Matrox G200 MMS is the ultimate in flexible solutions. The Matrox G200 MMS also supports the new digital video interface (DVI) created by the Digital Display Working Group (DDWG) designed to ease the adoption of digital flat panels. Other configurations include composite video capture ability and onboard TV tuner, making the Matrox G200 MMS the complete solution for business needs.<br /><br />Based on the award-winning MGA-G200 graphics chip, the Matrox G200 Multi-Monitor Series provides superior 2D/3D graphics acceleration to meet the demanding needs of business applications such as real-time stock quotes (Versus), live video feeds (Reuters &amp; Bloombergs), multiple windows applications, word processing, spreadsheets and CAD.', 'www.matrox.com/mga/products/g200_mms/home.cfm', 0, NULL, NULL, NULL, NULL, NULL),
(2, 1, 'Matrox G400 32MB', '<strong>Dramatically Different High Performance Graphics</strong><br /><br />Introducing the Millennium G400 Series - a dramatically different, high performance graphics experience. Armed with the industry''s fastest graphics chip, the Millennium G400 Series takes explosive acceleration two steps further by adding unprecedented image quality, along with the most versatile display options for all your 3D, 2D and DVD applications. As the most powerful and innovative tools in your PC''s arsenal, the Millennium G400 Series will not only change the way you see graphics, but will revolutionize the way you use your computer.<br /><br /><strong>Key features:</strong><ul><li>New Matrox G400 256-bit DualBus graphics chip</li><li>Explosive 3D, 2D and DVD performance</li><li>DualHead Display</li><li>Superior DVD and TV output</li><li>3D Environment-Mapped Bump Mapping</li><li>Vibrant Color Quality rendering </li><li>UltraSharp DAC of up to 360 MHz</li><li>3D Rendering Array Processor</li><li>Support for 16 or 32 MB of memory</li></ul>', 'www.matrox.com/mga/products/mill_g400/home.htm', 0, NULL, NULL, NULL, NULL, NULL),
(2, 2, 'Matrox G400 32MB', '<strong>Dramatically Different High Performance Graphics</strong><br /><br />Introducing the Millennium G400 Series - a dramatically different, high performance graphics experience. Armed with the industry''s fastest graphics chip, the Millennium G400 Series takes explosive acceleration two steps further by adding unprecedented image quality, along with the most versatile display options for all your 3D, 2D and DVD applications. As the most powerful and innovative tools in your PC''s arsenal, the Millennium G400 Series will not only change the way you see graphics, but will revolutionize the way you use your computer.<br /><br /><strong>Key features:</strong><ul><li>New Matrox G400 256-bit DualBus graphics chip</li><li>Explosive 3D, 2D and DVD performance</li><li>DualHead Display</li><li>Superior DVD and TV output</li><li>3D Environment-Mapped Bump Mapping</li><li>Vibrant Color Quality rendering </li><li>UltraSharp DAC of up to 360 MHz</li><li>3D Rendering Array Processor</li><li>Support for 16 or 32 MB of memory</li></ul>', 'www.matrox.com/mga/products/mill_g400/home.htm', 2, NULL, NULL, NULL, NULL, NULL),
(3, 1, 'Microsoft IntelliMouse Pro', 'Every element of IntelliMouse Pro - from its unique arched shape to the texture of the rubber grip around its base - is the product of extensive customer and ergonomic research. Microsoft''s popular wheel control, which now allows zooming and universal scrolling functions, gives IntelliMouse Pro outstanding comfort and efficiency.', 'www.microsoft.com/hardware/mouse/intellimouse.asp', 0, NULL, NULL, NULL, NULL, NULL),
(3, 2, 'Microsoft IntelliMouse Pro', 'Every element of IntelliMouse Pro - from its unique arched shape to the texture of the rubber grip around its base - is the product of extensive customer and ergonomic research. Microsoft''s popular wheel control, which now allows zooming and universal scrolling functions, gives IntelliMouse Pro outstanding comfort and efficiency.', 'www.microsoft.com/hardware/mouse/intellimouse.asp', 0, NULL, NULL, NULL, NULL, NULL),
(4, 1, 'The Replacement Killers', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />Languages: English, Deutsch.<br />Subtitles: English, Deutsch, Spanish.<br />Audio: Dolby Surround 5.1.<br />Picture Format: 16:9 Wide-Screen.<br />Length: (approx) 80 minutes.<br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.replacement-killers.com', 0, NULL, NULL, NULL, NULL, NULL),
(4, 2, 'The Replacement Killers', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />Languages: English, Deutsch.<br />Subtitles: English, Deutsch, Spanish.<br />Audio: Dolby Surround 5.1.<br />Picture Format: 16:9 Wide-Screen.<br />Length: (approx) 80 minutes.<br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.replacement-killers.com', 0, NULL, NULL, NULL, NULL, NULL),
(5, 1, 'Blade Runner - Director''s Cut', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />Languages: English, Deutsch.<br />Subtitles: English, Deutsch, Spanish.<br />Audio: Dolby Surround 5.1.<br />Picture Format: 16:9 Wide-Screen.<br />Length: (approx) 112 minutes.<br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.bladerunner.com', 0, NULL, NULL, NULL, NULL, NULL),
(5, 2, 'Blade Runner - Director''s Cut', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />Languages: English, Deutsch.<br />Subtitles: English, Deutsch, Spanish.<br />Audio: Dolby Surround 5.1.<br />Picture Format: 16:9 Wide-Screen.<br />Length: (approx) 112 minutes.<br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.bladerunner.com', 0, NULL, NULL, NULL, NULL, NULL),
(6, 1, 'The Matrix', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch.\r<br />\nAudio: Dolby Surround.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 131 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Making Of.', 'www.thematrix.com', 0, NULL, NULL, NULL, NULL, NULL),
(6, 2, 'The Matrix', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch.\r<br />\nAudio: Dolby Surround.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 131 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Making Of.', 'www.thematrix.com', 0, NULL, NULL, NULL, NULL, NULL),
(7, 1, 'You''ve Got Mail', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch, Spanish.\r<br />\nSubtitles: English, Deutsch, Spanish, French, Nordic, Polish.\r<br />\nAudio: Dolby Digital 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 115 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.youvegotmail.com', 0, NULL, NULL, NULL, NULL, NULL),
(7, 2, 'You''ve Got Mail', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch, Spanish.\r<br />\nSubtitles: English, Deutsch, Spanish, French, Nordic, Polish.\r<br />\nAudio: Dolby Digital 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 115 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.youvegotmail.com', 0, NULL, NULL, NULL, NULL, NULL),
(8, 1, 'A Bug''s Life', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Digital 5.1 / Dobly Surround Stereo.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 91 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.abugslife.com', 0, NULL, NULL, NULL, NULL, NULL),
(8, 2, 'A Bug''s Life', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Digital 5.1 / Dobly Surround Stereo.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 91 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.abugslife.com', 0, NULL, NULL, NULL, NULL, NULL),
(9, 1, 'Under Siege', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 98 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0, NULL, NULL, NULL, NULL, NULL),
(9, 2, 'Under Siege', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 98 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0, NULL, NULL, NULL, NULL, NULL),
(10, 1, 'Under Siege 2 - Dark Territory', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 98 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0, NULL, NULL, NULL, NULL, NULL),
(10, 2, 'Under Siege 2 - Dark Territory', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 98 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0, NULL, NULL, NULL, NULL, NULL),
(11, 1, 'Fire Down Below', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 100 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0, NULL, NULL, NULL, NULL, NULL),
(11, 2, 'Fire Down Below', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 100 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0, NULL, NULL, NULL, NULL, NULL),
(12, 1, 'Die Hard With A Vengeance', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 122 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0, NULL, NULL, NULL, NULL, NULL),
(12, 2, 'Die Hard With A Vengeance', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 122 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0, NULL, NULL, NULL, NULL, NULL),
(13, 1, 'Lethal Weapon', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 100 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0, NULL, NULL, NULL, NULL, NULL),
(13, 2, 'Lethal Weapon', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 100 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0, NULL, NULL, NULL, NULL, NULL),
(14, 1, 'Red Corner', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 117 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0, NULL, NULL, NULL, NULL, NULL),
(14, 2, 'Red Corner', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 117 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0, NULL, NULL, NULL, NULL, NULL),
(15, 1, 'Frantic', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 115 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0, NULL, NULL, NULL, NULL, NULL),
(15, 2, 'Frantic', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 115 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0, NULL, NULL, NULL, NULL, NULL),
(16, 1, 'Courage Under Fire', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 112 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0, NULL, NULL, NULL, NULL, NULL),
(16, 2, 'Courage Under Fire', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 112 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0, NULL, NULL, NULL, NULL, NULL),
(17, 1, 'Speed', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 112 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 3, NULL, NULL, NULL, NULL, NULL),
(17, 2, 'Speed', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 112 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0, NULL, NULL, NULL, NULL, NULL),
(18, 1, 'Speed 2: Cruise Control', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 120 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0, NULL, NULL, NULL, NULL, NULL),
(18, 2, 'Speed 2: Cruise Control', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 120 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0, NULL, NULL, NULL, NULL, NULL),
(19, 1, 'There''s Something About Mary', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 114 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0, NULL, NULL, NULL, NULL, NULL),
(19, 2, 'There''s Something About Mary', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 114 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0, NULL, NULL, NULL, NULL, NULL),
(20, 1, 'Beloved', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 164 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0, NULL, NULL, NULL, NULL, NULL),
(20, 2, 'Beloved', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 164 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0, NULL, NULL, NULL, NULL, NULL),
(21, 1, 'SWAT 3: Close Quarters Battle', '<strong>Windows 95/98</strong><br /><br />211 in progress with shots fired. Officer down. Armed suspects with hostages. Respond Code 3! Los Angles, 2005, In the next seven days, representatives from every nation around the world will converge on Las Angles to witness the signing of the United Nations Nuclear Abolishment Treaty. The protection of these dignitaries falls on the shoulders of one organization, LAPD SWAT. As part of this elite tactical organization, you and your team have the weapons and all the training necessary to protect, to serve, and "When needed" to use deadly force to keep the peace. It takes more than weapons to make it through each mission. Your arsenal includes C2 charges, flashbangs, tactical grenades. opti-Wand mini-video cameras, and other devices critical to meeting your objectives and keeping your men free of injury. Uncompromised Duty, Honor and Valor!', 'www.swat3.com', 0, NULL, NULL, NULL, NULL, NULL),
(21, 2, 'SWAT 3: Close Quarters Battle', '<strong>Windows 95/98</strong><br /><br />211 in progress with shots fired. Officer down. Armed suspects with hostages. Respond Code 3! Los Angles, 2005, In the next seven days, representatives from every nation around the world will converge on Las Angles to witness the signing of the United Nations Nuclear Abolishment Treaty. The protection of these dignitaries falls on the shoulders of one organization, LAPD SWAT. As part of this elite tactical organization, you and your team have the weapons and all the training necessary to protect, to serve, and "When needed" to use deadly force to keep the peace. It takes more than weapons to make it through each mission. Your arsenal includes C2 charges, flashbangs, tactical grenades. opti-Wand mini-video cameras, and other devices critical to meeting your objectives and keeping your men free of injury. Uncompromised Duty, Honor and Valor!', 'www.swat3.com', 0, NULL, NULL, NULL, NULL, NULL),
(22, 1, 'Unreal Tournament', 'From the creators of the best-selling Unreal, comes Unreal Tournament. A new kind of single player experience. A ruthless multiplayer revolution.<br /><br />This stand-alone game showcases completely new team-based gameplay, groundbreaking multi-faceted single player action or dynamic multi-player mayhem. It''s a fight to the finish for the title of Unreal Grand Master in the gladiatorial arena. A single player experience like no other! Guide your team of ''bots'' (virtual teamates) against the hardest criminals in the galaxy for the ultimate title - the Unreal Grand Master.', 'www.unrealtournament.net', 1, NULL, NULL, NULL, NULL, NULL),
(22, 2, 'Unreal Tournament', 'From the creators of the best-selling Unreal, comes Unreal Tournament. A new kind of single player experience. A ruthless multiplayer revolution.<br /><br />This stand-alone game showcases completely new team-based gameplay, groundbreaking multi-faceted single player action or dynamic multi-player mayhem. It''s a fight to the finish for the title of Unreal Grand Master in the gladiatorial arena. A single player experience like no other! Guide your team of ''bots'' (virtual teamates) against the hardest criminals in the galaxy for the ultimate title - the Unreal Grand Master.', 'www.unrealtournament.net', 0, NULL, NULL, NULL, NULL, NULL),
(23, 1, 'The Wheel Of Time', 'The world in which The Wheel of Time takes place is lifted directly out of Jordan''s pages; it''s huge and consists of many different environments. How you navigate the world will depend largely on which game - single player or multipayer - you''re playing. The single player experience, with a few exceptions, will see Elayna traversing the world mainly by foot (with a couple notable exceptions). In the multiplayer experience, your character will have more access to travel via Ter''angreal, Portal Stones, and the Ways. However you move around, though, you''ll quickly discover that means of locomotion can easily become the least of the your worries...<br /><br />During your travels, you quickly discover that four locations are crucial to your success in the game. Not surprisingly, these locations are the homes of The Wheel of Time''s main characters. Some of these places are ripped directly from the pages of Jordan''s books, made flesh with Legend''s unparalleled pixel-pushing ways. Other places are specific to the game, conceived and executed with the intent of expanding this game world even further. Either way, they provide a backdrop for some of the most intense first person action and strategy you''ll have this year.', 'www.wheeloftime.com', 0, NULL, NULL, NULL, NULL, NULL),
(23, 2, 'The Wheel Of Time', 'The world in which The Wheel of Time takes place is lifted directly out of Jordan''s pages; it''s huge and consists of many different environments. How you navigate the world will depend largely on which game - single player or multipayer - you''re playing. The single player experience, with a few exceptions, will see Elayna traversing the world mainly by foot (with a couple notable exceptions). In the multiplayer experience, your character will have more access to travel via Ter''angreal, Portal Stones, and the Ways. However you move around, though, you''ll quickly discover that means of locomotion can easily become the least of the your worries...<br /><br />During your travels, you quickly discover that four locations are crucial to your success in the game. Not surprisingly, these locations are the homes of The Wheel of Time''s main characters. Some of these places are ripped directly from the pages of Jordan''s books, made flesh with Legend''s unparalleled pixel-pushing ways. Other places are specific to the game, conceived and executed with the intent of expanding this game world even further. Either way, they provide a backdrop for some of the most intense first person action and strategy you''ll have this year.', 'www.wheeloftime.com', 0, NULL, NULL, NULL, NULL, NULL),
(24, 1, 'Disciples: Sacred Lands', 'A new age is dawning...<br /><br />Enter the realm of the Sacred Lands, where the dawn of a New Age has set in motion the most momentous of wars. As the prophecies long foretold, four races now clash with swords and sorcery in a desperate bid to control the destiny of their gods. Take on the quest as a champion of the Empire, the Mountain Clans, the Legions of the Damned, or the Undead Hordes and test your faith in battles of brute force, spellbinding magic and acts of guile. Slay demons, vanquish giants and combat merciless forces of the dead and undead. But to ensure the salvation of your god, the hero within must evolve.<br /><br />The day of reckoning has come... and only the chosen will survive.', '', 0, NULL, NULL, NULL, NULL, NULL),
(24, 2, 'Disciples: Sacred Lands', 'A new age is dawning...<br /><br />Enter the realm of the Sacred Lands, where the dawn of a New Age has set in motion the most momentous of wars. As the prophecies long foretold, four races now clash with swords and sorcery in a desperate bid to control the destiny of their gods. Take on the quest as a champion of the Empire, the Mountain Clans, the Legions of the Damned, or the Undead Hordes and test your faith in battles of brute force, spellbinding magic and acts of guile. Slay demons, vanquish giants and combat merciless forces of the dead and undead. But to ensure the salvation of your god, the hero within must evolve.<br /><br />The day of reckoning has come... and only the chosen will survive.', '', 0, NULL, NULL, NULL, NULL, NULL),
(25, 1, 'Microsoft Internet Keyboard PS/2', 'The Internet Keyboard has 10 Hot Keys on a comfortable standard keyboard design that also includes a detachable palm rest. The Hot Keys allow you to browse the web, or check e-mail directly from your keyboard. The IntelliType Pro software also allows you to customize your hot keys - make the Internet Keyboard work the way you want it to!', '', 0, NULL, NULL, NULL, NULL, NULL),
(25, 2, 'Microsoft Internet Keyboard PS/2', 'The Internet Keyboard has 10 Hot Keys on a comfortable standard keyboard design that also includes a detachable palm rest. The Hot Keys allow you to browse the web, or check e-mail directly from your keyboard. The IntelliType Pro software also allows you to customize your hot keys - make the Internet Keyboard work the way you want it to!', '', 3, NULL, NULL, NULL, NULL, NULL),
(26, 1, 'Microsoft IntelliMouse Explorer', 'Microsoft introduces its most advanced mouse, the IntelliMouse Explorer! IntelliMouse Explorer features a sleek design, an industrial-silver finish, a glowing red underside and taillight, creating a style and look unlike any other mouse. IntelliMouse Explorer combines the accuracy and reliability of Microsoft IntelliEye optical tracking technology, the convenience of two new customizable function buttons, the efficiency of the scrolling wheel and the comfort of expert ergonomic design. All these great features make this the best mouse for the PC!', 'www.microsoft.com/hardware/mouse/explorer.asp', 0, NULL, NULL, NULL, NULL, NULL),
(26, 2, 'Microsoft IntelliMouse Explorer', 'Microsoft introduces its most advanced mouse, the IntelliMouse Explorer! IntelliMouse Explorer features a sleek design, an industrial-silver finish, a glowing red underside and taillight, creating a style and look unlike any other mouse. IntelliMouse Explorer combines the accuracy and reliability of Microsoft IntelliEye optical tracking technology, the convenience of two new customizable function buttons, the efficiency of the scrolling wheel and the comfort of expert ergonomic design. All these great features make this the best mouse for the PC!', 'www.microsoft.com/hardware/mouse/explorer.asp', 0, NULL, NULL, NULL, NULL, NULL),
(27, 1, 'Hewlett Packard LaserJet 1100Xi', 'HP has always set the pace in laser printing technology. The new generation HP LaserJet 1100 series sets another impressive pace, delivering a stunning 8 pages per minute print speed. The 600 dpi print resolution with HP''s Resolution Enhancement technology (REt) makes every document more professional.<br /><br />Enhanced print speed and laser quality results are just the beginning. With 2MB standard memory, HP LaserJet 1100xi users will be able to print increasingly complex pages. Memory can be increased to 18MB to tackle even more complex documents with ease. The HP LaserJet 1100xi supports key operating systems including Windows 3.1, 3.11, 95, 98, NT 4.0, OS/2 and DOS. Network compatibility available via the optional HP JetDirect External Print Servers.<br /><br />HP LaserJet 1100xi also features The Document Builder for the Web Era from Trellix Corp. (featuring software to create Web documents).', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', 0, NULL, NULL, NULL, NULL, NULL),
(27, 2, 'Hewlett Packard LaserJet 1100Xi', 'HP has always set the pace in laser printing technology. The new generation HP LaserJet 1100 series sets another impressive pace, delivering a stunning 8 pages per minute print speed. The 600 dpi print resolution with HP''s Resolution Enhancement technology (REt) makes every document more professional.<br /><br />Enhanced print speed and laser quality results are just the beginning. With 2MB standard memory, HP LaserJet 1100xi users will be able to print increasingly complex pages. Memory can be increased to 18MB to tackle even more complex documents with ease. The HP LaserJet 1100xi supports key operating systems including Windows 3.1, 3.11, 95, 98, NT 4.0, OS/2 and DOS. Network compatibility available via the optional HP JetDirect External Print Servers.<br /><br />HP LaserJet 1100xi also features The Document Builder for the Web Era from Trellix Corp. (featuring software to create Web documents).', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', 0, NULL, NULL, NULL, NULL, NULL),
(28, 1, 'Samsung Galaxy Tab', '<p>Powered by a Cortex A8 1.0GHz application processor, the Samsung GALAXY Tab is designed to deliver high performance whenever and wherever you are. At the same time, HD video contents are supported by a wide range of multimedia formats (DivX, XviD, MPEG4, H.263, H.264 and more), which maximizes the joy of entertainment.</p><p>With 3G HSPA connectivity, 802.11n Wi-Fi, and Bluetooth 3.0, the Samsung GALAXY Tab enhances users'' mobile communication on a whole new level. Video conferencing and push email on the large 7-inch display make communication more smooth and efficient. For voice telephony, the Samsung GALAXY Tab turns out to be a perfect speakerphone on the desk, or a mobile phone on the move via Bluetooth headset.</p>', 'http://galaxytab.samsungmobile.com', 2, NULL, NULL, NULL, NULL, NULL),
(28, 2, 'Samsung Galaxy Tab', '<p>Powered by a Cortex A8 1.0GHz application processor, the Samsung GALAXY Tab is designed to deliver high performance whenever and wherever you are. At the same time, HD video contents are supported by a wide range of multimedia formats (DivX, XviD, MPEG4, H.263, H.264 and more), which maximizes the joy of entertainment.</p><p>With 3G HSPA connectivity, 802.11n Wi-Fi, and Bluetooth 3.0, the Samsung GALAXY Tab enhances users'' mobile communication on a whole new level. Video conferencing and push email on the large 7-inch display make communication more smooth and efficient. For voice telephony, the Samsung GALAXY Tab turns out to be a perfect speakerphone on the desk, or a mobile phone on the move via Bluetooth headset.</p>', 'http://galaxytab.samsungmobile.com', 6, NULL, NULL, NULL, NULL, NULL),
(29, 1, 'USB Memory', 'It''s a great memory', 'usbhp', 0, NULL, NULL, NULL, NULL, NULL),
(29, 2, 'Memoria USB', 'Es una excelente memoria', 'usbhp', 2, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products_images`
--

CREATE TABLE IF NOT EXISTS `products_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `image` varchar(64) COLLATE utf8_spanish_ci DEFAULT NULL,
  `htmlcontent` text COLLATE utf8_spanish_ci,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_images_prodid` (`products_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `products_images`
--

INSERT INTO `products_images` (`id`, `products_id`, `image`, `htmlcontent`, `sort_order`) VALUES
(1, 28, 'samsung/galaxy_tab_1.jpg', NULL, 1),
(2, 28, 'samsung/galaxy_tab_2.jpg', NULL, 2),
(3, 28, 'samsung/galaxy_tab_3.jpg', NULL, 3),
(4, 28, 'samsung/galaxy_tab_4.jpg', '<object type="application/x-shockwave-flash" width="640" height="385" data="http://www.youtube.com/v/tAbsmHMAhrQ?fs=1&amp;autoplay=1"><param name="movie" value="http://www.youtube.com/v/tAbsmHMAhrQ?fs=1&amp;autoplay=1" /><param name="allowFullScreen" value="true" /><param name="allowscriptaccess" value="always" /><param name="wmode" value="transparent" /></object>', 4);

-- --------------------------------------------------------

--
-- Table structure for table `products_notifications`
--

CREATE TABLE IF NOT EXISTS `products_notifications` (
  `products_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`products_id`,`customers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products_options`
--

CREATE TABLE IF NOT EXISTS `products_options` (
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_name` varchar(32) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`products_options_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `products_options`
--

INSERT INTO `products_options` (`products_options_id`, `language_id`, `products_options_name`) VALUES
(1, 1, 'Color'),
(1, 2, 'Color'),
(2, 1, 'Size'),
(2, 2, 'Size'),
(3, 1, 'Model'),
(3, 2, 'Model'),
(4, 1, 'Memory'),
(4, 2, 'Memory'),
(5, 1, 'Version'),
(5, 2, 'Version'),
(6, 1, 'Weight'),
(6, 2, 'Peso');

-- --------------------------------------------------------

--
-- Table structure for table `products_options_values`
--

CREATE TABLE IF NOT EXISTS `products_options_values` (
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_values_name` varchar(64) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`products_options_values_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `products_options_values`
--

INSERT INTO `products_options_values` (`products_options_values_id`, `language_id`, `products_options_values_name`) VALUES
(1, 1, '4 mb'),
(1, 2, '4 mb'),
(2, 1, '8 mb'),
(2, 2, '8 mb'),
(3, 1, '16 mb'),
(3, 2, '16 mb'),
(4, 1, '32 mb'),
(4, 2, '32 mb'),
(5, 1, 'Value'),
(5, 2, 'Value'),
(6, 1, 'Premium'),
(6, 2, 'Premium'),
(7, 1, 'Deluxe'),
(7, 2, 'Deluxe'),
(8, 1, 'PS/2'),
(8, 2, 'PS/2'),
(9, 1, 'USB'),
(9, 2, 'USB'),
(10, 1, 'Download: Windows - English'),
(10, 2, 'Download: Windows - English'),
(13, 1, 'Box: Windows - English'),
(13, 2, 'Box: Windows - English');

-- --------------------------------------------------------

--
-- Table structure for table `products_options_values_to_products_options`
--

CREATE TABLE IF NOT EXISTS `products_options_values_to_products_options` (
  `products_options_values_to_products_options_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_options_id` int(11) NOT NULL,
  `products_options_values_id` int(11) NOT NULL,
  PRIMARY KEY (`products_options_values_to_products_options_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `products_options_values_to_products_options`
--

INSERT INTO `products_options_values_to_products_options` (`products_options_values_to_products_options_id`, `products_options_id`, `products_options_values_id`) VALUES
(1, 4, 1),
(2, 4, 2),
(3, 4, 3),
(4, 4, 4),
(5, 3, 5),
(6, 3, 6),
(7, 3, 7),
(8, 3, 8),
(9, 3, 9),
(10, 5, 10),
(13, 5, 13);

-- --------------------------------------------------------

--
-- Table structure for table `products_to_categories`
--

CREATE TABLE IF NOT EXISTS `products_to_categories` (
  `products_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  PRIMARY KEY (`products_id`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `products_to_categories`
--

INSERT INTO `products_to_categories` (`products_id`, `categories_id`) VALUES
(1, 4),
(2, 4),
(3, 9),
(4, 10),
(5, 11),
(6, 10),
(7, 12),
(8, 13),
(9, 10),
(10, 10),
(11, 10),
(12, 10),
(13, 10),
(14, 15),
(15, 14),
(16, 15),
(17, 10),
(18, 10),
(19, 12),
(20, 15),
(21, 18),
(22, 19),
(23, 20),
(24, 20),
(25, 8),
(26, 9),
(27, 5),
(28, 21),
(29, 21);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE IF NOT EXISTS `reviews` (
  `reviews_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `customers_id` int(11) DEFAULT NULL,
  `customers_name` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `reviews_rating` int(1) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reviews_status` tinyint(1) NOT NULL DEFAULT '0',
  `reviews_read` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`reviews_id`),
  KEY `idx_reviews_products_id` (`products_id`),
  KEY `idx_reviews_customers_id` (`customers_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`reviews_id`, `products_id`, `customers_id`, `customers_name`, `reviews_rating`, `date_added`, `last_modified`, `reviews_status`, `reviews_read`) VALUES
(1, 19, 0, 'John Doe', 5, '2013-08-26 23:38:56', NULL, 1, 0),
(2, 17, 1, 'Alejandro GÃ³mez', 1, '2013-09-04 18:11:15', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `reviews_description`
--

CREATE TABLE IF NOT EXISTS `reviews_description` (
  `reviews_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL,
  `reviews_text` text COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`reviews_id`,`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `reviews_description`
--

INSERT INTO `reviews_description` (`reviews_id`, `languages_id`, `reviews_text`) VALUES
(1, 1, 'This has to be one of the funniest movies released for 1999!'),
(2, 1, 'MUy buena, dasjlfbsdbjgfsÃ±gfsdblgsldfbgodlngblÃ±sdnbglsdnfgfg');

-- --------------------------------------------------------

--
-- Table structure for table `sec_directory_whitelist`
--

CREATE TABLE IF NOT EXISTS `sec_directory_whitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `directory` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `sec_directory_whitelist`
--

INSERT INTO `sec_directory_whitelist` (`id`, `directory`) VALUES
(1, 'admin/backups'),
(2, 'admin/images/graphs'),
(3, 'images'),
(4, 'images/banners'),
(5, 'images/dvd'),
(6, 'images/gt_interactive'),
(7, 'images/hewlett_packard'),
(8, 'images/matrox'),
(9, 'images/microsoft'),
(10, 'images/samsung'),
(11, 'images/sierra'),
(12, 'includes/work'),
(13, 'pub');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `sesskey` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `expiry` int(11) unsigned NOT NULL,
  `value` text COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`sesskey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`sesskey`, `expiry`, `value`) VALUES
('23lchic3r8mcfr80sahlq6t5b3', 1378337739, 'language|s:7:"english";languages_id|s:1:"1";admin|a:2:{s:2:"id";s:1:"1";s:8:"username";s:6:"Alexis";}'),
('3mi8se24faocj359nqofsei106', 1377579983, 'sessiontoken|s:32:"257e5baf08993d531f41baf00d057f46";cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:4:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:5:"cPath";s:2:"21";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"product_info.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:3:{s:5:"cPath";s:2:"21";s:11:"products_id";s:2:"28";s:6:"action";s:6:"notify";}s:4:"post";a:0:{}}i:2;a:4:{s:4:"page";s:9:"login.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}i:3;a:4:{s:4:"page";s:18:"create_account.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:4:{s:4:"page";s:16:"product_info.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:3:{s:5:"cPath";s:2:"21";s:11:"products_id";s:2:"28";s:6:"action";s:6:"notify";}s:4:"post";a:0:{}}}'),
('50r36se79d47dovoafme647re5', 1377742797, 'sessiontoken|s:32:"3aa5cb47656b261f6e4354cb9ea3de3e";cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";s:5:"78634";s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:11:"account.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:1:"1";customer_default_address_id|s:1:"1";customer_first_name|s:9:"Alejandro";customer_country_id|s:3:"138";customer_zone_id|s:1:"0";'),
('9cinu6l5vo9ioa0869u9pg13q5', 1377742739, 'language|s:7:"english";languages_id|s:1:"1";redirect_origin|a:2:{s:4:"page";s:17:"configuration.php";s:3:"get";a:2:{s:3:"gID";s:2:"16";s:3:"cID";s:3:"259";}}'),
('a5t3u6benhur0l0lvnqfcrm086', 1377579904, 'language|s:7:"english";languages_id|s:1:"1";admin|a:2:{s:2:"id";s:1:"1";s:8:"username";s:6:"Alexis";}'),
('b0isoo1hfn3i0tvl0ctrl3ehu7', 1377667156, 'language|s:7:"english";languages_id|s:1:"1";redirect_origin|a:2:{s:4:"page";s:13:"languages.php";s:3:"get";a:1:{s:3:"lID";s:1:"2";}}'),
('bfi4bgdf8di68o3q0l0759jbs4', 1378337728, 'sessiontoken|s:32:"736177228f8146fecf5242b5b2dc7c9b";cart|O:12:"shoppingCart":5:{s:8:"contents";a:1:{i:29;a:1:{s:3:"qty";s:1:"1";}}s:5:"total";d:0.01000000000000000020816681711721685132943093776702880859375;s:6:"weight";d:0;s:6:"cartID";s:5:"74883";s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:3:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"product_info.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:11:"products_id";s:2:"17";}s:4:"post";a:0:{}}i:2;a:4:{s:4:"page";s:19:"product_reviews.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:11:"products_id";s:2:"17";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:1:"1";customer_default_address_id|s:1:"1";customer_first_name|s:9:"Alejandro";customer_country_id|s:3:"138";customer_zone_id|s:1:"0";'),
('bjvi89j8g2mgttq2kabeje2dc0', 1378163861, 'sessiontoken|s:32:"1bf7b116fcdf788f821f4b96387f7bec";cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('cuui0bnejnkrhr9aagbh7ibfa6', 1377659856, 'language|s:7:"english";languages_id|s:1:"1";admin|a:2:{s:2:"id";s:1:"1";s:8:"username";s:6:"Alexis";}'),
('ds0d3ioa62v66gufd9187kvl52', 1378767320, 'language|s:7:"english";languages_id|s:1:"1";admin|a:2:{s:2:"id";s:1:"1";s:8:"username";s:6:"Alexis";}'),
('h2f9h4s811d0pudahaa02svd66', 1377735966, 'sessiontoken|s:32:"f5661f55d6a6d68d5134fb5f3515efbc";cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";s:5:"49256";s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:4:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:11:"account.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}i:2;a:4:{s:4:"page";s:19:"account_history.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}i:3;a:4:{s:4:"page";s:24:"account_history_info.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:8:"order_id";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:1:"1";customer_default_address_id|s:1:"1";customer_first_name|s:9:"Alejandro";customer_country_id|s:3:"138";customer_zone_id|s:1:"0";'),
('i66omhkkqauardf71cqjsgh1r1', 1378768177, 'sessiontoken|s:32:"c449cfa2066c26492d86534bbfa11df7";cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:26:"headertags_seo_install.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('krohtrtl2lj6dsdmajgtfcus84', 1378941459, 'language|s:7:"english";languages_id|s:1:"1";admin|a:2:{s:2:"id";s:1:"1";s:8:"username";s:6:"Alexis";}'),
('lj17gliqb70sp9fmb0d8fh9cd5', 1377659781, 'sessiontoken|s:32:"e09ee591ad66216929841d5051c73d59";cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('mp0b9mati78lil3jur308a3gp5', 1377908161, 'sessiontoken|s:32:"6b37a80ec60510925263d26a73db0946";cart|O:12:"shoppingCart":5:{s:8:"contents";a:1:{i:29;a:1:{s:3:"qty";i:1;}}s:5:"total";d:0.01000000000000000020816681711721685132943093776702880859375;s:6:"weight";d:0;s:6:"cartID";s:5:"37453";s:12:"content_type";s:8:"physical";}language|s:7:"espanol";languages_id|s:1:"2";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:26:"headertags_seo_install.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:1:"1";customer_default_address_id|s:1:"1";customer_first_name|s:9:"Alejandro";customer_country_id|s:3:"138";customer_zone_id|s:1:"0";sendto|s:1:"1";cartID|s:5:"37453";comments|N;billto|s:1:"1";payment|s:15:"paypal_standard";shipping|a:3:{s:2:"id";s:9:"flat_flat";s:5:"title";s:27:"Tarifa Plana (Mejor manera)";s:4:"cost";s:1:"0";}cart_PayPal_Standard_ID|s:7:"37453-3";'),
('n9dqsslf6l61kq1fj1ee4requ7', 1377742718, 'sessiontoken|s:32:"a7e3152ccb576bce7f58b464384d7c9b";cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:24:"account_history_info.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:8:"order_id";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:9:"login.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:4:{s:4:"page";s:24:"account_history_info.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:8:"order_id";s:1:"1";}s:4:"post";a:0:{}}}'),
('o74fq2kr68ig8numecchgen2b6', 1378768050, 'sessiontoken|s:32:"df41e941a3a40182caf5d209f4b04058";cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:26:"headertags_seo_install.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('tqd8ddjmj9jgkm7hsgm8j5t2g2', 1377907059, 'language|s:7:"espanol";languages_id|s:1:"2";admin|a:2:{s:2:"id";s:1:"1";s:8:"username";s:6:"Alexis";}'),
('vroa075prfl3djds3oos4i34v2', 1378766696, 'sessiontoken|s:32:"33bfa6bb76beac321924a7a9b2ae514d";cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}');

-- --------------------------------------------------------

--
-- Table structure for table `specials`
--

CREATE TABLE IF NOT EXISTS `specials` (
  `specials_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `specials_new_products_price` decimal(15,4) NOT NULL,
  `specials_date_added` datetime DEFAULT NULL,
  `specials_last_modified` datetime DEFAULT NULL,
  `expires_date` datetime DEFAULT NULL,
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`specials_id`),
  KEY `idx_specials_products_id` (`products_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `specials`
--

INSERT INTO `specials` (`specials_id`, `products_id`, `specials_new_products_price`, `specials_date_added`, `specials_last_modified`, `expires_date`, `date_status_change`, `status`) VALUES
(1, 3, '39.9900', '2013-08-26 23:38:56', NULL, NULL, NULL, 1),
(2, 5, '30.0000', '2013-08-26 23:38:56', NULL, NULL, NULL, 1),
(3, 6, '30.0000', '2013-08-26 23:38:56', NULL, NULL, NULL, 1),
(4, 16, '29.9900', '2013-08-26 23:38:56', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tax_class`
--

CREATE TABLE IF NOT EXISTS `tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_title` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `tax_class_description` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tax_class`
--

INSERT INTO `tax_class` (`tax_class_id`, `tax_class_title`, `tax_class_description`, `last_modified`, `date_added`) VALUES
(1, 'Taxable Goods', 'The following types of products are included non-food, services, etc', '2013-08-26 23:38:56', '2013-08-26 23:38:56');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE IF NOT EXISTS `tax_rates` (
  `tax_rates_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_zone_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_priority` int(5) DEFAULT '1',
  `tax_rate` decimal(7,4) NOT NULL,
  `tax_description` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`tax_rates_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tax_rates`
--

INSERT INTO `tax_rates` (`tax_rates_id`, `tax_zone_id`, `tax_class_id`, `tax_priority`, `tax_rate`, `tax_description`, `last_modified`, `date_added`) VALUES
(1, 1, 1, 1, '7.0000', 'FL TAX 7.0%', '2013-08-26 23:38:56', '2013-08-26 23:38:56');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE IF NOT EXISTS `topics` (
  `topics_id` int(11) NOT NULL AUTO_INCREMENT,
  `topics_image` varchar(64) COLLATE utf8_spanish_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`topics_id`),
  KEY `idx_topics_parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`topics_id`, `topics_image`, `parent_id`, `sort_order`, `date_added`, `last_modified`) VALUES
(1, NULL, 0, 0, '2007-08-06 08:52:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `topics_description`
--

CREATE TABLE IF NOT EXISTS `topics_description` (
  `topics_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `topics_name` varchar(32) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `topics_heading_title` varchar(64) COLLATE utf8_spanish_ci DEFAULT NULL,
  `topics_description` text COLLATE utf8_spanish_ci,
  PRIMARY KEY (`topics_id`,`language_id`),
  KEY `idx_topics_name` (`topics_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `topics_description`
--

INSERT INTO `topics_description` (`topics_id`, `language_id`, `topics_name`, `topics_heading_title`, `topics_description`) VALUES
(1, 1, 'Miscellaneous Articles', 'Miscellaneous', 'Articles that do not fall into a specific category.');

-- --------------------------------------------------------

--
-- Table structure for table `whos_online`
--

CREATE TABLE IF NOT EXISTS `whos_online` (
  `customer_id` int(11) DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `session_id` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `ip_address` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `time_entry` varchar(14) COLLATE utf8_spanish_ci NOT NULL,
  `time_last_click` varchar(14) COLLATE utf8_spanish_ci NOT NULL,
  `last_page_url` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `whos_online`
--

INSERT INTO `whos_online` (`customer_id`, `full_name`, `session_id`, `ip_address`, `time_entry`, `time_last_click`, `last_page_url`) VALUES
(0, 'Guest', 'o74fq2kr68ig8numecchgen2b6', '::1', '1378766609', '1378766609', '/topicosweb/oscommerce/catalog/headertags_seo_install.php'),
(0, 'Guest', 'i66omhkkqauardf71cqjsgh1r1', '::1', '1378766737', '1378766737', '/topicosweb/oscommerce/catalog/headertags_seo_install.php');

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE IF NOT EXISTS `zones` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL,
  `zone_code` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `zone_name` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`zone_id`),
  KEY `idx_zones_country_id` (`zone_country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=182 ;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`zone_id`, `zone_country_id`, `zone_code`, `zone_name`) VALUES
(1, 223, 'AL', 'Alabama'),
(2, 223, 'AK', 'Alaska'),
(3, 223, 'AS', 'American Samoa'),
(4, 223, 'AZ', 'Arizona'),
(5, 223, 'AR', 'Arkansas'),
(6, 223, 'AF', 'Armed Forces Africa'),
(7, 223, 'AA', 'Armed Forces Americas'),
(8, 223, 'AC', 'Armed Forces Canada'),
(9, 223, 'AE', 'Armed Forces Europe'),
(10, 223, 'AM', 'Armed Forces Middle East'),
(11, 223, 'AP', 'Armed Forces Pacific'),
(12, 223, 'CA', 'California'),
(13, 223, 'CO', 'Colorado'),
(14, 223, 'CT', 'Connecticut'),
(15, 223, 'DE', 'Delaware'),
(16, 223, 'DC', 'District of Columbia'),
(17, 223, 'FM', 'Federated States Of Micronesia'),
(18, 223, 'FL', 'Florida'),
(19, 223, 'GA', 'Georgia'),
(20, 223, 'GU', 'Guam'),
(21, 223, 'HI', 'Hawaii'),
(22, 223, 'ID', 'Idaho'),
(23, 223, 'IL', 'Illinois'),
(24, 223, 'IN', 'Indiana'),
(25, 223, 'IA', 'Iowa'),
(26, 223, 'KS', 'Kansas'),
(27, 223, 'KY', 'Kentucky'),
(28, 223, 'LA', 'Louisiana'),
(29, 223, 'ME', 'Maine'),
(30, 223, 'MH', 'Marshall Islands'),
(31, 223, 'MD', 'Maryland'),
(32, 223, 'MA', 'Massachusetts'),
(33, 223, 'MI', 'Michigan'),
(34, 223, 'MN', 'Minnesota'),
(35, 223, 'MS', 'Mississippi'),
(36, 223, 'MO', 'Missouri'),
(37, 223, 'MT', 'Montana'),
(38, 223, 'NE', 'Nebraska'),
(39, 223, 'NV', 'Nevada'),
(40, 223, 'NH', 'New Hampshire'),
(41, 223, 'NJ', 'New Jersey'),
(42, 223, 'NM', 'New Mexico'),
(43, 223, 'NY', 'New York'),
(44, 223, 'NC', 'North Carolina'),
(45, 223, 'ND', 'North Dakota'),
(46, 223, 'MP', 'Northern Mariana Islands'),
(47, 223, 'OH', 'Ohio'),
(48, 223, 'OK', 'Oklahoma'),
(49, 223, 'OR', 'Oregon'),
(50, 223, 'PW', 'Palau'),
(51, 223, 'PA', 'Pennsylvania'),
(52, 223, 'PR', 'Puerto Rico'),
(53, 223, 'RI', 'Rhode Island'),
(54, 223, 'SC', 'South Carolina'),
(55, 223, 'SD', 'South Dakota'),
(56, 223, 'TN', 'Tennessee'),
(57, 223, 'TX', 'Texas'),
(58, 223, 'UT', 'Utah'),
(59, 223, 'VT', 'Vermont'),
(60, 223, 'VI', 'Virgin Islands'),
(61, 223, 'VA', 'Virginia'),
(62, 223, 'WA', 'Washington'),
(63, 223, 'WV', 'West Virginia'),
(64, 223, 'WI', 'Wisconsin'),
(65, 223, 'WY', 'Wyoming'),
(66, 38, 'AB', 'Alberta'),
(67, 38, 'BC', 'British Columbia'),
(68, 38, 'MB', 'Manitoba'),
(69, 38, 'NF', 'Newfoundland'),
(70, 38, 'NB', 'New Brunswick'),
(71, 38, 'NS', 'Nova Scotia'),
(72, 38, 'NT', 'Northwest Territories'),
(73, 38, 'NU', 'Nunavut'),
(74, 38, 'ON', 'Ontario'),
(75, 38, 'PE', 'Prince Edward Island'),
(76, 38, 'QC', 'Quebec'),
(77, 38, 'SK', 'Saskatchewan'),
(78, 38, 'YT', 'Yukon Territory'),
(79, 81, 'NDS', 'Niedersachsen'),
(80, 81, 'BAW', 'Baden-WÃ¼rttemberg'),
(81, 81, 'BAY', 'Bayern'),
(82, 81, 'BER', 'Berlin'),
(83, 81, 'BRG', 'Brandenburg'),
(84, 81, 'BRE', 'Bremen'),
(85, 81, 'HAM', 'Hamburg'),
(86, 81, 'HES', 'Hessen'),
(87, 81, 'MEC', 'Mecklenburg-Vorpommern'),
(88, 81, 'NRW', 'Nordrhein-Westfalen'),
(89, 81, 'RHE', 'Rheinland-Pfalz'),
(90, 81, 'SAR', 'Saarland'),
(91, 81, 'SAS', 'Sachsen'),
(92, 81, 'SAC', 'Sachsen-Anhalt'),
(93, 81, 'SCN', 'Schleswig-Holstein'),
(94, 81, 'THE', 'ThÃ¼ringen'),
(95, 14, 'WI', 'Wien'),
(96, 14, 'NO', 'NiederÃ¶sterreich'),
(97, 14, 'OO', 'OberÃ¶sterreich'),
(98, 14, 'SB', 'Salzburg'),
(99, 14, 'KN', 'KÃ¤rnten'),
(100, 14, 'ST', 'Steiermark'),
(101, 14, 'TI', 'Tirol'),
(102, 14, 'BL', 'Burgenland'),
(103, 14, 'VB', 'Voralberg'),
(104, 204, 'AG', 'Aargau'),
(105, 204, 'AI', 'Appenzell Innerrhoden'),
(106, 204, 'AR', 'Appenzell Ausserrhoden'),
(107, 204, 'BE', 'Bern'),
(108, 204, 'BL', 'Basel-Landschaft'),
(109, 204, 'BS', 'Basel-Stadt'),
(110, 204, 'FR', 'Freiburg'),
(111, 204, 'GE', 'Genf'),
(112, 204, 'GL', 'Glarus'),
(113, 204, 'JU', 'GraubÃ¼nden'),
(114, 204, 'JU', 'Jura'),
(115, 204, 'LU', 'Luzern'),
(116, 204, 'NE', 'Neuenburg'),
(117, 204, 'NW', 'Nidwalden'),
(118, 204, 'OW', 'Obwalden'),
(119, 204, 'SG', 'St. Gallen'),
(120, 204, 'SH', 'Schaffhausen'),
(121, 204, 'SO', 'Solothurn'),
(122, 204, 'SZ', 'Schwyz'),
(123, 204, 'TG', 'Thurgau'),
(124, 204, 'TI', 'Tessin'),
(125, 204, 'UR', 'Uri'),
(126, 204, 'VD', 'Waadt'),
(127, 204, 'VS', 'Wallis'),
(128, 204, 'ZG', 'Zug'),
(129, 204, 'ZH', 'ZÃ¼rich'),
(130, 195, 'A CoruÃ±a', 'A CoruÃ±a'),
(131, 195, 'Alava', 'Alava'),
(132, 195, 'Albacete', 'Albacete'),
(133, 195, 'Alicante', 'Alicante'),
(134, 195, 'Almeria', 'Almeria'),
(135, 195, 'Asturias', 'Asturias'),
(136, 195, 'Avila', 'Avila'),
(137, 195, 'Badajoz', 'Badajoz'),
(138, 195, 'Baleares', 'Baleares'),
(139, 195, 'Barcelona', 'Barcelona'),
(140, 195, 'Burgos', 'Burgos'),
(141, 195, 'Caceres', 'Caceres'),
(142, 195, 'Cadiz', 'Cadiz'),
(143, 195, 'Cantabria', 'Cantabria'),
(144, 195, 'Castellon', 'Castellon'),
(145, 195, 'Ceuta', 'Ceuta'),
(146, 195, 'Ciudad Real', 'Ciudad Real'),
(147, 195, 'Cordoba', 'Cordoba'),
(148, 195, 'Cuenca', 'Cuenca'),
(149, 195, 'Girona', 'Girona'),
(150, 195, 'Granada', 'Granada'),
(151, 195, 'Guadalajara', 'Guadalajara'),
(152, 195, 'Guipuzcoa', 'Guipuzcoa'),
(153, 195, 'Huelva', 'Huelva'),
(154, 195, 'Huesca', 'Huesca'),
(155, 195, 'Jaen', 'Jaen'),
(156, 195, 'La Rioja', 'La Rioja'),
(157, 195, 'Las Palmas', 'Las Palmas'),
(158, 195, 'Leon', 'Leon'),
(159, 195, 'Lleida', 'Lleida'),
(160, 195, 'Lugo', 'Lugo'),
(161, 195, 'Madrid', 'Madrid'),
(162, 195, 'Malaga', 'Malaga'),
(163, 195, 'Melilla', 'Melilla'),
(164, 195, 'Murcia', 'Murcia'),
(165, 195, 'Navarra', 'Navarra'),
(166, 195, 'Ourense', 'Ourense'),
(167, 195, 'Palencia', 'Palencia'),
(168, 195, 'Pontevedra', 'Pontevedra'),
(169, 195, 'Salamanca', 'Salamanca'),
(170, 195, 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'),
(171, 195, 'Segovia', 'Segovia'),
(172, 195, 'Sevilla', 'Sevilla'),
(173, 195, 'Soria', 'Soria'),
(174, 195, 'Tarragona', 'Tarragona'),
(175, 195, 'Teruel', 'Teruel'),
(176, 195, 'Toledo', 'Toledo'),
(177, 195, 'Valencia', 'Valencia'),
(178, 195, 'Valladolid', 'Valladolid'),
(179, 195, 'Vizcaya', 'Vizcaya'),
(180, 195, 'Zamora', 'Zamora'),
(181, 195, 'Zaragoza', 'Zaragoza');

-- --------------------------------------------------------

--
-- Table structure for table `zones_to_geo_zones`
--

CREATE TABLE IF NOT EXISTS `zones_to_geo_zones` (
  `association_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `geo_zone_id` int(11) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`association_id`),
  KEY `idx_zones_to_geo_zones_country_id` (`zone_country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `zones_to_geo_zones`
--

INSERT INTO `zones_to_geo_zones` (`association_id`, `zone_country_id`, `zone_id`, `geo_zone_id`, `last_modified`, `date_added`) VALUES
(1, 223, 18, 1, NULL, '2013-08-26 23:38:57');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
