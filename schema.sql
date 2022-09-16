CREATE DATABASE  IF NOT EXISTS `newuniversity` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `newuniversity`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: newuniversity
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `cid` int unsigned NOT NULL,
  `cred` int unsigned NOT NULL,
  `department` enum('Science','Math','CS','History','LA') NOT NULL,
  `cname` varchar(255) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `department` (`department`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`department`) REFERENCES `department` (`depname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (9,3,'Math','null'),(200,5,'CS','CS 101'),(201,4,'CS','CS 102'),(203,5,'CS','CS 103'),(204,3,'CS','CS 104'),(205,2,'CS','CS 105'),(206,3,'CS','CS 106'),(207,4,'CS','CS 107'),(208,5,'CS','CS 108'),(209,0,'Science','Science 101'),(210,0,'Science','Science 102'),(211,4,'Science','Science 103'),(212,1,'Science','Science 104'),(213,0,'Science','Science 105'),(214,3,'Math','Math 101'),(215,5,'Math','Math 102'),(216,0,'Math','Math 103'),(217,5,'Math','Math 104'),(219,4,'Math','Math 105'),(221,1,'Math','Math 106'),(223,3,'Math','Math 107'),(224,3,'Math','Math 108'),(225,2,'Math','Math 109'),(226,2,'Math','Math 110'),(227,0,'Math','Math 111'),(228,0,'Math','Math 112'),(229,3,'LA','LA 101'),(230,0,'LA','LA 102'),(231,0,'LA','LA 103'),(232,0,'LA','LA 105'),(233,3,'LA','LA 106'),(234,2,'LA','LA 107'),(235,3,'LA','LA 108'),(236,4,'LA','LA 109'),(237,4,'LA','LA 110'),(238,0,'History','History 101'),(239,4,'History','History 102'),(240,4,'History','History 103'),(241,2,'History','History 104'),(242,5,'History','History 105'),(243,4,'History','History 106'),(244,1,'History','History 107'),(245,2,'History','History 108'),(246,1,'History','History 109'),(247,4,'History','History 110'),(248,0,'History','History 111'),(249,3,'History','History 113'),(250,3,'History','History 114'),(251,0,'History','History 115'),(252,1,'History','History 116'),(253,1,'History','History 117');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `depname` enum('Science','Math','CS','History','LA','Art') NOT NULL,
  `depadmin` int unsigned NOT NULL,
  `adminname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`depname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('Science',2,'Jane Doe'),('Math',1,'John Doe'),('CS',3,'Jared Doe'),('History',4,'Joe Doe'),('LA',5,'Bob'),('Art',7,'Moe');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `id` int unsigned NOT NULL,
  `acctype` int unsigned NOT NULL,
  `pass` varchar(50) NOT NULL DEFAULT 'password',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,3,'password'),(2,3,'password'),(3,3,'password'),(4,3,'password'),(5,3,'password'),(7,1,'password'),(16,1,'password'),(19,1,'password'),(66,1,'password'),(99,1,'password'),(102,2,'password'),(130,2,'password'),(154,2,'password'),(160,2,'password'),(170,2,'password'),(177,2,'password'),(179,2,'password'),(187,2,'password'),(189,2,'password'),(194,2,'password'),(200,2,'password'),(787,3,'password');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prereqs`
--

DROP TABLE IF EXISTS `prereqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prereqs` (
  `cid` int unsigned NOT NULL,
  `prereq` int unsigned NOT NULL,
  KEY `cid` (`cid`),
  KEY `prereq` (`prereq`),
  CONSTRAINT `prereqs_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `courses` (`cid`),
  CONSTRAINT `prereqs_ibfk_2` FOREIGN KEY (`prereq`) REFERENCES `courses` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prereqs`
--

LOCK TABLES `prereqs` WRITE;
/*!40000 ALTER TABLE `prereqs` DISABLE KEYS */;
INSERT INTO `prereqs` VALUES (201,200),(203,200),(203,201),(204,201),(204,200),(205,204),(205,203),(206,205),(206,203),(206,201),(206,200),(208,200),(208,200),(211,209),(211,210),(212,200),(212,210),(213,200),(213,201),(213,210),(213,209),(213,211),(213,214),(216,214),(217,215),(219,214),(219,215),(219,200),(250,248),(251,249),(219,200),(252,248),(252,249),(253,248),(253,249),(253,250),(253,251),(253,252),(231,229),(232,230),(233,229),(233,230),(234,231),(234,229),(235,232),(235,230);
/*!40000 ALTER TABLE `prereqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `pid` int unsigned NOT NULL,
  `pname` varchar(100) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `office` int NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (101,'Ester Macklimore','531.808.5357x2251',2147433647),(102,'Theresa James','07813076154',2147283647),(119,'Amy Shumer','(793)417-8631',2137483647),(123,'Bilbo Baggins','(745)979-1109x20388',2144483647),(130,'Ethan Smith','684-284-5137x19368',2147413647),(131,'Sam Sterling','(122)132-8598',2146483647),(137,'Adam Gorgy','595.957.2146x86200',2147183647),(140,'Sally Susu','04513763670',2147283647),(154,'Jack Nester','700.165.7683x66434',2147483647),(157,'Malena Mordor','07469624624',2143483647),(158,'Gary Lord','444-488-7063x7459',2141483647),(159,'Larry Arbor','1-672-583-2414',2127483647),(160,'Terry Thompson','04892012056',2145483647),(170,'Jeannie James','(306)728-2702x31589',2147423647),(177,'John Doe','423.374.2379x30511',2147483647),(179,'Jon Snow','1-110-171-9771x045',2117483647),(181,'Gordo Mcallister','657-055-1617x0666',2142483647),(187,'Johnathon Joestar','1-085-884-9578',2147443647),(189,'Hourdour Bob','+43(0)8128916092',2145483647),(194,'Henry Eric','808-120-1014x7033',2147383647),(200,'Joe','848-213-2239',4);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `register` (
  `rid` int NOT NULL AUTO_INCREMENT,
  `grade` varchar(3) NOT NULL DEFAULT 'N',
  `sid` int unsigned NOT NULL,
  `pid` int unsigned NOT NULL,
  `section` int unsigned NOT NULL,
  `cid` int unsigned NOT NULL,
  PRIMARY KEY (`rid`),
  UNIQUE KEY `regID` (`cid`,`sid`,`pid`),
  KEY `sid` (`sid`),
  KEY `pid` (`pid`),
  CONSTRAINT `register_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `professor` (`pid`),
  CONSTRAINT `register_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `courses` (`cid`),
  CONSTRAINT `register_ibfk_3` FOREIGN KEY (`sid`) REFERENCES `students` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` VALUES (1,'A',4,177,1,201),(2,'A',8,130,1,232),(3,'C',7,160,1,244),(4,'D',24,160,1,244),(5,'F',16,160,1,240),(6,'N',19,160,1,244);
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semester` (
  `section` varchar(255) NOT NULL,
  `stime` time NOT NULL,
  `sday` set('mon','tues','wed','thurs','friday') NOT NULL,
  `cid` int unsigned NOT NULL,
  `pid` int unsigned NOT NULL,
  `sem` varchar(20) NOT NULL,
  PRIMARY KEY (`section`,`cid`),
  KEY `pid` (`pid`),
  KEY `cid` (`cid`),
  CONSTRAINT `semester_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `professor` (`pid`),
  CONSTRAINT `semester_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `courses` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` VALUES ('1','01:20:00','wed',9,102,'Spring'),('1','08:00:00','mon',201,177,'Fall'),('1','08:00:00','thurs',203,187,'Spring'),('1','08:00:00','thurs',207,154,'Winter'),('1','08:00:00','wed',211,102,'Spring'),('1','08:00:00','wed',214,170,'Fall'),('1','08:00:00','mon',216,189,'Fall'),('1','08:00:00','tues',221,102,'Spring'),('1','08:00:00','friday',224,179,'Fall'),('1','08:00:00','thurs',232,130,'Fall'),('1','08:00:00','friday',236,177,'Spring'),('1','08:00:00','tues',239,160,'Summer'),('1','08:00:00','mon',240,160,'Spring'),('1','08:00:00','tues',244,160,'Spring'),('1','08:00:00','mon',253,194,'Summer'),('2','15:00:00','tues',201,177,'Fall');
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `sid` int unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `bday` date NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (0,'Joyce','162-257-8893','1989-07-23'),(2,'Fannie','662.043.3096','1978-07-25'),(3,'Helga','1-431-984-8304','1987-10-18'),(4,'Tavares','+27(4)1898200006','1973-10-09'),(5,'Celestino','1-104-338-5708','2007-11-22'),(6,'Billie','754.226.8373','1970-11-18'),(7,'Shad','(919)484-3088','2013-09-08'),(8,'Armand','1-581-623-1533','1975-07-03'),(9,'Ara','(929)284-9465','1990-01-24'),(10,'Elizabeth','(650)806-9747','2008-10-22'),(11,'Kailee','1-356-770-2611','2005-11-13'),(12,'Danielle','1-415-723-8337','2017-04-03'),(13,'Alaina','247-713-6998','1993-08-11'),(14,'Demond','(868)030-5828','2014-04-30'),(15,'Joan','06069264735','2010-03-28'),(16,'Mazie','282-975-8835','1973-04-02'),(17,'Shyanne','(292)512-4165x912','1992-09-12'),(18,'Savanna','969.558.0566','2005-04-20'),(19,'Sydnie','632-440-0035','1986-02-12'),(20,'Kirsten','(063)925-1589','1981-03-14'),(21,'Eleanore','03272270830','2012-11-01'),(22,'Melyna','585-902-4104','1975-09-19'),(23,'Duane','869-445-3195','1993-12-19'),(24,'Frida','102-428-6268','1994-01-13'),(25,'Addie','1-869-088-9829','1983-06-15'),(26,'Jessica','(805)112-7016','1985-06-24'),(27,'Beaulah','+58(1)3683323246','1994-07-24'),(28,'Ben','1-212-565-4488','1978-12-08'),(29,'Lexus','331-450-8150','1988-08-22'),(30,'Lula','1-275-826-4875','2005-05-25'),(31,'Shany','701-515-4783','2020-10-25'),(32,'Jeramy','676.069.6513','1996-02-25'),(33,'Sigmund','1-137-382-6115','1974-10-19'),(34,'Julie','631.735.7102','1979-04-30'),(35,'Hilton','341.817.5831','1991-11-22'),(36,'Juana','03839964889','1999-04-08'),(37,'Otho','1-980-140-9265','2017-04-07'),(38,'Anya','+26(7)3826576410','2020-11-30'),(39,'Deon','1-363-061-1208','1971-01-31'),(40,'Mossie','02709085721','2016-04-15'),(41,'Waino','1-542-054-9471','2016-09-09'),(42,'Jason','446-442-7011','2015-10-12'),(43,'Zakary','391-885-8277','1981-12-14'),(44,'Nyah','(656)759-6852','2015-07-07'),(45,'Otis','1-677-548-6326','2011-04-22'),(46,'Sincere','963-735-4464','2004-04-05'),(47,'Mariano','146.164.4831','2005-03-14'),(48,'Samara','007.283.4091','2012-06-15'),(49,'Shany','1-478-363-8631','1997-03-28'),(50,'Ruben','529-116-2733','2021-02-07'),(51,'Gwen','516-826-7259','1979-09-24'),(53,'Efrain','+84(6)4578606100','2015-07-13'),(54,'Augustine','1-708-726-9664x04796','2006-03-22'),(55,'Kaylah','879.901.5449','1971-02-28'),(56,'Mozelle','187.288.9911','1976-03-19'),(57,'Tiffany','+83(8)0185021390','1998-03-04'),(58,'Amos','(165)154-7963','2019-01-02'),(59,'Arden','075-405-2978','2018-08-29'),(60,'Darryl','249.996.2956','2014-10-29'),(61,'Raven','+53(2)2259085508','2010-01-14'),(62,'Bret','+88(3)2109282705','2014-09-30'),(63,'Mack','(888)964-6201x9630','1977-01-20'),(64,'Americo','128-515-7850','1987-04-17'),(65,'Annalise','(037)950-1847x431','1971-11-12'),(66,'Daphne','1-548-392-6504','1972-02-15'),(67,'Camille','+58(7)9408058815','1998-12-04'),(68,'Tatum','073.317.2973x48321','1995-03-06'),(69,'Glenna','06615916515','2006-09-01'),(70,'Izaiah','137.390.0127','1982-02-17'),(71,'Deion','1-395-452-5100','1996-07-02'),(72,'Lenny','410-996-0882x1186','1991-02-04'),(73,'Jody','(533)969-8285','2016-04-26'),(74,'Delores','741-455-6942','1976-04-17'),(75,'Sim','(001)655-2354','2018-01-21'),(76,'Jeremie','926-410-9686x72579','1991-03-14'),(77,'Domenica','820.135.9472','2012-04-23'),(78,'Lenna','(727)293-2300','1971-06-29'),(79,'Judd','739.847.0456','2012-07-28'),(80,'Gertrude','428-774-7829','2002-06-15'),(81,'Minerva','278-844-7200x03767','1982-10-05'),(82,'Reynold','+46(6)2470679766','1997-03-29'),(83,'Brenna','021.925.6422','2019-05-10'),(84,'Torey','556.322.5503','2011-10-30'),(85,'Van','(072)436-4260x05292','2011-02-10'),(86,'Pascale','640.874.7257x7185','1984-01-28'),(87,'Rowan','08716828139','2007-01-06'),(88,'Melvina','816.937.5915','1981-11-15'),(89,'Rupert','550.455.0434','2016-01-27'),(90,'Monserrate','1-036-342-5267','1975-03-27'),(91,'Elinore','393-968-1749','1984-07-15'),(92,'Adriana','590-040-4625','1996-03-31'),(93,'Phoebe','113-525-6123','2007-08-25'),(94,'Aryanna','317-982-6536','1991-04-27'),(95,'Julien','1-360-015-1109','1997-12-18'),(96,'Mason','160.917.1971','1979-12-21'),(97,'Fatima','1-480-026-4585','1983-05-31'),(98,'Jazmyn','236.410.9334','1979-01-30'),(99,'Brant','1-328-810-1067','1999-11-22'),(100,'Trycia','(588)069-2651','2020-02-04'),(101,'Kari','(698)239-0708','1975-10-08'),(787,'Moe','848-213-2239','1969-09-21');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taken`
--

DROP TABLE IF EXISTS `taken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taken` (
  `sid` int unsigned NOT NULL,
  `cid` int unsigned NOT NULL,
  `grade` int unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`sid`,`cid`),
  KEY `cid` (`cid`),
  CONSTRAINT `taken_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `courses` (`cid`),
  CONSTRAINT `taken_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `students` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taken`
--

LOCK TABLES `taken` WRITE;
/*!40000 ALTER TABLE `taken` DISABLE KEYS */;
INSERT INTO `taken` VALUES (16,200,97),(16,201,98),(16,238,94),(16,239,95),(16,240,96),(19,200,95),(19,201,80),(66,200,77),(66,201,73),(66,214,76),(66,215,74),(66,229,90),(66,230,98),(66,238,78),(66,239,81),(99,229,91),(99,230,92),(99,231,93);
/*!40000 ALTER TABLE `taken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-15 21:49:44
