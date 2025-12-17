-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: myproject
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollment` (
  `nfcid` int(10) unsigned NOT NULL,
  `fname` enum('gym','sauna','workplace') NOT NULL,
  `beggining` timestamp NOT NULL,
  `ending` timestamp NULL DEFAULT NULL,
  KEY `visitor` (`nfcid`),
  KEY `fid` (`fname`),
  KEY `enrolled_nfcid_fname_idx` (`nfcid`,`fname`),
  CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`nfcid`) REFERENCES `visitor` (`nfcid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (2,'gym','2021-06-07 11:10:42',NULL),(6,'gym','2021-06-16 07:10:42',NULL),(10,'gym','2021-06-11 08:10:42','2021-06-15 09:06:47'),(11,'gym','2021-06-11 08:10:43','2021-06-15 09:06:50'),(1,'workplace','2021-06-07 11:10:40',NULL),(2,'workplace','2021-06-07 11:10:42',NULL),(3,'workplace','2021-06-07 11:10:40',NULL),(13,'workplace','2021-06-14 13:12:40',NULL),(1,'sauna','2021-06-09 16:10:40','2021-06-10 12:10:40'),(2,'sauna','2021-06-09 16:10:41','2021-06-10 12:10:41'),(3,'sauna','2021-06-09 16:10:42','2021-06-10 12:10:40'),(1,'sauna','2021-06-15 19:10:40','2021-06-16 11:10:40'),(2,'sauna','2021-06-15 19:10:41','2021-06-16 11:10:40'),(3,'sauna','2021-06-15 19:10:40','2021-06-16 11:10:42'),(4,'sauna','2021-06-14 07:10:40',NULL),(5,'sauna','2021-06-14 07:10:41',NULL),(10,'sauna','2021-06-11 08:10:42','2021-06-15 09:06:47'),(11,'sauna','2021-06-11 08:10:43','2021-06-15 09:06:50'),(13,'sauna','2021-06-15 19:10:43','2021-06-16 13:10:40'),(14,'sauna','2021-06-15 19:10:44','2021-06-16 13:10:42'),(6,'sauna','2021-06-16 07:10:42',NULL),(9,'sauna','2021-06-16 07:10:43',NULL);
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hallway`
--

DROP TABLE IF EXISTS `hallway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hallway` (
  `floor` tinyint(3) unsigned NOT NULL,
  `orientation` enum('south','east','north','west') NOT NULL,
  `hid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`hid`,`orientation`),
  CONSTRAINT `hallway_ibfk_1` FOREIGN KEY (`hid`) REFERENCES `location` (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hallway`
--

LOCK TABLES `hallway` WRITE;
/*!40000 ALTER TABLE `hallway` DISABLE KEYS */;
INSERT INTO `hallway` VALUES (1,'north',1),(1,'east',2),(1,'south',3),(1,'west',4),(2,'north',5),(2,'east',6),(2,'south',7),(2,'west',8),(3,'north',9),(3,'east',10),(3,'south',11),(3,'west',12),(4,'north',13),(4,'east',14),(4,'south',15),(4,'west',16),(5,'north',17),(5,'east',18),(5,'south',19),(5,'west',20);
/*!40000 ALTER TABLE `hallway` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `description` enum('room','hallway','elevator','bar','restaurant','workplace','gym','sauna','hairstyle') NOT NULL,
  `lid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=581 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES ('hallway',1),('hallway',2),('hallway',3),('hallway',4),('hallway',5),('hallway',6),('hallway',7),('hallway',8),('hallway',9),('hallway',10),('hallway',11),('hallway',12),('hallway',13),('hallway',14),('hallway',15),('hallway',16),('hallway',17),('hallway',18),('hallway',19),('hallway',20),('elevator',21),('elevator',22),('elevator',23),('elevator',24),('elevator',25),('bar',26),('bar',27),('bar',28),('bar',29),('bar',30),('bar',31),('restaurant',32),('restaurant',33),('restaurant',34),('restaurant',35),('workplace',36),('workplace',37),('workplace',38),('workplace',39),('workplace',40),('workplace',41),('workplace',42),('workplace',43),('workplace',44),('workplace',45),('gym',46),('gym',47),('gym',48),('gym',49),('sauna',50),('sauna',51),('sauna',52),('sauna',53),('sauna',54),('sauna',55),('sauna',56),('sauna',57),('sauna',58),('sauna',59),('hairstyle',60),('room',101),('room',102),('room',103),('room',104),('room',105),('room',106),('room',107),('room',108),('room',109),('room',110),('room',111),('room',112),('room',113),('room',114),('room',115),('room',116),('room',117),('room',118),('room',119),('room',120),('room',121),('room',122),('room',123),('room',124),('room',125),('room',126),('room',127),('room',128),('room',129),('room',130),('room',131),('room',132),('room',133),('room',134),('room',135),('room',136),('room',137),('room',138),('room',139),('room',140),('room',141),('room',142),('room',143),('room',144),('room',145),('room',146),('room',147),('room',148),('room',149),('room',150),('room',151),('room',152),('room',153),('room',154),('room',155),('room',156),('room',157),('room',158),('room',159),('room',160),('room',161),('room',162),('room',163),('room',164),('room',165),('room',166),('room',167),('room',168),('room',169),('room',170),('room',171),('room',172),('room',173),('room',174),('room',175),('room',176),('room',177),('room',178),('room',179),('room',180),('room',201),('room',202),('room',203),('room',204),('room',205),('room',206),('room',207),('room',208),('room',209),('room',210),('room',211),('room',212),('room',213),('room',214),('room',215),('room',216),('room',217),('room',218),('room',219),('room',220),('room',221),('room',222),('room',223),('room',224),('room',225),('room',226),('room',227),('room',228),('room',229),('room',230),('room',231),('room',232),('room',233),('room',234),('room',235),('room',236),('room',237),('room',238),('room',239),('room',240),('room',241),('room',242),('room',243),('room',244),('room',245),('room',246),('room',247),('room',248),('room',249),('room',250),('room',251),('room',252),('room',253),('room',254),('room',255),('room',256),('room',257),('room',258),('room',259),('room',260),('room',261),('room',262),('room',263),('room',264),('room',265),('room',266),('room',267),('room',268),('room',269),('room',270),('room',271),('room',272),('room',273),('room',274),('room',275),('room',276),('room',277),('room',278),('room',279),('room',280),('room',301),('room',302),('room',303),('room',304),('room',305),('room',306),('room',307),('room',308),('room',309),('room',310),('room',311),('room',312),('room',313),('room',314),('room',315),('room',316),('room',317),('room',318),('room',319),('room',320),('room',321),('room',322),('room',323),('room',324),('room',325),('room',326),('room',327),('room',328),('room',329),('room',330),('room',331),('room',332),('room',333),('room',334),('room',335),('room',336),('room',337),('room',338),('room',339),('room',340),('room',341),('room',342),('room',343),('room',344),('room',345),('room',346),('room',347),('room',348),('room',349),('room',350),('room',351),('room',352),('room',353),('room',354),('room',355),('room',356),('room',357),('room',358),('room',359),('room',360),('room',361),('room',362),('room',363),('room',364),('room',365),('room',366),('room',367),('room',368),('room',369),('room',370),('room',371),('room',372),('room',373),('room',374),('room',375),('room',376),('room',377),('room',378),('room',379),('room',380),('room',401),('room',402),('room',403),('room',404),('room',405),('room',406),('room',407),('room',408),('room',409),('room',410),('room',411),('room',412),('room',413),('room',414),('room',415),('room',416),('room',417),('room',418),('room',419),('room',420),('room',421),('room',422),('room',423),('room',424),('room',425),('room',426),('room',427),('room',428),('room',429),('room',430),('room',431),('room',432),('room',433),('room',434),('room',435),('room',436),('room',437),('room',438),('room',439),('room',440),('room',441),('room',442),('room',443),('room',444),('room',445),('room',446),('room',447),('room',448),('room',449),('room',450),('room',451),('room',452),('room',453),('room',454),('room',455),('room',456),('room',457),('room',458),('room',459),('room',460),('room',461),('room',462),('room',463),('room',464),('room',465),('room',466),('room',467),('room',468),('room',469),('room',470),('room',471),('room',472),('room',473),('room',474),('room',475),('room',476),('room',477),('room',478),('room',479),('room',480),('room',501),('room',502),('room',503),('room',504),('room',505),('room',506),('room',507),('room',508),('room',509),('room',510),('room',511),('room',512),('room',513),('room',514),('room',515),('room',516),('room',517),('room',518),('room',519),('room',520),('room',521),('room',522),('room',523),('room',524),('room',525),('room',526),('room',527),('room',528),('room',529),('room',530),('room',531),('room',532),('room',533),('room',534),('room',535),('room',536),('room',537),('room',538),('room',539),('room',540),('room',541),('room',542),('room',543),('room',544),('room',545),('room',546),('room',547),('room',548),('room',549),('room',550),('room',551),('room',552),('room',553),('room',554),('room',555),('room',556),('room',557),('room',558),('room',559),('room',560),('room',561),('room',562),('room',563),('room',564),('room',565),('room',566),('room',567),('room',568),('room',569),('room',570),('room',571),('room',572),('room',573),('room',574),('room',575),('room',576),('room',577),('room',578),('room',579),('room',580);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passing_log`
--

DROP TABLE IF EXISTS `passing_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passing_log` (
  `nfcid` int(10) unsigned NOT NULL,
  `lid` smallint(5) unsigned NOT NULL,
  `entered` timestamp NULL DEFAULT NULL,
  `exited` timestamp NULL DEFAULT NULL,
  `charged` float unsigned DEFAULT NULL,
  KEY `lid` (`lid`),
  KEY `passing_log_ibfk_1` (`nfcid`),
  KEY `log_enter_exit_idx` (`entered`,`exited`),
  CONSTRAINT `passing_log_ibfk_1` FOREIGN KEY (`nfcid`) REFERENCES `visitor` (`nfcid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `passing_log_ibfk_2` FOREIGN KEY (`lid`) REFERENCES `location` (`lid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passing_log`
--

LOCK TABLES `passing_log` WRITE;
/*!40000 ALTER TABLE `passing_log` DISABLE KEYS */;
INSERT INTO `passing_log` VALUES (1,35,'2021-06-12 11:17:00','2021-06-12 12:20:00',3.85),(2,35,'2021-06-12 11:17:10','2021-06-12 12:20:00',3.25),(3,35,'2021-06-12 11:17:05','2021-06-12 12:20:05',4.85),(13,35,'2021-06-12 11:20:00','2021-06-12 12:25:00',4.55),(14,35,'2021-06-12 11:20:00','2021-06-12 12:25:10',5.85),(7,34,'2021-06-13 11:17:00','2021-06-13 12:20:00',7.85),(8,34,'2021-06-13 11:17:10','2021-06-13 12:20:00',8.25),(10,34,'2021-06-13 11:17:06','2021-06-13 12:20:05',6.85),(11,34,'2021-06-13 11:21:00','2021-06-13 12:25:00',9.55),(12,34,'2021-06-13 11:21:07','2021-06-13 12:25:10',7.85),(4,34,'2021-06-13 11:20:08','2021-06-13 12:20:00',7.85),(5,34,'2021-06-13 11:20:11','2021-06-13 12:20:00',8.25),(6,30,'2021-06-14 20:20:10','2021-06-14 21:20:00',10.85),(9,30,'2021-06-14 20:20:04','2021-06-14 21:20:00',11.25),(6,47,'2021-06-15 06:17:00','2021-06-15 07:17:05',NULL),(11,47,'2021-06-15 06:19:10','2021-06-15 08:00:00',NULL),(3,43,'2021-06-09 14:20:00','2021-06-09 15:00:05',NULL),(1,43,'2021-06-09 14:17:00','2021-06-09 15:00:02',NULL),(2,43,'2021-06-09 14:17:10','2021-06-09 15:00:01',NULL),(1,253,'2021-06-16 11:17:00',NULL,NULL);
/*!40000 ALTER TABLE `passing_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `floor` tinyint(3) unsigned NOT NULL,
  `orientation` enum('south','east','north','west') NOT NULL,
  `hid` smallint(5) unsigned NOT NULL,
  `num` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `is_full` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`num`),
  KEY `hid` (`hid`),
  CONSTRAINT `room_ibfk_2` FOREIGN KEY (`hid`) REFERENCES `hallway` (`hid`),
  CONSTRAINT `room_ibfk_3` FOREIGN KEY (`num`) REFERENCES `location` (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=581 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'north',1,101,'no'),(1,'north',1,102,'no'),(1,'north',1,103,'no'),(1,'north',1,104,'no'),(1,'north',1,105,'no'),(1,'north',1,106,'no'),(1,'north',1,107,'no'),(1,'north',1,108,'no'),(1,'north',1,109,'no'),(1,'north',1,110,'no'),(1,'north',1,111,'no'),(1,'north',1,112,'no'),(1,'north',1,113,'no'),(1,'north',1,114,'no'),(1,'north',1,115,'no'),(1,'north',1,116,'no'),(1,'north',1,117,'no'),(1,'north',1,118,'no'),(1,'north',1,119,'no'),(1,'north',1,120,'no'),(1,'east',2,121,'no'),(1,'east',2,122,'no'),(1,'east',2,123,'no'),(1,'east',2,124,'no'),(1,'east',2,125,'no'),(1,'east',2,126,'no'),(1,'east',2,127,'no'),(1,'east',2,128,'no'),(1,'east',2,129,'no'),(1,'east',2,130,'no'),(1,'east',2,131,'no'),(1,'east',2,132,'no'),(1,'east',2,133,'no'),(1,'east',2,134,'yes'),(1,'east',2,135,'no'),(1,'east',2,136,'no'),(1,'east',2,137,'no'),(1,'east',2,138,'no'),(1,'east',2,139,'no'),(1,'east',2,140,'no'),(1,'south',3,141,'no'),(1,'south',3,142,'no'),(1,'south',3,143,'no'),(1,'south',3,144,'no'),(1,'south',3,145,'no'),(1,'south',3,146,'no'),(1,'south',3,147,'no'),(1,'south',3,148,'no'),(1,'south',3,149,'no'),(1,'south',3,150,'no'),(1,'south',3,151,'no'),(1,'south',3,152,'no'),(1,'south',3,153,'no'),(1,'south',3,154,'no'),(1,'south',3,155,'no'),(1,'south',3,156,'no'),(1,'south',3,157,'no'),(1,'south',3,158,'no'),(1,'south',3,159,'no'),(1,'south',3,160,'no'),(1,'west',4,161,'no'),(1,'west',4,162,'no'),(1,'west',4,163,'no'),(1,'west',4,164,'no'),(1,'west',4,165,'no'),(1,'west',4,166,'no'),(1,'west',4,167,'no'),(1,'west',4,168,'no'),(1,'west',4,169,'no'),(1,'west',4,170,'no'),(1,'west',4,171,'no'),(1,'west',4,172,'no'),(1,'west',4,173,'no'),(1,'west',4,174,'no'),(1,'west',4,175,'no'),(1,'west',4,176,'no'),(1,'west',4,177,'no'),(1,'west',4,178,'no'),(1,'west',4,179,'no'),(1,'west',4,180,'no'),(2,'north',5,201,'no'),(2,'north',5,202,'no'),(2,'north',5,203,'no'),(2,'north',5,204,'no'),(2,'north',5,205,'no'),(2,'north',5,206,'no'),(2,'north',5,207,'no'),(2,'north',5,208,'no'),(2,'north',5,209,'no'),(2,'north',5,210,'no'),(2,'north',5,211,'no'),(2,'north',5,212,'no'),(2,'north',5,213,'no'),(2,'north',5,214,'no'),(2,'north',5,215,'no'),(2,'north',5,216,'no'),(2,'north',5,217,'no'),(2,'north',5,218,'no'),(2,'north',5,219,'no'),(2,'north',5,220,'no'),(2,'east',6,221,'no'),(2,'east',6,222,'no'),(2,'east',6,223,'no'),(2,'east',6,224,'no'),(2,'east',6,225,'no'),(2,'east',6,226,'no'),(2,'east',6,227,'no'),(2,'east',6,228,'no'),(2,'east',6,229,'no'),(2,'east',6,230,'no'),(2,'east',6,231,'no'),(2,'east',6,232,'no'),(2,'east',6,233,'no'),(2,'east',6,234,'no'),(2,'east',6,235,'no'),(2,'east',6,236,'no'),(2,'east',6,237,'no'),(2,'east',6,238,'no'),(2,'east',6,239,'no'),(2,'east',6,240,'no'),(2,'south',7,241,'no'),(2,'south',7,242,'no'),(2,'south',7,243,'no'),(2,'south',7,244,'no'),(2,'south',7,245,'no'),(2,'south',7,246,'no'),(2,'south',7,247,'no'),(2,'south',7,248,'no'),(2,'south',7,249,'no'),(2,'south',7,250,'no'),(2,'south',7,251,'no'),(2,'south',7,252,'no'),(2,'south',7,253,'yes'),(2,'south',7,254,'no'),(2,'south',7,255,'no'),(2,'south',7,256,'no'),(2,'south',7,257,'no'),(2,'south',7,258,'no'),(2,'south',7,259,'no'),(2,'south',7,260,'no'),(2,'west',8,261,'no'),(2,'west',8,262,'no'),(2,'west',8,263,'no'),(2,'west',8,264,'no'),(2,'west',8,265,'no'),(2,'west',8,266,'no'),(2,'west',8,267,'no'),(2,'west',8,268,'no'),(2,'west',8,269,'no'),(2,'west',8,270,'no'),(2,'west',8,271,'no'),(2,'west',8,272,'no'),(2,'west',8,273,'no'),(2,'west',8,274,'no'),(2,'west',8,275,'no'),(2,'west',8,276,'no'),(2,'west',8,277,'no'),(2,'west',8,278,'no'),(2,'west',8,279,'no'),(2,'west',8,280,'no'),(3,'north',9,301,'no'),(3,'north',9,302,'no'),(3,'north',9,303,'no'),(3,'north',9,304,'no'),(3,'north',9,305,'no'),(3,'north',9,306,'no'),(3,'north',9,307,'no'),(3,'north',9,308,'no'),(3,'north',9,309,'no'),(3,'north',9,310,'no'),(3,'north',9,311,'no'),(3,'north',9,312,'no'),(3,'north',9,313,'no'),(3,'north',9,314,'no'),(3,'north',9,315,'no'),(3,'north',9,316,'no'),(3,'north',9,317,'no'),(3,'north',9,318,'no'),(3,'north',9,319,'no'),(3,'north',9,320,'no'),(3,'east',10,321,'no'),(3,'east',10,322,'no'),(3,'east',10,323,'no'),(3,'east',10,324,'no'),(3,'east',10,325,'no'),(3,'east',10,326,'no'),(3,'east',10,327,'no'),(3,'east',10,328,'no'),(3,'east',10,329,'no'),(3,'east',10,330,'no'),(3,'east',10,331,'no'),(3,'east',10,332,'no'),(3,'east',10,333,'no'),(3,'east',10,334,'yes'),(3,'east',10,335,'no'),(3,'east',10,336,'no'),(3,'east',10,337,'no'),(3,'east',10,338,'no'),(3,'east',10,339,'no'),(3,'east',10,340,'no'),(3,'south',11,341,'no'),(3,'south',11,342,'no'),(3,'south',11,343,'no'),(3,'south',11,344,'no'),(3,'south',11,345,'no'),(3,'south',11,346,'no'),(3,'south',11,347,'no'),(3,'south',11,348,'no'),(3,'south',11,349,'no'),(3,'south',11,350,'no'),(3,'south',11,351,'no'),(3,'south',11,352,'no'),(3,'south',11,353,'no'),(3,'south',11,354,'yes'),(3,'south',11,355,'no'),(3,'south',11,356,'no'),(3,'south',11,357,'no'),(3,'south',11,358,'no'),(3,'south',11,359,'no'),(3,'south',11,360,'no'),(3,'west',12,361,'no'),(3,'west',12,362,'no'),(3,'west',12,363,'no'),(3,'west',12,364,'no'),(3,'west',12,365,'no'),(3,'west',12,366,'no'),(3,'west',12,367,'no'),(3,'west',12,368,'no'),(3,'west',12,369,'no'),(3,'west',12,370,'no'),(3,'west',12,371,'no'),(3,'west',12,372,'no'),(3,'west',12,373,'no'),(3,'west',12,374,'no'),(3,'west',12,375,'no'),(3,'west',12,376,'no'),(3,'west',12,377,'no'),(3,'west',12,378,'no'),(3,'west',12,379,'no'),(3,'west',12,380,'no'),(4,'north',13,401,'no'),(4,'north',13,402,'no'),(4,'north',13,403,'no'),(4,'north',13,404,'no'),(4,'north',13,405,'no'),(4,'north',13,406,'no'),(4,'north',13,407,'no'),(4,'north',13,408,'no'),(4,'north',13,409,'no'),(4,'north',13,410,'no'),(4,'north',13,411,'no'),(4,'north',13,412,'no'),(4,'north',13,413,'no'),(4,'north',13,414,'no'),(4,'north',13,415,'no'),(4,'north',13,416,'no'),(4,'north',13,417,'no'),(4,'north',13,418,'no'),(4,'north',13,419,'no'),(4,'north',13,420,'no'),(4,'east',14,421,'no'),(4,'east',14,422,'no'),(4,'east',14,423,'no'),(4,'east',14,424,'no'),(4,'east',14,425,'no'),(4,'east',14,426,'no'),(4,'east',14,427,'no'),(4,'east',14,428,'no'),(4,'east',14,429,'no'),(4,'east',14,430,'no'),(4,'east',14,431,'no'),(4,'east',14,432,'no'),(4,'east',14,433,'no'),(4,'east',14,434,'no'),(4,'east',14,435,'no'),(4,'east',14,436,'no'),(4,'east',14,437,'no'),(4,'east',14,438,'no'),(4,'east',14,439,'no'),(4,'east',14,440,'no'),(4,'south',15,441,'no'),(4,'south',15,442,'no'),(4,'south',15,443,'no'),(4,'south',15,444,'no'),(4,'south',15,445,'no'),(4,'south',15,446,'no'),(4,'south',15,447,'no'),(4,'south',15,448,'no'),(4,'south',15,449,'no'),(4,'south',15,450,'no'),(4,'south',15,451,'no'),(4,'south',15,452,'no'),(4,'south',15,453,'no'),(4,'south',15,454,'no'),(4,'south',15,455,'no'),(4,'south',15,456,'no'),(4,'south',15,457,'no'),(4,'south',15,458,'no'),(4,'south',15,459,'no'),(4,'south',15,460,'no'),(4,'west',16,461,'no'),(4,'west',16,462,'no'),(4,'west',16,463,'no'),(4,'west',16,464,'no'),(4,'west',16,465,'no'),(4,'west',16,466,'no'),(4,'west',16,467,'no'),(4,'west',16,468,'no'),(4,'west',16,469,'no'),(4,'west',16,470,'no'),(4,'west',16,471,'no'),(4,'west',16,472,'no'),(4,'west',16,473,'no'),(4,'west',16,474,'no'),(4,'west',16,475,'no'),(4,'west',16,476,'no'),(4,'west',16,477,'no'),(4,'west',16,478,'no'),(4,'west',16,479,'no'),(4,'west',16,480,'no'),(5,'north',17,501,'no'),(5,'north',17,502,'no'),(5,'north',17,503,'no'),(5,'north',17,504,'no'),(5,'north',17,505,'no'),(5,'north',17,506,'no'),(5,'north',17,507,'no'),(5,'north',17,508,'no'),(5,'north',17,509,'no'),(5,'north',17,510,'no'),(5,'north',17,511,'no'),(5,'north',17,512,'no'),(5,'north',17,513,'no'),(5,'north',17,514,'no'),(5,'north',17,515,'no'),(5,'north',17,516,'no'),(5,'north',17,517,'no'),(5,'north',17,518,'no'),(5,'north',17,519,'no'),(5,'north',17,520,'no'),(5,'east',18,521,'no'),(5,'east',18,522,'no'),(5,'east',18,523,'no'),(5,'east',18,524,'no'),(5,'east',18,525,'no'),(5,'east',18,526,'no'),(5,'east',18,527,'no'),(5,'east',18,528,'no'),(5,'east',18,529,'yes'),(5,'east',18,530,'no'),(5,'east',18,531,'no'),(5,'east',18,532,'no'),(5,'east',18,533,'no'),(5,'east',18,534,'no'),(5,'east',18,535,'no'),(5,'east',18,536,'no'),(5,'east',18,537,'no'),(5,'east',18,538,'no'),(5,'east',18,539,'no'),(5,'east',18,540,'no'),(5,'south',19,541,'no'),(5,'south',19,542,'no'),(5,'south',19,543,'no'),(5,'south',19,544,'no'),(5,'south',19,545,'no'),(5,'south',19,546,'no'),(5,'south',19,547,'no'),(5,'south',19,548,'no'),(5,'south',19,549,'no'),(5,'south',19,550,'no'),(5,'south',19,551,'no'),(5,'south',19,552,'no'),(5,'south',19,553,'no'),(5,'south',19,554,'no'),(5,'south',19,555,'no'),(5,'south',19,556,'no'),(5,'south',19,557,'no'),(5,'south',19,558,'no'),(5,'south',19,559,'no'),(5,'south',19,560,'no'),(5,'west',20,561,'no'),(5,'west',20,562,'no'),(5,'west',20,563,'no'),(5,'west',20,564,'no'),(5,'west',20,565,'no'),(5,'west',20,566,'no'),(5,'west',20,567,'no'),(5,'west',20,568,'no'),(5,'west',20,569,'no'),(5,'west',20,570,'no'),(5,'west',20,571,'no'),(5,'west',20,572,'no'),(5,'west',20,573,'no'),(5,'west',20,574,'no'),(5,'west',20,575,'no'),(5,'west',20,576,'no'),(5,'west',20,577,'no'),(5,'west',20,578,'no'),(5,'west',20,579,'no'),(5,'west',20,580,'no');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitor`
--

DROP TABLE IF EXISTS `visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitor` (
  `nfcid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(15) NOT NULL,
  `mname` varchar(15) DEFAULT NULL,
  `surname` varchar(20) NOT NULL,
  `id_num` varchar(15) DEFAULT NULL,
  `id_auth` varchar(25) DEFAULT NULL,
  `id_doc` enum('ID','PASSPORT') DEFAULT NULL,
  `birthdate` date NOT NULL,
  `arrival` timestamp NOT NULL,
  `room` smallint(5) unsigned NOT NULL,
  `hallway_id` smallint(5) unsigned NOT NULL,
  `mail` varchar(40) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `left_on` timestamp NULL DEFAULT NULL,
  `parent` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`nfcid`),
  KEY `hallway_id` (`hallway_id`),
  KEY `room` (`room`),
  KEY `visitor_ibfk_3` (`parent`),
  KEY `visitor_left_on_idx` (`left_on`),
  CONSTRAINT `visitor_ibfk_1` FOREIGN KEY (`hallway_id`) REFERENCES `hallway` (`hid`),
  CONSTRAINT `visitor_ibfk_2` FOREIGN KEY (`room`) REFERENCES `room` (`num`),
  CONSTRAINT `visitor_ibfk_3` FOREIGN KEY (`parent`) REFERENCES `visitor` (`nfcid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor`
--

LOCK TABLES `visitor` WRITE;
/*!40000 ALTER TABLE `visitor` DISABLE KEYS */;
INSERT INTO `visitor` VALUES (1,'Kostas',NULL,'Papadopoulos','AT893456','ATPeiraia','ID','1997-01-01','2021-06-06 19:10:42',253,7,'kwpap@gmail.com','6978539555',NULL,NULL),(2,'George',NULL,'Bampilis','NM038456','ATGlyfadas','ID','1997-11-17','2021-06-06 19:10:43',253,7,'georgebam@gmail.com','6973227999',NULL,NULL),(3,'George',NULL,'Tsironis','AN591661','ATGlyfadas','ID','1998-07-06','2021-06-06 19:10:45',253,7,'getsironis@gmail.com','6979297417',NULL,NULL),(4,'Kostas',NULL,'Loupis','AP073681','ATChalandriou','ID','1973-02-05','2021-06-13 13:15:29',134,2,'loupis@yahoo.gr','6987444417',NULL,NULL),(5,'Virginia',NULL,'Managlioti','AN084327','ATChalandriou','ID','1975-08-31','2021-06-13 13:15:00',134,2,'vmanaglioti@hotmail.com','6945280717',NULL,NULL),(6,'Dionisis',NULL,'Mindrinos','NP074532','ATChalandriou','ID','1970-07-12','2021-06-15 14:11:00',334,6,'dionmin@yahoo.gr','6987444417',NULL,NULL),(7,'Thanasis',NULL,'Loupis',NULL,NULL,NULL,'2005-06-30','2021-06-13 13:17:00',134,2,NULL,NULL,NULL,5),(8,'Flora',NULL,'Loupi',NULL,NULL,NULL,'2004-05-21','2021-06-13 13:18:00',134,2,NULL,NULL,NULL,5),(9,'Despoina',NULL,'Xristou','MN0987231','AT Chalandriou','PASSPORT','1980-02-27','2021-06-15 14:13:00',334,6,'depydepy@gmail.com','6956667603',NULL,NULL),(10,'Harry','Derek','Peterson','XN8965222','Passport Office Manhatan','PASSPORT','1976-04-21','2021-06-10 10:18:00',544,19,'hadepe@gmail.com','+1 212-509-6995','2021-06-15 16:06:47',NULL),(11,'Amanda','Polyanna','Poppins','AN8987222','Passport Office Manhatan','PASSPORT','1980-11-21','2021-06-10 10:20:00',544,19,'amanpo@gmail.com','+1 212-333-6995','2021-06-15 16:06:50',NULL),(12,'Lucy','Polyanna','Peterson','AN8989962','Passport Office Manhatan','PASSPORT','2006-12-22','2021-06-10 10:22:00',544,19,NULL,NULL,'2021-06-15 16:06:50',10),(13,'Georgia',NULL,'Kasimi','PO152590','AT Papagou','ID','1999-05-13','2021-06-14 11:13:00',354,6,'buralobo@hotmail.com','6959884603',NULL,NULL),(14,'Irida',NULL,'Savrami','OP152590','AT Papagou','ID','1999-09-13','2021-06-14 11:17:00',354,6,'iridizo@hotmail.com','6985670333',NULL,NULL);
/*!40000 ALTER TABLE `visitor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER hello BEFORE INSERT
ON visitor
FOR EACH ROW BEGIN
UPDATE room SET is_full='yes' WHERE num = NEW.room;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER hallway BEFORE INSERT
ON visitor
FOR EACH ROW BEGIN
IF NEW.room BETWEEN 101 AND 120 THEN
	SET NEW.hallway_id=1;
ELSEIF NEW.room BETWEEN 121 AND 140 THEN
	SET NEW.hallway_id=2;
ELSEIF NEW.room BETWEEN 141 AND 160 THEN
	SET NEW.hallway_id=3;
ELSEIF NEW.room BETWEEN 161 AND 180 THEN
	SET NEW.hallway_id=4;
ELSEIF NEW.room BETWEEN 201 AND 220 THEN
	SET NEW.hallway_id=5;
ELSEIF NEW.room BETWEEN 221 AND 240 THEN
	SET NEW.hallway_id=6;
ELSEIF NEW.room BETWEEN 241 AND 260 THEN
	SET NEW.hallway_id=7;
ELSEIF NEW.room BETWEEN 261 AND 280 THEN
	SET NEW.hallway_id=8;
ELSEIF NEW.room BETWEEN 301 AND 320 THEN
	SET NEW.hallway_id=9;
ELSEIF NEW.room BETWEEN 321 AND 340 THEN
	SET NEW.hallway_id=10;
ELSEIF NEW.room BETWEEN 341 AND 360 THEN
	SET NEW.hallway_id=11;
ELSEIF NEW.room BETWEEN 361 AND 380 THEN
	SET NEW.hallway_id=12;
ELSEIF NEW.room BETWEEN 401 AND 420 THEN
	SET NEW.hallway_id=13;
ELSEIF NEW.room BETWEEN 421 AND 440 THEN
	SET NEW.hallway_id=14;
ELSEIF NEW.room BETWEEN 441 AND 460 THEN
	SET NEW.hallway_id=15;
ELSEIF NEW.room BETWEEN 461 AND 480 THEN
	SET NEW.hallway_id=16;
ELSEIF NEW.room BETWEEN 501 AND 520 THEN
	SET NEW.hallway_id=17;
ELSEIF NEW.room BETWEEN 521 AND 540 THEN
	SET NEW.hallway_id=18;
ELSEIF NEW.room BETWEEN 541 AND 560 THEN
	SET NEW.hallway_id=19;
ELSEIF NEW.room BETWEEN 561 AND 580 THEN
	SET NEW.hallway_id=20;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER bye BEFORE UPDATE
ON visitor
FOR EACH ROW BEGIN
IF NEW.left_on THEN
	UPDATE room SET is_full='no' WHERE num = NEW.room;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'myproject'
--

--
-- Dumping routines for database 'myproject'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-13 18:04:39
