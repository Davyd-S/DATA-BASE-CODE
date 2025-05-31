-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: labs
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `crew`
--

DROP TABLE IF EXISTS `crew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crew` (
  `crew_id` int NOT NULL AUTO_INCREMENT,
  `flight_id` int DEFAULT NULL,
  `commander_id` int NOT NULL,
  `pilot_id` int NOT NULL,
  `stewardess_1_id` int NOT NULL,
  `stewardess_2_id` int NOT NULL,
  PRIMARY KEY (`crew_id`),
  KEY `flight_id` (`flight_id`),
  KEY `commander_id` (`commander_id`),
  KEY `pilot_id` (`pilot_id`),
  KEY `stewardess_1_id` (`stewardess_1_id`),
  KEY `stewardess_2_id` (`stewardess_2_id`),
  CONSTRAINT `crew_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`) ON DELETE CASCADE,
  CONSTRAINT `crew_ibfk_2` FOREIGN KEY (`commander_id`) REFERENCES `crew_member` (`id`) ON DELETE CASCADE,
  CONSTRAINT `crew_ibfk_3` FOREIGN KEY (`pilot_id`) REFERENCES `pilot` (`id`) ON DELETE CASCADE,
  CONSTRAINT `crew_ibfk_4` FOREIGN KEY (`stewardess_1_id`) REFERENCES `crew_member` (`id`) ON DELETE CASCADE,
  CONSTRAINT `crew_ibfk_5` FOREIGN KEY (`stewardess_2_id`) REFERENCES `crew_member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crew`
--

