-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Ven 08 Août 2014 à 11:56
-- Version du serveur: 5.5.38-0ubuntu0.14.04.1
-- Version de PHP: 5.5.9-1ubuntu4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `Harpe`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=154 ;

--
-- Contenu de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add user', 3, 'add_user'),
(8, 'Can change user', 3, 'change_user'),
(9, 'Can delete user', 3, 'delete_user'),
(10, 'Can add content type', 4, 'add_contenttype'),
(11, 'Can change content type', 4, 'change_contenttype'),
(12, 'Can delete content type', 4, 'delete_contenttype'),
(13, 'Can add session', 5, 'add_session'),
(14, 'Can change session', 5, 'change_session'),
(15, 'Can delete session', 5, 'delete_session'),
(16, 'Can add site', 6, 'add_site'),
(17, 'Can change site', 6, 'change_site'),
(18, 'Can delete site', 6, 'delete_site'),
(19, 'Can add log entry', 7, 'add_logentry'),
(20, 'Can change log entry', 7, 'change_logentry'),
(21, 'Can delete log entry', 7, 'delete_logentry'),
(22, 'Can add amino acid', 8, 'add_aa'),
(23, 'Can change amino acid', 8, 'change_aa'),
(24, 'Can delete amino acid', 8, 'delete_aa'),
(25, 'Can add impossible cut', 9, 'add_impossiblecut'),
(26, 'Can change impossible cut', 9, 'change_impossiblecut'),
(27, 'Can delete impossible cut', 9, 'delete_impossiblecut'),
(28, 'Can add enzyme', 10, 'add_enzyme'),
(29, 'Can change enzyme', 10, 'change_enzyme'),
(30, 'Can delete enzyme', 10, 'delete_enzyme'),
(31, 'Can add analyse mgf', 11, 'add_analysemgf'),
(32, 'Can change analyse mgf', 11, 'change_analysemgf'),
(33, 'Can delete analyse mgf', 11, 'delete_analysemgf'),
(34, 'Can add generic flatblock', 12, 'add_genericflatblock'),
(35, 'Can change generic flatblock', 12, 'change_genericflatblock'),
(36, 'Can delete generic flatblock', 12, 'delete_genericflatblock'),
(37, 'Can add generic flatblock list', 13, 'add_genericflatblocklist'),
(38, 'Can change generic flatblock list', 13, 'change_genericflatblocklist'),
(39, 'Can delete generic flatblock list', 13, 'delete_genericflatblocklist'),
(40, 'Can add template block', 14, 'add_templateblock'),
(41, 'Can change template block', 14, 'change_templateblock'),
(42, 'Can delete template block', 14, 'delete_templateblock'),
(43, 'Can add title', 15, 'add_title'),
(44, 'Can change title', 15, 'change_title'),
(45, 'Can delete title', 15, 'delete_title'),
(46, 'Can add text', 16, 'add_text'),
(47, 'Can change text', 16, 'change_text'),
(48, 'Can delete text', 16, 'delete_text'),
(49, 'Can add image', 17, 'add_image'),
(50, 'Can change image', 17, 'change_image'),
(51, 'Can delete image', 17, 'delete_image'),
(52, 'Can add image and link', 18, 'add_imageandlink'),
(53, 'Can change image and link', 18, 'change_imageandlink'),
(54, 'Can delete image and link', 18, 'delete_imageandlink'),
(55, 'Can add title and file', 19, 'add_titleandfile'),
(56, 'Can change title and file', 19, 'change_titleandfile'),
(57, 'Can delete title and file', 19, 'delete_titleandfile'),
(58, 'Can add title text and file', 20, 'add_titletextandfile'),
(59, 'Can change title text and file', 20, 'change_titletextandfile'),
(60, 'Can delete title text and file', 20, 'delete_titletextandfile'),
(61, 'Can add title and text', 21, 'add_titleandtext'),
(62, 'Can change title and text', 21, 'change_titleandtext'),
(63, 'Can delete title and text', 21, 'delete_titleandtext'),
(64, 'Can add title text and image', 22, 'add_titletextandimage'),
(65, 'Can change title text and image', 22, 'change_titletextandimage'),
(66, 'Can delete title text and image', 22, 'delete_titletextandimage'),
(67, 'Can add title link and image', 23, 'add_titlelinkandimage'),
(68, 'Can change title link and image', 23, 'change_titlelinkandimage'),
(69, 'Can delete title link and image', 23, 'delete_titlelinkandimage'),
(70, 'Can add title link text and image', 24, 'add_titlelinktextandimage'),
(71, 'Can change title link text and image', 24, 'change_titlelinktextandimage'),
(72, 'Can delete title link text and image', 24, 'delete_titlelinktextandimage'),
(73, 'Can add menu item', 25, 'add_menuitem'),
(74, 'Can change menu item', 25, 'change_menuitem'),
(75, 'Can delete menu item', 25, 'delete_menuitem'),
(76, 'Can add page var', 26, 'add_pagevar'),
(77, 'Can change page var', 26, 'change_pagevar'),
(78, 'Can delete page var', 26, 'delete_pagevar'),
(79, 'Can add form block', 27, 'add_formblock'),
(80, 'Can change form block', 27, 'change_formblock'),
(81, 'Can delete form block', 27, 'delete_formblock'),
(82, 'Can add page template', 28, 'add_pagetemplate'),
(83, 'Can change page template', 28, 'change_pagetemplate'),
(84, 'Can delete page template', 28, 'delete_pagetemplate'),
(85, 'Can add page object', 29, 'add_pageobject'),
(86, 'Can change page object', 29, 'change_pageobject'),
(87, 'Can delete page object', 29, 'delete_pageobject'),
(88, 'Can add page containeur', 30, 'add_pagecontaineur'),
(89, 'Can change page containeur', 30, 'change_pagecontaineur'),
(90, 'Can delete page containeur', 30, 'delete_pagecontaineur'),
(91, 'Can add containeur to object', 31, 'add_containeurtoobject'),
(92, 'Can change containeur to object', 31, 'change_containeurtoobject'),
(93, 'Can delete containeur to object', 31, 'delete_containeurtoobject'),
(94, 'Can add analyse peptide', 32, 'add_analysepeptide'),
(95, 'Can change analyse peptide', 32, 'change_analysepeptide'),
(96, 'Can delete analyse peptide', 32, 'delete_analysepeptide'),
(100, 'Can add calculated peptide', 34, 'add_calculatedpeptide'),
(101, 'Can change calculated peptide', 34, 'change_calculatedpeptide'),
(102, 'Can delete calculated peptide', 34, 'delete_calculatedpeptide'),
(103, 'Can add client calculation', 35, 'add_clientcalculation'),
(104, 'Can change client calculation', 35, 'change_clientcalculation'),
(105, 'Can delete client calculation', 35, 'delete_clientcalculation'),
(106, 'Can add client', 36, 'add_client'),
(107, 'Can change client', 36, 'change_client'),
(108, 'Can delete client', 36, 'delete_client'),
(109, 'Can add harpe server', 37, 'add_harpeserver'),
(110, 'Can change harpe server', 37, 'change_harpeserver'),
(111, 'Can delete harpe server', 37, 'delete_harpeserver'),
(115, 'Can add aa modification', 39, 'add_aamodification'),
(116, 'Can change aa modification', 39, 'change_aamodification'),
(117, 'Can delete aa modification', 39, 'delete_aamodification'),
(118, 'Can add aa modification position', 40, 'add_aamodificationposition'),
(119, 'Can change aa modification position', 40, 'change_aamodificationposition'),
(120, 'Can delete aa modification position', 40, 'delete_aamodificationposition'),
(121, 'Can add soft', 41, 'add_soft'),
(122, 'Can change soft', 41, 'change_soft'),
(123, 'Can delete soft', 41, 'delete_soft'),
(124, 'Can add version', 42, 'add_version'),
(125, 'Can change version', 42, 'change_version'),
(126, 'Can delete version', 42, 'delete_version'),
(127, 'Can add file', 43, 'add_file'),
(128, 'Can change file', 43, 'change_file'),
(129, 'Can delete file', 43, 'delete_file'),
(130, 'Can add atom', 44, 'add_atom'),
(131, 'Can change atom', 44, 'change_atom'),
(132, 'Can delete atom', 44, 'delete_atom'),
(133, 'Can add atom isotope', 45, 'add_atomisotope'),
(134, 'Can change atom isotope', 45, 'change_atomisotope'),
(135, 'Can delete atom isotope', 45, 'delete_atomisotope'),
(136, 'Can add aa type', 46, 'add_aatype'),
(137, 'Can change aa type', 46, 'change_aatype'),
(138, 'Can delete aa type', 46, 'delete_aatype'),
(139, 'Can add analyse peptide validated', 47, 'add_analysepeptidevalidated'),
(140, 'Can change analyse peptide validated', 47, 'change_analysepeptidevalidated'),
(141, 'Can delete analyse peptide validated', 47, 'delete_analysepeptidevalidated'),
(145, 'Can add blast calculated peptide', 49, 'add_blastcalculatedpeptide'),
(146, 'Can change blast calculated peptide', 49, 'change_blastcalculatedpeptide'),
(147, 'Can delete blast calculated peptide', 49, 'delete_blastcalculatedpeptide'),
(148, 'Can add blast analyse', 50, 'add_blastanalyse'),
(149, 'Can change blast analyse', 50, 'change_blastanalyse'),
(150, 'Can delete blast analyse', 50, 'delete_blastanalyse'),
(151, 'Can add mod type', 51, 'add_modtype'),
(152, 'Can change mod type', 51, 'change_modtype'),
(153, 'Can delete mod type', 51, 'delete_modtype');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`) VALUES
(1, 'admin', '', '', 'a@a.com', 'pbkdf2_sha256$10000$DvIGMFblLNVh$/bJz1/LTZ/4To1tDF0A9wUfQsuM7OonUgO9SPzs378I=', 1, 1, 1, '2014-07-30 08:23:58', '2013-11-06 12:27:04');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `communication_client`
--

CREATE TABLE IF NOT EXISTS `communication_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL,
  `port` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `server_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `ram` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `communication_client_5d52dd10` (`owner_id`),
  KEY `communication_client_4a752677` (`server_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=400 ;

--
-- Contenu de la table `communication_client`
--

INSERT INTO `communication_client` (`id`, `ip`, `port`, `owner_id`, `server_id`, `is_active`, `ram`, `version`) VALUES
(397, '130.79.253.239', 55607, NULL, 1, 0, 3950, 408),
(399, '130.79.253.239', 55983, NULL, 1, 0, 3950, 408);

-- --------------------------------------------------------

--
-- Structure de la table `communication_clientcalculation`
--

