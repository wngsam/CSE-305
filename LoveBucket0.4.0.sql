CREATE DATABASE  IF NOT EXISTS `love_bucket` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `love_bucket`;
-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: 127.0.0.1    Database: love_bucket
-- ------------------------------------------------------
-- Server version	5.6.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `OwnerSSN` char(11) NOT NULL DEFAULT '',
  `CardNumber` bigint(16) NOT NULL DEFAULT '0',
  `AcctNum` char(30) NOT NULL DEFAULT '',
  `AcctCreationDate` date DEFAULT NULL,
  PRIMARY KEY (`OwnerSSN`,`CardNumber`,`AcctNum`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`OwnerSSN`) REFERENCES `user` (`SSN`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('555-55-5555',349454276731232,'23456','2012-09-07'),('555-55-5555',5186330464994532,'12345','2013-10-07'),('666-66-6666',5192383525185287,'34567','2013-09-23'),('777-77-7777',5144751168293870,'45678','2014-05-28'),('888-88-8888',5167593514262698,'56789','2014-04-22'),('999-99-9999',4482704287348312,'67891','2011-10-07');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blinddate`
--

DROP TABLE IF EXISTS `blinddate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blinddate` (
  `ProfileA` char(20) NOT NULL DEFAULT '',
  `ProfileB` char(20) NOT NULL DEFAULT '',
  `ProfileC` char(20) NOT NULL DEFAULT '',
  `Date_Time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ProfileA`,`ProfileB`,`ProfileC`,`Date_Time`),
  KEY `ProfileB` (`ProfileB`),
  KEY `ProfileC` (`ProfileC`),
  CONSTRAINT `blinddate_ibfk_1` FOREIGN KEY (`ProfileA`) REFERENCES `profile` (`ProfileID`) ON DELETE CASCADE,
  CONSTRAINT `blinddate_ibfk_2` FOREIGN KEY (`ProfileB`) REFERENCES `profile` (`ProfileID`) ON DELETE CASCADE,
  CONSTRAINT `blinddate_ibfk_3` FOREIGN KEY (`ProfileC`) REFERENCES `profile` (`ProfileID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blinddate`
--

LOCK TABLES `blinddate` WRITE;
/*!40000 ALTER TABLE `blinddate` DISABLE KEYS */;
INSERT INTO `blinddate` VALUES ('Isabelle2014','Fletcher2013','VazquezFromAlajuela','2014-10-07 09:56:08'),('DesiraeBerg','VazquezFromAlajuela','Fletcher_Trujillo','2014-10-04 13:59:20');
/*!40000 ALTER TABLE `blinddate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date`
--

DROP TABLE IF EXISTS `date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date` (
  `Profile1` char(20) NOT NULL DEFAULT '',
  `Profile2` char(20) NOT NULL DEFAULT '',
  `CustRep` char(11) DEFAULT NULL,
  `Date_Time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Location` varchar(100) DEFAULT NULL,
  `BookingFee` decimal(10,2) DEFAULT NULL,
  `Comments` text,
  `User1Rating` int(11) DEFAULT NULL,
  `User2Rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`Profile1`,`Profile2`,`Date_Time`),
  KEY `Profile2` (`Profile2`),
  KEY `CustRep` (`CustRep`),
  CONSTRAINT `date_ibfk_1` FOREIGN KEY (`Profile1`) REFERENCES `profile` (`ProfileID`) ON DELETE CASCADE,
  CONSTRAINT `date_ibfk_2` FOREIGN KEY (`Profile2`) REFERENCES `profile` (`ProfileID`) ON DELETE CASCADE,
  CONSTRAINT `date_ibfk_3` FOREIGN KEY (`CustRep`) REFERENCES `employee` (`SSN`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date`
--

LOCK TABLES `date` WRITE;
/*!40000 ALTER TABLE `date` DISABLE KEYS */;
INSERT INTO `date` VALUES ('Brenna_Berlin','DesiraeBerg','333-33-3333','2014-10-06 12:21:06','The Mall',36.46,'Comments Here',2,3),('Fletcher2013','VazquezFromAlajuela','333-33-3333','2014-10-06 04:30:52','Ruvos Restaurant',42.75,'Comments Here',3,1),('Isabelle2013','DesiraeBerg','222-22-2222','2014-10-04 21:39:42','Port Jeff Cinema',65.25,'Comments Here',4,5),('Isabelle2014','VazquezFromAlajuela','222-22-2222','2014-10-06 21:49:30','The Mall',90.91,'Comments Here',3,3),('VazquezFromAlajuela','Brenna_Berlin','444-44-4444','2014-10-06 05:34:04','Turking Restaurant',69.26,'Comments Here',4,4);
/*!40000 ALTER TABLE `date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `SSN` char(11) NOT NULL DEFAULT '',
  `Role` varchar(50) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `HourlyRate` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`SSN`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `person` (`SSN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('111-11-1111','Manager','2014-10-04',250.00),('222-22-2222','CustRep','2014-10-04',150.00),('333-33-3333','CustRep','2014-10-04',100.00),('444-44-4444','CustRep','2014-10-04',75.00);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `Liker` char(20) NOT NULL DEFAULT '',
  `Likee` char(20) NOT NULL DEFAULT '',
  `Date_Time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`Liker`,`Likee`,`Date_Time`),
  KEY `Likee` (`Likee`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`Liker`) REFERENCES `profile` (`ProfileID`) ON DELETE CASCADE,
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`Likee`) REFERENCES `profile` (`ProfileID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES ('VazquezFromAlajuela','Brenna_Berlin','2014-10-06 21:13:02'),('Brenna_Berlin','DesiraeBerg','2014-10-05 05:05:08'),('Brenna_Berlin','DesiraeBerg','2014-10-05 11:02:05'),('Isabelle2013','DesiraeBerg','2014-10-06 23:06:12'),('Isabelle2014','DesiraeBerg','2014-10-07 21:04:09'),('Fletcher2013','VazquezFromAlajuela','2014-10-06 03:46:48'),('Isabelle2013','VazquezFromAlajuela','2014-10-08 09:15:49'),('Isabelle2014','VazquezFromAlajuela','2014-10-06 05:28:39');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pendingdate`
--

DROP TABLE IF EXISTS `pendingdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pendingdate` (
  `profile1` char(20) DEFAULT NULL,
  `profile2` char(20) DEFAULT NULL,
  `id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pendingdate`
--

LOCK TABLES `pendingdate` WRITE;
/*!40000 ALTER TABLE `pendingdate` DISABLE KEYS */;
INSERT INTO `pendingdate` VALUES ('Brenna_Berlin','Brenna_Berlin',2),('Isabelle2013','Brenna_Berlin',9),('DesiraeBerg','Brenna_Berlin',10),('VazquezFromAlajuela','Brenna_Berlin',12),('VazquezFromAlajuela','Fletcher2013',13);
/*!40000 ALTER TABLE `pendingdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `SSN` char(11) NOT NULL DEFAULT '',
  `Password` char(80) DEFAULT NULL,
  `FirstName` varchar(30) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Street` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(30) DEFAULT NULL,
  `Zipcode` int(11) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telephone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES ('111-11-1111','77af778b51abd4a3c51c5ddd97204a9c3ae614ebccb75a606c3b6865aed6744e','Veronica','Alvarado','45 Rockefeller Plaza','New York','New York',10111,'manager@manager.com','(612) 506-2244'),('213124','5a9cea259640cac7ec4428c3d584606845c2cb0d6c353252c6487b2cc0be6653','Barry','Barry','Alabama Ave','woodside','NY',122,'barry@barry.com','124124'),('222-22-2222','6c83c73a168e7142e52e499d16a7d48dbecfecfe30978a5691653664e0a304ac','Bo','Osborne','45 Rockefeller Plaza','New York','New York',10111,'mattis.Integer.eu@elit.org','(592) 765-8277'),('333-33-3333','033c44f9940d1f5245b8247c5f2748c1b461105f3d82cbf2ac57af44f709c263','Hashim','Ross','350 5th Ave','New York','New York',10118,'vulputate@Curae.co.uk','(276) 634-6949'),('444-44-4444','40064eb6317f36e4462959caea345bcc09a6b5bc02320e7c50acf14d2dbe3764','Shaine','Terrell','350 5th Ave','New York','New York',10118,'tincidunt.nibh@risus.com','(600) 803-9508'),('555-55-5555','733eaaab07de3eb34d2985aa5e091449271f80c42fcf0dcb87e9a1c86ec60618','Isabelle','Odonnell','Schomburg Apartments, 350 Circle Road','Stony Brook','New York',11790,'magna.tellus.faucibus@amet.edu','(934) 241-3862'),('666-66-6666','aa103d713ae0aa2531d9feb69cd6b3240204b6349780d9f41b8de22736dddad6','Fletcher','Trujillo','700 Health Sciences Dr','Stony Brook','New York',11790,'elementum.dui.quis@utlacus.net','(990) 760-1480'),('777-77-7777','c8b4a3833c3bc48cd15430f18005b5365b6b46e44fab8f30cc0a21e86ebb8d56','Malachi','Vazquez','700 Health Sciences Dr','Stony Brook','New York',11790,'tellus.lorem.eu@atlacus.org','(226) 193-8257'),('888-88-8888','2010d49fb663d97b3415cadce379117ee2c72683bfb37516f8c508e0993ee2cd','Brenna','Cross','Schomburg Apartments, 350 Circle Road','Stony Brook','New York',11790,'sed.turpis@vehiculaaliquet.com','(968) 409-7641'),('999-99-9999','ccd4dbcb4e2e04749bf725887d5f58c7922d7f1baddf031212b228199bf37599','Desirae','Berg','116th St & Broadway','New York','New York',10027,'vitae@magnased.com','(237) 321-3189');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `ProfileID` char(20) NOT NULL DEFAULT '',
  `OwnerSSN` char(11) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `DatingAgeRangeStart` int(11) DEFAULT NULL,
  `DatingAgeRangeEnd` int(11) DEFAULT NULL,
  `DatinGeoRange` int(11) DEFAULT NULL,
  `M_F` varchar(10) DEFAULT NULL,
  `Hobbies` varchar(1000) DEFAULT NULL,
  `Height` decimal(2,1) DEFAULT NULL,
  `Weight` int(11) DEFAULT NULL,
  `HairColor` varchar(20) DEFAULT NULL,
  `CreationDate` datetime NOT NULL,
  `LastModDate` datetime NOT NULL,
  PRIMARY KEY (`ProfileID`),
  KEY `OwnerSSN` (`OwnerSSN`),
  CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`OwnerSSN`) REFERENCES `user` (`SSN`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES ('Brenna_Berlin','888-88-8888',22,22,23,4,'Female','Whatever',6.9,120,'Blonde','2014-10-04 20:20:55','2014-10-07 12:21:58'),('DesiraeBerg','999-99-9999',20,17,25,5,'Male','Water sports, Football',5.6,200,'Red','2014-10-04 19:13:18','2014-10-04 15:54:48'),('Fletcher2013','666-66-6666',25,20,28,18,'Female','Reading, Basketball',5.6,150,'Brown','2014-10-04 19:21:37','2014-10-07 01:25:55'),('Fletcher_Trujillo','666-66-6666',23,19,30,8,'Female','Shopping, Volleyball',5.6,150,'Brown','2014-10-04 18:26:49','2014-10-05 00:42:03'),('Isabelle2013','555-55-5555',22,20,22,29,'Female','Shopping, Dance, Mountain Claiming',5.7,120,'Black','2014-10-04 00:37:12','2014-10-04 17:08:38'),('Isabelle2014','555-55-5555',22,20,25,5,'Female','Shopping, Cooking',5.7,110,'Black','2014-10-04 22:43:25','2014-10-09 11:51:19'),('VazquezFromAlajuela','777-77-7777',26,20,28,15,'Male','Hunting, Running',5.7,170,'Black','2014-10-04 17:13:30','2014-10-07 04:16:43');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suggestedby`
--

DROP TABLE IF EXISTS `suggestedby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suggestedby` (
  `CustRep` char(11) NOT NULL DEFAULT '',
  `Profile1` char(20) NOT NULL DEFAULT '',
  `Profile2` char(20) NOT NULL DEFAULT '',
  `Date_Time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`CustRep`,`Profile1`,`Profile2`,`Date_Time`),
  KEY `Profile1` (`Profile1`),
  KEY `Profile2` (`Profile2`),
  CONSTRAINT `suggestedby_ibfk_1` FOREIGN KEY (`Profile1`) REFERENCES `profile` (`ProfileID`) ON DELETE CASCADE,
  CONSTRAINT `suggestedby_ibfk_2` FOREIGN KEY (`Profile2`) REFERENCES `profile` (`ProfileID`) ON DELETE CASCADE,
  CONSTRAINT `suggestedby_ibfk_3` FOREIGN KEY (`CustRep`) REFERENCES `employee` (`SSN`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggestedby`
--

LOCK TABLES `suggestedby` WRITE;
/*!40000 ALTER TABLE `suggestedby` DISABLE KEYS */;
INSERT INTO `suggestedby` VALUES ('222-22-2222','Fletcher2013','DesiraeBerg','2014-10-05 15:07:44'),('333-33-3333','Fletcher_Trujillo','VazquezFromAlajuela','2014-10-09 20:59:22');
/*!40000 ALTER TABLE `suggestedby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `SSN` char(11) NOT NULL DEFAULT '',
  `PPP` varchar(50) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `DateOfLastAct` datetime DEFAULT NULL,
  PRIMARY KEY (`SSN`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `person` (`SSN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('555-55-5555','Super-User',3,'2014-10-07 05:53:13'),('666-66-6666','Good-User',3,'2014-10-05 05:27:28'),('777-77-7777','Good-User',4,'2014-10-08 22:37:07'),('888-88-8888','User-User',3,'2014-10-04 09:10:12'),('999-99-9999','User-User',2,'2014-10-05 18:28:02');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-04  4:32:58
