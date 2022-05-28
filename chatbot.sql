-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 28, 2022 at 05:00 PM
-- Server version: 5.7.36
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatbot`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add intent', 7, 'add_intent'),
(26, 'Can change intent', 7, 'change_intent'),
(27, 'Can delete intent', 7, 'delete_intent'),
(28, 'Can view intent', 7, 'view_intent'),
(29, 'Can add measurement', 8, 'add_measurement'),
(30, 'Can change measurement', 8, 'change_measurement'),
(31, 'Can delete measurement', 8, 'delete_measurement'),
(32, 'Can view measurement', 8, 'view_measurement'),
(33, 'Can add category', 9, 'add_category'),
(34, 'Can change category', 9, 'change_category'),
(35, 'Can delete category', 9, 'delete_category'),
(36, 'Can view category', 9, 'view_category'),
(37, 'Can add item', 10, 'add_item'),
(38, 'Can change item', 10, 'change_item'),
(39, 'Can delete item', 10, 'delete_item'),
(40, 'Can view item', 10, 'view_item');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$WNR0C7uH1myDMsg2Anx3XZ$02sK35fdAjk/sx5/neyugvLAp5V42zU3YqecyBHKIv4=', '2022-05-28 13:25:23.001065', 1, 'admin', '', '', 'admin@chatbot.com', 1, 1, '2022-05-16 08:55:43.305580');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-05-16 08:56:17.230608', 'greeting', 'Intent object (greeting)', 1, '[{\"added\": {}}]', 7, 1),
(2, '2022-05-20 02:15:32.541592', 'greeting', 'Intent object (greeting)', 2, '[]', 7, 1),
(3, '2022-05-20 02:15:57.315396', 'greeting', 'Intent object (greeting)', 2, '[]', 7, 1),
(4, '2022-05-20 02:16:21.034472', 'goodbye', 'Intent object (goodbye)', 1, '[{\"added\": {}}]', 7, 1),
(5, '2022-05-20 02:16:38.035868', 'thanks', 'Intent object (thanks)', 1, '[{\"added\": {}}]', 7, 1),
(6, '2022-05-20 02:18:01.105272', 'noanswer', 'Intent object (noanswer)', 1, '[{\"added\": {}}]', 7, 1),
(7, '2022-05-24 12:57:50.443095', '1', 'Measurement object (1)', 1, '[{\"added\": {}}]', 8, 1),
(8, '2022-05-24 12:58:18.744274', '2', 'Measurement object (2)', 1, '[{\"added\": {}}]', 8, 1),
(9, '2022-05-24 12:58:42.283238', '3', 'Measurement object (3)', 1, '[{\"added\": {}}]', 8, 1),
(10, '2022-05-24 12:59:22.609767', '4', 'Measurement object (4)', 1, '[{\"added\": {}}]', 8, 1),
(11, '2022-05-24 12:59:50.941702', '5', 'Measurement object (5)', 1, '[{\"added\": {}}]', 8, 1),
(12, '2022-05-24 13:00:15.308990', '6', 'Measurement object (6)', 1, '[{\"added\": {}}]', 8, 1),
(13, '2022-05-24 14:08:57.285953', '7', 'Measurement object (7)', 1, '[{\"added\": {}}]', 8, 1),
(14, '2022-05-24 14:11:29.251168', '7', 'Measurement object (7)', 3, '', 8, 1),
(15, '2022-05-24 14:33:29.795603', '1', 'Category object (1)', 1, '[{\"added\": {}}]', 9, 1),
(16, '2022-05-24 14:33:42.745494', '2', 'Category object (2)', 1, '[{\"added\": {}}]', 9, 1),
(17, '2022-05-24 14:37:02.969656', '1', 'Item object (1)', 1, '[{\"added\": {}}]', 10, 1),
(18, '2022-05-24 14:37:24.528620', '2', 'Item object (2)', 1, '[{\"added\": {}}]', 10, 1),
(19, '2022-05-24 14:37:43.801028', '3', 'Item object (3)', 1, '[{\"added\": {}}]', 10, 1),
(20, '2022-05-24 14:38:18.156674', '4', 'Item object (4)', 1, '[{\"added\": {}}]', 10, 1),
(21, '2022-05-24 14:38:42.453876', '5', 'Item object (5)', 1, '[{\"added\": {}}]', 10, 1),
(22, '2022-05-24 14:39:06.795081', '6', 'Item object (6)', 1, '[{\"added\": {}}]', 10, 1),
(23, '2022-05-28 03:41:42.309514', '3', 'Item object (3)', 2, '[{\"changed\": {\"fields\": [\"Price\", \"Image\"]}}]', 10, 1),
(24, '2022-05-28 03:42:11.238446', '2', 'Item object (2)', 2, '[{\"changed\": {\"fields\": [\"Price\", \"Image\"]}}]', 10, 1),
(25, '2022-05-28 03:42:29.019938', '1', 'Item object (1)', 2, '[{\"changed\": {\"fields\": [\"Price\", \"Image\"]}}]', 10, 1),
(26, '2022-05-28 03:49:48.952981', '4', 'Item object (4)', 2, '[{\"changed\": {\"fields\": [\"Price\", \"Image\"]}}]', 10, 1),
(27, '2022-05-28 03:50:16.202834', '5', 'Item object (5)', 2, '[{\"changed\": {\"fields\": [\"Price\", \"Image\"]}}]', 10, 1),
(28, '2022-05-28 03:50:38.156709', '6', 'Item object (6)', 2, '[{\"changed\": {\"fields\": [\"Price\", \"Image\"]}}]', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'project', 'intent'),
(8, 'project', 'measurement'),
(9, 'project', 'category'),
(10, 'project', 'item');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-05-16 08:54:46.596965'),
(2, 'auth', '0001_initial', '2022-05-16 08:54:47.018840'),
(3, 'admin', '0001_initial', '2022-05-16 08:54:47.128216'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-05-16 08:54:47.128216'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-05-16 08:54:47.143839'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-05-16 08:54:47.206339'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-05-16 08:54:47.237589'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-05-16 08:54:47.268840'),
(9, 'auth', '0004_alter_user_username_opts', '2022-05-16 08:54:47.268840'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-05-16 08:54:47.300089'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-05-16 08:54:47.300089'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-05-16 08:54:47.315753'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-05-16 08:54:47.346969'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-05-16 08:54:47.378217'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-05-16 08:54:47.409466'),
(16, 'auth', '0011_update_proxy_permissions', '2022-05-16 08:54:47.409466'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-05-16 08:54:47.440715'),
(18, 'project', '0001_initial', '2022-05-16 08:54:47.471971'),
(19, 'sessions', '0001_initial', '2022-05-16 08:54:47.503222'),
(20, 'project', '0002_measurement', '2022-05-24 12:50:05.490510'),
(21, 'project', '0003_category_item', '2022-05-24 14:29:23.426204'),
(22, 'project', '0004_alter_item_description', '2022-05-24 14:34:57.008694'),
(23, 'project', '0005_alter_item_category', '2022-05-24 14:36:35.490798'),
(24, 'project', '0006_item_image_item_price', '2022-05-28 03:19:47.714421');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `project_category`
--

DROP TABLE IF EXISTS `project_category`;
CREATE TABLE IF NOT EXISTS `project_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project_category`
--

INSERT INTO `project_category` (`id`, `name`, `description`) VALUES
(1, 'Polo T-Shirts', 'Stunning T-Shirts with elegant line for confident and even sassy galt.'),
(2, 'Crop Tops', 'Favourite shoes with smooth fabric line ideal for casual lounging around.');

-- --------------------------------------------------------

--
-- Table structure for table `project_intent`
--

DROP TABLE IF EXISTS `project_intent`;
CREATE TABLE IF NOT EXISTS `project_intent` (
  `tag` varchar(50) NOT NULL,
  `patterns` varchar(5000) NOT NULL,
  `responses` varchar(5000) NOT NULL,
  PRIMARY KEY (`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project_intent`
--

INSERT INTO `project_intent` (`tag`, `patterns`, `responses`) VALUES
('greeting', '\"Hi there\", \"How are you\", \"Is anyone there?\",\"Hey\",\"Hola\", \"Hello\", \"Good day\", \"Hey\", \"Ekse\", \"Hi\"', '\"Hi stranger\", \"Yebo yes, how can I help\", \"Ey watsupp\", \"Ekse Hoezit\", \"Hola\", \"Hey dude\", \"You again\"'),
('goodbye', '\"Bye\", \"See you later\", \"Goodbye\", \"Ok bye\", \"Bye Bye\"', '\"See you!\", \"Have a nice day\", \"Sure Bye\", \"Later dude\", \"Sayoonara\", \"Peace out\", \"Sure dude\", \"Ciao\"'),
('thanks', '\"Thanks\", \"Thank you\", \"That\'s helpful\", \"Awesome, thanks\", \"Thanks for helping me\"', '\"Happy to help!\", \"Any time!\", \"My pleasure\", \"You are welcome\", \"Sure dude\"'),
('noanswer', '\" \"', '\"Sorry, can\'t understand you\", \"Please give me more info\", \"Not sure I understand\", \"I am still here dude\"');

-- --------------------------------------------------------

--
-- Table structure for table `project_item`
--

DROP TABLE IF EXISTS `project_item`;
CREATE TABLE IF NOT EXISTS `project_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `color` varchar(10) NOT NULL,
  `category` varchar(20) NOT NULL,
  `image` varchar(2048) NOT NULL,
  `price` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project_item`
--

INSERT INTO `project_item` (`id`, `name`, `description`, `color`, `category`, `image`, `price`) VALUES
(1, 'Polo T-Shirts 1', 'Polo T-Shirts description', 'blue', 'Polo T-Shirts', '/static/img/polo-t-shirt-blue.jpg', '2500'),
(2, 'Polo T-Shirts 2', 'Polo T-Shirts 2 description', 'red', 'Polo T-Shirts', '/static/img/polo-t-shirt-red.jpg', '1800'),
(3, 'Polo T-Shirts 3', 'Polo T-Shirts 3 description', 'yellow', 'Polo T-Shirts', '/static/img/polo-t-shirt-yellow.jpg', '2000'),
(4, 'Crop Tops 1', 'Crop Tops 1 description', 'black', 'Crop Tops', '/static/img/crop-tops-black.jpg', '3000'),
(5, 'Crop Tops 2', 'Crop Tops 2 description', 'white', 'Crop Tops', '/static/img/crop-tops-white.jpg', '2200'),
(6, 'Crop Tops 3', 'Crop Tops 3 description', 'green', 'Crop Tops', '/static/img/crop-tops-green.jpg', '2800');

-- --------------------------------------------------------

--
-- Table structure for table `project_measurement`
--

DROP TABLE IF EXISTS `project_measurement`;
CREATE TABLE IF NOT EXISTS `project_measurement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `size` varchar(5) NOT NULL,
  `uk` varchar(10) NOT NULL,
  `chest` varchar(10) NOT NULL,
  `waist` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project_measurement`
--

INSERT INTO `project_measurement` (`id`, `size`, `uk`, `chest`, `waist`) VALUES
(1, 'S', '34/36', '91-94', '79-83'),
(2, 'M', '36/38', '95-99', '84-88'),
(3, 'L', '38/40', '100-105', '88-92'),
(4, 'XL', '42/44', '106-111', '93-98'),
(5, 'XXL', '46/48', '112-118', '99-105'),
(6, 'XXXL', '50/52', '119-126', '106-113');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