CREATE TABLE IF NOT EXISTS `communication_clientcalculation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `analysepeptide_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `send_hour` datetime NOT NULL,
  `recive_hour` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `communication_clientcalculation_4a4e8ffb` (`client_id`),
  KEY `communication_clientcalculation_25e57ee8` (`analysepeptide_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7884 ;

--
-- Contenu de la table `communication_clientcalculation`
--

INSERT INTO `communication_clientcalculation` (`id`, `client_id`, `analysepeptide_id`, `status`, `send_hour`, `recive_hour`) VALUES
(7822, 397, 627860, 2, '2014-08-05 12:32:40', '2014-08-05 12:32:40'),
(7823, 397, 627861, 2, '2014-08-05 12:32:40', '2014-08-05 12:32:40'),
(7824, 397, 627862, 2, '2014-08-05 12:32:40', '2014-08-05 12:32:40'),
(7825, 397, 627863, 2, '2014-08-05 12:32:40', '2014-08-05 12:32:41'),
(7826, 397, 627864, 2, '2014-08-05 12:32:41', '2014-08-05 12:32:41'),
(7827, 397, 627865, 2, '2014-08-05 12:32:41', '2014-08-05 12:32:41'),
(7828, 397, 627866, 2, '2014-08-05 12:32:41', '2014-08-05 12:32:41'),
(7829, 397, 627867, 2, '2014-08-05 12:32:41', '2014-08-05 12:32:41'),
(7830, 397, 627868, 2, '2014-08-05 12:32:41', '2014-08-05 12:32:41'),
(7831, 397, 627869, 2, '2014-08-05 12:32:41', '2014-08-05 12:32:41'),
(7832, 397, 627870, 2, '2014-08-05 12:32:41', '2014-08-05 12:32:42'),
(7833, 397, 627871, 2, '2014-08-05 12:32:42', '2014-08-05 12:32:42'),
(7834, 397, 627872, 2, '2014-08-05 12:32:42', '2014-08-05 12:32:42'),
(7835, 397, 627873, 2, '2014-08-05 12:32:42', '2014-08-05 12:32:42'),
(7836, 397, 627874, 2, '2014-08-05 12:32:42', '2014-08-05 12:32:42'),
(7837, 397, 627875, 2, '2014-08-05 12:32:42', '2014-08-05 12:32:42'),
(7838, 397, 627876, 2, '2014-08-05 12:32:42', '2014-08-05 12:32:42'),
(7839, 397, 627877, 2, '2014-08-05 12:32:43', '2014-08-05 12:32:43'),
(7840, 397, 627878, 2, '2014-08-05 12:32:43', '2014-08-05 12:32:43'),
(7841, 397, 627879, 2, '2014-08-05 12:32:43', '2014-08-05 12:32:43'),
(7842, 397, 627880, 2, '2014-08-05 12:32:43', '2014-08-05 12:32:43'),
(7843, 397, 627881, 2, '2014-08-05 12:32:43', '2014-08-05 12:32:43'),
(7844, 397, 627882, 2, '2014-08-05 12:32:43', '2014-08-05 12:32:44'),
(7845, 397, 627883, 2, '2014-08-05 12:32:44', '2014-08-05 12:32:44'),
(7846, 397, 627884, 2, '2014-08-05 12:32:44', '2014-08-05 12:32:44'),
(7847, 397, 627885, 2, '2014-08-05 12:32:44', '2014-08-05 12:32:44'),
(7848, 397, 627886, 2, '2014-08-05 12:32:44', '2014-08-05 12:32:44'),
(7849, 397, 627887, 2, '2014-08-05 12:32:44', '2014-08-05 12:32:44'),
(7850, 397, 627888, 2, '2014-08-05 12:32:44', '2014-08-05 12:32:45'),
(7851, 397, 627889, 2, '2014-08-05 12:32:45', '2014-08-05 12:32:45'),
(7852, 397, 627890, 2, '2014-08-05 12:32:45', '2014-08-05 12:32:45'),
(7853, 399, 627891, 2, '2014-08-05 12:38:04', '2014-08-05 12:38:04'),
(7854, 399, 627892, 2, '2014-08-05 12:38:04', '2014-08-05 12:38:04'),
(7855, 399, 627893, 2, '2014-08-05 12:38:04', '2014-08-05 12:38:04'),
(7856, 399, 627894, 2, '2014-08-05 12:38:04', '2014-08-05 12:38:04'),
(7857, 399, 627895, 2, '2014-08-05 12:38:04', '2014-08-05 12:38:05'),
(7858, 399, 627896, 2, '2014-08-05 12:38:05', '2014-08-05 12:38:05'),
(7859, 399, 627897, 2, '2014-08-05 12:38:05', '2014-08-05 12:38:05'),
(7860, 399, 627898, 2, '2014-08-05 12:38:05', '2014-08-05 12:38:05'),
(7861, 399, 627899, 2, '2014-08-05 12:38:05', '2014-08-05 12:38:05'),
(7862, 399, 627900, 2, '2014-08-05 12:38:05', '2014-08-05 12:38:05'),
(7863, 399, 627901, 2, '2014-08-05 12:38:05', '2014-08-05 12:38:05'),
(7864, 399, 627902, 2, '2014-08-05 12:38:05', '2014-08-05 12:38:05'),
(7865, 399, 627903, 2, '2014-08-05 12:38:06', '2014-08-05 12:38:06'),
(7866, 399, 627904, 2, '2014-08-05 12:38:06', '2014-08-05 12:38:06'),
(7867, 399, 627905, 2, '2014-08-05 12:38:06', '2014-08-05 12:38:06'),
(7868, 399, 627906, 2, '2014-08-05 12:38:06', '2014-08-05 12:38:06'),
(7869, 399, 627907, 2, '2014-08-05 12:38:06', '2014-08-05 12:38:06'),
(7870, 399, 627908, 2, '2014-08-05 12:38:06', '2014-08-05 12:38:06'),
(7871, 399, 627909, 2, '2014-08-05 12:38:06', '2014-08-05 12:38:07'),
(7872, 399, 627910, 2, '2014-08-05 12:38:07', '2014-08-05 12:38:07'),
(7873, 399, 627911, 2, '2014-08-05 12:38:07', '2014-08-05 12:38:07'),
(7874, 399, 627912, 2, '2014-08-05 12:38:07', '2014-08-05 12:38:07'),
(7875, 399, 627913, 2, '2014-08-05 12:38:07', '2014-08-05 12:38:07'),
(7876, 399, 627914, 2, '2014-08-05 12:38:07', '2014-08-05 12:38:07'),
(7877, 399, 627915, 2, '2014-08-05 12:38:07', '2014-08-05 12:38:07'),
(7878, 399, 627916, 2, '2014-08-05 12:38:07', '2014-08-05 12:38:08'),
(7879, 399, 627917, 2, '2014-08-05 12:38:08', '2014-08-05 12:38:08'),
(7880, 399, 627918, 2, '2014-08-05 12:38:08', '2014-08-05 12:38:08'),
(7881, 399, 627919, 2, '2014-08-05 12:38:08', '2014-08-05 12:38:08'),
(7882, 399, 627920, 2, '2014-08-05 12:38:08', '2014-08-05 12:38:08'),
(7883, 399, 627921, 2, '2014-08-05 12:38:08', '2014-08-05 12:38:08');

-- --------------------------------------------------------

--
-- Structure de la table `communication_harpeserver`
--

CREATE TABLE IF NOT EXISTS `communication_harpeserver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `ip` char(15) NOT NULL,
  `port` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `communication_harpeserver`
--

INSERT INTO `communication_harpeserver` (`id`, `name`, `ip`, `port`, `is_active`, `version`) VALUES
(1, 'Lyre', '130.79.253.239', 3987, 0, 407),
(2, 'Luth', '127.0.0.1', 3987, 0, 0),
(3, 'Cithare', '127.0.0.1', 3987, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `contentblocks_containeurtoobject`
--

CREATE TABLE IF NOT EXISTS `contentblocks_containeurtoobject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_object_id` int(11) NOT NULL,
  `page_containeur_id` int(11) NOT NULL,
  `position` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contentblocks_containeurtoobject_7e84c4ce` (`page_object_id`),
  KEY `contentblocks_containeurtoobject_638c1241` (`page_containeur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `contentblocks_pagecontaineur`
--

CREATE TABLE IF NOT EXISTS `contentblocks_pagecontaineur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `hextra_class` varchar(255) DEFAULT NULL,
  `position` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `contentblocks_pagecontaineur_32d04bc7` (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `contentblocks_pagecontaineur`
--

INSERT INTO `contentblocks_pagecontaineur` (`id`, `slug`, `page_id`, `hextra_class`, `position`) VALUES
(1, 'atoms', NULL, 'top', 0);

-- --------------------------------------------------------

--
-- Structure de la table `contentblocks_pageobject`
--

CREATE TABLE IF NOT EXISTS `contentblocks_pageobject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_type_id` int(11) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contentblocks_pageobject_1bb8f392` (`content_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

--
-- Contenu de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'permission', 'auth', 'permission'),
(2, 'group', 'auth', 'group'),
(3, 'user', 'auth', 'user'),
(4, 'content type', 'contenttypes', 'contenttype'),
(5, 'session', 'sessions', 'session'),
(6, 'site', 'sites', 'site'),
(7, 'log entry', 'admin', 'logentry'),
(8, 'amino acid', 'website', 'aa'),
(9, 'impossible cut', 'website', 'impossiblecut'),
(10, 'enzyme', 'website', 'enzyme'),
(11, 'analyse mgf', 'website', 'analysemgf'),
(12, 'generic flatblock', 'flatblocks', 'genericflatblock'),
(13, 'generic flatblock list', 'flatblocks', 'genericflatblocklist'),
(14, 'template block', 'flatblocks', 'templateblock'),
(15, 'title', 'gblocks', 'title'),
(16, 'text', 'gblocks', 'text'),
(17, 'image', 'gblocks', 'image'),
(18, 'image and link', 'gblocks', 'imageandlink'),
(19, 'title and file', 'gblocks', 'titleandfile'),
(20, 'title text and file', 'gblocks', 'titletextandfile'),
(21, 'title and text', 'gblocks', 'titleandtext'),
(22, 'title text and image', 'gblocks', 'titletextandimage'),
(23, 'title link and image', 'gblocks', 'titlelinkandimage'),
(24, 'title link text and image', 'gblocks', 'titlelinktextandimage'),
(25, 'menu item', 'Kraggne', 'menuitem'),
(26, 'page var', 'Kraggne', 'pagevar'),
(27, 'form block', 'Kraggne', 'formblock'),
(28, 'page template', 'Kraggne', 'pagetemplate'),
(29, 'page object', 'contentblocks', 'pageobject'),
(30, 'page containeur', 'contentblocks', 'pagecontaineur'),
(31, 'containeur to object', 'contentblocks', 'containeurtoobject'),
(32, 'analyse peptide', 'website', 'analysepeptide'),
(34, 'calculated peptide', 'website', 'calculatedpeptide'),
(35, 'client calculation', 'communication', 'clientcalculation'),
(36, 'client', 'communication', 'client'),
(37, 'harpe server', 'communication', 'harpeserver'),
(39, 'aa modification', 'website', 'aamodification'),
(40, 'aa modification position', 'website', 'aamodificationposition'),
(41, 'soft', 'Patcher', 'soft'),
(42, 'version', 'Patcher', 'version'),
(43, 'file', 'Patcher', 'file'),
(44, 'atom', 'website', 'atom'),
(45, 'atom isotope', 'website', 'atomisotope'),
(46, 'aa type', 'website', 'aatype'),
(47, 'analyse peptide validated', 'website', 'analysepeptidevalidated'),
(49, 'blast calculated peptide', 'website', 'blastcalculatedpeptide'),
(50, 'blast analyse', 'website', 'blastanalyse'),
(51, 'mod type', 'website', 'modtype');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Structure de la table `flatblocks_genericflatblock`
--

CREATE TABLE IF NOT EXISTS `flatblocks_genericflatblock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `exclude_fields` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `flatblocks_genericflatblock_1bb8f392` (`content_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `flatblocks_genericflatblocklist`
--

CREATE TABLE IF NOT EXISTS `flatblocks_genericflatblocklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `exclude_fields` longtext,
  `query_args` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `flatblocks_genericflatblocklist_1bb8f392` (`content_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `flatblocks_templateblock`
--

CREATE TABLE IF NOT EXISTS `flatblocks_templateblock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `template_path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `template_path` (`template_path`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `gblocks_image`
--

CREATE TABLE IF NOT EXISTS `gblocks_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `gblocks_imageandlink`
--

CREATE TABLE IF NOT EXISTS `gblocks_imageandlink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `link` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `gblocks_text`
--

CREATE TABLE IF NOT EXISTS `gblocks_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `gblocks_title`
--

CREATE TABLE IF NOT EXISTS `gblocks_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `gblocks_titleandfile`
--

CREATE TABLE IF NOT EXISTS `gblocks_titleandfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `file` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `gblocks_titleandtext`
--

CREATE TABLE IF NOT EXISTS `gblocks_titleandtext` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `text` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `gblocks_titlelinkandimage`
--

CREATE TABLE IF NOT EXISTS `gblocks_titlelinkandimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `gblocks_titlelinktextandimage`
--

CREATE TABLE IF NOT EXISTS `gblocks_titlelinktextandimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `text` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `gblocks_titletextandfile`
--

CREATE TABLE IF NOT EXISTS `gblocks_titletextandfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `text` longtext NOT NULL,
  `file` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `gblocks_titletextandimage`
--

CREATE TABLE IF NOT EXISTS `gblocks_titletextandimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `text` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `Kraggne_formblock`
--

CREATE TABLE IF NOT EXISTS `Kraggne_formblock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(50) NOT NULL,
  `page_id` int(11) NOT NULL,
  `form` varchar(255) NOT NULL,
  `view` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `Kraggne_menuitem`
--

CREATE TABLE IF NOT EXISTS `Kraggne_menuitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `cms_page` tinyint(1) NOT NULL,
  `view` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `is_visible` tinyint(1) NOT NULL,
  `login_required` tinyint(1) NOT NULL,
  `login_required_to_see` tinyint(1) NOT NULL,
  `login_forbidden` tinyint(1) NOT NULL,
  `login_forbidden_to_see` tinyint(1) NOT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `Kraggne_menuitem_63f17a16` (`parent_id`),
  KEY `Kraggne_menuitem_42b06ff6` (`lft`),
  KEY `Kraggne_menuitem_6eabc1a6` (`rght`),
  KEY `Kraggne_menuitem_102f80d8` (`tree_id`),
  KEY `Kraggne_menuitem_2a8f42e8` (`level`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Contenu de la table `Kraggne_menuitem`
--

INSERT INTO `Kraggne_menuitem` (`id`, `name`, `slug`, `order`, `parent_id`, `cms_page`, `view`, `url`, `is_visible`, `login_required`, `login_required_to_see`, `login_forbidden`, `login_forbidden_to_see`, `lft`, `rght`, `tree_id`, `level`) VALUES
(1, 'main', 'main', 0, NULL, 0, '', '/', 0, 0, 0, 0, 0, 1, 32, 1, 0),
(2, 'Accueil', 'accueil', 0, 1, 0, 'website-home', '/', 1, 0, 0, 0, 0, 2, 3, 1, 1),
(3, 'Mon compte', 'mon-compte', 19, 1, 0, 'website-home', '/', 1, 1, 1, 0, 0, 18, 31, 1, 1),
(4, 'Connection', 'connection', 18, 1, 0, 'website-login', '/login/', 1, 0, 0, 1, 1, 16, 17, 1, 1),
(5, 'Télécharger', 'telecharger', 1, 1, 0, 'patcher-soft-list', '/patcher/list/', 1, 0, 0, 0, 0, 4, 5, 1, 1),
(6, 'À propos', 'about', 2, 1, 0, 'website-home', '/', 1, 0, 0, 0, 0, 6, 13, 1, 1),
(7, 'Mes analyses', 'analyse-list', 0, 3, 0, 'analyse-list', '/analyses/list/', 1, 1, 1, 0, 0, 19, 28, 1, 2),
(8, 'Détail d''analyse', 'detail-danalyse', 1, 7, 0, 'website-home', '/', 0, 1, 1, 0, 0, 22, 23, 1, 3),
(9, 'Nouvelle analyse', 'analyse-create', 0, 7, 0, 'analyse-create', '/analyse/create/', 1, 1, 1, 0, 0, 20, 21, 1, 3),
(10, 'Contact', 'contact', 3, 1, 0, 'website-home', '/', 1, 0, 0, 0, 0, 14, 15, 1, 1),
(11, 'Deconnection', 'deconnection', 10, 3, 0, 'website-logout', '/logout/', 1, 1, 1, 0, 0, 29, 30, 1, 2),
(12, 'Atoms', 'atoms', 0, 6, 1, 'list("/atoms",website.Atom)', '/atoms', 1, 0, 0, 0, 0, 7, 8, 1, 2),
(13, 'Amino acids', 'amino-acids', 1, 6, 1, 'list("/aa",website.AA)', '/aa', 1, 0, 0, 0, 0, 9, 10, 1, 2),
(14, 'PTMs', 'ptms', 2, 6, 1, 'list("/ptm",website.AAModification)', '/ptm', 1, 0, 0, 0, 0, 11, 12, 1, 2),
(15, 'Blast', 'blast-create', 3, 7, 0, 'blast-create', '/blast/', 1, 0, 0, 0, 0, 26, 27, 1, 3),
(16, 'Blast détail', 'blast-detail', 2, 7, 1, 'detail("/blast/(?P<pk>[\\d]+)",website.BlastAnalyse)', '/blast/(?P<pk>[\\d]+)', 0, 0, 0, 0, 0, 24, 25, 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `Kraggne_pagetemplate`
--

CREATE TABLE IF NOT EXISTS `Kraggne_pagetemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `template_path` char(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_id` (`page_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `Kraggne_pagevar`
--

CREATE TABLE IF NOT EXISTS `Kraggne_pagevar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `context_name` varchar(20) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `object_id` int(10) unsigned DEFAULT NULL,
  `query_args` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `context_name` (`context_name`,`page_id`),
  KEY `Kraggne_pagevar_32d04bc7` (`page_id`),
  KEY `Kraggne_pagevar_1bb8f392` (`content_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `Patcher_file`
--

CREATE TABLE IF NOT EXISTS `Patcher_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `file` varchar(100) DEFAULT NULL,
  `action` int(11) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Patcher_file_10f4f63` (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `Patcher_soft`
--

CREATE TABLE IF NOT EXISTS `Patcher_soft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(32) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `Patcher_soft`
--

INSERT INTO `Patcher_soft` (`id`, `name`, `slug`, `description`) VALUES
(1, 'harpe-client', 'harpe-client', 'Permet de participer aux calcules des peptides (trouver les séquences).\r\nCe logiciel est téléchargé automatiquement depuis le patcher, avec les MAJ.\r\nNe le téléchargez pas directement, sauf si une version spésifique est requise.\r\nIl est préférable de passer par le patcher.'),
(2, 'harpe-server', 'harpe-server', 'Permet de recevoir des fichiers mgf et de dispatcher les calcules sur différents clients.\r\nCe logiciel se charge aussi d''enregistrer les résultats en base de données.\r\nUn seul server Harpe est nécessaire.'),
(3, 'harpe-client-patcher', 'harpe-client-patcher', 'Patcher automatique pour le client harpe.\r\nIl est à installer sur les machines servant de calculateur.\r\nLa quantitée de ressources utilisées es bornée pour permettre une utilisation normal de la machine.\r\n\r\nL''URL demmandée lors de la configuration est celle du site (http://130.79.253.239:8000).');

-- --------------------------------------------------------

--
-- Structure de la table `Patcher_version`
--

CREATE TABLE IF NOT EXISTS `Patcher_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `soft_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `os` varchar(128) NOT NULL,
  `bit` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Patcher_version_62b1f288` (`soft_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `website_aa`
--

CREATE TABLE IF NOT EXISTS `website_aa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(16) NOT NULL,
  `code` varchar(1) NOT NULL,
  `formule` longtext NOT NULL,
  `type_id` int(11) NOT NULL,
  `mass` decimal(15,10) NOT NULL,
  `fk_aa_id` int(11) DEFAULT NULL,
  `fk_mod_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `website_aa_403d8ff3` (`type_id`),
  KEY `website_aa_f182c18a` (`fk_aa_id`),
  KEY `website_aa_16c1b4a6` (`fk_mod_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Contenu de la table `website_aa`
--

INSERT INTO `website_aa` (`id`, `name`, `slug`, `code`, `formule`, `type_id`, `mass`, `fk_aa_id`, `fk_mod_id`) VALUES
(1, 'Alanine', 'Ala', 'A', 'C3H5NO', 2, 71.0371137900, NULL, NULL),
(2, 'Arginine', 'Arg', 'R', 'C6H12N4O', 2, 156.1011110440, NULL, NULL),
(3, 'Asparagine', 'Asn', 'N', 'C4H6N2O2', 2, 114.0429274520, NULL, NULL),
(4, 'Aspartic Acid', 'Asp', 'D', 'C4H5NO3', 2, 115.0269430300, NULL, NULL),
(5, 'Cysteine', 'Cys', 'C', 'C3H5NOS', 2, 103.0091844900, NULL, NULL),
(6, 'Glutamine', 'Gln', 'Q', 'C5H8N2O2', 2, 128.0585775160, NULL, NULL),
(7, 'Glutamic Acid', 'Glu', 'E', 'C5H7NO3', 2, 129.0425930940, NULL, NULL),
(8, 'Glycine', 'Gly', 'G', 'C2H3NO', 2, 57.0214637260, NULL, NULL),
(9, 'Histidine', 'His', 'H', 'C6H7N3O', 2, 137.0589118740, NULL, NULL),
(10, 'Isoleucine', 'Ile', 'I', 'C6H11NO', 2, 113.0840639820, NULL, NULL),
(12, 'Lysine', 'Lys', 'K', 'C6H12N2O', 2, 128.0949630240, NULL, NULL),
(13, 'Methionine', 'Met', 'M', 'C5H9NOS', 2, 131.0404846180, NULL, NULL),
(14, 'Phenylalanine', 'Phe', 'F', 'C9H9NO', 2, 147.0684139180, NULL, NULL),
(15, 'Proline', 'Pro', 'P', 'C5H7NO', 2, 97.0527638540, NULL, NULL),
(16, 'Serine', 'Ser', 'S', 'C3H5NO2', 2, 87.0320284100, NULL, NULL),
(17, 'Threonine', 'Thr', 'T', 'C4H7NO2', 2, 101.0476784740, NULL, NULL),
(18, 'Tryptophan', 'Trp', 'W', 'C11H10N2O', 2, 186.0793129600, NULL, NULL),
(19, 'Tyrosine', 'Tyr', 'Y', 'C9H9NO2', 2, 163.0633285380, NULL, NULL),
(20, 'Valine', 'Val', 'V', 'C5H9NO', 2, 99.0684139180, NULL, NULL),
(21, 'Selenocysteine', 'Sec', 'U', 'C3H5NOSe', 2, 150.9536357900, NULL, NULL),
(22, 'Leucine', 'leucine', 'L', 'C6H11NO', 3, 113.0840639820, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `website_aamodification`
--

CREATE TABLE IF NOT EXISTS `website_aamodification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `delta` decimal(15,10) NOT NULL,
  `TS` int(11) NOT NULL,
  `type_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1665 ;

--
-- Contenu de la table `website_aamodification`
--

INSERT INTO `website_aamodification` (`id`, `name`, `slug`, `delta`, `TS`, `type_id`) VALUES
(1444, 'Acetyl', '1Ac', 42.0105646840, 2, 1),
(1445, 'Amidated', 'Ami', -0.9840155780, 3, 1),
(1446, 'Citrullination', 'Citrullination', 0.9840155780, 1, 1),
(1447, 'Amidino', 'Amd', 42.0217980840, 1, 1),
(1448, 'Archaeol', 'Ach', 634.6627819920, 1, 1),
(1449, 'Arg->Orn', 'Orn', -42.0217980840, 1, 1),
(1450, 'Biotin', 'Btn', 226.0775984080, 2, 1),
(1451, 'Bromo', '1Br', 77.9105129680, 1, 1),
(1452, 'Dibromo', '2Br', 155.8210259360, 1, 1),
(1453, 'Butyryl', 'Byr', 70.0418648120, 1, 1),
(1454, 'Carboxylation', 'Cox', 43.9898292400, 1, 1),
(1455, 'Carboxyethyl', 'CEt', 72.0211293680, 1, 1),
(1456, 'CHDH', 'CHD', 294.1831093120, 1, 1),
(1457, 'Chloro', '1Cl', 33.9610276780, 1, 1),
(1458, 'Dichloro', '2Cl', 67.9220553560, 1, 1),
(1459, 'Disulphide', 'Disulphide', -2.0156500640, 1, 1),
(1460, 'Cholesterol', 'Chl', 368.3443014080, 8, 1),
(1461, 'CuSMo', 'CSM', 922.8348552480, 1, 1),
(1462, 'Cyano', '1CN', 24.9952489780, 1, 1),
(1463, 'Cysteinylation', 'SCC', 119.0040991100, 1, 1),
(1464, 'Cys->Hcy', 'CHC', 14.0156500640, 1, 1),
(1465, 'Cys->Oxoalanine', 'COa', -17.9928061440, 1, 1),
(1466, 'Cys->PyruvicAcid', 'CPA', -33.0037051860, 1, 1),
(1467, 'Deamidated', 'Dea', 0.9840155780, 2, 1),
(1468, 'Decanoyl', 'Dec', 154.1357651960, 1, 1),
(1469, 'Delta:Se(1)', '1Se', 79.9165220000, 1, 1),
(1470, 'Delta:S(-1)Se(1)', 'SSe', 47.9444513000, 1, 1),
(1471, 'Diacylglycerol', 'DiG', 576.5117606560, 1, 1),
(1472, 'Deoxy', 'dOx', -15.9949146200, 1, 1),
(1473, 'Formylation', 'For', 27.9949146200, 2, 1),
(1474, 'Oxydation', 'Ox', 15.9949146200, 1, 1),
(1475, 'Dehydration', 'dHy', -18.0105646840, 1, 2),
(1476, 'Didehydroretinylidene', 'ddR', 264.1878007680, 1, 1),
(1477, 'Diironsubcluster', 'dFe', 342.7869214880, 1, 1),
(1478, 'Diphthamide', 'Dip', 142.1106130880, 1, 1),
(1479, 'Dipyrrolylmethanemethyl', 'dpM', 418.1376156840, 1, 1),
(1480, 'Pyroglutamic acid', 'Pyroglutamic acid', -17.0027396520, 2, 1),
(1481, 'FAD', 'FAD', 783.1414843820, 1, 1),
(1482, 'FMN', 'FMN', 438.0940501080, 1, 1),
(1483, 'FMNC', 'FNC', 456.1046147920, 1, 1),
(1484, 'FMNH', 'FNH', 454.0889647280, 1, 1),
(1485, 'Farnesyl', 'Far', 204.1878007680, 1, 1),
(1486, 'Hydroxyfarnesyl', 'HFr', 220.1827153880, 1, 1),
(1487, 'Formylméthionine', 'FMA', 159.0353992380, 2, 1),
(1488, 'Geranylgeranyl', '2Ge', 272.2504010240, 1, 1),
(1489, 'GlnThrGlyGly', 'SU1', 343.1491834420, 1, 1),
(1490, 'GlnGlnGlnThrGlyGly', 'SU2', 599.2663384740, 1, 1),
(1491, 'Glucuronyl', 'GCn', 176.0320879760, 2, 1),
(1492, 'Glutathione', 'GSO', 305.0681559300, 1, 1),
(1493, 'Glycerophospho', 'GPh', 154.0031098240, 1, 1),
(1494, 'GlycerylPE', 'GPE', 197.0453089940, 1, 1),
(1495, 'GlyGly', 'UGG', 114.0429274520, 1, 1),
(1496, 'GlyGlyGln', 'GGQ', 243.1093300000, 1, 1),
(1497, 'GPIanchor', 'GPI', 123.0085295620, 8, 1),
(1498, 'Heme', 'HEM', 616.1772975440, 0, 1),
(1499, 'HNE', 'HNE', 156.1150297520, 0, 1),
(1500, 'Hex', 'Hex', 162.0528234200, 2, 1),
(1501, 'dHex', 'dHx', 146.0579088000, 1, 1),
(1502, 'HexNAc', 'HNc', 203.0793725260, 1, 1),
(1503, 'Hex(1)HexNAc(1)', 'HHN', 365.1321959460, 1, 1),
(1504, 'Hex(1)HexNAc(1)NeuAc(1)', 'NHH', 656.2276124600, 1, 1),
(1505, 'Hex(1)HexNAc(1)NeuAc(2)', 'NHN', 947.3230289740, 1, 1),
(1506, 'Homoserine', 'Homoserine', -29.9928061440, 3, 1),
(1507, 'Homoarginine', 'Homoarginine', 42.0217980840, 1, 1),
(1508, 'Hydroxycinnamyl', 'hCn', 146.0367794320, 1, 1),
(1509, 'Hydroxyheme', 'hHm', 614.1616474800, 1, 1),
(1510, 'Hydroxymethyl', 'h1M', 30.0105646840, 1, 1),
(1511, 'Hydroxytrimethyl', 'h3M', 59.0496898440, 1, 1),
(1512, 'Hypusine', 'Hps', 87.0684139180, 1, 1),
(1513, 'Iodo', 'Iod', 125.8966429680, 1, 1),
(1514, 'Diiodo', '2Io', 251.7932859360, 1, 1),
(1515, 'Isopropyl', 'Ipr', 42.0469501920, 1, 1),
(1516, 'LeuArgGlyGly', 'Umc', 383.2281024780, 1, 1),
(1517, 'Lipoyl', 'Lip', 188.0329564040, 1, 1),
(1518, 'Lys->AminoadipicAcid', 'AAA', 14.9632801340, 1, 1),
(1519, 'Methyl', '1Me', 14.0156500640, 1, 1),
(1520, 'Dimethyl', '2Me', 28.0313001280, 2, 1),
(1521, 'Dimethyl-d6', '2MD', 34.0689606040, 2, 1),
(1522, 'Trimethyl', '3Me', 42.0469501920, 1, 1),
(1523, 'Methyl+Deamidated', 'MDe', 14.9996656420, 1, 1),
(1524, 'Methylpyrroline', 'MPr', 109.0527638540, 1, 1),
(1525, 'Methylthio', 'MSH', 45.9877207640, 2, 1),
(1526, 'MMTS', 'MMT', 45.9877207640, 1, 1),
(1527, 'Met->Hcy', 'MHC', -14.0156500640, 1, 1),
(1528, 'Microcin', 'Mic', 831.1970406140, 8, 1),
(1529, 'MicrocinC7', 'Mi7', 386.1103688880, 8, 1),
(1530, 'Molybdopterin', 'Mdt', 521.8840722620, 1, 1),
(1531, 'MolybdopterinGD', 'MGD', 1572.9857726240, 1, 1),
(1532, 'MolybdopterinGD+Delta:S(-1)Se(1)', 'MtD', 1620.9302239240, 1, 1),
(1533, 'Myristoylation', 'Myr', 210.1983654520, 1, 1),
(1534, 'NeuAc', 'NAc', 291.0954165140, 1, 1),
(1535, 'NeuGc', 'NGc', 307.0903311340, 1, 1),
(1536, 'Nicotinyl', 'Ncl', 104.0136386940, 1, 1),
(1537, 'Nitro', 'Ntr', 44.9850782180, 1, 1),
(1538, 'Octanoyl', 'Oct', 126.1044650680, 1, 1),
(1539, 'Palmitoleyl', 'Pty', 236.2140155160, 1, 1),
(1540, 'Palmitoylation', 'Pal', 238.2296655800, 2, 1),
(1541, 'Tripalmitate', '3Pa', 788.7257761720, 2, 1),
(1542, 'Phosphopantetheine', 'PPE', 340.0857936120, 1, 1),
(1543, 'Phosphoadenosine', 'AMP', 329.0525196540, 1, 1),
(1544, 'Phosphoguanosine', 'GMP', 345.0474342740, 1, 1),
(1545, 'PhosphoribosyldephosphoCoA', 'PRC', 881.1469023940, 1, 1),
(1546, 'PhosphoUridine', 'UMP', 306.0253018320, 1, 1),
(1547, 'Phospho', 'Pho', 79.9663303920, 1, 1),
(1548, 'Phycocyanobilin', 'pcb', 586.2791349760, 1, 1),
(1549, 'Phycoerythrobilin', 'pct', 588.2947850400, 1, 1),
(1550, 'Phytochromobilin', 'pcm', 584.2634849120, 1, 1),
(1551, 'PyridoxalPhosphate', 'PyP', 229.0140088660, 1, 1),
(1552, 'PyruvicAcidIminyl', 'PAI', 70.0054793040, 1, 1),
(1553, 'Quinone', 'Qin', 29.9741791760, 1, 1),
(1554, 'Retinylidene', 'Ret', 266.2034508320, 1, 1),
(1555, 'Ser->LacticAcid', 'SLA', -15.0108990420, 1, 1),
(1556, 'Ser->Oxoalanine', 'SOa', -2.0156500640, 1, 1),
(1557, 'Succinyl', 'Suc', 100.0160439880, 2, 1),
(1558, 'Sulfide', 'Sud', 31.9720707000, 1, 1),
(1559, 'Sulfation', 'SuO', 79.9568145600, 1, 1),
(1560, 'Thyroxine', 'Trx', 595.6127866200, 1, 1),
(1561, 'Triiodothyronine', '3IT', 469.7161436520, 1, 1),
(1562, 'Tyr->Dha', 'YDA', -94.0418648120, 1, 1),
(1563, 'Acetyl-PEO-Biotin', 'PEO', 414.1936908000, 1, 1),
(1564, 'Carboxymethyl', 'Cmc', 58.0054793040, 1, 1),
(1565, 'Carbamidomethyl', 'CAM', 57.0214637260, 1, 1),
(1566, 'Dicarbamidomethyl', '2CM', 114.0429274520, 1, 1),
(1567, 'Cys->pyro-CAM', 'PCa', 39.9949146200, 2, 1),
(1568, 'Cys->pyro-CmC', 'cysToPyro', 39.9949146200, 2, 1),
(1569, 'Dethiomethyl', 'DTM', -48.0033708280, 1, 1),
(1570, 'Ethanolyl', 'EtO', 44.0262147480, 1, 1),
(1571, 'N-Ethylmaleimide', 'NEM', 125.0476784740, 1, 1),
(1572, 'N-Ethylmaleimide+water', 'NMH', 143.0582431580, 1, 1),
(1573, 'Met->Carbamidomethyl-Hcy', 'CaS', 43.0058136620, 1, 1),
(1574, 'N-Methylmaleimide', 'NMM', 111.0320284100, 1, 1),
(1575, 'N-Methylmaleimide+water', 'MMH', 129.0425930940, 1, 1),
(1576, 'Pyridylethyl', 'Pye', 105.0578492340, 1, 1),
(1577, 'Met->Hsl', 'MetToHsl', -48.0033708280, 0, 1),
(1578, 'Met->Hse', 'MetToHse', -29.9928061440, 0, 1),
(1579, 'Met->HseLactone Old3LetterCode', 'HSL', -48.0033708280, 0, 1),
(1580, 'Acetyl:2H(3)', 'DAc', 45.0293949220, 1, 1),
(1581, 'Deamidated:18O(1)', 'DeO', 2.9882609580, 1, 1),
(1582, 'Delta:H(1)O(-1)18O(1)', 'DeW', 3.0120704120, 1, 1),
(1583, 'ICAT-C', 'C0I', 227.1269914340, 1, 1),
(1584, 'ICAT-C:13C(9)', 'C9I', 236.1571849940, 1, 1),
(1585, 'ICAT-D', 'd0I', 442.2249909280, 1, 1),
(1586, 'ICAT-D:2H(8)', 'd8I', 450.2752048960, 1, 1),
(1587, 'ICPL', 'IP0', 105.0214637260, 1, 1),
(1588, 'ICPL:2H(4)', 'IP4', 109.0465707100, 1, 1),
(1589, 'ICPL:13C(6)', 'IP6', 111.0415927660, 1, 1),
(1590, 'iTRAQ4plex', 'IT4', 144.1020625040, 1, 1),
(1591, 'iTRAQ8plex', 'IT8', 304.2053595080, 1, 1),
(1592, 'iTRAQ8plexCold', 'T8C', 296.1848406680, 1, 1),
(1593, 'TMT6plex', 'TM6', 229.1629322200, 1, 1),
(1594, 'TMT2plex', 'TM2', 225.1558327400, 1, 1),
(1595, 'TMT', 'TM0', 224.1524779000, 1, 1),
(1596, 'Label:2H(10)', 'D10', 10.0627674600, 1, 1),
(1597, 'Label:2H(4)', 'D04', 4.0251069840, 1, 1),
(1598, 'Label:15N(4)', '+04', 3.9881398400, 1, 1),
(1599, 'Label:13C(4)', '+4a', 4.0134193600, 1, 1),
(1600, 'Label:13C(6)', '+06', 6.0201290400, 1, 1),
(1601, 'Label:13C(5)15N(1)', '+6a', 6.0138091600, 1, 1),
(1602, 'Label:13C(6)15N(1)', '+07', 7.0171640000, 1, 1),
(1603, 'Label:13C(6)15N(2)', '+08', 8.0141989600, 1, 1),
(1604, 'Label:13C(6)15N(4)', '+10', 10.0082688800, 1, 1),
(1605, 'Label:18O(1)', 'Ob1', 2.0042453800, 1, 1),
(1606, 'mTRAQ', 'M00', 140.0949630240, 1, 1),
(1607, 'mTRAQ:13C(3)15N(1)', 'M04', 144.1020625040, 1, 1),
(1608, 'mTRAQ:13C(6)15N(2)', 'M08', 148.1091619840, 1, 1),
(1609, 'Ammonia-loss', 'dAm', -17.0265491060, 1, 2),
(1610, 'Cation:Na', 'NaX', 21.9819446680, 1, 1),
(1611, 'Cation:K', 'KXX', 37.9558818680, 1, 1),
(1612, 'Cation:Cu[I]', 'CuX', 61.9217759680, 1, 1),
(1613, 'Didehydro', '-2H', -2.0156500640, 1, 1),
(1614, 'Formyl', 'Frm', 27.9949146200, 1, 1),
(1615, 'FormaldehydeAdduct', 'FRT', 12.0000000000, 1, 1),
(1616, 'Propionyl', 'Poy', 56.0262147480, 1, 1),
(1617, 'AEC-MAEC', 'Aec', 59.0193552500, 1, 1),
(1618, 'Amino', 'Amn', 15.0108990420, 1, 1),
(1619, 'Arg-add', '+1R', 156.1011110440, 5, 1),
(1620, 'Arg-loss', '-1R', -156.1011110440, 3, 1),
(1621, 'Arg->GluSA', 'AGA', -43.0534325700, 1, 1),
(1622, 'Carbamyl', 'CRM', 43.0058136620, 1, 1),
(1623, 'Cys->Dha', 'DHA', -33.9877207640, 1, 1),
(1624, 'Dehydro', '-1H', -1.0078250320, 1, 1),
(1625, 'Delta:H(2)C(2)', 'AAS', 26.0156500640, 1, 1),
(1626, 'Delta:H(4)C(2)', 'AAR', 28.0313001280, 1, 1),
(1627, 'Ethylamide', 'EAm', 29.0391251600, 1, 1),
(1628, 'Gln->pyro-Glu', 'PGQ', -17.0265491060, 5, 1),
(1629, 'Glu->pyro-Glu', 'PGE', -18.0105646840, 5, 1),
(1630, 'Guanidinyl', '1Gu', 42.0217980840, 1, 1),
(1631, 'Lys->Allysine', 'LAA', -1.0316344860, 1, 1),
(1632, 'Lys->Hydroxyallysine', 'HAA', 14.9632801340, 1, 1),
(1633, 'Lys-add', '+1K', 128.0949630240, 5, 1),
(1634, 'Lys-loss', '-1K', -128.0949630240, 3, 1),
(1635, 'Met->Aha', 'MAH', -4.9863237660, 1, 1),
(1636, 'Met->Aha+tag', 'MAT', 107.0773391300, 1, 1),
(1637, 'Met->Aha+tagMCL', 'MAC', 695.2800742740, 1, 1),
(1638, 'Oxidation', 'Oxi', 15.9949146200, 1, 1),
(1639, 'Hydroxy Old3LetterCode', '1OH', 15.9949146200, 1, 1),
(1640, 'Cysteine sulfenic acid Old3LetterCode', 'CSA', 15.9949146200, 1, 1),
(1641, 'Proglutamicsealde Old3LetterCode', 'PGa', 15.9949146200, 1, 1),
(1642, 'Dioxidation', '2Ox', 31.9898292400, 1, 1),
(1643, 'Dihydroxy Old3LetterCode', '2OH', 31.9898292400, 1, 1),
(1644, 'Dihydroxy-Phe Old3LetterCode', 'DHF', 31.9898292400, 1, 1),
(1645, 'Formylkynurenin Old3LetterCode', 'Fky', 31.9898292400, 1, 1),
(1646, 'Trioxidation', '3Ox', 47.9847438600, 1, 1),
(1647, 'Trioxidation Old3LetterCode', 'CAa', 47.9847438600, 1, 1),
(1648, 'Pro->Pyrrolidinone', 'PYD', -30.0105646840, 3, 1),
(1649, 'Propionamide', 'PPa', 71.0371137900, 1, 1),
(1650, 'Pro->pyro-Glu', 'PGP', 13.9792645560, 1, 1),
(1651, 'Sec->Dha', 'UHA', -81.9321720640, 1, 1),
(1652, 'Trp->Kynurenin', 'Kyn', 3.9949146200, 1, 1),
(1653, 'Trp->Hydroxykynurenin', 'HKy', 19.9898292400, 1, 1),
(1654, 'Benzyl', 'Bnz', 90.0469501920, 1, 1),
(1655, 'Boc', 'Boc', 100.0524294960, 2, 1),
(1656, 'CBZ(Benzyloxycarbonyl)', 'CBZ', 134.0367794320, 2, 1),
(1657, 'Dinitrophenyl', '2Np', 166.0014565640, 1, 1),
(1658, 'Fmoc', 'Fmc', 222.0680795600, 2, 1),
(1659, 'Hydrazide', 'Hyz', 14.0268834640, 1, 1),
(1660, 'Naphthyl', 'Npl', 126.0469501920, 1, 1),
(1661, 'Napthylacetyl', 'NpA', 168.0575148760, 1, 1),
(1662, 'Trifluoroacetyl', 'TFA', 95.9822991880, 1, 1),
(1663, 'Trinitrophenyl', '3Np', 210.9865347820, 1, 1),
(1664, 'PMC', 'PMC', 265.0898401040, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `website_aamodificationposition`
--

CREATE TABLE IF NOT EXISTS `website_aamodificationposition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AA_id` int(11) NOT NULL,
  `modification_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `website_aamodificationposition_ee362409` (`AA_id`),
  KEY `website_aamodificationposition_b94bca49` (`modification_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9896 ;

--
-- Contenu de la table `website_aamodificationposition`
--

INSERT INTO `website_aamodificationposition` (`id`, `AA_id`, `modification_id`, `position`) VALUES
(8334, 16, 1444, 2),
(8335, 12, 1444, 2),
(8336, 5, 1444, 2),
(8337, 1, 1445, 3),
(8338, 2, 1445, 3),
(8339, 3, 1445, 3),
(8340, 4, 1445, 3),
(8341, 5, 1445, 3),
(8342, 7, 1445, 3),
(8343, 6, 1445, 3),
(8344, 8, 1445, 3),
(8345, 9, 1445, 3),
(8346, 10, 1445, 3),
(8348, 12, 1445, 3),
(8349, 13, 1445, 3),
(8350, 14, 1445, 3),
(8351, 15, 1445, 3),
(8352, 21, 1445, 3),
(8353, 16, 1445, 3),
(8354, 17, 1445, 3),
(8355, 18, 1445, 3),
(8356, 19, 1445, 3),
(8357, 20, 1445, 3),
(8358, 2, 1446, 1),
(8359, 5, 1447, 1),
(8360, 5, 1448, 1),
(8361, 2, 1449, 1),
(8362, 12, 1450, 2),
(8363, 18, 1451, 1),
(8364, 14, 1451, 1),
(8365, 9, 1451, 1),
(8366, 19, 1451, 1),
(8367, 19, 1452, 1),
(8368, 12, 1453, 1),
(8369, 4, 1454, 1),
(8370, 7, 1454, 1),
(8371, 12, 1454, 1),
(8372, 18, 1454, 1),
(8373, 13, 1454, 2),
(8374, 12, 1455, 1),
(8375, 4, 1456, 1),
(8376, 19, 1457, 1),
(8377, 19, 1458, 1),
(8378, 1, 1459, 1),
(8379, 2, 1459, 1),
(8380, 3, 1459, 1),
(8381, 4, 1459, 1),
(8382, 5, 1459, 1),
(8383, 7, 1459, 1),
(8384, 6, 1459, 1),
(8385, 8, 1459, 1),
(8386, 9, 1459, 1),
(8387, 10, 1459, 1),
(8389, 12, 1459, 1),
(8390, 13, 1459, 1),
(8391, 14, 1459, 1),
(8392, 15, 1459, 1),
(8393, 21, 1459, 1),
(8394, 16, 1459, 1),
(8395, 17, 1459, 1),
(8396, 18, 1459, 1),
(8397, 19, 1459, 1),
(8398, 20, 1459, 1),
(8399, 1, 1460, 8),
(8400, 2, 1460, 8),
(8401, 3, 1460, 8),
(8402, 4, 1460, 8),
(8403, 5, 1460, 8),
(8404, 7, 1460, 8),
(8405, 6, 1460, 8),
(8406, 8, 1460, 8),
(8407, 9, 1460, 8),
(8408, 10, 1460, 8),
(8410, 12, 1460, 8),
(8411, 13, 1460, 8),
(8412, 14, 1460, 8),
(8413, 15, 1460, 8),
(8414, 21, 1460, 8),
(8415, 16, 1460, 8),
(8416, 17, 1460, 8),
(8417, 18, 1460, 8),
(8418, 19, 1460, 8),
(8419, 20, 1460, 8),
(8420, 5, 1461, 1),
(8421, 5, 1462, 1),
(8422, 5, 1463, 1),
(8423, 5, 1464, 1),
(8424, 5, 1465, 1),
(8425, 5, 1466, 1),
(8426, 2, 1467, 2),
(8427, 3, 1467, 2),
(8428, 6, 1467, 2),
(8429, 16, 1468, 1),
(8430, 17, 1468, 1),
(8431, 5, 1469, 1),
(8432, 5, 1470, 1),
(8433, 13, 1470, 1),
(8434, 5, 1471, 1),
(8435, 4, 1472, 1),
(8436, 16, 1472, 1),
(8437, 17, 1472, 1),
(8438, 17, 1473, 2),
(8439, 12, 1473, 2),
(8440, 16, 1473, 2),
(8441, 18, 1474, 1),
(8442, 9, 1474, 1),
(8443, 5, 1474, 1),
(8444, 13, 1474, 1),
(8445, 19, 1475, 1),
(8446, 17, 1475, 1),
(8447, 16, 1475, 1),
(8448, 3, 1475, 3),
(8449, 6, 1475, 3),
(8450, 5, 1475, 2),
(8451, 12, 1476, 1),
(8452, 5, 1477, 1),
(8453, 9, 1478, 1),
(8454, 5, 1479, 1),
(8455, 1, 1480, 2),
(8456, 2, 1480, 2),
(8457, 3, 1480, 2),
(8458, 4, 1480, 2),
(8459, 5, 1480, 2),
(8460, 7, 1480, 2),
(8461, 6, 1480, 2),
(8462, 8, 1480, 2),
(8463, 9, 1480, 2),
(8464, 10, 1480, 2),
(8466, 12, 1480, 2),
(8467, 13, 1480, 2),
(8468, 14, 1480, 2),
(8469, 15, 1480, 2),
(8470, 21, 1480, 2),
(8471, 16, 1480, 2),
(8472, 17, 1480, 2),
(8473, 18, 1480, 2),
(8474, 19, 1480, 2),
(8475, 20, 1480, 2),
(8476, 5, 1481, 1),
(8477, 9, 1481, 1),
(8478, 19, 1481, 1),
(8479, 16, 1482, 1),
(8480, 17, 1482, 1),
(8481, 5, 1483, 1),
(8482, 5, 1484, 1),
(8483, 9, 1484, 1),
(8484, 5, 1485, 1),
(8485, 5, 1486, 1),
(8486, 1, 1487, 2),
(8487, 2, 1487, 2),
(8488, 3, 1487, 2),
(8489, 4, 1487, 2),
(8490, 5, 1487, 2),
(8491, 7, 1487, 2),
(8492, 6, 1487, 2),
(8493, 8, 1487, 2),
(8494, 9, 1487, 2),
(8495, 10, 1487, 2),
(8497, 12, 1487, 2),
(8498, 13, 1487, 2),
(8499, 14, 1487, 2),
(8500, 15, 1487, 2),
(8501, 21, 1487, 2),
(8502, 16, 1487, 2),
(8503, 17, 1487, 2),
(8504, 18, 1487, 2),
(8505, 19, 1487, 2),
(8506, 20, 1487, 2),
(8507, 5, 1488, 1),
(8508, 12, 1489, 1),
(8509, 5, 1489, 1),
(8510, 12, 1490, 1),
(8511, 16, 1491, 2),
(8512, 5, 1492, 1),
(8513, 16, 1493, 1),
(8514, 7, 1494, 1),
(8515, 12, 1495, 1),
(8516, 5, 1495, 1),
(8517, 16, 1495, 1),
(8518, 17, 1495, 1),
(8519, 12, 1496, 1),
(8520, 1, 1497, 8),
(8521, 2, 1497, 8),
(8522, 3, 1497, 8),
(8523, 4, 1497, 8),
(8524, 5, 1497, 8),
(8525, 7, 1497, 8),
(8526, 6, 1497, 8),
(8527, 8, 1497, 8),
(8528, 9, 1497, 8),
(8529, 10, 1497, 8),
(8531, 12, 1497, 8),
(8532, 13, 1497, 8),
(8533, 14, 1497, 8),
(8534, 15, 1497, 8),
(8535, 21, 1497, 8),
(8536, 16, 1497, 8),
(8537, 17, 1497, 8),
(8538, 18, 1497, 8),
(8539, 19, 1497, 8),
(8540, 20, 1497, 8),
(8541, 5, 1498, 0),
(8542, 9, 1498, 0),
(8543, 5, 1499, 0),
(8544, 9, 1499, 0),
(8545, 12, 1499, 0),
(8546, 16, 1500, 2),
(8547, 17, 1500, 2),
(8548, 18, 1500, 2),
(8549, 3, 1500, 2),
(8550, 2, 1500, 2),
(8551, 12, 1500, 2),
(8552, 19, 1500, 2),
(8553, 5, 1500, 2),
(8554, 1, 1501, 1),
(8555, 2, 1501, 1),
(8556, 3, 1501, 1),
(8557, 4, 1501, 1),
(8558, 5, 1501, 1),
(8559, 7, 1501, 1),
(8560, 6, 1501, 1),
(8561, 8, 1501, 1),
(8562, 9, 1501, 1),
(8563, 10, 1501, 1),
(8565, 12, 1501, 1),
(8566, 13, 1501, 1),
(8567, 14, 1501, 1),
(8568, 15, 1501, 1),
(8569, 21, 1501, 1),
(8570, 16, 1501, 1),
(8571, 17, 1501, 1),
(8572, 18, 1501, 1),
(8573, 19, 1501, 1),
(8574, 20, 1501, 1),
(8575, 16, 1502, 1),
(8576, 17, 1502, 1),
(8577, 3, 1502, 1),
(8578, 16, 1503, 1),
(8579, 17, 1503, 1),
(8580, 3, 1503, 1),
(8581, 16, 1504, 1),
(8582, 17, 1504, 1),
(8583, 3, 1504, 1),
(8584, 16, 1505, 1),
(8585, 17, 1505, 1),
(8586, 3, 1505, 1),
(8587, 13, 1506, 3),
(8588, 12, 1507, 1),
(8589, 5, 1508, 1),
(8590, 7, 1509, 1),
(8591, 3, 1510, 1),
(8592, 12, 1511, 1),
(8593, 12, 1512, 1),
(8594, 9, 1513, 1),
(8595, 19, 1513, 1),
(8596, 9, 1514, 1),
(8597, 19, 1514, 1),
(8598, 1, 1515, 1),
(8599, 2, 1515, 1),
(8600, 3, 1515, 1),
(8601, 4, 1515, 1),
(8602, 5, 1515, 1),
(8603, 7, 1515, 1),
(8604, 6, 1515, 1),
(8605, 8, 1515, 1),
(8606, 9, 1515, 1),
(8607, 10, 1515, 1),
(8609, 12, 1515, 1),
(8610, 13, 1515, 1),
(8611, 14, 1515, 1),
(8612, 15, 1515, 1),
(8613, 21, 1515, 1),
(8614, 16, 1515, 1),
(8615, 17, 1515, 1),
(8616, 18, 1515, 1),
(8617, 19, 1515, 1),
(8618, 20, 1515, 1),
(8619, 12, 1516, 1),
(8620, 12, 1517, 1),
(8621, 12, 1518, 1),
(8622, 17, 1519, 2),
(8623, 16, 1519, 2),
(8624, 7, 1519, 2),
(8625, 4, 1519, 2),
(8627, 10, 1519, 2),
(8628, 2, 1519, 3),
(8629, 6, 1519, 3),
(8630, 3, 1519, 3),
(8631, 12, 1519, 3),
(8632, 9, 1519, 3),
(8633, 5, 1519, 3),
(8634, 2, 1520, 2),
(8635, 12, 1520, 2),
(8636, 3, 1520, 2),
(8637, 2, 1521, 2),
(8638, 12, 1521, 2),
(8639, 3, 1521, 2),
(8640, 12, 1522, 1),
(8641, 2, 1522, 1),
(8642, 1, 1522, 1),
(8643, 6, 1523, 1),
(8644, 3, 1523, 1),
(8645, 12, 1524, 1),
(8646, 5, 1525, 2),
(8647, 12, 1525, 2),
(8648, 3, 1525, 2),
(8649, 4, 1525, 2),
(8650, 21, 1525, 2),
(8651, 1, 1526, 1),
(8652, 2, 1526, 1),
(8653, 3, 1526, 1),
(8654, 4, 1526, 1),
(8655, 5, 1526, 1),
(8656, 7, 1526, 1),
(8657, 6, 1526, 1),
(8658, 8, 1526, 1),
(8659, 9, 1526, 1),
(8660, 10, 1526, 1),
(8662, 12, 1526, 1),
(8663, 13, 1526, 1),
(8664, 14, 1526, 1),
(8665, 15, 1526, 1),
(8666, 21, 1526, 1),
(8667, 16, 1526, 1),
(8668, 17, 1526, 1),
(8669, 18, 1526, 1),
(8670, 19, 1526, 1),
(8671, 20, 1526, 1),
(8672, 13, 1527, 1),
(8673, 1, 1528, 8),
(8674, 2, 1528, 8),
(8675, 3, 1528, 8),
(8676, 4, 1528, 8),
(8677, 5, 1528, 8),
(8678, 7, 1528, 8),
(8679, 6, 1528, 8),
(8680, 8, 1528, 8),
(8681, 9, 1528, 8),
(8682, 10, 1528, 8),
(8684, 12, 1528, 8),
(8685, 13, 1528, 8),
(8686, 14, 1528, 8),
(8687, 15, 1528, 8),
(8688, 21, 1528, 8),
(8689, 16, 1528, 8),
(8690, 17, 1528, 8),
(8691, 18, 1528, 8),
(8692, 19, 1528, 8),
(8693, 20, 1528, 8),
(8694, 1, 1529, 8),
(8695, 2, 1529, 8),
(8696, 3, 1529, 8),
(8697, 4, 1529, 8),
(8698, 5, 1529, 8),
(8699, 7, 1529, 8),
(8700, 6, 1529, 8),
(8701, 8, 1529, 8),
(8702, 9, 1529, 8),
(8703, 10, 1529, 8),
(8705, 12, 1529, 8),
(8706, 13, 1529, 8),
(8707, 14, 1529, 8),
(8708, 15, 1529, 8),
(8709, 21, 1529, 8),
(8710, 16, 1529, 8),
(8711, 17, 1529, 8),
(8712, 18, 1529, 8),
(8713, 19, 1529, 8),
(8714, 20, 1529, 8),
(8715, 5, 1530, 1),
(8716, 5, 1531, 1),
(8717, 4, 1531, 1),
(8718, 5, 1532, 1),
(8719, 12, 1533, 1),
(8720, 5, 1533, 1),
(8721, 8, 1533, 2),
(8722, 16, 1534, 1),
(8723, 17, 1534, 1),
(8724, 3, 1534, 1),
(8725, 16, 1535, 1),
(8726, 17, 1535, 1),
(8727, 3, 1535, 1),
(8728, 12, 1536, 1),
(8729, 19, 1537, 1),
(8730, 18, 1537, 1),
(8731, 16, 1538, 1),
(8732, 17, 1538, 1),
(8733, 5, 1539, 1),
(8734, 5, 1540, 2),
(8735, 16, 1540, 2),
(8736, 17, 1540, 2),
(8737, 12, 1540, 2),
(8738, 5, 1541, 2),
(8739, 16, 1542, 1),
(8740, 12, 1543, 1),
(8741, 19, 1543, 1),
(8742, 17, 1543, 1),
(8743, 9, 1543, 1),
(8744, 12, 1544, 1),
(8745, 9, 1544, 1),
(8746, 16, 1545, 1),
(8747, 19, 1546, 1),
(8748, 9, 1546, 1),
(8749, 19, 1547, 1),
(8750, 9, 1547, 1),
(8751, 4, 1547, 1),
(8752, 2, 1547, 1),
(8753, 5, 1547, 1),
(8754, 16, 1547, 1),
(8755, 17, 1547, 1),
(8756, 5, 1548, 1),
(8757, 5, 1549, 1),
(8758, 5, 1550, 1),
(8759, 12, 1551, 1),
(8760, 12, 1552, 1),
(8761, 20, 1552, 2),
(8762, 5, 1552, 2),
(8763, 19, 1553, 1),
(8764, 18, 1553, 1),
(8765, 12, 1554, 1),
(8766, 16, 1555, 1),
(8767, 16, 1556, 1),
(8768, 1, 1557, 2),
(8769, 2, 1557, 2),
(8770, 3, 1557, 2),
(8771, 4, 1557, 2),
(8772, 5, 1557, 2),
(8773, 7, 1557, 2),
(8774, 6, 1557, 2),
(8775, 8, 1557, 2),
(8776, 9, 1557, 2),
(8777, 10, 1557, 2),
(8779, 12, 1557, 2),
(8780, 13, 1557, 2),
(8781, 14, 1557, 2),
(8782, 15, 1557, 2),
(8783, 21, 1557, 2),
(8784, 16, 1557, 2),
(8785, 17, 1557, 2),
(8786, 18, 1557, 2),
(8787, 19, 1557, 2),
(8788, 20, 1557, 2),
(8789, 5, 1558, 1),
(8790, 19, 1559, 1),
(8791, 19, 1560, 1),
(8792, 19, 1561, 1),
(8793, 19, 1562, 1),
(8794, 5, 1563, 1),
(8795, 12, 1563, 1),
(8796, 1, 1563, 2),
(8797, 2, 1563, 2),
(8798, 3, 1563, 2),
(8799, 4, 1563, 2),
(8800, 7, 1563, 2),
(8801, 6, 1563, 2),
(8802, 8, 1563, 2),
(8803, 9, 1563, 2),
(8804, 10, 1563, 2),
(8806, 13, 1563, 2),
(8807, 14, 1563, 2),
(8808, 15, 1563, 2),
(8809, 21, 1563, 2),
(8810, 16, 1563, 2),
(8811, 17, 1563, 2),
(8812, 18, 1563, 2),
(8813, 19, 1563, 2),
(8814, 20, 1563, 2),
(8815, 5, 1564, 1),
(8816, 5, 1565, 1),
(8817, 4, 1566, 1),
(8818, 5, 1567, 2),
(8819, 5, 1568, 2),
(8820, 13, 1569, 1),
(8821, 5, 1570, 1),
(8822, 12, 1570, 1),
(8823, 21, 1570, 1),
(8824, 1, 1570, 2),
(8825, 2, 1570, 2),
(8826, 3, 1570, 2),
(8827, 4, 1570, 2),
(8828, 7, 1570, 2),
(8829, 6, 1570, 2),
(8830, 8, 1570, 2),
(8831, 9, 1570, 2),
(8832, 10, 1570, 2),
(8834, 13, 1570, 2),
(8835, 14, 1570, 2),
(8836, 15, 1570, 2),
(8837, 16, 1570, 2),
(8838, 17, 1570, 2),
(8839, 18, 1570, 2),
(8840, 19, 1570, 2),
(8841, 20, 1570, 2),
(8842, 5, 1571, 1),
(8843, 12, 1571, 1),
(8844, 1, 1571, 2),
(8845, 2, 1571, 2),
(8846, 3, 1571, 2),
(8847, 4, 1571, 2),
(8848, 7, 1571, 2),
(8849, 6, 1571, 2),
(8850, 8, 1571, 2),
(8851, 9, 1571, 2),
(8852, 10, 1571, 2),
(8854, 13, 1571, 2),
(8855, 14, 1571, 2),
(8856, 15, 1571, 2),
(8857, 21, 1571, 2),
(8858, 16, 1571, 2),
(8859, 17, 1571, 2),
(8860, 18, 1571, 2),
(8861, 19, 1571, 2),
(8862, 20, 1571, 2),
(8863, 5, 1572, 1),
(8864, 12, 1572, 1),
(8865, 1, 1572, 2),
(8866, 2, 1572, 2),
(8867, 3, 1572, 2),
(8868, 4, 1572, 2),
(8869, 7, 1572, 2),
(8870, 6, 1572, 2),
(8871, 8, 1572, 2),
(8872, 9, 1572, 2),
(8873, 10, 1572, 2),
(8875, 13, 1572, 2),
(8876, 14, 1572, 2),
(8877, 15, 1572, 2),
(8878, 21, 1572, 2),
(8879, 16, 1572, 2),
(8880, 17, 1572, 2),
(8881, 18, 1572, 2),
(8882, 19, 1572, 2),
(8883, 20, 1572, 2),
(8884, 13, 1573, 1),
(8885, 5, 1574, 1),
(8886, 12, 1574, 1),
(8887, 1, 1574, 2),
(8888, 2, 1574, 2),
(8889, 3, 1574, 2),
(8890, 4, 1574, 2),
(8891, 7, 1574, 2),
(8892, 6, 1574, 2),
(8893, 8, 1574, 2),
(8894, 9, 1574, 2),
(8895, 10, 1574, 2),
(8897, 13, 1574, 2),
(8898, 14, 1574, 2),
(8899, 15, 1574, 2),
(8900, 21, 1574, 2),
(8901, 16, 1574, 2),
(8902, 17, 1574, 2),
(8903, 18, 1574, 2),
(8904, 19, 1574, 2),
(8905, 20, 1574, 2),
(8906, 5, 1575, 1),
(8907, 12, 1575, 1),
(8908, 1, 1575, 2),
(8909, 2, 1575, 2),
(8910, 3, 1575, 2),
(8911, 4, 1575, 2),
(8912, 7, 1575, 2),
(8913, 6, 1575, 2),
(8914, 8, 1575, 2),
(8915, 9, 1575, 2),
(8916, 10, 1575, 2),
(8918, 13, 1575, 2),
(8919, 14, 1575, 2),
(8920, 15, 1575, 2),
(8921, 21, 1575, 2),
(8922, 16, 1575, 2),
(8923, 17, 1575, 2),
(8924, 18, 1575, 2),
(8925, 19, 1575, 2),
(8926, 20, 1575, 2),
(8927, 5, 1576, 1),
(8928, 12, 1576, 1),
(8929, 1, 1576, 2),
(8930, 2, 1576, 2),
(8931, 3, 1576, 2),
(8932, 4, 1576, 2),
(8933, 7, 1576, 2),
(8934, 6, 1576, 2),
(8935, 8, 1576, 2),
(8936, 9, 1576, 2),
(8937, 10, 1576, 2),
(8939, 13, 1576, 2),
(8940, 14, 1576, 2),
(8941, 15, 1576, 2),
(8942, 21, 1576, 2),
(8943, 16, 1576, 2),
(8944, 17, 1576, 2),
(8945, 18, 1576, 2),
(8946, 19, 1576, 2),
(8947, 20, 1576, 2),
(8948, 13, 1577, 0),
(8949, 13, 1578, 0),
(8950, 13, 1579, 0),
(8951, 12, 1580, 1),
(8952, 16, 1580, 1),
(8953, 17, 1580, 1),
(8954, 19, 1580, 1),
(8955, 9, 1580, 1),
(8956, 1, 1580, 5),
(8957, 2, 1580, 5),
(8958, 3, 1580, 5),
(8959, 4, 1580, 5),
(8960, 5, 1580, 5),
(8961, 7, 1580, 5),
(8962, 6, 1580, 5),
(8963, 8, 1580, 5),
(8964, 10, 1580, 5),
(8966, 13, 1580, 5),
(8967, 14, 1580, 5),
(8968, 15, 1580, 5),
(8969, 21, 1580, 5),
(8970, 18, 1580, 5),
(8971, 20, 1580, 5),
(8972, 3, 1581, 1),
(8973, 6, 1581, 1),
(8974, 3, 1582, 1),
(8975, 5, 1583, 1),
(8976, 5, 1584, 1),
(8977, 5, 1585, 1),
(8978, 5, 1586, 1),
(8979, 12, 1587, 1),
(8980, 19, 1587, 1),
(8981, 9, 1587, 1),
(8982, 16, 1587, 1),
(8983, 17, 1587, 1),
(8984, 1, 1587, 5),
(8985, 2, 1587, 5),
(8986, 3, 1587, 5),
(8987, 4, 1587, 5),
(8988, 5, 1587, 5),
(8989, 7, 1587, 5),
(8990, 6, 1587, 5),
(8991, 8, 1587, 5),
(8992, 10, 1587, 5),
(8994, 13, 1587, 5),
(8995, 14, 1587, 5),
(8996, 15, 1587, 5),
(8997, 21, 1587, 5),
(8998, 18, 1587, 5),
(8999, 20, 1587, 5),
(9000, 12, 1588, 1),
(9001, 1, 1588, 5),
(9002, 2, 1588, 5),
(9003, 3, 1588, 5),
(9004, 4, 1588, 5),
(9005, 5, 1588, 5),
(9006, 7, 1588, 5),
(9007, 6, 1588, 5),
(9008, 8, 1588, 5),
(9009, 9, 1588, 5),
(9010, 10, 1588, 5),
(9012, 13, 1588, 5),
(9013, 14, 1588, 5),
(9014, 15, 1588, 5),
(9015, 21, 1588, 5),
(9016, 16, 1588, 5),
(9017, 17, 1588, 5),
(9018, 18, 1588, 5),
(9019, 19, 1588, 5),
(9020, 20, 1588, 5),
(9021, 12, 1589, 1),
(9022, 19, 1589, 1),
(9023, 9, 1589, 1),
(9024, 16, 1589, 1),
(9025, 17, 1589, 1),
(9026, 1, 1589, 5),
(9027, 2, 1589, 5),
(9028, 3, 1589, 5),
(9029, 4, 1589, 5),
(9030, 5, 1589, 5),
(9031, 7, 1589, 5),
(9032, 6, 1589, 5),
(9033, 8, 1589, 5),
(9034, 10, 1589, 5),
(9036, 13, 1589, 5),
(9037, 14, 1589, 5),
(9038, 15, 1589, 5),
(9039, 21, 1589, 5),
(9040, 18, 1589, 5),
(9041, 20, 1589, 5),
(9042, 12, 1590, 1),
(9043, 19, 1590, 1),
(9044, 9, 1590, 1),
(9045, 16, 1590, 1),
(9046, 17, 1590, 1),
(9047, 1, 1590, 2),
(9048, 2, 1590, 2),
(9049, 3, 1590, 2),
(9050, 4, 1590, 2),
(9051, 5, 1590, 2),
(9052, 7, 1590, 2),
(9053, 6, 1590, 2),
(9054, 8, 1590, 2),
(9055, 10, 1590, 2),
(9057, 13, 1590, 2),
(9058, 14, 1590, 2),
(9059, 15, 1590, 2),
(9060, 21, 1590, 2),
(9061, 18, 1590, 2),
(9062, 20, 1590, 2),
(9063, 12, 1591, 1),
(9064, 19, 1591, 1),
(9065, 9, 1591, 1),
(9066, 16, 1591, 1),
(9067, 17, 1591, 1),
(9068, 1, 1591, 2),
(9069, 2, 1591, 2),
(9070, 3, 1591, 2),
(9071, 4, 1591, 2),
(9072, 5, 1591, 2),
(9073, 7, 1591, 2),
(9074, 6, 1591, 2),
(9075, 8, 1591, 2),
(9076, 10, 1591, 2),
(9078, 13, 1591, 2),
(9079, 14, 1591, 2),
(9080, 15, 1591, 2),
(9081, 21, 1591, 2),
(9082, 18, 1591, 2),
(9083, 20, 1591, 2),
(9084, 12, 1592, 1),
(9085, 19, 1592, 1),
(9086, 9, 1592, 1),
(9087, 16, 1592, 1),
(9088, 17, 1592, 1),
(9089, 1, 1592, 2),
(9090, 2, 1592, 2),
(9091, 3, 1592, 2),
(9092, 4, 1592, 2),
(9093, 5, 1592, 2),
(9094, 7, 1592, 2),
(9095, 6, 1592, 2),
(9096, 8, 1592, 2),
(9097, 10, 1592, 2),
(9099, 13, 1592, 2),
(9100, 14, 1592, 2),
(9101, 15, 1592, 2),
(9102, 21, 1592, 2),
(9103, 18, 1592, 2),
(9104, 20, 1592, 2),
(9105, 12, 1593, 1),
(9106, 19, 1593, 1),
(9107, 9, 1593, 1),
(9108, 16, 1593, 1),
(9109, 17, 1593, 1),
(9110, 1, 1593, 5),
(9111, 2, 1593, 5),
(9112, 3, 1593, 5),
(9113, 4, 1593, 5),
(9114, 5, 1593, 5),
(9115, 7, 1593, 5),
(9116, 6, 1593, 5),
(9117, 8, 1593, 5),
(9118, 10, 1593, 5),
(9120, 13, 1593, 5),
(9121, 14, 1593, 5),
(9122, 15, 1593, 5),
(9123, 21, 1593, 5),
(9124, 18, 1593, 5),
(9125, 20, 1593, 5),
(9126, 12, 1594, 1),
(9127, 19, 1594, 1),
(9128, 9, 1594, 1),
(9129, 16, 1594, 1),
(9130, 17, 1594, 1),
(9131, 1, 1594, 5),
(9132, 2, 1594, 5),
(9133, 3, 1594, 5),
(9134, 4, 1594, 5),
(9135, 5, 1594, 5),
(9136, 7, 1594, 5),
(9137, 6, 1594, 5),
(9138, 8, 1594, 5),
(9139, 10, 1594, 5),
(9141, 13, 1594, 5),
(9142, 14, 1594, 5),
(9143, 15, 1594, 5),
(9144, 21, 1594, 5),
(9145, 18, 1594, 5),
(9146, 20, 1594, 5),
(9147, 12, 1595, 1),
(9148, 19, 1595, 1),
(9149, 9, 1595, 1),
(9150, 16, 1595, 1),
(9151, 17, 1595, 1),
(9152, 1, 1595, 5),
(9153, 2, 1595, 5),
(9154, 3, 1595, 5),
(9155, 4, 1595, 5),
(9156, 5, 1595, 5),
(9157, 7, 1595, 5),
(9158, 6, 1595, 5),
(9159, 8, 1595, 5),
(9160, 10, 1595, 5),
(9162, 13, 1595, 5),
(9163, 14, 1595, 5),
(9164, 15, 1595, 5),
(9165, 21, 1595, 5),
(9166, 18, 1595, 5),
(9167, 20, 1595, 5),
(9169, 12, 1597, 1),
(9170, 2, 1598, 1),
(9171, 12, 1599, 1),
(9172, 12, 1600, 1),
(9173, 2, 1600, 1),
(9174, 10, 1600, 1),
(9176, 20, 1601, 1),
(9177, 15, 1601, 1),
(9178, 7, 1601, 1),
(9180, 10, 1602, 1),
(9181, 12, 1603, 1),
(9182, 2, 1604, 1),
(9183, 12, 1604, 1),
(9184, 19, 1605, 1),
(9185, 16, 1605, 1),
(9186, 17, 1605, 1),
(9187, 1, 1605, 3),
(9188, 2, 1605, 3),
(9189, 3, 1605, 3),
(9190, 4, 1605, 3),
(9191, 5, 1605, 3),
(9192, 7, 1605, 3),
(9193, 6, 1605, 3),
(9194, 8, 1605, 3),
(9195, 9, 1605, 3),
(9196, 10, 1605, 3),
(9198, 12, 1605, 3),
(9199, 13, 1605, 3),
(9200, 14, 1605, 3),
(9201, 15, 1605, 3),
(9202, 21, 1605, 3),
(9203, 18, 1605, 3),
(9204, 20, 1605, 3),
(9205, 12, 1606, 1),
(9206, 19, 1606, 1),
(9207, 9, 1606, 1),
(9208, 16, 1606, 1),
(9209, 17, 1606, 1),
(9210, 1, 1606, 5),
(9211, 2, 1606, 5),
(9212, 3, 1606, 5),
(9213, 4, 1606, 5),
(9214, 5, 1606, 5),
(9215, 7, 1606, 5),
(9216, 6, 1606, 5),
(9217, 8, 1606, 5),
(9218, 10, 1606, 5),
(9220, 13, 1606, 5),
(9221, 14, 1606, 5),
(9222, 15, 1606, 5),
(9223, 21, 1606, 5),
(9224, 18, 1606, 5),
(9225, 20, 1606, 5),
(9226, 12, 1607, 1),
(9227, 19, 1607, 1),
(9228, 9, 1607, 1),
(9229, 16, 1607, 1),
(9230, 17, 1607, 1),
(9231, 1, 1607, 5),
(9232, 2, 1607, 5),
(9233, 3, 1607, 5),
(9234, 4, 1607, 5),
(9235, 5, 1607, 5),
(9236, 7, 1607, 5),
(9237, 6, 1607, 5),
(9238, 8, 1607, 5),
(9239, 10, 1607, 5),
(9241, 13, 1607, 5),
(9242, 14, 1607, 5),
(9243, 15, 1607, 5),
(9244, 21, 1607, 5),
(9245, 18, 1607, 5),
(9246, 20, 1607, 5),
(9247, 12, 1608, 1),
(9248, 19, 1608, 1),
(9249, 9, 1608, 1),
(9250, 16, 1608, 1),
(9251, 17, 1608, 1),
(9252, 1, 1608, 5),
(9253, 2, 1608, 5),
(9254, 3, 1608, 5),
(9255, 4, 1608, 5),
(9256, 5, 1608, 5),
(9257, 7, 1608, 5),
(9258, 6, 1608, 5),
(9259, 8, 1608, 5),
(9260, 10, 1608, 5),
(9262, 13, 1608, 5),
(9263, 14, 1608, 5),
(9264, 15, 1608, 5),
(9265, 21, 1608, 5),
(9266, 18, 1608, 5),
(9267, 20, 1608, 5),
(9268, 3, 1609, 1),
(9269, 5, 1609, 1),
(9270, 16, 1609, 2),
(9271, 17, 1609, 2),
(9272, 4, 1610, 1),
(9273, 7, 1610, 1),
(9274, 1, 1610, 3),
(9275, 2, 1610, 3),
(9276, 3, 1610, 3),
(9277, 5, 1610, 3),
(9278, 6, 1610, 3),
(9279, 8, 1610, 3),
(9280, 9, 1610, 3),
(9281, 10, 1610, 3),
(9283, 12, 1610, 3),
(9284, 13, 1610, 3),
(9285, 14, 1610, 3),
(9286, 15, 1610, 3),
(9287, 21, 1610, 3),
(9288, 16, 1610, 3),
(9289, 17, 1610, 3),
(9290, 18, 1610, 3),
(9291, 19, 1610, 3),
(9292, 20, 1610, 3),
(9293, 4, 1611, 1),
(9294, 7, 1611, 1),
(9295, 1, 1611, 3),
(9296, 2, 1611, 3),
(9297, 3, 1611, 3),
(9298, 5, 1611, 3),
(9299, 6, 1611, 3),
(9300, 8, 1611, 3),
(9301, 9, 1611, 3),
(9302, 10, 1611, 3),
(9304, 12, 1611, 3),
(9305, 13, 1611, 3),
(9306, 14, 1611, 3),
(9307, 15, 1611, 3),
(9308, 21, 1611, 3),
(9309, 16, 1611, 3),
(9310, 17, 1611, 3),
(9311, 18, 1611, 3),
(9312, 19, 1611, 3),
(9313, 20, 1611, 3),
(9314, 4, 1612, 1),
(9315, 7, 1612, 1),
(9316, 1, 1612, 3),
(9317, 2, 1612, 3),
(9318, 3, 1612, 3),
(9319, 5, 1612, 3),
(9320, 6, 1612, 3),
(9321, 8, 1612, 3),
(9322, 9, 1612, 3),
(9323, 10, 1612, 3),
(9325, 12, 1612, 3),
(9326, 13, 1612, 3),
(9327, 14, 1612, 3),
(9328, 15, 1612, 3),
(9329, 21, 1612, 3),
(9330, 16, 1612, 3),
(9331, 17, 1612, 3),
(9332, 18, 1612, 3),
(9333, 19, 1612, 3),
(9334, 20, 1612, 3),
(9335, 16, 1613, 1),
(9336, 17, 1613, 1),
(9337, 19, 1613, 1),
(9338, 12, 1613, 3),
(9339, 12, 1614, 1),
(9340, 16, 1614, 1),
(9341, 17, 1614, 1),
(9342, 1, 1614, 5),
(9343, 2, 1614, 5),
(9344, 3, 1614, 5),
(9345, 4, 1614, 5),
(9346, 5, 1614, 5),
(9347, 7, 1614, 5),
(9348, 6, 1614, 5),
(9349, 8, 1614, 5),
(9350, 9, 1614, 5),
(9351, 10, 1614, 5),
(9353, 13, 1614, 5),
(9354, 14, 1614, 5),
(9355, 15, 1614, 5),
(9356, 21, 1614, 5),
(9357, 18, 1614, 5),
(9358, 19, 1614, 5),
(9359, 20, 1614, 5),
(9360, 18, 1615, 1),
(9361, 12, 1616, 1),
(9362, 16, 1616, 1),
(9363, 17, 1616, 1),
(9364, 19, 1616, 1),
(9365, 1, 1616, 5),
(9366, 2, 1616, 5),
(9367, 3, 1616, 5),
(9368, 4, 1616, 5),
(9369, 5, 1616, 5),
(9370, 7, 1616, 5),
(9371, 6, 1616, 5),
(9372, 8, 1616, 5),
(9373, 9, 1616, 5),
(9374, 10, 1616, 5),
(9376, 13, 1616, 5),
(9377, 14, 1616, 5),
(9378, 15, 1616, 5),
(9379, 21, 1616, 5),
(9380, 18, 1616, 5),
(9381, 20, 1616, 5),
(9382, 16, 1617, 1),
(9383, 17, 1617, 1),
(9384, 19, 1618, 1),
(9385, 2, 1620, 3),
(9386, 2, 1621, 1),
(9387, 12, 1622, 1),
(9388, 5, 1622, 1),
(9389, 2, 1622, 1),
(9390, 13, 1622, 1),
(9391, 1, 1622, 5),
(9392, 3, 1622, 5),
(9393, 4, 1622, 5),
(9394, 7, 1622, 5),
(9395, 6, 1622, 5),
(9396, 8, 1622, 5),
(9397, 9, 1622, 5),
(9398, 10, 1622, 5),
(9400, 14, 1622, 5),
(9401, 15, 1622, 5),
(9402, 21, 1622, 5),
(9403, 16, 1622, 5),
(9404, 17, 1622, 5),
(9405, 18, 1622, 5),
(9406, 19, 1622, 5),
(9407, 20, 1622, 5),
(9408, 5, 1623, 1),
(9409, 5, 1624, 1),
(9410, 21, 1624, 1),
(9411, 12, 1625, 1),
(9412, 9, 1625, 1),
(9413, 1, 1625, 5),
(9414, 2, 1625, 5),
(9415, 3, 1625, 5),
(9416, 4, 1625, 5),
(9417, 5, 1625, 5),
(9418, 7, 1625, 5),
(9419, 6, 1625, 5),
(9420, 8, 1625, 5),
(9421, 10, 1625, 5),
(9423, 13, 1625, 5),
(9424, 14, 1625, 5),
(9425, 15, 1625, 5),
(9426, 21, 1625, 5),
(9427, 16, 1625, 5),
(9428, 17, 1625, 5),
(9429, 18, 1625, 5),
(9430, 19, 1625, 5),
(9431, 20, 1625, 5),
(9432, 12, 1626, 1),
(9433, 9, 1626, 1),
(9434, 1, 1626, 5),
(9435, 2, 1626, 5),
(9436, 3, 1626, 5),
(9437, 4, 1626, 5),
(9438, 5, 1626, 5),
(9439, 7, 1626, 5),
(9440, 6, 1626, 5),
(9441, 8, 1626, 5),
(9442, 10, 1626, 5),
(9444, 13, 1626, 5),
(9445, 14, 1626, 5),
(9446, 15, 1626, 5),
(9447, 21, 1626, 5),
(9448, 16, 1626, 5),
(9449, 17, 1626, 5),
(9450, 18, 1626, 5),
(9451, 19, 1626, 5),
(9452, 20, 1626, 5),
(9453, 7, 1627, 1),
(9454, 4, 1627, 1),
(9455, 6, 1628, 5),
(9456, 7, 1629, 5),
(9457, 12, 1630, 1),
(9458, 1, 1630, 5),
(9459, 2, 1630, 5),
(9460, 3, 1630, 5),
(9461, 4, 1630, 5),
(9462, 5, 1630, 5),
(9463, 7, 1630, 5),
(9464, 6, 1630, 5),
(9465, 8, 1630, 5),
(9466, 9, 1630, 5),
(9467, 10, 1630, 5),
(9469, 13, 1630, 5),
(9470, 14, 1630, 5),
(9471, 15, 1630, 5),
(9472, 21, 1630, 5),
(9473, 16, 1630, 5),
(9474, 17, 1630, 5),
(9475, 18, 1630, 5),
(9476, 19, 1630, 5),
(9477, 20, 1630, 5),
(9478, 12, 1631, 1),
(9479, 12, 1632, 1),
(9480, 12, 1634, 3),
(9481, 13, 1635, 1),
(9482, 13, 1636, 1),
(9483, 13, 1637, 1),
(9484, 13, 1638, 1),
(9485, 18, 1638, 1),
(9486, 9, 1638, 1),
(9487, 5, 1638, 1),
(9488, 4, 1638, 1),
(9489, 3, 1638, 1),
(9490, 19, 1638, 1),
(9491, 14, 1638, 1),
(9492, 12, 1638, 1),
(9493, 15, 1638, 1),
(9494, 2, 1638, 1),
(9495, 21, 1638, 1),
(9496, 8, 1638, 3),
(9497, 1, 1639, 1),
(9498, 2, 1639, 1),
(9499, 3, 1639, 1),
(9500, 4, 1639, 1),
(9501, 5, 1639, 1),
(9502, 7, 1639, 1),
(9503, 6, 1639, 1),
(9504, 8, 1639, 1),
(9505, 9, 1639, 1),
(9506, 10, 1639, 1),
(9508, 12, 1639, 1),
(9509, 13, 1639, 1),
(9510, 14, 1639, 1),
(9511, 15, 1639, 1),
(9512, 21, 1639, 1),
(9513, 16, 1639, 1),
(9514, 17, 1639, 1),
(9515, 18, 1639, 1),
(9516, 19, 1639, 1),
(9517, 20, 1639, 1),
(9518, 1, 1640, 1),
(9519, 2, 1640, 1),
(9520, 3, 1640, 1),
(9521, 4, 1640, 1),
(9522, 5, 1640, 1),
(9523, 7, 1640, 1),
(9524, 6, 1640, 1),
(9525, 8, 1640, 1),
(9526, 9, 1640, 1),
(9527, 10, 1640, 1),
(9529, 12, 1640, 1),
(9530, 13, 1640, 1),
(9531, 14, 1640, 1),
(9532, 15, 1640, 1),
(9533, 21, 1640, 1),
(9534, 16, 1640, 1),
(9535, 17, 1640, 1),
(9536, 18, 1640, 1),
(9537, 19, 1640, 1),
(9538, 20, 1640, 1),
(9539, 1, 1641, 1),
(9540, 2, 1641, 1),
(9541, 3, 1641, 1),
(9542, 4, 1641, 1),
(9543, 5, 1641, 1),
(9544, 7, 1641, 1),
(9545, 6, 1641, 1),
(9546, 8, 1641, 1),
(9547, 9, 1641, 1),
(9548, 10, 1641, 1),
(9550, 12, 1641, 1),
(9551, 13, 1641, 1),
(9552, 14, 1641, 1),
(9553, 15, 1641, 1),
(9554, 21, 1641, 1),
(9555, 16, 1641, 1),
(9556, 17, 1641, 1),
(9557, 18, 1641, 1),
(9558, 19, 1641, 1),
(9559, 20, 1641, 1),
(9560, 13, 1642, 1),
(9561, 18, 1642, 1),
(9562, 19, 1642, 1),
(9563, 5, 1642, 1),
(9564, 14, 1642, 1),
(9565, 12, 1642, 1),
(9566, 15, 1642, 1),
(9567, 2, 1642, 1),
(9568, 21, 1642, 1),
(9569, 1, 1643, 1),
(9570, 2, 1643, 1),
(9571, 3, 1643, 1),
(9572, 4, 1643, 1),
(9573, 5, 1643, 1),
(9574, 7, 1643, 1),
(9575, 6, 1643, 1),
(9576, 8, 1643, 1),
(9577, 9, 1643, 1),
(9578, 10, 1643, 1),
(9580, 12, 1643, 1),
(9581, 13, 1643, 1),
(9582, 14, 1643, 1),
(9583, 15, 1643, 1),
(9584, 21, 1643, 1),
(9585, 16, 1643, 1),
(9586, 17, 1643, 1),
(9587, 18, 1643, 1),
(9588, 19, 1643, 1),
(9589, 20, 1643, 1),
(9590, 1, 1644, 1),
(9591, 2, 1644, 1),
(9592, 3, 1644, 1),
(9593, 4, 1644, 1),
(9594, 5, 1644, 1),
(9595, 7, 1644, 1),
(9596, 6, 1644, 1),
(9597, 8, 1644, 1),
(9598, 9, 1644, 1),
(9599, 10, 1644, 1),
(9601, 12, 1644, 1),
(9602, 13, 1644, 1),
(9603, 14, 1644, 1),
(9604, 15, 1644, 1),
(9605, 21, 1644, 1),
(9606, 16, 1644, 1),
(9607, 17, 1644, 1),
(9608, 18, 1644, 1),
(9609, 19, 1644, 1),
(9610, 20, 1644, 1),
(9611, 1, 1645, 1),
(9612, 2, 1645, 1),
(9613, 3, 1645, 1),
(9614, 4, 1645, 1),
(9615, 5, 1645, 1),
(9616, 7, 1645, 1),
(9617, 6, 1645, 1),
(9618, 8, 1645, 1),
(9619, 9, 1645, 1),
(9620, 10, 1645, 1),
(9622, 12, 1645, 1),
(9623, 13, 1645, 1),
(9624, 14, 1645, 1),
(9625, 15, 1645, 1),
(9626, 21, 1645, 1),
(9627, 16, 1645, 1),
(9628, 17, 1645, 1),
(9629, 18, 1645, 1),
(9630, 19, 1645, 1),
(9631, 20, 1645, 1),
(9632, 5, 1646, 1),
(9633, 18, 1646, 1),
(9634, 19, 1646, 1),
(9635, 5, 1647, 1),
(9636, 18, 1647, 1),
(9637, 15, 1648, 3),
(9638, 5, 1649, 1),
(9639, 12, 1649, 1),
(9640, 21, 1649, 1),
(9641, 1, 1649, 5),
(9642, 2, 1649, 5),
(9643, 3, 1649, 5),
(9644, 4, 1649, 5),
(9645, 7, 1649, 5),
(9646, 6, 1649, 5),
(9647, 8, 1649, 5),
(9648, 9, 1649, 5),
(9649, 10, 1649, 5),
(9651, 13, 1649, 5),
(9652, 14, 1649, 5),
(9653, 15, 1649, 5),
(9654, 16, 1649, 5),
(9655, 17, 1649, 5),
(9656, 18, 1649, 5),
(9657, 19, 1649, 5),
(9658, 20, 1649, 5),
(9659, 15, 1650, 1),
(9660, 21, 1651, 1),
(9661, 18, 1652, 1),
(9662, 18, 1653, 1),
(9663, 5, 1654, 1),
(9664, 1, 1655, 2),
(9665, 2, 1655, 2),
(9666, 3, 1655, 2),
(9667, 4, 1655, 2),
(9668, 5, 1655, 2),
(9669, 7, 1655, 2),
(9670, 6, 1655, 2),
(9671, 8, 1655, 2),
(9672, 9, 1655, 2),
(9673, 10, 1655, 2),
(9675, 12, 1655, 2),
(9676, 13, 1655, 2),
(9677, 14, 1655, 2),
(9678, 15, 1655, 2),
(9679, 21, 1655, 2),
(9680, 16, 1655, 2),
(9681, 17, 1655, 2),
(9682, 18, 1655, 2),
(9683, 19, 1655, 2),
(9684, 20, 1655, 2),
(9685, 1, 1656, 2),
(9686, 2, 1656, 2),
(9687, 3, 1656, 2),
(9688, 4, 1656, 2),
(9689, 5, 1656, 2),
(9690, 7, 1656, 2),
(9691, 6, 1656, 2),
(9692, 8, 1656, 2),
(9693, 9, 1656, 2),
(9694, 10, 1656, 2),
(9696, 12, 1656, 2),
(9697, 13, 1656, 2),
(9698, 14, 1656, 2),
(9699, 15, 1656, 2),
(9700, 21, 1656, 2),
(9701, 16, 1656, 2),
(9702, 17, 1656, 2),
(9703, 18, 1656, 2),
(9704, 19, 1656, 2),
(9705, 20, 1656, 2),
(9706, 1, 1657, 1),
(9707, 2, 1657, 1),
(9708, 3, 1657, 1),
(9709, 4, 1657, 1),
(9710, 5, 1657, 1),
(9711, 7, 1657, 1),
(9712, 6, 1657, 1),
(9713, 8, 1657, 1),
(9714, 9, 1657, 1),
(9715, 10, 1657, 1),
(9717, 12, 1657, 1),
(9718, 13, 1657, 1),
(9719, 14, 1657, 1),
(9720, 15, 1657, 1),
(9721, 21, 1657, 1),
(9722, 16, 1657, 1),
(9723, 17, 1657, 1),
(9724, 18, 1657, 1),
(9725, 19, 1657, 1),
(9726, 20, 1657, 1),
(9727, 1, 1658, 2),
(9728, 2, 1658, 2),
(9729, 3, 1658, 2),
(9730, 4, 1658, 2),
(9731, 5, 1658, 2),
(9732, 7, 1658, 2),
(9733, 6, 1658, 2),
(9734, 8, 1658, 2),
(9735, 9, 1658, 2),
(9736, 10, 1658, 2),
(9738, 12, 1658, 2),
(9739, 13, 1658, 2),
(9740, 14, 1658, 2),
(9741, 15, 1658, 2),
(9742, 21, 1658, 2),
(9743, 16, 1658, 2),
(9744, 17, 1658, 2),
(9745, 18, 1658, 2),
(9746, 19, 1658, 2),
(9747, 20, 1658, 2),
(9748, 1, 1659, 1),
(9749, 2, 1659, 1),
(9750, 3, 1659, 1),
(9751, 4, 1659, 1),
(9752, 5, 1659, 1),
(9753, 7, 1659, 1),
(9754, 6, 1659, 1),
(9755, 8, 1659, 1),
(9756, 9, 1659, 1),
(9757, 10, 1659, 1),
(9759, 12, 1659, 1),
(9760, 13, 1659, 1),
(9761, 14, 1659, 1),
(9762, 15, 1659, 1),
(9763, 21, 1659, 1),
(9764, 16, 1659, 1),
(9765, 17, 1659, 1),
(9766, 18, 1659, 1),
(9767, 19, 1659, 1),
(9768, 20, 1659, 1),
(9769, 1, 1660, 1),
(9770, 1, 1661, 1),
(9771, 2, 1661, 1),
(9772, 3, 1661, 1),
(9773, 4, 1661, 1),
(9774, 5, 1661, 1),
(9775, 7, 1661, 1),
(9776, 6, 1661, 1),
(9777, 8, 1661, 1),
(9778, 9, 1661, 1),
(9779, 10, 1661, 1),
(9781, 12, 1661, 1),
(9782, 13, 1661, 1),
(9783, 14, 1661, 1),
(9784, 15, 1661, 1),
(9785, 21, 1661, 1),
(9786, 16, 1661, 1),
(9787, 17, 1661, 1),
(9788, 18, 1661, 1),
(9789, 19, 1661, 1),
(9790, 20, 1661, 1),
(9791, 1, 1662, 1),
(9792, 2, 1662, 1),
(9793, 3, 1662, 1),
(9794, 4, 1662, 1),
(9795, 5, 1662, 1),
(9796, 7, 1662, 1),
(9797, 6, 1662, 1),
(9798, 8, 1662, 1),
(9799, 9, 1662, 1),
(9800, 10, 1662, 1),
(9802, 12, 1662, 1),
(9803, 13, 1662, 1),
(9804, 14, 1662, 1),
(9805, 15, 1662, 1),
(9806, 21, 1662, 1),
(9807, 16, 1662, 1),
(9808, 17, 1662, 1),
(9809, 18, 1662, 1),
(9810, 19, 1662, 1),
(9811, 20, 1662, 1),
(9812, 1, 1663, 1),
(9813, 2, 1663, 1),
(9814, 3, 1663, 1),
(9815, 4, 1663, 1),
(9816, 5, 1663, 1),
(9817, 7, 1663, 1),
(9818, 6, 1663, 1),
(9819, 8, 1663, 1),
(9820, 9, 1663, 1),
(9821, 10, 1663, 1),
(9823, 12, 1663, 1),
(9824, 13, 1663, 1),
(9825, 14, 1663, 1),
(9826, 15, 1663, 1),
(9827, 21, 1663, 1),
(9828, 16, 1663, 1),
(9829, 17, 1663, 1),
(9830, 18, 1663, 1),
(9831, 19, 1663, 1),
(9832, 20, 1663, 1),
(9833, 2, 1664, 1),
(9834, 22, 1445, 3),
(9835, 22, 1459, 1),
(9836, 22, 1460, 8),
(9837, 22, 1480, 2),
(9838, 22, 1487, 2),
(9839, 22, 1497, 8),
(9840, 22, 1501, 1),
(9841, 22, 1515, 1),
(9842, 22, 1526, 1),
(9843, 22, 1528, 8),
(9844, 22, 1529, 8),
(9845, 22, 1557, 2),
(9846, 22, 1563, 2),
(9847, 22, 1570, 2),
(9848, 22, 1571, 2),
(9849, 22, 1572, 2),
(9850, 22, 1574, 2),
(9851, 22, 1575, 2),
(9852, 22, 1576, 2),
(9853, 22, 1580, 5),
(9854, 22, 1587, 5),
(9855, 22, 1588, 5),
(9856, 22, 1589, 5),
(9857, 22, 1590, 2),
(9858, 22, 1591, 2),
(9859, 22, 1592, 2),
(9860, 22, 1593, 5),
(9861, 22, 1594, 5),
(9862, 22, 1595, 5),
(9863, 22, 1596, 1),
(9864, 22, 1602, 1),
(9865, 22, 1605, 3),
(9866, 22, 1606, 5),
(9867, 22, 1607, 5),
(9868, 22, 1608, 5),
(9869, 22, 1610, 3),
(9870, 22, 1611, 3),
(9871, 22, 1612, 3),
(9872, 22, 1614, 5),
(9873, 22, 1616, 5),
(9874, 22, 1622, 5),
(9875, 22, 1625, 5),
(9876, 22, 1626, 5),
(9877, 22, 1630, 5),
(9878, 22, 1639, 1),
(9879, 22, 1640, 1),
(9880, 22, 1641, 1),
(9881, 22, 1643, 1),
(9882, 22, 1644, 1),
(9883, 22, 1645, 1),
(9884, 22, 1649, 5),
(9885, 22, 1655, 2),
(9886, 22, 1656, 2),
(9887, 22, 1657, 1),
(9888, 22, 1658, 2),
(9889, 22, 1659, 1),
(9890, 22, 1661, 1),
(9891, 22, 1662, 1),
(9892, 22, 1663, 1),
(9893, 2, 1609, 1),
(9894, 12, 1609, 1),
(9895, 6, 1609, 1);

-- --------------------------------------------------------

--
-- Structure de la table `website_aatype`
--

CREATE TABLE IF NOT EXISTS `website_aatype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `website_aatype`
--

INSERT INTO `website_aatype` (`id`, `name`) VALUES
(2, 'default'),
(3, 'Natural'),
(1, 'TODO');

-- --------------------------------------------------------

--
-- Structure de la table `website_analysemgf`
--

CREATE TABLE IF NOT EXISTS `website_analysemgf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `enzyme_id` int(11) DEFAULT NULL,
  `mgf` varchar(100) NOT NULL,
  `max_charge` int(11) NOT NULL,
  `error` double NOT NULL,
  `descriptif` longtext NOT NULL,
  `created` datetime NOT NULL,
  `ignore` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `owner_id` (`owner_id`,`name`),
  KEY `website_analysemgf_cb902d83` (`owner_id`),
  KEY `website_analysemgf_bc4990cc` (`enzyme_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Contenu de la table `website_analysemgf`
--

INSERT INTO `website_analysemgf` (`id`, `owner_id`, `name`, `enzyme_id`, `mgf`, `max_charge`, `error`, `descriptif`, `created`, `ignore`) VALUES
(1, 1, 'learning_1', NULL, 'mgf/learning_1.mgf', 0, 0.05, '', '2014-07-24 10:42:28', 1),
(2, 1, 'learning_2', NULL, 'mgf/learning_2.mgf', 0, 0.05, '', '2014-07-24 10:42:28', 1),
(3, 1, 'learning_3', NULL, 'mgf/learning_3.mgf', 0, 0.05, '', '2014-07-24 10:42:28', 1),
(4, 1, 'learning_4_1', NULL, 'mgf/learning_4.mgf', 0, 0.05, '', '2014-07-24 10:42:28', 1),
(5, 1, 'learning_4_2', NULL, 'mgf/learning_5.mgf', 0, 0.05, '', '2014-07-24 10:42:28', 1),
(6, 1, 'learning_5_1', NULL, 'mgf/learning_6.mgf', 0, 0.05, '', '2014-07-24 10:42:28', 1),
(7, 1, 'learning_5_2', NULL, 'mgf/learning_7.mgf', 0, 0.05, '', '2014-07-24 10:42:28', 1),
(8, 1, 'learning_5_3', NULL, 'mgf/learning_8.mgf', 0, 0.05, '', '2014-07-24 10:42:28', 1),
(9, 1, 'learning_6_1', NULL, 'mgf/learning_6_1.mgf', 0, 0.05, '', '2014-07-24 10:42:28', 1),
(11, 1, 'learning_6_3', NULL, 'mgf/learning_6_1_1.mgf', 0, 0.05, '', '2014-07-24 10:42:28', 1),
(12, 1, 'learning_6_2', NULL, 'mgf/learning_6_2.mgf', 0, 0.05, '', '2014-07-24 10:42:27', 1),
(13, 1, 'learning_6_5', NULL, 'mgf/learning_6_5.mgf', 0, 0.05, '', '2014-07-24 10:42:27', 1),
(14, 1, 'learning_7_1', NULL, 'mgf/learning_7_1.mgf', 0, 0.05, '', '2014-07-24 10:42:27', 1),
(15, 1, 'learning_7_2', NULL, 'mgf/learning_7_2.mgf', 0, 0.05, '', '2014-07-24 10:42:27', 1),
(16, 1, 'learning_7_3', NULL, 'mgf/learning_7_3.mgf', 0, 0.05, '', '2014-07-24 10:42:27', 1),
(17, 1, 'learning_7_5', NULL, 'mgf/learning_7_5.mgf', 0, 0.05, '', '2014-07-24 10:42:27', 1),
(18, 1, 'learning_8_1', NULL, 'mgf/learning_8_1.mgf', 0, 0.05, '', '2014-07-24 10:42:27', 1),
(19, 1, 'learning_8_2', NULL, 'mgf/learning_8_2.mgf', 0, 0.05, '', '2014-07-24 10:42:27', 1),
(20, 1, 'learning_8_3', NULL, 'mgf/learning_8_3.mgf', 0, 0.05, '', '2014-07-24 10:42:27', 1),
(21, 1, 'learning_8_4', NULL, 'mgf/learning_8_4.mgf', 0, 0.05, '', '2014-07-24 10:42:27', 1),
(22, 1, 'learning_8_6', NULL, 'mgf/learning_8_6.mgf', 0, 0.05, '', '2014-07-24 10:42:27', 1),
(23, 1, 'learning_11_1', NULL, 'mgf/learning_11_1.mgf', 0, 0.05, '', '2014-07-24 10:42:27', 1),
(24, 1, 'learning_10_1', NULL, 'mgf/learning_10_1.mgf', 0, 0.05, '', '2014-07-24 10:42:27', 1),
(25, 1, 'learning_10_2', NULL, 'mgf/learning_10_2.mgf', 0, 0.05, '', '2014-07-24 10:42:27', 1),
(26, 1, 'learning_11_2', NULL, 'mgf/learning_11_2.mgf', 0, 0.05, '', '2014-07-24 10:42:27', 1),
(27, 1, 'learning_12_1', NULL, 'mgf/learning_12_1.mgf', 0, 0.05, '', '2014-07-24 10:42:27', 1),
(28, 1, 'learning_12_2', NULL, 'mgf/learning_12_2.mgf', 0, 0.05, '', '2014-07-24 10:42:27', 1),
(40, 1, 'BSA', NULL, 'mgf/bsa.mgf', 0, 0.05, '', '2014-08-05 14:10:19', 0),
(41, 1, 'BSA no L', NULL, 'mgf/bsa_1.mgf', 0, 0.05, '', '2014-08-05 10:37:59', 0);

-- --------------------------------------------------------

--
-- Structure de la table `website_analysepeptide`
--

CREATE TABLE IF NOT EXISTS `website_analysepeptide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `analyse_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mgf_part` longtext NOT NULL,
  `cmpd` int(11) NOT NULL,
  `mz` double NOT NULL,
  `mass` double NOT NULL,
  `intensity` int(11) NOT NULL,
  `charge` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `website_analysepeptide_74e57bc9` (`analyse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `website_analysepeptidevalidated`
--

CREATE TABLE IF NOT EXISTS `website_analysepeptidevalidated` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` double NOT NULL,
  `analyse_id` int(11) NOT NULL,
  `sequence` longtext NOT NULL,
  `modification_seq` longtext,
  PRIMARY KEY (`id`),
  KEY `website_analysepeptidevalidated_74e57bc9` (`analyse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `website_analysepeptidevalidated_modifications`
--

CREATE TABLE IF NOT EXISTS `website_analysepeptidevalidated_modifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `analysepeptidevalidated_id` int(11) NOT NULL,
  `aamodification_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `analysepeptidevalidated_id` (`analysepeptidevalidated_id`,`aamodification_id`),
  KEY `website_analysepeptidevalidated_modifications_ce1d3243` (`analysepeptidevalidated_id`),
  KEY `website_analysepeptidevalidated_modifications_ed1c5c41` (`aamodification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `website_atom`
--

CREATE TABLE IF NOT EXISTS `website_atom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `per_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=120 ;

--
-- Contenu de la table `website_atom`
--

INSERT INTO `website_atom` (`id`, `per_id`, `name`, `slug`) VALUES
(1, 1, 'Hydrogen', 'H'),
(2, 2, 'Helium', 'He'),
(3, 3, 'Lithium', 'Li'),
(4, 4, 'Berylium', 'Be'),
(5, 5, 'Boron', 'B'),
(6, 6, 'Carbon', 'C'),
(7, 7, 'Nitrogen', 'N'),
(8, 8, 'Oxygen', 'O'),
(9, 9, 'Fluorine', 'F'),
(10, 10, 'Neon', 'Ne'),
(11, 11, 'Sodium', 'Na'),
(12, 12, 'Magnesium', 'Mg'),
(13, 13, 'Aluminum', 'Al'),
(14, 14, 'Silicon', 'Si'),
(15, 15, 'Phosphorus', 'P'),
(16, 16, 'Sulfur', 'S'),
(17, 17, 'Chlorine', 'Cl'),
(18, 18, 'Argon', 'Ar'),
(19, 19, 'Potassium', 'K'),
(20, 20, 'Calcium', 'Ca'),
(21, 21, 'Scandium', 'Sc'),
(22, 22, 'Titanium', 'Ti'),
(23, 23, 'Vanadium', 'V'),
(24, 24, 'Chromium', 'Cr'),
(25, 25, 'Manganese', 'Mn'),
(26, 26, 'Iron', 'Fe'),
(27, 27, 'Cobalt', 'Co'),
(28, 28, 'Nickel', 'Ni'),
(29, 29, 'Copper', 'Cu'),
(30, 30, 'Zinc', 'Zn'),
(31, 31, 'Gallium', 'Ga'),
(32, 32, 'Germanium', 'Ge'),
(33, 33, 'Arsenic', 'As'),
(34, 34, 'Selenium', 'Se'),
(35, 35, 'Bromine', 'Br'),
(36, 36, 'Krypton', 'Kr'),
(37, 37, 'Rubidium', 'Rb'),
(38, 38, 'Strontium', 'Sr'),
(39, 39, 'Yttrium', 'Y'),
(40, 40, 'Zirconium', 'Zr'),
(41, 41, 'Niobium', 'Nb'),
(42, 42, 'Molybdenum', 'Mo'),
(43, 43, 'Technetium', 'Tc'),
(44, 44, 'Ruthenium', 'Ru'),
(45, 45, 'Rhodium', 'Rh'),
(46, 46, 'Palladium', 'Pd'),
(47, 47, 'Silver', 'Ag'),
(48, 48, 'Cadmium', 'Cd'),
(49, 49, 'Indium', 'In'),
(50, 50, 'Tin', 'Sn'),
(51, 51, 'Antimony', 'Sb'),
(52, 52, 'Tellurium', 'Te'),
(53, 53, 'Iodine', 'I'),
(54, 54, 'Xenon', 'Xe'),
(55, 55, 'Cesium', 'Cs'),
(56, 56, 'Barium', 'Ba'),
(57, 57, 'Lanthanum', 'La'),
(58, 58, 'Cerium', 'Ce'),
(59, 59, 'Praseodymium', 'Pr'),
(60, 60, 'Neodymium', 'Nd'),
(61, 62, 'Samarium', 'Sm'),
(62, 63, 'Europium', 'Eu'),
(63, 64, 'Gadolinium', 'Gd'),
(64, 65, 'Terbium', 'Tb'),
(65, 66, 'Dysprosium', 'Dy'),
(66, 67, 'Holmium', 'Ho'),
(67, 68, 'Erbium', 'Er'),
(68, 69, 'Thulium', 'Tm'),
(69, 70, 'Ytterbium', 'Yb'),
(70, 71, 'Lutetium', 'Lu'),
(71, 72, 'Hafnium', 'Hf'),
(72, 73, 'Tantalum', 'Ta'),
(73, 74, 'Tungsten', 'W'),
(74, 75, 'Rhenium', 'Re'),
(75, 76, 'Osmium', 'Os'),
(76, 77, 'Iridium', 'Ir'),
(77, 78, 'Platinum', 'Pt'),
(78, 79, 'Gold', 'Au'),
(79, 80, 'Mercury', 'Hg'),
(80, 81, 'Thallium', 'Tl'),
(81, 82, 'Lead', 'Pb'),
(82, 83, 'Bismuth', 'Bi'),
(83, 90, 'Thorium', 'Th'),
(84, 92, 'Uranium', 'U'),
(85, 93, 'Neptunium', 'Np'),
(86, 94, 'Plutonium', 'Pu'),
(87, 95, 'Americium', 'Am'),
(88, 96, 'Curium', 'Cm'),
(89, 97, 'Berkelium', 'Bk'),
(90, 98, 'Californium', 'Cf'),
(91, 99, 'Einsteinium', 'Es'),
(92, 100, 'Fermium', 'Fm'),
(93, 101, 'Mendelevium', 'Md'),
(94, 102, 'Nobelium', 'No'),
(95, 103, 'Lawrencium', 'Lr'),
(96, 89, 'Actinium', 'Ac'),
(97, 85, 'Astatine', 'At'),
(98, 87, 'Francium', 'Fr'),
(99, 84, 'Polonium', 'Po'),
(100, 61, 'Promethium', 'Pm'),
(101, 91, 'Protactinium', 'Pa'),
(102, 88, 'Radium', 'Ra'),
(103, 86, 'Radon', 'Rn'),
(104, 1, 'Deuterium', 'D'),
(105, 1, 'Tritium', 'T'),
(106, 6, 'Carbon14', 'Cc'),
(107, 6, 'Carbon13', 'Cb'),
(108, 8, 'Oxygen18', 'Ob'),
(109, 15, 'Phosphorus32', 'Pc'),
(110, 16, 'Sulfur32', 'Sa'),
(111, 16, 'Sulfur33', 'Sd'),
(112, 16, 'Sulfur34', 'Sf'),
(113, 16, 'Sulfur36', 'Sg'),
(114, 17, 'Chlorine37', 'Cg'),
(115, 35, 'Bromine77', 'Bb'),
(116, 35, 'Bromine79', 'Bc'),
(117, 35, 'Bromine81', 'Bd'),
(118, 35, 'Bromine82', 'Bf'),
(119, 7, 'Nitrogen15', 'Nc');

-- --------------------------------------------------------

--
-- Structure de la table `website_atomisotope`
--

CREATE TABLE IF NOT EXISTS `website_atomisotope` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atom_id` int(11) NOT NULL,
  `mass` double NOT NULL,
  `frequence` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `website_atomisotope_7d2790e2` (`atom_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=325 ;

--
-- Contenu de la table `website_atomisotope`
--

INSERT INTO `website_atomisotope` (`id`, `atom_id`, `mass`, `frequence`) VALUES
(1, 1, 1.007825032, 0.99985),
(2, 1, 2.014101778, 0.00015),
(3, 2, 4.00260325, 0.99999863),
(4, 2, 3.01629309, 0.00000137),
(5, 3, 7.0160041, 0.925),
(6, 3, 6.0151223, 0.075),
(7, 4, 9.0121822, 1),
(8, 5, 11.0093055, 0.801),
(9, 5, 10.0129371, 0.199),
(10, 6, 12, 0.9893),
(11, 6, 13.00335839, 0.0107),
(12, 6, 14.00324199, 0),
(13, 7, 14.00307401, 0.99632),
(14, 7, 15.00010897, 0.00368),
(15, 8, 15.99491462, 0.99757),
(16, 8, 17.99916, 0.00205),
(17, 8, 16.9991315, 0.00038),
(18, 9, 18.9984032, 1),
(19, 10, 19.99244018, 0.9048),
(20, 10, 21.9913855, 0.0925),
(21, 10, 20.99384674, 0.0027),
(22, 11, 22.9897697, 1),
(23, 12, 23.9850419, 0.7899),
(24, 12, 25.982593, 0.1101),
(25, 12, 24.985837, 0.1),
(26, 13, 26.9815384, 1),
(27, 14, 27.97692653, 0.9222),
(28, 14, 28.97649472, 0.0469),
(29, 14, 29.97377022, 0.0309),
(30, 15, 30.9737615, 1),
(31, 16, 31.9720707, 0.9493),
(32, 16, 33.9678668, 0.0429),
(33, 16, 32.9714585, 0.0076),
(34, 16, 35.9670809, 0.0002),
(35, 17, 34.96885271, 0.7578),
(36, 17, 36.9659026, 0.2422),
(37, 18, 39.96238312, 0.996003),
(38, 18, 35.9675463, 0.003365),
(39, 18, 37.9627322, 0.000632),
(40, 19, 38.9637069, 0.932581),
(41, 19, 40.961826, 0.067302),
(42, 19, 39.9639987, 0.000117),
(43, 20, 39.9625912, 0.96941),
(44, 20, 43.955481, 0.02086),
(45, 20, 41.9586183, 0.00647),
(46, 20, 47.952533, 0.00187),
(47, 20, 42.9587668, 0.00135),
(48, 20, 45.953693, 0.00004),
(49, 21, 44.95591, 1),
(50, 22, 47.947947, 0.7372),
(51, 22, 45.95263, 0.0825),
(52, 22, 46.951764, 0.0744),
(53, 22, 48.947871, 0.0541),
(54, 22, 49.944792, 0.0518),
(55, 23, 50.943964, 0.9975),
(56, 23, 49.947163, 0.0025),
(57, 24, 51.940512, 0.83789),
(58, 24, 52.940653, 0.09501),
(59, 24, 49.94605, 0.04345),
(60, 24, 53.938885, 0.02365),
(61, 25, 54.938049, 1),
(62, 26, 55.934942, 0.91754),
(63, 26, 53.939615, 0.05845),
(64, 26, 56.935398, 0.02119),
(65, 26, 57.93328, 0.00282),
(66, 27, 58.9332, 1),
(67, 28, 57.935348, 0.680769),
(68, 28, 59.93079, 0.262231),
(69, 28, 61.928348, 0.036345),
(70, 28, 60.93106, 0.011399),
(71, 28, 63.927969, 0.009256),
(72, 29, 62.929601, 0.6917),
(73, 29, 64.927794, 0.3083),
(74, 30, 63.929146, 0.4863),
(75, 30, 65.926036, 0.279),
(76, 30, 67.924847, 0.1875),
(77, 30, 66.927131, 0.041),
(78, 30, 69.925325, 0.0062),
(79, 31, 68.925581, 0.60108),
(80, 31, 70.924707, 0.39892),
(81, 32, 73.921178, 0.3628),
(82, 32, 71.922076, 0.2754),
(83, 32, 69.92425, 0.2084),
(84, 32, 72.92346, 0.0773),
(85, 32, 75.921403, 0.0761),
(86, 33, 74.921597, 1),
(87, 34, 79.916522, 0.4961),
(88, 34, 77.91731, 0.2377),
(89, 34, 75.919214, 0.0937),
(90, 34, 81.9167, 0.0873),
(91, 34, 76.919915, 0.0763),
(92, 34, 73.922477, 0.0089),
(93, 35, 78.918338, 0.5069),
(94, 35, 80.916291, 0.4931),
(95, 36, 83.911508, 0.57),
(96, 36, 85.910615, 0.173),
(97, 36, 81.913485, 0.1158),
(98, 36, 82.914137, 0.1149),
(99, 36, 79.916379, 0.0228),
(100, 36, 77.92039, 0.0035),
(101, 37, 84.911792, 0.7217),
(102, 37, 86.909186, 0.2783),
(103, 38, 87.905617, 0.8258),
(104, 38, 85.909265, 0.0986),
(105, 38, 86.908882, 0.07),
(106, 38, 83.913426, 0.0056),
(107, 39, 88.905849, 1),
(108, 40, 89.904702, 0.5145),
(109, 40, 93.906314, 0.1738),
(110, 40, 91.905039, 0.1715),
(111, 40, 90.905643, 0.1122),
(112, 40, 95.908275, 0.028),
(113, 41, 92.906376, 1),
(114, 42, 97.905407, 0.2413),
(115, 42, 95.904678, 0.1668),
(116, 42, 94.905841, 0.1592),
(117, 42, 91.90681, 0.1484),
(118, 42, 99.90748, 0.0963),
(119, 42, 96.90602, 0.0955),
(120, 42, 93.905087, 0.0925),
(121, 43, 97.907215, 1),
(122, 44, 101.904349, 0.3157),
(123, 44, 103.90543, 0.1866),
(124, 44, 100.905582, 0.1705),
(125, 44, 98.905939, 0.1274),
(126, 44, 99.904219, 0.126),
(127, 44, 95.9076, 0.055),
(128, 44, 97.90529, 0.0188),
(129, 45, 102.905504, 1),
(130, 46, 105.903484, 0.2733),
(131, 46, 107.903895, 0.2646),
(132, 46, 104.905083, 0.2233),
(133, 46, 109.905153, 0.1172),
(134, 46, 103.904034, 0.1114),
(135, 46, 101.905607, 0.0102),
(136, 47, 106.905093, 0.51839),
(137, 47, 108.904756, 0.48161),
(138, 48, 113.903359, 0.2873),
(139, 48, 111.902758, 0.2413),
(140, 48, 110.904182, 0.128),
(141, 48, 109.903006, 0.1249),
(142, 48, 112.904401, 0.1222),
(143, 48, 115.904756, 0.0749),
(144, 48, 105.90646, 0.0125),
(145, 48, 107.90418, 0.0089),
(146, 49, 114.903879, 0.9571),
(147, 49, 112.904062, 0.0429),
(148, 50, 119.902199, 0.3259),
(149, 50, 117.901606, 0.2422),
(150, 50, 115.901745, 0.1454),
(151, 50, 118.9033011, 0.0859),
(152, 50, 116.902955, 0.0768),
(153, 50, 123.905275, 0.0579),
(154, 50, 121.903441, 0.0463),
(155, 50, 111.904822, 0.0097),
(156, 50, 113.902783, 0.0065),
(157, 50, 114.903347, 0.0034),
(158, 51, 120.903822, 0.5721),
(159, 51, 122.904216, 0.4279),
(160, 52, 129.906223, 0.3408),
(161, 52, 127.904462, 0.3174),
(162, 52, 125.903305, 0.1884),
(163, 52, 124.904424, 0.0707),
(164, 52, 123.902819, 0.0474),
(165, 52, 121.903056, 0.0255),
(166, 52, 122.904271, 0.0089),
(167, 52, 119.90403, 0.0009),
(168, 53, 126.904468, 1),
(169, 54, 131.904155, 0.2689),
(170, 54, 128.90478, 0.2644),
(171, 54, 130.905083, 0.2118),
(172, 54, 133.905395, 0.1044),
(173, 54, 135.90722, 0.0887),
(174, 54, 129.903509, 0.0408),
(175, 54, 127.903531, 0.0192),
(176, 54, 123.905895, 0.0009),
(177, 54, 125.90427, 0.0009),
(178, 55, 132.905447, 1),
(179, 56, 137.905242, 0.71698),
(180, 56, 136.905822, 0.11232),
(181, 56, 135.904571, 0.07854),
(182, 56, 134.905684, 0.06592),
(183, 56, 133.904504, 0.02417),
(184, 56, 129.90631, 0.00106),
(185, 56, 131.905056, 0.00101),
(186, 57, 138.906349, 0.9991),
(187, 57, 137.907107, 0.0009),
(188, 58, 139.905435, 0.8848),
(189, 58, 141.909241, 0.1108),
(190, 58, 137.90599, 0.0025),
(191, 58, 135.90714, 0.0019),
(192, 59, 140.907648, 1),
(193, 60, 141.907719, 0.2713),
(194, 60, 143.910083, 0.238),
(195, 60, 145.913113, 0.1719),
(196, 60, 142.90981, 0.1218),
(197, 60, 144.912569, 0.083),
(198, 60, 147.916889, 0.0576),
(199, 60, 149.920887, 0.0564),
(200, 61, 151.919729, 0.267),
(201, 61, 153.922206, 0.227),
(202, 61, 146.914894, 0.15),
(203, 61, 148.91718, 0.138),
(204, 61, 147.914818, 0.113),
(205, 61, 149.917272, 0.074),
(206, 61, 143.911996, 0.031),
(207, 62, 152.921227, 0.522),
(208, 62, 150.919846, 0.478),
(209, 63, 157.924101, 0.2484),
(210, 63, 159.927051, 0.2186),
(211, 63, 155.92212, 0.2047),
(212, 63, 156.923957, 0.1565),
(213, 63, 154.922619, 0.148),
(214, 63, 153.920862, 0.0218),
(215, 63, 151.919789, 0.002),
(216, 64, 158.925343, 1),
(217, 65, 163.929171, 0.282),
(218, 65, 161.926795, 0.255),
(219, 65, 162.928728, 0.249),
(220, 65, 160.92693, 0.189),
(221, 65, 159.925194, 0.0234),
(222, 65, 157.924405, 0.001),
(223, 65, 155.92428, 0.0006),
(224, 66, 164.930319, 1),
(225, 67, 165.93029, 0.336),
(226, 67, 167.932368, 0.268),
(227, 67, 166.932046, 0.2295),
(228, 67, 169.935461, 0.149),
(229, 67, 163.929197, 0.0161),
(230, 67, 161.928775, 0.0014),
(231, 68, 168.934211, 1),
(232, 69, 173.938858, 0.318),
(233, 69, 171.936378, 0.219),
(234, 69, 172.938207, 0.1612),
(235, 69, 170.936323, 0.143),
(236, 69, 175.942569, 0.127),
(237, 69, 169.934759, 0.0305),
(238, 69, 167.933895, 0.0013),
(239, 70, 174.940768, 0.9741),
(240, 70, 175.942683, 0.0259),
(241, 71, 179.946549, 0.351),
(242, 71, 177.943698, 0.27297),
(243, 71, 176.94322, 0.18606),
(244, 71, 178.945815, 0.13629),
(245, 71, 175.941403, 0.05206),
(246, 71, 173.940042, 0.00162),
(247, 72, 180.947996, 0.99988),
(248, 72, 179.947466, 0.00012),
(249, 73, 183.950932, 0.30642),
(250, 73, 185.954362, 0.28426),
(251, 73, 181.948205, 0.26498),
(252, 73, 182.950224, 0.14314),
(253, 73, 179.946706, 0.0012),
(254, 74, 186.955751, 0.626),
(255, 74, 184.952955, 0.374),
(256, 75, 191.961479, 0.41),
(257, 75, 189.958445, 0.264),
(258, 75, 188.958145, 0.161),
(259, 75, 187.955836, 0.133),
(260, 75, 186.955748, 0.016),
(261, 75, 185.953838, 0.0158),
(262, 75, 183.952491, 0.0002),
(263, 76, 192.962923, 0.627),
(264, 76, 190.960591, 0.373),
(265, 77, 194.964774, 0.338),
(266, 77, 193.962663, 0.329),
(267, 77, 195.964934, 0.253),
(268, 77, 197.967875, 0.072),
(269, 77, 191.961035, 0.0079),
(270, 77, 189.95993, 0.0001),
(271, 78, 196.966551, 1),
(272, 79, 201.970625, 0.2986),
(273, 79, 199.968309, 0.231),
(274, 79, 198.968262, 0.1687),
(275, 79, 200.970285, 0.1318),
(276, 79, 197.966752, 0.0997),
(277, 79, 203.973475, 0.0687),
(278, 79, 195.965814, 0.0015),
(279, 80, 204.974412, 0.70476),
(280, 80, 202.972329, 0.29524),
(281, 81, 207.976636, 0.524),
(282, 81, 205.974449, 0.241),
(283, 81, 206.97588, 0.221),
(284, 81, 203.973028, 0.014),
(285, 82, 208.980384, 1),
(286, 83, 232.03805, 1),
(287, 84, 238.050784, 0.992745),
(288, 84, 235.043922, 0.0072),
(289, 84, 234.040945, 0.000055),
(290, 85, 237.048166, 1),
(291, 86, 244.064197, 1),
(292, 87, 243.061372, 1),
(293, 88, 247.070346, 1),
(294, 89, 247.0703, 1),
(295, 90, 251.079579, 1),
(296, 91, 252.08297, 1),
(297, 92, 257.0951, 1),
(298, 93, 258.098427, 1),
(299, 94, 259.1011, 1),
(300, 95, 262.11, 1),
(301, 96, 227.027747, 1),
(302, 97, 209.98713, 1),
(303, 98, 223.019731, 1),
(304, 99, 208.982415, 1),
(305, 100, 144.912745, 1),
(306, 101, 231.035878, 1),
(307, 102, 226.025402, 1),
(308, 103, 222.01757, 1),
(309, 104, 2.014101778, 1),
(310, 105, 3.016049268, 1),
(311, 106, 14.00324199, 1),
(312, 107, 13.00335484, 1),
(313, 108, 17.99916, 1),
(314, 109, 31.9739071, 1),
(315, 110, 31.9720707, 1),
(316, 111, 32.9714585, 1),
(317, 112, 33.9678668, 1),
(318, 113, 35.9670809, 1),
(319, 114, 36.9659026, 1),
(320, 115, 76.92138, 1),
(321, 116, 78.918338, 1),
(322, 117, 80.916291, 1),
(323, 118, 81.916805, 1),
(324, 119, 15.00010897, 1);

-- --------------------------------------------------------

--
-- Structure de la table `website_blastanalyse`
--

CREATE TABLE IF NOT EXISTS `website_blastanalyse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `analyse_id` int(11) NOT NULL,
  `database` varchar(255) NOT NULL,
  `program` varchar(16) NOT NULL,
  `xml` varchar(100) DEFAULT NULL,
  `fasta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_blastanalyse_74e57bc9` (`analyse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `website_blastcalculatedpeptide`
--

CREATE TABLE IF NOT EXISTS `website_blastcalculatedpeptide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blast_id` int(11) NOT NULL,
  `calculatedpeptide_id` int(11) NOT NULL,
  `gi` int(11) NOT NULL,
  `title` longtext NOT NULL,
  `score` double NOT NULL,
  `e_value` double NOT NULL,
  `sequence_match` longtext NOT NULL,
  `sequence_real` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `website_blastcalculatedpeptide_7adbfd64` (`blast_id`),
  KEY `website_blastcalculatedpeptide_422da748` (`calculatedpeptide_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `website_calculatedpeptide`
--

CREATE TABLE IF NOT EXISTS `website_calculatedpeptide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` double NOT NULL,
  `sequence` longtext NOT NULL,
  `sequence_aa` longtext NOT NULL,
  `analyse_id` int(11) NOT NULL,
  `error_total` double NOT NULL,
  `error_aa_cumul` double NOT NULL,
  `intensitee_total_parent` double NOT NULL,
  `intensitee_total` double NOT NULL,
  `mass_total` double NOT NULL,
  `percent_couverture` double NOT NULL,
  `nb_aa` double NOT NULL,
  `nb_peaks` double NOT NULL,
  `mass_parent` double NOT NULL,
  `percent_intensitee_utilisee` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `website_calculatedpeptide_74e57bc9` (`analyse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `website_enzyme`
--

CREATE TABLE IF NOT EXISTS `website_enzyme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `website_enzyme_cut_after`
--

CREATE TABLE IF NOT EXISTS `website_enzyme_cut_after` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enzyme_id` int(11) NOT NULL,
  `aa_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enzyme_id` (`enzyme_id`,`aa_id`),
  KEY `website_enzyme_cut_after_bc4990cc` (`enzyme_id`),
  KEY `website_enzyme_cut_after_1fee7eca` (`aa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `website_enzyme_cut_before`
--

CREATE TABLE IF NOT EXISTS `website_enzyme_cut_before` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enzyme_id` int(11) NOT NULL,
  `aa_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enzyme_id` (`enzyme_id`,`aa_id`),
  KEY `website_enzyme_cut_before_bc4990cc` (`enzyme_id`),
  KEY `website_enzyme_cut_before_1fee7eca` (`aa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `website_enzyme_cut_imposible`
--

CREATE TABLE IF NOT EXISTS `website_enzyme_cut_imposible` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enzyme_id` int(11) NOT NULL,
  `impossiblecut_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enzyme_id` (`enzyme_id`,`impossiblecut_id`),
  KEY `website_enzyme_cut_imposible_bc4990cc` (`enzyme_id`),
  KEY `website_enzyme_cut_imposible_e9a5a006` (`impossiblecut_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `website_impossiblecut`
--

CREATE TABLE IF NOT EXISTS `website_impossiblecut` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_id` int(11) NOT NULL,
  `second_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `website_impossiblecut_48e99221` (`first_id`),
  KEY `website_impossiblecut_fe82182b` (`second_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `website_modtype`
--

CREATE TABLE IF NOT EXISTS `website_modtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `website_modtype`
--

INSERT INTO `website_modtype` (`id`, `name`) VALUES
(2, 'default'),
(1, 'TODO');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `communication_client`
--
ALTER TABLE `communication_client`
  ADD CONSTRAINT `owner_id_refs_id_3da3a7aa` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `server_id_refs_id_553f97aa` FOREIGN KEY (`server_id`) REFERENCES `communication_harpeserver` (`id`);

--
-- Contraintes pour la table `communication_clientcalculation`
--
ALTER TABLE `communication_clientcalculation`
  ADD CONSTRAINT `analysepeptide_id_refs_id_867e1a5` FOREIGN KEY (`analysepeptide_id`) REFERENCES `website_analysepeptide` (`id`),
  ADD CONSTRAINT `client_id_refs_id_7a1f93b1` FOREIGN KEY (`client_id`) REFERENCES `communication_client` (`id`);

--
-- Contraintes pour la table `contentblocks_containeurtoobject`
--
ALTER TABLE `contentblocks_containeurtoobject`
  ADD CONSTRAINT `page_containeur_id_refs_id_74129522` FOREIGN KEY (`page_containeur_id`) REFERENCES `contentblocks_pagecontaineur` (`id`),
  ADD CONSTRAINT `page_object_id_refs_id_1cb62373` FOREIGN KEY (`page_object_id`) REFERENCES `contentblocks_pageobject` (`id`);

--
-- Contraintes pour la table `contentblocks_pagecontaineur`
--
ALTER TABLE `contentblocks_pagecontaineur`
  ADD CONSTRAINT `page_id_refs_id_40bfc76a` FOREIGN KEY (`page_id`) REFERENCES `Kraggne_menuitem` (`id`);

--
-- Contraintes pour la table `contentblocks_pageobject`
--
ALTER TABLE `contentblocks_pageobject`
  ADD CONSTRAINT `content_type_id_refs_id_363d6f0` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `flatblocks_genericflatblock`
--
ALTER TABLE `flatblocks_genericflatblock`
  ADD CONSTRAINT `content_type_id_refs_id_1a358ab0` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `flatblocks_genericflatblocklist`
--
ALTER TABLE `flatblocks_genericflatblocklist`
  ADD CONSTRAINT `content_type_id_refs_id_4f141848` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `Kraggne_formblock`
--
ALTER TABLE `Kraggne_formblock`
  ADD CONSTRAINT `page_id_refs_id_6570606d` FOREIGN KEY (`page_id`) REFERENCES `Kraggne_menuitem` (`id`);

--
-- Contraintes pour la table `Kraggne_menuitem`
--
ALTER TABLE `Kraggne_menuitem`
  ADD CONSTRAINT `parent_id_refs_id_2182e73d` FOREIGN KEY (`parent_id`) REFERENCES `Kraggne_menuitem` (`id`);

--
-- Contraintes pour la table `Kraggne_pagetemplate`
--
ALTER TABLE `Kraggne_pagetemplate`
  ADD CONSTRAINT `page_id_refs_id_4504d774` FOREIGN KEY (`page_id`) REFERENCES `Kraggne_menuitem` (`id`);

--
-- Contraintes pour la table `Kraggne_pagevar`
--
ALTER TABLE `Kraggne_pagevar`
  ADD CONSTRAINT `content_type_id_refs_id_1a61c2cb` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `page_id_refs_id_552fc464` FOREIGN KEY (`page_id`) REFERENCES `Kraggne_menuitem` (`id`);

--
-- Contraintes pour la table `Patcher_file`
--
ALTER TABLE `Patcher_file`
  ADD CONSTRAINT `version_id_refs_id_4a1c51f4` FOREIGN KEY (`version_id`) REFERENCES `Patcher_version` (`id`);

--
-- Contraintes pour la table `Patcher_version`
--
ALTER TABLE `Patcher_version`
  ADD CONSTRAINT `soft_id_refs_id_3998d0f0` FOREIGN KEY (`soft_id`) REFERENCES `Patcher_soft` (`id`);

--
-- Contraintes pour la table `website_aa`
--
ALTER TABLE `website_aa`
  ADD CONSTRAINT `fk_aa_id_refs_id_5aa789d1` FOREIGN KEY (`fk_aa_id`) REFERENCES `website_aa` (`id`),
  ADD CONSTRAINT `fk_mod_id_refs_id_ea852514` FOREIGN KEY (`fk_mod_id`) REFERENCES `website_aamodification` (`id`),
  ADD CONSTRAINT `type_id_refs_id_e8baba34` FOREIGN KEY (`type_id`) REFERENCES `website_aatype` (`id`);

--
-- Contraintes pour la table `website_aamodificationposition`
--
ALTER TABLE `website_aamodificationposition`
  ADD CONSTRAINT `AA_id_refs_id_888b86ca` FOREIGN KEY (`AA_id`) REFERENCES `website_aa` (`id`),
  ADD CONSTRAINT `modification_id_refs_id_ba6d3741` FOREIGN KEY (`modification_id`) REFERENCES `website_aamodification` (`id`);

--
-- Contraintes pour la table `website_analysemgf`
--
ALTER TABLE `website_analysemgf`
  ADD CONSTRAINT `enzyme_id_refs_id_aa0a71b3` FOREIGN KEY (`enzyme_id`) REFERENCES `website_enzyme` (`id`),
  ADD CONSTRAINT `owner_id_refs_id_6c775271` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `website_analysepeptide`
--
ALTER TABLE `website_analysepeptide`
  ADD CONSTRAINT `analyse_id_refs_id_2cd9020a` FOREIGN KEY (`analyse_id`) REFERENCES `website_analysemgf` (`id`);

--
-- Contraintes pour la table `website_analysepeptidevalidated`
--
ALTER TABLE `website_analysepeptidevalidated`
  ADD CONSTRAINT `analyse_id_refs_id_ffd5ce78` FOREIGN KEY (`analyse_id`) REFERENCES `website_analysepeptide` (`id`);

--
-- Contraintes pour la table `website_analysepeptidevalidated_modifications`
--
ALTER TABLE `website_analysepeptidevalidated_modifications`
  ADD CONSTRAINT `analysepeptidevalidated_id_refs_id_2625bbcc` FOREIGN KEY (`analysepeptidevalidated_id`) REFERENCES `website_analysepeptidevalidated` (`id`),
  ADD CONSTRAINT `aamodification_id_refs_id_7138c25b` FOREIGN KEY (`aamodification_id`) REFERENCES `website_aamodification` (`id`);

--
-- Contraintes pour la table `website_atomisotope`
--
ALTER TABLE `website_atomisotope`
  ADD CONSTRAINT `atom_id_refs_id_598ffb80` FOREIGN KEY (`atom_id`) REFERENCES `website_atom` (`id`);

--
-- Contraintes pour la table `website_blastanalyse`
--
ALTER TABLE `website_blastanalyse`
  ADD CONSTRAINT `analyse_id_refs_id_36e27438` FOREIGN KEY (`analyse_id`) REFERENCES `website_analysemgf` (`id`);

--
-- Contraintes pour la table `website_blastcalculatedpeptide`
--
ALTER TABLE `website_blastcalculatedpeptide`
  ADD CONSTRAINT `calculatedpeptide_id_refs_id_831921e9` FOREIGN KEY (`calculatedpeptide_id`) REFERENCES `website_calculatedpeptide` (`id`),
  ADD CONSTRAINT `blast_id_refs_id_e4da5e5d` FOREIGN KEY (`blast_id`) REFERENCES `website_blastanalyse` (`id`);

--
-- Contraintes pour la table `website_calculatedpeptide`
--
ALTER TABLE `website_calculatedpeptide`
  ADD CONSTRAINT `analyse_id_refs_id_c3ee6788` FOREIGN KEY (`analyse_id`) REFERENCES `website_analysepeptide` (`id`);

--
-- Contraintes pour la table `website_enzyme_cut_after`
--
ALTER TABLE `website_enzyme_cut_after`
  ADD CONSTRAINT `enzyme_id_refs_id_56533418` FOREIGN KEY (`enzyme_id`) REFERENCES `website_enzyme` (`id`),
  ADD CONSTRAINT `aa_id_refs_id_55f1d044` FOREIGN KEY (`aa_id`) REFERENCES `website_aa` (`id`);

--
-- Contraintes pour la table `website_enzyme_cut_before`
--
ALTER TABLE `website_enzyme_cut_before`
  ADD CONSTRAINT `enzyme_id_refs_id_83eb54c2` FOREIGN KEY (`enzyme_id`) REFERENCES `website_enzyme` (`id`),
  ADD CONSTRAINT `aa_id_refs_id_d765570f` FOREIGN KEY (`aa_id`) REFERENCES `website_aa` (`id`);

--
-- Contraintes pour la table `website_enzyme_cut_imposible`
--
ALTER TABLE `website_enzyme_cut_imposible`
  ADD CONSTRAINT `enzyme_id_refs_id_af84d994` FOREIGN KEY (`enzyme_id`) REFERENCES `website_enzyme` (`id`),
  ADD CONSTRAINT `impossiblecut_id_refs_id_1f247ebf` FOREIGN KEY (`impossiblecut_id`) REFERENCES `website_impossiblecut` (`id`);

--
-- Contraintes pour la table `website_impossiblecut`
--
ALTER TABLE `website_impossiblecut`
  ADD CONSTRAINT `second_id_refs_id_c9007468` FOREIGN KEY (`second_id`) REFERENCES `website_aa` (`id`),
  ADD CONSTRAINT `first_id_refs_id_c9007468` FOREIGN KEY (`first_id`) REFERENCES `website_aa` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
