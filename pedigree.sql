-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.5-10.0.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for pedigree
CREATE DATABASE IF NOT EXISTS `pedigree` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pedigree`;


-- Dumping structure for table pedigree.bank
CREATE TABLE IF NOT EXISTS `bank` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `def_name` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table pedigree.bank: ~4 rows (approximately)
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
INSERT INTO `bank` (`id`, `name`, `def_name`) VALUES
	(1, 'กรุงไทย', 'KTB'),
	(2, 'ไทยพาณิชย์', 'SCB'),
	(7, 'ออมสิน', 'GSB'),
	(8, 'ทหารไทย', 'TMB');
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;


-- Dumping structure for table pedigree.color
CREATE TABLE IF NOT EXISTS `color` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `cname` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table pedigree.color: ~3 rows (approximately)
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` (`id`, `cname`) VALUES
	(12, 'Grey'),
	(51, 'Red'),
	(52, 'Black');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;


-- Dumping structure for table pedigree.data
CREATE TABLE IF NOT EXISTS `data` (
  `data_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `l_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_no` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `other_mail` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`data_id`),
  KEY `FK_data_users` (`user_id`),
  CONSTRAINT `FK_data_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table pedigree.data: ~3 rows (approximately)
/*!40000 ALTER TABLE `data` DISABLE KEYS */;
INSERT INTO `data` (`data_id`, `f_name`, `l_name`, `id_no`, `address`, `phone`, `mobile`, `mail`, `fax`, `other_mail`, `user_id`) VALUES
	(1, 'ปรัชญา', 'ปันอินทร์', '1121111134160', '19/4 Phayao', '0824771428', '-', 'xnakky@gmail.com', '-', '-', 13),
	(2, 'Jinjutha', 'Chaikeaw', '2222222226222', 'Phayao', '0850492194', NULL, 'mild_zoza@hotmail.com', NULL, NULL, 1),
	(5, 'ปรัชญา', 'ปันอินทร์', '1510400142035', '169 หมู่ 15 ตำบลลี้ อำเภอลี้ จ.ลำพูน', '-', '0824771428', 'xnakky@live.com', '-', 'xnakky@gmail.com', 18);
/*!40000 ALTER TABLE `data` ENABLE KEYS */;


-- Dumping structure for table pedigree.pedigree
CREATE TABLE IF NOT EXISTS `pedigree` (
  `pedigree_id` int(200) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calved` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bbfa_no` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bbfa_f` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `private_no` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `band` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `breeder` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_delivery` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `breed` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `farm_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pay` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color_id` int(2) DEFAULT NULL,
  `pedigree_type_type_id1` int(11) DEFAULT NULL,
  `pedigree_sire_id` int(11) DEFAULT NULL,
  `pedigree_dam_id` int(11) DEFAULT NULL,
  `users_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pedigree_id`),
  KEY `fk_pedigree_color1_idx` (`color_id`),
  KEY `fk_pedigree_pedigree_type1_idx` (`pedigree_type_type_id1`),
  KEY `fk_pedigree_pedigree1_idx` (`pedigree_sire_id`),
  KEY `fk_pedigree_pedigree2_idx` (`pedigree_dam_id`),
  KEY `FK_pedigree_users` (`users_user_id`),
  CONSTRAINT `FK_pedigree_color` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_pedigree_pedigree` FOREIGN KEY (`pedigree_sire_id`) REFERENCES `pedigree` (`pedigree_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_pedigree_pedigree_2` FOREIGN KEY (`pedigree_dam_id`) REFERENCES `pedigree` (`pedigree_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_pedigree_pedigree_type` FOREIGN KEY (`pedigree_type_type_id1`) REFERENCES `pedigree_type` (`type_id`),
  CONSTRAINT `FK_pedigree_users` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=502 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table pedigree.pedigree: ~75 rows (approximately)
/*!40000 ALTER TABLE `pedigree` DISABLE KEYS */;
INSERT INTO `pedigree` (`pedigree_id`, `c_name`, `sex`, `calved`, `bbfa_no`, `bbfa_f`, `private_no`, `band`, `breeder`, `owner`, `date_delivery`, `breed`, `farm_name`, `owner_name`, `pay`, `color_id`, `pedigree_type_type_id1`, `pedigree_sire_id`, `pedigree_dam_id`, `users_user_id`) VALUES
	(427, 'ครุคริ', 'BULL', NULL, '12169849846', NULL, '102', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(428, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(429, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 427, 428, 1),
	(430, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(431, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(432, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 430, 431, 1),
	(433, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 429, 432, 1),
	(434, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(435, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(436, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 434, 435, 1),
	(437, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(438, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(439, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 437, 438, 1),
	(440, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 436, 439, 1),
	(441, 'ไนท์คอกแคก', 'COW', '2560-08-18', '77777777', NULL, '012', 'กระดิ่งแมว', 'mr.ไนท์ ใครวะ', 'นายไนท์ ใครวะ', '2560-08-17', NULL, 'ไนท์คอกแคกวิลล์', 'นายไนท์ ใครวะ', NULL, 51, 25, 433, 440, 1),
	(442, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(443, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(444, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 442, 443, 1),
	(445, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(446, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(447, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 445, 446, 1),
	(448, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 444, 447, 1),
	(449, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(450, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(451, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 449, 450, 1),
	(452, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(453, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(454, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 452, 453, 1),
	(455, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 451, 454, 1),
	(456, 'โดมิโน่', 'COW', '2561-05-31', '17588342221', NULL, 'G15669', 'กังหันลม', 'นายนัฐพงษ์', 'นัฐพงษ์', '', NULL, 'โดมิโน่โคแท้ ฟาร์ม', 'นัฐพงษ์', NULL, 12, 25, 448, 455, 1),
	(457, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(458, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(459, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 457, 458, 1),
	(460, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(461, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(462, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 460, 461, 1),
	(463, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 459, 462, 1),
	(464, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(465, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(466, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 464, 465, 1),
	(467, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(468, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(469, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 467, 468, 1),
	(470, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 466, 469, 1),
	(471, 'โดมิโน่', 'COW', '2561-05-31', '17588342221', NULL, 'G15669', 'กังหันลม', 'นายนัฐพงษ์', 'นัฐพงษ์', '', NULL, 'โดมิโน่โคแท้ ฟาร์ม', 'นัฐพงษ์', NULL, 12, 25, 463, 470, 1),
	(472, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(473, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(474, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 472, 473, 1),
	(475, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(476, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(477, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 475, 476, 1),
	(478, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 474, 477, 1),
	(479, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(480, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(481, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 479, 480, 1),
	(482, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(483, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(484, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 482, 483, 1),
	(485, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 481, 484, 1),
	(486, 'สมปอง', 'COW', '2017-08-01', '95645231', NULL, '64893211', '888', 'naret', 'เฉลิม', '2017-08-03', NULL, 'เฉลิม', 'สมใจ', NULL, 51, 1, 478, 485, 1),
	(487, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(488, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(489, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 487, 488, 1),
	(490, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(491, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(492, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 490, 491, 1),
	(493, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 489, 492, 1),
	(494, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(495, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(496, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 494, 495, 1),
	(497, '', 'BULL', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(498, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1),
	(499, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 497, 498, 1),
	(500, '', 'COW', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 496, 499, 1),
	(501, '', 'BULL', '', '', NULL, '', '', '', '', '', NULL, '', '', NULL, 12, 1, 493, 500, 1);
/*!40000 ALTER TABLE `pedigree` ENABLE KEYS */;


-- Dumping structure for table pedigree.pedigree_type
CREATE TABLE IF NOT EXISTS `pedigree_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `gene` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `type` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `def` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table pedigree.pedigree_type: ~5 rows (approximately)
/*!40000 ALTER TABLE `pedigree_type` DISABLE KEYS */;
INSERT INTO `pedigree_type` (`type_id`, `gene`, `type`, `price`, `def`) VALUES
	(1, 'Angus', '100%', 500, 'ABFA'),
	(24, 'Beef Master', 'F2', 300, 'BMBFA'),
	(25, 'Brahman', 'F3', 300, 'BBFA'),
	(26, 'Wagyu', '100%', 500, 'WBFA'),
	(27, 'Charolais', 'F3', 300, 'CBFA');
/*!40000 ALTER TABLE `pedigree_type` ENABLE KEYS */;


-- Dumping structure for table pedigree.privilege
CREATE TABLE IF NOT EXISTS `privilege` (
  `privilege_id` int(11) NOT NULL DEFAULT '0',
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`privilege_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table pedigree.privilege: ~2 rows (approximately)
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
INSERT INTO `privilege` (`privilege_id`, `status`) VALUES
	(1, 'Admin'),
	(2, 'User');
/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;


-- Dumping structure for table pedigree.report
CREATE TABLE IF NOT EXISTS `report` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `pedigree_id` int(11) DEFAULT NULL,
  `bank_id` int(3) NOT NULL DEFAULT '0',
  `data_id` int(11) NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `FK_report_bank` (`bank_id`),
  KEY `FK_report_pedigree` (`pedigree_id`),
  KEY `FK_report_data` (`data_id`),
  CONSTRAINT `FK_report_bank` FOREIGN KEY (`bank_id`) REFERENCES `bank` (`id`),
  CONSTRAINT `FK_report_data` FOREIGN KEY (`data_id`) REFERENCES `data` (`data_id`),
  CONSTRAINT `FK_report_pedigree` FOREIGN KEY (`pedigree_id`) REFERENCES `pedigree` (`pedigree_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table pedigree.report: ~1 rows (approximately)
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` (`report_id`, `date`, `pedigree_id`, `bank_id`, `data_id`) VALUES
	(1, '2017-08-17 08:54:31', 427, 8, 2);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;


-- Dumping structure for table pedigree.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` char(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `privilege_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FK_users_privilege` (`privilege_id`),
  CONSTRAINT `FK_users_privilege` FOREIGN KEY (`privilege_id`) REFERENCES `privilege` (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table pedigree.users: ~4 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`, `username`, `password`, `privilege_id`) VALUES
	(1, 'peddy', '1234', 1),
	(2, 'admin', 'admin', 1),
	(13, 'admin', '1234', 1),
	(18, 'prachaya', 'nack0824771428', 2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
