-- MySQL dump 10.13  Distrib 8.0.42, for macos15 (x86_64)
--
-- Host: localhost    Database: united_helpers
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment` (
  `volunteerId` int NOT NULL,
  `taskCode` int NOT NULL,
  `startDateTime` datetime NOT NULL,
  `endDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`volunteerId`,`taskCode`,`startDateTime`),
  KEY `fk_assignment_task` (`taskCode`),
  CONSTRAINT `fk_assignment_task` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`),
  CONSTRAINT `fk_assignment_vol` FOREIGN KEY (`volunteerId`) REFERENCES `volunteer` (`volunteerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (1,1,'2025-10-01 09:00:00','2025-10-01 13:00:00'),(1,2,'2025-10-02 10:00:00','2025-10-02 16:00:00'),(2,1,'2025-10-01 09:00:00','2025-10-01 12:00:00'),(2,3,'2025-10-03 10:00:00','2025-10-03 16:00:00'),(3,2,'2025-10-02 10:00:00','2025-10-02 15:00:00'),(4,3,'2025-10-03 09:30:00','2025-10-03 17:00:00'),(5,5,'2025-10-04 09:00:00','2025-10-04 14:00:00'),(6,6,'2025-10-05 13:00:00','2025-10-05 18:00:00'),(7,8,'2025-10-06 08:00:00','2025-10-06 12:00:00'),(8,9,'2025-10-06 13:00:00','2025-10-06 17:00:00'),(9,10,'2025-10-07 09:00:00','2025-10-07 12:00:00'),(10,4,'2025-10-07 12:00:00','2025-10-07 16:00:00');
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `itemId` int NOT NULL AUTO_INCREMENT,
  `itemDescription` varchar(100) NOT NULL,
  `itemValue` decimal(8,2) NOT NULL,
  `quantityOnHand` int NOT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Gauze Roll',2.50,5000),(2,'Bandage Pack',3.00,4200),(3,'Antiseptic Wipes (10ct)',1.80,6000),(4,'Pain Reliever (10ct)',4.50,3500),(5,'Rice (2kg)',3.20,9000),(6,'Canned Beans (400g)',1.10,11000),(7,'Canned Veggies (400g)',1.15,10000),(8,'Bottled Water (1L)',0.90,12000),(9,'Toothbrush',0.80,7000),(10,'Toothpaste (100ml)',1.20,6800),(11,'Soap Bar',0.75,7500),(12,'Diapers (10ct)',4.20,5000),(13,'Baby Wipes (20ct)',2.40,5200),(14,'Infant Formula (400g)',9.50,3000),(15,'Small Toy',2.00,2700),(16,'Reading Glasses (+2.0)',5.00,1500),(17,'Soft Fruit Cups (4ct)',3.60,3200),(18,'Shampoo (250ml)',1.90,4500),(19,'Sanitary Pads (10ct)',2.80,4700),(20,'Vitamin Supplements (bottle)',6.50,1800);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `packageId` int NOT NULL AUTO_INCREMENT,
  `taskCode` int NOT NULL,
  `packageTypeId` int NOT NULL,
  `packageCreateDate` date NOT NULL,
  `packageWeight` decimal(6,2) NOT NULL,
  PRIMARY KEY (`packageId`),
  KEY `fk_package_task` (`taskCode`),
  KEY `fk_package_type` (`packageTypeId`),
  CONSTRAINT `fk_package_task` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`),
  CONSTRAINT `fk_package_type` FOREIGN KEY (`packageTypeId`) REFERENCES `package_type` (`packageTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,2,3,'2025-10-01',12.40),(2,2,3,'2025-10-01',12.55),(3,2,3,'2025-10-02',12.30),(4,3,1,'2025-10-03',6.10),(5,3,1,'2025-10-03',6.05),(6,5,2,'2025-10-04',8.25),(7,6,4,'2025-10-05',5.95),(8,6,4,'2025-10-05',6.10),(9,8,3,'2025-10-06',10.20),(10,9,1,'2025-10-06',7.80),(11,9,1,'2025-10-07',7.75),(12,5,2,'2025-10-07',8.40);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_contents`
--

DROP TABLE IF EXISTS `package_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_contents` (
  `itemId` int NOT NULL,
  `packageId` int NOT NULL,
  `itemQuantity` int NOT NULL,
  PRIMARY KEY (`itemId`,`packageId`),
  KEY `fk_pkgcontents_package` (`packageId`),
  CONSTRAINT `fk_pkgcontents_item` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`),
  CONSTRAINT `fk_pkgcontents_package` FOREIGN KEY (`packageId`) REFERENCES `package` (`packageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_contents`
--

LOCK TABLES `package_contents` WRITE;
/*!40000 ALTER TABLE `package_contents` DISABLE KEYS */;
INSERT INTO `package_contents` VALUES (1,4,2),(1,5,2),(1,9,1),(2,4,2),(2,5,2),(3,4,1),(3,5,1),(4,4,1),(4,5,1),(5,1,1),(5,2,1),(5,3,1),(5,9,1),(6,1,2),(6,2,2),(6,3,2),(7,1,2),(7,2,2),(7,3,2),(8,1,2),(8,2,2),(8,3,2),(8,9,2),(9,7,1),(9,8,1),(10,7,1),(10,8,1),(11,7,1),(11,8,1),(11,9,1),(12,6,1),(12,12,1),(13,6,1),(13,12,1),(14,6,1),(14,12,1),(15,6,1),(16,10,1),(16,11,1),(17,10,2),(17,11,2),(18,7,1),(18,8,1),(19,7,1),(19,8,1),(20,10,1),(20,11,1);
/*!40000 ALTER TABLE `package_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_type`
--

DROP TABLE IF EXISTS `package_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_type` (
  `packageTypeId` int NOT NULL AUTO_INCREMENT,
  `packageTypeName` varchar(50) NOT NULL,
  PRIMARY KEY (`packageTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_type`
--

LOCK TABLES `package_type` WRITE;
/*!40000 ALTER TABLE `package_type` DISABLE KEYS */;
INSERT INTO `package_type` VALUES (1,'basic medical'),(2,'child-care'),(3,'food'),(4,'hygiene');
/*!40000 ALTER TABLE `package_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packing_list`
--

DROP TABLE IF EXISTS `packing_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packing_list` (
  `packingListId` int NOT NULL AUTO_INCREMENT,
  `packingListName` varchar(100) NOT NULL,
  `packingListDescription` text,
  PRIMARY KEY (`packingListId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packing_list`
--

LOCK TABLES `packing_list` WRITE;
/*!40000 ALTER TABLE `packing_list` DISABLE KEYS */;
INSERT INTO `packing_list` VALUES (1,'Medical Basics','Gauze, bandages, antiseptic wipes, pain relievers; avoid antibiotics.'),(2,'Child Care Starter','Diapers, wipes, formula, small toys; no choking hazards.'),(3,'Food Staples','Rice, beans, canned vegetables, water; no meat.'),(4,'Hygiene Kit','Toothbrush, toothpaste, soap, shampoo, sanitary pads.'),(5,'Emergency Combo','Mixed supplies for rapid response; tailored on site.'),(6,'Senior Care','Vitamin supplements, soft foods, easy-open cans, reading glasses.');
/*!40000 ALTER TABLE `packing_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `taskCode` int NOT NULL AUTO_INCREMENT,
  `packingListId` int DEFAULT NULL,
  `taskTypeId` int NOT NULL,
  `taskStatusId` int NOT NULL,
  `taskDescription` varchar(255) NOT NULL,
  PRIMARY KEY (`taskCode`),
  KEY `fk_task_tasktype` (`taskTypeId`),
  KEY `fk_task_taskstatus` (`taskStatusId`),
  KEY `fk_task_packinglist` (`packingListId`),
  CONSTRAINT `fk_task_packinglist` FOREIGN KEY (`packingListId`) REFERENCES `packing_list` (`packingListId`),
  CONSTRAINT `fk_task_taskstatus` FOREIGN KEY (`taskStatusId`) REFERENCES `task_status` (`taskStatusId`),
  CONSTRAINT `fk_task_tasktype` FOREIGN KEY (`taskTypeId`) REFERENCES `task_type` (`taskTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,NULL,1,2,'Answer the telephone hotline'),(2,3,2,1,'Prepare 1,200 food staple packages'),(3,1,2,2,'Assemble 800 basic medical kits'),(4,NULL,3,1,'Enter donor receipts into CRM'),(5,2,2,1,'Assemble 500 child-care starter kits'),(6,4,2,2,'Assemble 900 hygiene kits'),(7,NULL,1,1,'Staff the distribution center desk'),(8,5,2,1,'Assemble 300 emergency combo kits'),(9,6,2,1,'Assemble 200 senior care kits'),(10,NULL,3,2,'Inventory count and reconciliation');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_status`
--

DROP TABLE IF EXISTS `task_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_status` (
  `taskStatusId` int NOT NULL AUTO_INCREMENT,
  `taskStatusName` varchar(50) NOT NULL,
  PRIMARY KEY (`taskStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_status`
--

LOCK TABLES `task_status` WRITE;
/*!40000 ALTER TABLE `task_status` DISABLE KEYS */;
INSERT INTO `task_status` VALUES (1,'open'),(2,'ongoing'),(3,'closed');
/*!40000 ALTER TABLE `task_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_type`
--

DROP TABLE IF EXISTS `task_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_type` (
  `taskTypeId` int NOT NULL AUTO_INCREMENT,
  `taskTypeName` varchar(50) NOT NULL,
  PRIMARY KEY (`taskTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_type`
--

LOCK TABLES `task_type` WRITE;
/*!40000 ALTER TABLE `task_type` DISABLE KEYS */;
INSERT INTO `task_type` VALUES (1,'recurring'),(2,'packing'),(3,'administrative');
/*!40000 ALTER TABLE `task_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteer`
--

DROP TABLE IF EXISTS `volunteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteer` (
  `volunteerId` int NOT NULL AUTO_INCREMENT,
  `volunteerName` varchar(100) NOT NULL,
  `volunteerAddress` varchar(255) DEFAULT NULL,
  `volunteerTelephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`volunteerId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteer`
--

LOCK TABLES `volunteer` WRITE;
/*!40000 ALTER TABLE `volunteer` DISABLE KEYS */;
INSERT INTO `volunteer` VALUES (1,'Ava Chen','12 Maple St, Albany, NY','518-555-1001'),(2,'Ben Ortiz','88 Oak Ave, Newark, NJ','973-555-2020'),(3,'Carla Singh','51 Pine Rd, Queens, NY','718-555-3131'),(4,'Diego Morales','9 River Dr, Hoboken, NJ','201-555-4444'),(5,'Elena Rossi','700 Grove St, Jersey City, NJ','201-555-5555'),(6,'Fiona Patel','44 Cedar Ct, Stamford, CT','203-555-6666'),(7,'Gabe Kim','100 5th Ave, New York, NY','212-555-7777'),(8,'Hana Sato','200 Broadway, New York, NY','212-555-8888'),(9,'Ivan Petrov','3 Atlantic Ave, Brooklyn, NY','347-555-9999'),(10,'Jada Brooks','600 Main St, Yonkers, NY','914-555-0000');
/*!40000 ALTER TABLE `volunteer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-15 23:54:26
