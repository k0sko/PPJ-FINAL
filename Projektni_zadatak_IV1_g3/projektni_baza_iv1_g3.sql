/*
Navicat MySQL Data Transfer

Source Server         : aaa
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : projektni_baza_iv1_g3

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2020-04-26 15:21:51
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `artikal`
-- ----------------------------
DROP TABLE IF EXISTS `artikal`;
CREATE TABLE `artikal` (
  `artikal_id` int(11) NOT NULL auto_increment,
  `naziv_artikla` varchar(50) default NULL,
  `vrsta_artikla` varchar(50) default NULL,
  `cijena` double(11,2) default NULL,
  PRIMARY KEY  (`artikal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of artikal
-- ----------------------------
INSERT INTO `artikal` VALUES ('1', 'kisela pavlaka', 'hrana', '1.95');
INSERT INTO `artikal` VALUES ('2', 'Sunka pureca', 'hrana', '7.95');
INSERT INTO `artikal` VALUES ('3', 'Kupka NIVEA', 'higijenski proizvod', '3.50');
INSERT INTO `artikal` VALUES ('4', 'Usisivac', 'Kucanski aparat', '49.90');
INSERT INTO `artikal` VALUES ('5', 'Deterdzent za sude', 'Kucanski aparat', '3.95');
INSERT INTO `artikal` VALUES ('6', 'Suncokretovo ulje', 'hrana', '2.50');
INSERT INTO `artikal` VALUES ('7', 'grijalica', 'kucanski apart', '33.00');
INSERT INTO `artikal` VALUES ('8', 'cips', 'hrana', '0.50');
INSERT INTO `artikal` VALUES ('9', 'Kecap', 'hrana', '1.80');
INSERT INTO `artikal` VALUES ('10', 'Biber', 'Hrana', '2.80');

-- ----------------------------
-- Table structure for `kupac`
-- ----------------------------
DROP TABLE IF EXISTS `kupac`;
CREATE TABLE `kupac` (
  `Kupac_id` int(11) NOT NULL auto_increment,
  `Ime` varchar(50) default NULL,
  `Prezime` varchar(50) default NULL,
  `grad` varchar(50) default NULL,
  `adresa` varchar(50) default NULL,
  `telefon` varchar(50) default NULL,
  `user` varchar(50) default NULL,
  `pass` varchar(50) default NULL,
  PRIMARY KEY  (`Kupac_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kupac
-- ----------------------------
INSERT INTO `kupac` VALUES ('1', 'Hamza', 'Pajevic', 'Sarajevo', 'dsa 23', '031 654 645', 'admin', 'admin');
INSERT INTO `kupac` VALUES ('2', 'Ismar', 'Polovina', 'Mostar', 'ret 43', '062 786 645', '2Ismar', '2Ismar2');
INSERT INTO `kupac` VALUES ('3', 'Ahmed', 'Cosovic', 'Sarajevo', 'Ilidza 11', '063 034 364', '3Ahmed', '3Ahmed3');
INSERT INTO `kupac` VALUES ('4', 'Berin', 'Zlatic', 'Mostar', 'Velesic 32', '056 644 465', '4Berin', '4Berin4');
INSERT INTO `kupac` VALUES ('5', 'Edvin', 'Obralija', 'Sarajevo', 'Lik 45', '066 456 654', '5Edvin', '5Edvin5');
INSERT INTO `kupac` VALUES ('6', 'Nedim', 'Dzindo', 'Ilidza', 'Buljakovo 12', '062 064 063', '6Nedim', '6Nedim6');
INSERT INTO `kupac` VALUES ('7', 'Adis', 'Kos', 'Tuzla', 'ilidza 12', '064 161 645', '7adis', '7adis7');
INSERT INTO `kupac` VALUES ('8', 'Berin', 'Masovic', 'Sarajevo', 'ter 43', '063 034 364', '8Berin', '8Berin8');

-- ----------------------------
-- Table structure for `narudzbenica`
-- ----------------------------
DROP TABLE IF EXISTS `narudzbenica`;
CREATE TABLE `narudzbenica` (
  `Narudžbenica_id` int(11) NOT NULL auto_increment,
  `kupac_id` int(11) NOT NULL,
  `Datum_narudžbe` date NOT NULL,
  PRIMARY KEY  (`Narudžbenica_id`),
  KEY `Kupac_id` (`kupac_id`),
  CONSTRAINT `Kupac_id` FOREIGN KEY (`kupac_id`) REFERENCES `kupac` (`Kupac_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of narudzbenica
-- ----------------------------
INSERT INTO `narudzbenica` VALUES ('1', '1', '2020-04-16');
INSERT INTO `narudzbenica` VALUES ('2', '2', '2020-04-21');
INSERT INTO `narudzbenica` VALUES ('3', '2', '2020-04-21');
INSERT INTO `narudzbenica` VALUES ('4', '2', '2020-04-21');
INSERT INTO `narudzbenica` VALUES ('5', '2', '2020-04-21');
INSERT INTO `narudzbenica` VALUES ('6', '2', '2020-04-21');
INSERT INTO `narudzbenica` VALUES ('8', '2', '2020-04-21');
INSERT INTO `narudzbenica` VALUES ('9', '2', '2020-04-21');
INSERT INTO `narudzbenica` VALUES ('10', '2', '2020-04-21');
INSERT INTO `narudzbenica` VALUES ('11', '2', '2020-04-21');
INSERT INTO `narudzbenica` VALUES ('12', '2', '2020-04-21');
INSERT INTO `narudzbenica` VALUES ('13', '2', '2020-04-21');
INSERT INTO `narudzbenica` VALUES ('14', '2', '2020-04-21');
INSERT INTO `narudzbenica` VALUES ('15', '2', '2020-04-21');
INSERT INTO `narudzbenica` VALUES ('16', '2', '2020-04-21');
INSERT INTO `narudzbenica` VALUES ('20', '2', '2020-04-21');
INSERT INTO `narudzbenica` VALUES ('21', '2', '2020-04-26');

-- ----------------------------
-- Table structure for `skladiste`
-- ----------------------------
DROP TABLE IF EXISTS `skladiste`;
CREATE TABLE `skladiste` (
  `ID` int(11) NOT NULL auto_increment,
  `artikal_id` int(11) default NULL,
  `kolicina_stanje` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `sartikal_id` (`artikal_id`),
  CONSTRAINT `sartikal_id` FOREIGN KEY (`artikal_id`) REFERENCES `artikal` (`artikal_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of skladiste
-- ----------------------------
INSERT INTO `skladiste` VALUES ('1', '1', '46');
INSERT INTO `skladiste` VALUES ('2', '2', '75');
INSERT INTO `skladiste` VALUES ('3', '7', '59');
INSERT INTO `skladiste` VALUES ('4', '8', '52');
INSERT INTO `skladiste` VALUES ('5', '9', '58');
INSERT INTO `skladiste` VALUES ('6', '10', '58');

-- ----------------------------
-- Table structure for `stavka_narudzbenica`
-- ----------------------------
DROP TABLE IF EXISTS `stavka_narudzbenica`;
CREATE TABLE `stavka_narudzbenica` (
  `stavka_id` int(11) NOT NULL auto_increment,
  `narudzbenica_id` int(11) NOT NULL,
  `artikal_id` int(11) NOT NULL,
  `kolicina` int(11) NOT NULL,
  PRIMARY KEY  (`stavka_id`),
  KEY `Narudžbenica_id` (`narudzbenica_id`),
  KEY `artikal_id` (`artikal_id`),
  CONSTRAINT `Narudžbenica_id` FOREIGN KEY (`narudzbenica_id`) REFERENCES `narudzbenica` (`Narudžbenica_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `artikal_id` FOREIGN KEY (`artikal_id`) REFERENCES `artikal` (`artikal_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of stavka_narudzbenica
-- ----------------------------
INSERT INTO `stavka_narudzbenica` VALUES ('1', '1', '1', '3');
INSERT INTO `stavka_narudzbenica` VALUES ('2', '3', '1', '6');
INSERT INTO `stavka_narudzbenica` VALUES ('3', '3', '2', '3');
INSERT INTO `stavka_narudzbenica` VALUES ('4', '9', '2', '0');
INSERT INTO `stavka_narudzbenica` VALUES ('5', '10', '7', '1');
INSERT INTO `stavka_narudzbenica` VALUES ('6', '10', '8', '2');
INSERT INTO `stavka_narudzbenica` VALUES ('7', '11', '7', '0');
INSERT INTO `stavka_narudzbenica` VALUES ('8', '12', '7', '0');
INSERT INTO `stavka_narudzbenica` VALUES ('9', '13', '7', '0');
INSERT INTO `stavka_narudzbenica` VALUES ('10', '14', '1', '0');
INSERT INTO `stavka_narudzbenica` VALUES ('11', '20', '2', '9');
INSERT INTO `stavka_narudzbenica` VALUES ('12', '21', '10', '11');
INSERT INTO `stavka_narudzbenica` VALUES ('13', '21', '9', '11');
INSERT INTO `stavka_narudzbenica` VALUES ('14', '21', '7', '5');
