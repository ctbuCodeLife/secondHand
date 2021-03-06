/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;

/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;

/*!40103 SET SQL_NOTES='ON' */;

DROP DATABASE
IF EXISTS `second_hand`;

CREATE DATABASE `second_hand` DEFAULT
CHARSET utf8;
USE second_hand;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `level` tinyint DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_admin_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uId` int(11) NOT NULL,
  `pId` int(11) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `isBuy` enum('是','否') NOT NULL DEFAULT '否',
  `totalPrice` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`uId`),
  KEY `fk_product_id` (`pId`),
  CONSTRAINT `fk_cart_user_id` FOREIGN KEY (`uId`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_cart_product_id` FOREIGN KEY (`pId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hot
-- ----------------------------
DROP TABLE IF EXISTS `hot`;
CREATE TABLE `hot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_id` (`pId`),
  CONSTRAINT `fk_hot_product_id` FOREIGN KEY (`pId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for kind
-- ----------------------------
DROP TABLE IF EXISTS `kind`;
CREATE TABLE `kind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kName` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_kind_kname` (`kName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uId` int(11) NOT NULL,
  `kId` int(11) NOT NULL,
  `pName` varchar(64) DEFAULT NULL,
  `pDesc` text,
  `pNum` int(11) DEFAULT NULL,
  `pImage` varchar(255) DEFAULT NULL,
  `realPrice` int(11) DEFAULT '0',
  `originPrice` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_product` (`uId`,`pName`),
  KEY `fk_kid` (`kId`),
  KEY `fk_uid` (`uId`),
  CONSTRAINT `fk_product_kind_id` FOREIGN KEY (`kId`) REFERENCES `kind` (`id`),
  CONSTRAINT `fk_product_user_id` FOREIGN KEY (`uId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100032 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for product_image
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pId` int(11) NOT NULL,
  `imageType` varchar(32) DEFAULT NULL,
  `imageName` varchar(64) DEFAULT NULL,
  `imageSrc` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unque_image_name` (`imageName`),
  KEY `fk_product_id` (`pId`),
  CONSTRAINT `fk_product_image_product_id` FOREIGN KEY (`pId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100032 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uId` int(11) NOT NULL,
  `pId` int(11) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `totalPrice` int(11) DEFAULT '0',
  `orderDate` datetime DEFAULT NULL,
  `invoiceNo` char(15) DEFAULT NULL,
  `orderStatus` varchar(10) DEFAULT NULL,
  `delivDate` datetime DEFAULT NULL,
  `contactMan` varchar(10) DEFAULT NULL,
  `contactTel` varchar(11) DEFAULT NULL,
  `contactAddr` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`uId`),
  KEY `fk_product_id` (`pId`),
  CONSTRAINT `fk_sales_user_id` FOREIGN KEY (`uId`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_sales_product_id` FOREIGN KEY (`pId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `sex` varchar(20) DEFAULT '保密',
  `level` tinyint DEFAULT '1',
  `score` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