LOCK TABLES `crew` WRITE;
/*!40000 ALTER TABLE `crew` DISABLE KEYS */;
INSERT INTO `crew` VALUES (1,NULL,1,1,2,3),(2,NULL,2,2,3,4),(3,NULL,3,3,4,5),(4,NULL,4,4,5,6),(5,NULL,5,5,6,7),(6,NULL,6,6,7,8);
/*!40000 ALTER TABLE `crew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crew_member`
--

DROP TABLE IF EXISTS `crew_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crew_member` (
  `id` int NOT NULL AUTO_INCREMENT,
  `surname` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `adress` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crew_member`
--

LOCK TABLES `crew_member` WRITE;
/*!40000 ALTER TABLE `crew_member` DISABLE KEYS */;
INSERT INTO `crew_member` VALUES (1,'Martin','2019-04-02','St Bandery'),(2,'Davyd','2006-08-07','St Bandery'),(3,'Rureko','2022-03-12','Verbova'),(4,'Ostin','2012-01-08','Bratova'),(5,'Invincible','2000-07-01','idk'),(6,'William','1960-03-09','idk'),(7,'Subzero','1999-12-12','Fazbers'),(8,'Eevee','2012-06-03','Pokemon\'s'),(9,'Teto','2008-04-01','Vocaloid\'s'),(10,'Peacemaker','1981-07-07','Peace');
/*!40000 ALTER TABLE `crew_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `flight_id` int NOT NULL AUTO_INCREMENT,
  `board_id` int NOT NULL,
  `place_of_departure` varchar(100) NOT NULL,
  `place_of_arrival` varchar(100) NOT NULL,
  `time_of_departure` time DEFAULT NULL,
  `time_of_arrival` time DEFAULT NULL,
  `crew_id` int DEFAULT NULL,
  `UCR` varchar(50) DEFAULT NULL,
  `DCR` date DEFAULT NULL,
  `ULC` varchar(50) DEFAULT NULL,
  `DLC` datetime DEFAULT NULL,
  `departure_date` date DEFAULT NULL,
  `pilot_id` int DEFAULT NULL,
  PRIMARY KEY (`flight_id`),
  KEY `board_id` (`board_id`),
  KEY `crew_id` (`crew_id`),
  CONSTRAINT `crew_id` FOREIGN KEY (`crew_id`) REFERENCES `crew` (`crew_id`) ON DELETE CASCADE,
  CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`board_id`) REFERENCES `plane` (`board_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (169,1,'Lviv','Kyiv','08:00:00','10:15:00',1,'root@localhost','2025-05-07','root@localhost','2025-05-07 11:47:55','2025-05-20',1),(170,1,'Lviv','Kyiv','08:00:00',NULL,1,'root@localhost','2025-05-25',NULL,NULL,'2025-07-20',1),(171,1,'Lviv','Kyiv','08:00:00','11:05:00',5,'root@localhost','2025-05-25','root@localhost','2025-05-25 20:25:26','2025-07-29',5),(172,1,'Kyiv','Lviv','08:00:00',NULL,5,'root@localhost','2025-05-25',NULL,NULL,'2025-10-29',5);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilot`
--

DROP TABLE IF EXISTS `pilot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pilot` (
  `id` int NOT NULL,
  `pilot_id` int NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `total_flights` int DEFAULT '0',
  `total_flight_time` float DEFAULT '0',
  `rating` float DEFAULT '0',
  `complains` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pilot_id` (`pilot_id`),
  CONSTRAINT `pilot_ibfk_1` FOREIGN KEY (`pilot_id`) REFERENCES `crew_member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilot`
--

LOCK TABLES `pilot` WRITE;
/*!40000 ALTER TABLE `pilot` DISABLE KEYS */;
INSERT INTO `pilot` VALUES (1,2,'ultra-pilot',800,2403.12,4.8,2),(2,4,'normal-pilot',12,89.1,3.29,1),(3,7,'lov-pilot',2,12.95,0.12,3),(4,1,'ultra-pilot',12,122,4.6,4),(5,8,'lov-pilot',1,3,0.02,1),(6,5,'normal-pilot',20,80,3.5,1);
/*!40000 ALTER TABLE `pilot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilot_allowed_planes`
--

DROP TABLE IF EXISTS `pilot_allowed_planes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pilot_allowed_planes` (
  `pilot_id` int NOT NULL,
  `plane_id` int NOT NULL,
  PRIMARY KEY (`pilot_id`,`plane_id`),
  KEY `plane_id` (`plane_id`),
  CONSTRAINT `pilot_allowed_planes_ibfk_1` FOREIGN KEY (`pilot_id`) REFERENCES `pilot` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pilot_allowed_planes_ibfk_2` FOREIGN KEY (`plane_id`) REFERENCES `plane` (`board_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilot_allowed_planes`
--

LOCK TABLES `pilot_allowed_planes` WRITE;
/*!40000 ALTER TABLE `pilot_allowed_planes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pilot_allowed_planes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plane`
--

DROP TABLE IF EXISTS `plane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plane` (
  `board_id` int NOT NULL AUTO_INCREMENT,
  `model_id` int NOT NULL,
  `hours_worked` float DEFAULT NULL,
  PRIMARY KEY (`board_id`),
  KEY `model_id` (`model_id`),
  CONSTRAINT `plane_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `plane_model` (`id`) ON DELETE CASCADE,
  CONSTRAINT `plane_chk_1` CHECK ((`hours_worked` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plane`
--

LOCK TABLES `plane` WRITE;
/*!40000 ALTER TABLE `plane` DISABLE KEYS */;
INSERT INTO `plane` VALUES (1,1,312),(5,3,365),(6,2,100);
/*!40000 ALTER TABLE `plane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plane_model`
--

DROP TABLE IF EXISTS `plane_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plane_model` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_of_model` varchar(100) NOT NULL,
  `number_of_sits` int NOT NULL,
  `load_capasity` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `plane_model_chk_1` CHECK ((`number_of_sits` > 0)),
  CONSTRAINT `plane_model_chk_2` CHECK ((`load_capasity` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plane_model`
--

LOCK TABLES `plane_model` WRITE;
/*!40000 ALTER TABLE `plane_model` DISABLE KEYS */;
INSERT INTO `plane_model` VALUES (1,'boeing 787',294,227930),(2,'airbus a380',520,575155),(3,'boeing 737',210,23900);
/*!40000 ALTER TABLE `plane_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sold_tickets`
--

DROP TABLE IF EXISTS `sold_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sold_tickets` (
  `ticket_id` int NOT NULL AUTO_INCREMENT,
  `flight_id` int NOT NULL,
  `number_of_sold_tickets` int DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `flight_id` (`flight_id`),
  CONSTRAINT `sold_tickets_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`) ON DELETE CASCADE,
  CONSTRAINT `sold_tickets_chk_1` CHECK ((`number_of_sold_tickets` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sold_tickets`
--

LOCK TABLES `sold_tickets` WRITE;
/*!40000 ALTER TABLE `sold_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `sold_tickets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-31 20:27:47
