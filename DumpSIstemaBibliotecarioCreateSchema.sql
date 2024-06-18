CREATE DATABASE  IF NOT EXISTS `sistema bibliotecario provinciale` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sistema bibliotecario provinciale`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: sistema bibliotecario provinciale
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `biblioteca`
--

DROP TABLE IF EXISTS `biblioteca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biblioteca` (
  `ID_BIBLIOTECA` int unsigned NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(320) NOT NULL,
  `N_TELEFONO` char(10) NOT NULL,
  `INDIRIZZO` varchar(300) NOT NULL,
  `INVENTARIO` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_BIBLIOTECA`),
  UNIQUE KEY `EMAIL_UNIQUE` (`EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioteca`
--

LOCK TABLES `biblioteca` WRITE;
/*!40000 ALTER TABLE `biblioteca` DISABLE KEYS */;
INSERT INTO `biblioteca` VALUES (1,'biblioteca@comune.trecenta.ro.it','0425701089','Piazza G.Garibaldi, 34, 45027, Trecenta, RO',0),(2,'biblioteca@comune.badiapolesine.ro.it','3346642494','Via Cigno, 109/A,\n45021, Badia Polesine, RO',0),(3,'reference@concordi.it','042527991','Piazza Vittorio Emanuele II, 14,\n45100, Rovigo, RO',0),(4,'biblioteca@comune.lendinara.ro.it','0425605666','G.B. Conti, 30, 45026,\nLendinara, RO',0),(5,'bibliotecaceneselli@gmail.com','0425809354','Piazza Marconi, 1, 45030,\nCeneselli, RO',0),(6,'biblioteca@comune.rosolina.ro.it','3402847312','Via Don Giuseppe\nSambo, 1, 45010, Rosolina, RO',0),(7,'biblioteca@comune.guardaveneta.ro.it','0425487090','Via Sandro\nPertini, 57, 45030, Guarda Veneta, RO',0),(8,'biblioteca@comune.occhiobello.ro.it','0425757860','Via Martin Luther\nKing, 1/B, 45030, Occhiobello, RO',0),(9,'biblio@comune.villadose.ro.it','3357244867','Via N. Paganini, 16, 45010,\nVilladose, RO',0),(10,'biblioteca@comune.stienta.ro.it','0425746378','Via Maffei, 195, 45039,\nStienta, RO',0);
/*!40000 ALTER TABLE `biblioteca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bibliotecario`
--

DROP TABLE IF EXISTS `bibliotecario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bibliotecario` (
  `ID_BIBLIOTECARIO` int unsigned NOT NULL,
  `ID_BIBLIOTECA_LAVORO` int unsigned NOT NULL,
  PRIMARY KEY (`ID_BIBLIOTECARIO`),
  KEY `ID_BIBLIOTECA_idx` (`ID_BIBLIOTECA_LAVORO`),
  CONSTRAINT `ID_BIBLIOTECA_LAVORO` FOREIGN KEY (`ID_BIBLIOTECA_LAVORO`) REFERENCES `biblioteca` (`ID_BIBLIOTECA`) ON UPDATE CASCADE,
  CONSTRAINT `ID_BIBLIOTECARIO` FOREIGN KEY (`ID_BIBLIOTECARIO`) REFERENCES `utente` (`ID_UTENTE`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bibliotecario`
--

LOCK TABLES `bibliotecario` WRITE;
/*!40000 ALTER TABLE `bibliotecario` DISABLE KEYS */;
INSERT INTO `bibliotecario` VALUES (2,1),(6,2),(1,3),(4,3),(10,4),(3,5),(8,6),(9,6),(11,7),(21,8),(20,9),(16,10);
/*!40000 ALTER TABLE `bibliotecario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copia_giornale_1`
--

DROP TABLE IF EXISTS `copia_giornale_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `copia_giornale_1` (
  `INVENTARIO` int unsigned NOT NULL,
  `COMUNE` varchar(45) NOT NULL,
  `STATO` varchar(45) NOT NULL DEFAULT 'AMMESSO AL PRESTITO',
  `ID_BIBLIOTECARIO_REGISTRA` int unsigned NOT NULL,
  PRIMARY KEY (`INVENTARIO`,`COMUNE`),
  KEY `ID_BIBLIOTECARIO_REGISTRA_COPIA_GIOR_idx` (`ID_BIBLIOTECARIO_REGISTRA`),
  CONSTRAINT `CODICE_COPIA_GIOR` FOREIGN KEY (`INVENTARIO`, `COMUNE`) REFERENCES `copia_giornale_3` (`INVENTARIO`, `COMUNE`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ID_BIBLIOTECARIO_REGISTRA_COPIA_GIOR` FOREIGN KEY (`ID_BIBLIOTECARIO_REGISTRA`) REFERENCES `bibliotecario` (`ID_BIBLIOTECARIO`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copia_giornale_1`
--

LOCK TABLES `copia_giornale_1` WRITE;
/*!40000 ALTER TABLE `copia_giornale_1` DISABLE KEYS */;
INSERT INTO `copia_giornale_1` VALUES (2,'VIL','AMMESSO AL PRESTITO',20),(3,'CEN','AMMESSO AL PRESTITO',3),(4,'CEN','AMMESSO AL PRESTITO',3),(5,'BAP','AMMESSO AL PRESTITO',6),(5,'CEN','AMMESSO AL PRESTITO',3),(6,'ROS','SOLO CONSULTAZIONE',8),(6,'ROV','AMMESSO AL PRESTITO',4);
/*!40000 ALTER TABLE `copia_giornale_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copia_giornale_2`
--

DROP TABLE IF EXISTS `copia_giornale_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `copia_giornale_2` (
  `COMUNE` varchar(45) NOT NULL,
  `ID_BIBLIOTECA_PROPRIETARIA` int unsigned NOT NULL,
  PRIMARY KEY (`COMUNE`),
  KEY `ID_BIBLIOTECA_PROP_COPIA_GIOR_idx` (`ID_BIBLIOTECA_PROPRIETARIA`),
  CONSTRAINT `COMUNE_PROP_COPIA_GIOR` FOREIGN KEY (`COMUNE`) REFERENCES `copia_giornale_3` (`COMUNE`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ID_BIBLIOTECA_PROP_COPIA_GIOR` FOREIGN KEY (`ID_BIBLIOTECA_PROPRIETARIA`) REFERENCES `biblioteca` (`ID_BIBLIOTECA`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copia_giornale_2`
--

LOCK TABLES `copia_giornale_2` WRITE;
/*!40000 ALTER TABLE `copia_giornale_2` DISABLE KEYS */;
INSERT INTO `copia_giornale_2` VALUES ('BAP',2),('ROV',3),('CEN',5),('ROS',6),('VIL',9);
/*!40000 ALTER TABLE `copia_giornale_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copia_giornale_3`
--

DROP TABLE IF EXISTS `copia_giornale_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `copia_giornale_3` (
  `ISSN_GIOR` char(9) NOT NULL,
  `INVENTARIO` int unsigned NOT NULL,
  `COMUNE` varchar(45) NOT NULL,
  `ID_BIBLIOTECA_OSPITANTE` int unsigned NOT NULL,
  PRIMARY KEY (`ISSN_GIOR`,`COMUNE`,`INVENTARIO`),
  KEY `ID_BIBLIOTECA_OSPITA_COPIA_GIOR_idx` (`ID_BIBLIOTECA_OSPITANTE`),
  KEY `COMUNE_PROP_COPIA_GIOR_idx` (`COMUNE`),
  KEY `CODICE_COPIA_GIOR_idx` (`INVENTARIO`,`COMUNE`),
  KEY `PRESTITO_COPIA_idx` (`ISSN_GIOR`,`INVENTARIO`,`COMUNE`),
  CONSTRAINT `ID_BIBLIOTECA_OSPITA_COPIA_GIOR` FOREIGN KEY (`ID_BIBLIOTECA_OSPITANTE`) REFERENCES `biblioteca` (`ID_BIBLIOTECA`) ON UPDATE CASCADE,
  CONSTRAINT `ISSN_COPIA` FOREIGN KEY (`ISSN_GIOR`) REFERENCES `giornale` (`ISSN`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copia_giornale_3`
--

LOCK TABLES `copia_giornale_3` WRITE;
/*!40000 ALTER TABLE `copia_giornale_3` DISABLE KEYS */;
INSERT INTO `copia_giornale_3` VALUES ('9770-3917',5,'BAP',2),('9772-0397',6,'ROV',3),('9771-1247',3,'CEN',5),('9771-5941',4,'CEN',5),('9772-0396',5,'CEN',5),('0055-3559',6,'ROS',6),('9772-7245',2,'VIL',9);
/*!40000 ALTER TABLE `copia_giornale_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copia_libro_1`
--

DROP TABLE IF EXISTS `copia_libro_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `copia_libro_1` (
  `INVENTARIO` int unsigned NOT NULL,
  `COMUNE` varchar(45) NOT NULL,
  `EDITORE` varchar(255) NOT NULL,
  `DIMENSIONE` varchar(45) DEFAULT NULL,
  `N_PAGINE` int unsigned DEFAULT NULL,
  `STATO` varchar(45) NOT NULL DEFAULT 'AMMESSO AL PRESTITO',
  `LINGUE` varchar(45) DEFAULT NULL,
  `N_RISTAMPA` int NOT NULL,
  `ID_BIBLIOTECARIO_REGISTRA` int unsigned NOT NULL,
  PRIMARY KEY (`INVENTARIO`,`COMUNE`),
  KEY `ID_BIBLIOTECARIO_REGISTRA_COPIA_LIB_idx` (`ID_BIBLIOTECARIO_REGISTRA`),
  CONSTRAINT `CODICE_COPIA_LIB` FOREIGN KEY (`INVENTARIO`, `COMUNE`) REFERENCES `copia_libro_3` (`INVENTARIO`, `COMUNE`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ID_BIBLIOTECARIO_REGISTRA_COPIA_LIB` FOREIGN KEY (`ID_BIBLIOTECARIO_REGISTRA`) REFERENCES `bibliotecario` (`ID_BIBLIOTECARIO`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copia_libro_1`
--

LOCK TABLES `copia_libro_1` WRITE;
/*!40000 ALTER TABLE `copia_libro_1` DISABLE KEYS */;
INSERT INTO `copia_libro_1` VALUES (1,'BAP','Editorial Letra Minúscula','13,97 x 0,53 x\n21,59',84,'AMMESSO AL PRESTITO','italiano',5,6),(1,'CEN','The Planet','15,24 x 1,57 x 22,86',292,'AMMESSO AL PRESTITO','russo',3,20),(1,'GUV','Enaudi','13 x 2 x 20,8',214,'AMMESSO AL PRESTITO','italiano',2,11),(1,'LEN','Sperling & Kupfer','14,4 x 5,6 x 21,9',1216,'AMMESSO AL PRESTITO','italiano',2,10),(1,'OCC','Heartbeat Edizioni','14,9 x 3 x 21',300,'AMMESSO AL PRESTITO','italiano',1,21),(1,'ROS','Enaudi','',220,'AMMESSO AL PRESTITO','italiano',1,6),(1,'ROV','Enaudi','13 x 2 x 20,8',214,'AMMESSO AL PRESTITO','italiano',2,1),(1,'STI','Il Castoro','21,8 x 2,7 x 14,8',196,'AMMESSO AL PRESTITO','italiano',1,10),(1,'TRE','Piemme','14,7 x 3,4 x 19,4',377,'AMMESSO AL PRESTITO','italiano',2,2),(1,'VIL','Rowohlt Taschenbuch Verlag','14,5 x 2,4 x\n18,9',320,'AMMESSO AL PRESTITO','tedesco',2,20),(2,'BAP','Usborne','14,4 x 2,7 x 15',10,'PRESTATO','italiano',1,6),(2,'CEN','Black Cat-Cideb','21,3 x 0,8 x 15',NULL,'AMMESSO AL PRESTITO','inglese',3,3),(2,'GUV','Independently published','13,97 x 0,51 x 21,59',80,'AMMESSO AL PRESTITO','inglese',9,11),(2,'LEN','Sodis','11 x 0,9 x 18',144,'AMMESSO AL PRESTITO','francese',15,10),(2,'OCC','Cesare','',224,'AMMESSO AL PRESTITO','italiano',17,21),(2,'ROS','Mondadori','15 x 4 x 22,5',429,'AMMESSO AL PRESTITO','italiano',1,9),(2,'ROV','Einaudi','11,8 x 2 x 19,5',350,'AMMESSO AL PRESTITO','italiano',2,1),(2,'STI','Independently published','15,24 x 1,17 x\n22,86',184,'AMMESSO AL PRESTITO','italiano',20,16),(2,'TRE','Newton Compton Editori','13,1 x 3,5 x 20',212,'AMMESSO AL PRESTITO','italiano',12,2),(3,'BAP','Mondadori','14 x 1,7 x 21,3',216,'AMMESSO AL PRESTITO','italiano',1,6),(3,'GUV','CreateSpace Independent Publishing\nPlatform','15,24 x 0,86 x 22,86',148,'AMMESSO AL PRESTITO','russo',2,11),(3,'LEN','Einaudi','11,9 x 1 x 19,5',148,'AMMESSO AL PRESTITO','italiano',2,10),(3,'ROS','Cornerstone Digital','null',642,'AMMESSO AL PRESTITO','inglese',1,8),(3,'ROV','Einaudi','12 x 0,8 x 19.7',70,'AMMESSO AL PRESTITO','italiano',9,1),(4,'BAP','Mondadori','13,8 x 1,9 x 21,2',480,'AMMESSO AL PRESTITO','italiano',7,1),(4,'GUV','BUR Rizzoli','13 x 0,69 x 19,8',107,'AMMESSO AL PRESTITO','italiano',2,11),(4,'ROS','La torre dei Venti','13 x 2,7 x 22',436,'AMMESSO AL PRESTITO','italiano',1,8),(4,'ROV','Minotauro','15 x 1,7 x 23',320,'AMMESSO AL PRESTITO','spagnolo',1,4),(5,'ROS','Insignis Media','14 x 2,5 x 21',348,'AMMESSO AL PRESTITO','polacco',1,8),(5,'ROV','Hoepli','null',2272,'AMMESSO AL PRESTITO','italiano',2,4);
/*!40000 ALTER TABLE `copia_libro_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copia_libro_2`
--

DROP TABLE IF EXISTS `copia_libro_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `copia_libro_2` (
  `COMUNE` varchar(45) NOT NULL,
  `ID_BIBLIOTECA_PROPRIETARIA` int unsigned NOT NULL,
  PRIMARY KEY (`COMUNE`),
  KEY `ID_BIBLIOTECA_PROPRIETARIA_COPIA_LIB_idx` (`ID_BIBLIOTECA_PROPRIETARIA`),
  CONSTRAINT `COMUNE_LIB` FOREIGN KEY (`COMUNE`) REFERENCES `copia_libro_3` (`COMUNE`) ON UPDATE CASCADE,
  CONSTRAINT `ID_BIBLIOTECA_PROPRIETARIA_COPIA_LIB` FOREIGN KEY (`ID_BIBLIOTECA_PROPRIETARIA`) REFERENCES `biblioteca` (`ID_BIBLIOTECA`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copia_libro_2`
--

LOCK TABLES `copia_libro_2` WRITE;
/*!40000 ALTER TABLE `copia_libro_2` DISABLE KEYS */;
INSERT INTO `copia_libro_2` VALUES ('TRE',1),('BAP',2),('ROV',3),('LEN',4),('CEN',5),('ROS',6),('GUV',7),('OCC',8),('VIL',9),('STI',10);
/*!40000 ALTER TABLE `copia_libro_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copia_libro_3`
--

DROP TABLE IF EXISTS `copia_libro_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `copia_libro_3` (
  `ISBN_LIB` varchar(17) NOT NULL,
  `INVENTARIO` int unsigned NOT NULL,
  `COMUNE` varchar(45) NOT NULL,
  `ID_BIBLIOTECA_OSPITANTE` int unsigned NOT NULL,
  PRIMARY KEY (`ISBN_LIB`,`INVENTARIO`,`COMUNE`),
  KEY `CODICE_COPIA_LIB_idx` (`INVENTARIO`,`COMUNE`),
  KEY `COMUNE_LIB` (`COMUNE`),
  KEY `ID_BIBLIOTECA_OSPITA_COPIA_LIB_idx` (`ID_BIBLIOTECA_OSPITANTE`),
  CONSTRAINT `ID_BIBLIOTECA_OSPITA_COPIA_LIB` FOREIGN KEY (`ID_BIBLIOTECA_OSPITANTE`) REFERENCES `biblioteca` (`ID_BIBLIOTECA`) ON UPDATE CASCADE,
  CONSTRAINT `ISBN_LIB` FOREIGN KEY (`ISBN_LIB`) REFERENCES `libro` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copia_libro_3`
--

LOCK TABLES `copia_libro_3` WRITE;
/*!40000 ALTER TABLE `copia_libro_3` DISABLE KEYS */;
INSERT INTO `copia_libro_3` VALUES ('978-8804734567',2,'ROS',1),('978-8856656572',1,'TRE',1),('978-8867582313',2,'TRE',1),('978-8410245078',1,'BAP',2),('978-8410245078',5,'ROV',2),('978-8804732532',3,'BAP',2),('978-8867582313',2,'STI',2),('9788817165198',4,'BAP',2),('978-8806219352',1,'ROS',4),('978-8867582313',2,'OCC',4),('978-8880339236',1,'STI',4),('978-8804709930',3,'LEN',5),('978-8867582313',2,'ROV',5),('979-1281380769',1,'OCC',5),('978-8806217549',3,'ROS',6),('978-8863555578',5,'ROS',6),('978-8868365622',1,'LEN',6),('9788817165198',4,'ROS',6),('978-8410245078',2,'GUV',7),('978-8804709930',3,'GUV',7),('978-8806219352',1,'GUV',7),('978-8817168960',4,'GUV',7),('978-8806219352',1,'ROV',8),('978-8820366452',3,'ROV',8),('978-1409515449',2,'BAP',9),('978-8804732532',2,'CEN',9),('978-8856656572',1,'VIL',9),('9788817165198',1,'CEN',9),('978-8410245078',2,'LEN',10),('978-8863555578',4,'ROV',10);
/*!40000 ALTER TABLE `copia_libro_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copia_multimediale_1`
--

DROP TABLE IF EXISTS `copia_multimediale_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `copia_multimediale_1` (
  `INVENTARIO` int unsigned NOT NULL,
  `COMUNE` varchar(45) NOT NULL,
  `STATO` varchar(45) NOT NULL DEFAULT 'AMMESSO AL PRESTITO',
  `ID_BIBLIOTECARIO_REGISTRA` int unsigned NOT NULL,
  PRIMARY KEY (`INVENTARIO`,`COMUNE`),
  KEY `ID_BIBLIOTECARIO_REGISTRA_COPIA_MEDIA_idx` (`ID_BIBLIOTECARIO_REGISTRA`),
  CONSTRAINT `CODICE_COPIA_MEDIA` FOREIGN KEY (`INVENTARIO`, `COMUNE`) REFERENCES `copia_multimediale_3` (`INVENTARIO`, `COMUNE`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ID_BIBLIOTECARIO_REGISTRA_COPIA_MEDIA` FOREIGN KEY (`ID_BIBLIOTECARIO_REGISTRA`) REFERENCES `bibliotecario` (`ID_BIBLIOTECARIO`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copia_multimediale_1`
--

LOCK TABLES `copia_multimediale_1` WRITE;
/*!40000 ALTER TABLE `copia_multimediale_1` DISABLE KEYS */;
INSERT INTO `copia_multimediale_1` VALUES (3,'TRE','AMMESSO AL PRESTITO',2),(3,'VIL','AMMESSO AL PRESTITO',20),(7,'ROV','AMMESSO AL PRESTITO',1),(8,'ROV','AMMESSO AL PRESTITO',1),(9,'ROV','AMMESSO AL PRESTITO',4);
/*!40000 ALTER TABLE `copia_multimediale_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copia_multimediale_2`
--

DROP TABLE IF EXISTS `copia_multimediale_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `copia_multimediale_2` (
  `COMUNE` varchar(45) NOT NULL,
  `ID_BIBLIOTECA_PROPRIETARIA` int unsigned NOT NULL,
  PRIMARY KEY (`COMUNE`),
  KEY `ID_BIBLIOTECA_PROPRIETARIA_COPIA_MEDIA_idx` (`ID_BIBLIOTECA_PROPRIETARIA`),
  CONSTRAINT `COMUNE_PROP_COPIA_MEDIA` FOREIGN KEY (`COMUNE`) REFERENCES `copia_multimediale_3` (`COMUNE`) ON UPDATE CASCADE,
  CONSTRAINT `ID_BIBLIOTECA_PROPRIETARIA_COPIA_MEDIA` FOREIGN KEY (`ID_BIBLIOTECA_PROPRIETARIA`) REFERENCES `biblioteca` (`ID_BIBLIOTECA`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copia_multimediale_2`
--

LOCK TABLES `copia_multimediale_2` WRITE;
/*!40000 ALTER TABLE `copia_multimediale_2` DISABLE KEYS */;
INSERT INTO `copia_multimediale_2` VALUES ('TRE',1),('ROV',3),('VIL',9);
/*!40000 ALTER TABLE `copia_multimediale_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copia_multimediale_3`
--

DROP TABLE IF EXISTS `copia_multimediale_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `copia_multimediale_3` (
  `ID_MULTIMEDIALE` int unsigned NOT NULL,
  `INVENTARIO` int unsigned NOT NULL,
  `COMUNE` varchar(45) NOT NULL,
  `ID_BIBLIOTECA_OSPITANTE` int unsigned NOT NULL,
  PRIMARY KEY (`ID_MULTIMEDIALE`,`INVENTARIO`,`COMUNE`),
  KEY `ID_BIBLIOTECA_OSPITANTE_COPIA_MEDIA_idx` (`ID_BIBLIOTECA_OSPITANTE`),
  KEY `CODICE_COPIA_MEDIA_idx` (`INVENTARIO`,`COMUNE`),
  KEY `COMUNE_PROP_COPIA_MEDIA_idx` (`COMUNE`),
  CONSTRAINT `ID_BIBLIOTECA_OSPITANTE_COPIA_MEDIA` FOREIGN KEY (`ID_BIBLIOTECA_OSPITANTE`) REFERENCES `biblioteca` (`ID_BIBLIOTECA`) ON UPDATE CASCADE,
  CONSTRAINT `ID_MEDIA_COPIA` FOREIGN KEY (`ID_MULTIMEDIALE`) REFERENCES `multimedia` (`ID_MULTIMEDIA`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copia_multimediale_3`
--

LOCK TABLES `copia_multimediale_3` WRITE;
/*!40000 ALTER TABLE `copia_multimediale_3` DISABLE KEYS */;
INSERT INTO `copia_multimediale_3` VALUES (3,3,'TRE',1),(1,7,'ROV',3),(2,8,'ROV',3),(5,9,'ROV',3),(4,3,'VIL',9);
/*!40000 ALTER TABLE `copia_multimediale_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento` (
  `ID_EVENTO` int unsigned NOT NULL AUTO_INCREMENT,
  `DATA` datetime NOT NULL,
  `LUOGO` varchar(255) NOT NULL,
  `DESCRIZIONE` varchar(8000) DEFAULT NULL,
  PRIMARY KEY (`ID_EVENTO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,'2024-06-29 17:00:00','Abbazia della Vangadizza','Presentazione nuovo libro di Mauro Corona'),(2,'2024-08-06 21:20:00','Biblioteca di Guarda Veneta','Lettura di \"Se questo è un uomo\" di Primo\nLevi'),(3,'2024-06-29 17:00:00','Abbazia della Vangadizza','Visione del film “Barbie” di Greta Gerwig'),(4,'2024-09-03 20:30:00','Piazzale Europa a Rosolina Mare','Concerto di Annalisa organizzato dalla\nbiblioteca di Rosolina come raccolta fondi per la ristrutturazione delle scuole della Palestina'),(5,'2024-10-01 15:45:00','Abbazia della Vangadizza','Presentazione del nuovo fumetto “LUX” di\nRiot Comics');
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giornale`
--

DROP TABLE IF EXISTS `giornale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giornale` (
  `ISSN` char(9) NOT NULL,
  `GENERE` varchar(255) NOT NULL,
  `EDITORE` varchar(255) NOT NULL,
  `TITOLO` varchar(255) NOT NULL,
  `NUMERO` int unsigned DEFAULT NULL,
  `DATA_PUBL` date NOT NULL,
  `IMM_COPERTINA` varchar(510) DEFAULT NULL,
  `ID_BIBLIOTECARIO_REGISTRA` int unsigned NOT NULL,
  PRIMARY KEY (`ISSN`),
  KEY `ID_BIBLIOTECARIO_REGISTRA_GIOR_idx` (`ID_BIBLIOTECARIO_REGISTRA`),
  CONSTRAINT `ID_BIBLIOTECARIO_REGISTRA_GIOR` FOREIGN KEY (`ID_BIBLIOTECARIO_REGISTRA`) REFERENCES `bibliotecario` (`ID_BIBLIOTECARIO`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giornale`
--

LOCK TABLES `giornale` WRITE;
/*!40000 ALTER TABLE `giornale` DISABLE KEYS */;
INSERT INTO `giornale` VALUES ('0055-3559','cronaca','Roma : Libreria G. Amori','La campana di S. Pietro bollettino\nreligioso settimanale',5,'1880-12-09','http://digitale.bnc.roma.sbn.it/tecadigitale/img/giornale/TO00553559/1880-1881/unico/med',8),('9770-3917','economia','Il Sole 24 Ore','Guida normativa Il sole 24 ore - NOVITÀ\nFISCALI 2024',1,'2024-01-20','https://edicola.shop/media/catalog/product/cache/1/thumbnail/400x/17f82f742ffe127f42dca9de82f\nb58b1/b/7/b7d0caaa03.jpg',6),('9771-1247','sport','Corriere dello Sport','Am - Tuttosport - Automese',3,'2020-03-01','https://edicola.shop/media/catalog/product/cache/1/thumbnail/400x/17f82f742ffe127f42dca9de82f\nb58b1/i/m/image_549_1_2698_1_15947.png',3),('9771-5941','attualità','Edizioni Vero','Vero – Settimanale di Attualità',51,'2021-12-22','https://edicola.shop/media/catalog/product/cache/1/thumbnail/400x/17f82f742ffe127f42dca9de82f\nb58b1/0/3/03a1997e62.jpg',3),('9772-0396','moda','Hearts Magazines Italia','Elle Italia',18,'2024-05-09','https://edicola.shop/media/catalog/product/cache/1/thumbnail/400x/17f82f742ffe127f42dca9de82f',3),('9772-0397','musica e spettacolo','Sprea','Classic Rock - I protagonisti del rock',1,'2023-05-01','https://edicola.shop/media/catalog/product/cache/1/thumbnail/400x/17f82f742ffe127f42dca9de82f\nb58b1/c/f/cf9a99d9c6.jpg',4),('9772-7245','politica','Editore Domani','Politica speciale del quotidiano Domani',4,'2023-04-08','https://edicola.shop/media/catalog/product/cache/1/thumbnail/400x/17f82f742ffe127f42dca9de82f\nb58b1/b/5/b5ba1e8152.jpg',20);
/*!40000 ALTER TABLE `giornale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `ISBN` varchar(17) NOT NULL,
  `TITOLO` varchar(510) NOT NULL,
  `ANNO_PRIMA_PUBL` smallint unsigned DEFAULT NULL,
  `IMM_COPERTINA` varchar(510) DEFAULT NULL,
  `AUTORE` varchar(510) NOT NULL,
  `GENERE` varchar(255) NOT NULL,
  `ID_BIBLIOTECARIO_REGISTRA` int unsigned NOT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `ID_BIBLIOTECARIO_REGISTRA_LIBRO_idx` (`ID_BIBLIOTECARIO_REGISTRA`),
  CONSTRAINT `ID_BIBLIOTECARIO_REGISTRA_LIBRO` FOREIGN KEY (`ID_BIBLIOTECARIO_REGISTRA`) REFERENCES `bibliotecario` (`ID_BIBLIOTECARIO`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES ('978-1409515449','Il mio primo carezzalibro',2010,' https://m.media-amazon.com/images/I/51GMpP8x55L._SY342_.jpg','Fiona Watt','per bambini',1),('978-8410245078','LA METAMORFOSI',1915,'https://m.media-amazon.com/images/I/61TvARLsv1L._SL1500_.jpg','Franz Kafka','fantasy',4),('978-8804709930','La Figlia Del Capitano',1836,'https://m.media-amazon.com/images/I/410EII5wVIL._SY445_SX342_.jpg','Aleksandr Puskin','narrativa',11),('978-8804732532','Assassinio sull Orient Express',1974,'https://m.media-amazon.com/images/I/71-gfpil2WL._SY466_.jpg','Agatha Christie','giallo',6),('978-8804734567','Gli occhi di Venezia',2020,'https://m.media-amazon.com/images/I/81iZNoEQ2+L._SY466_.jpg','Alessandro Barbero','storico',9),('978-8806217549','Il Cartello',2015,'https://m.media-amazon.com/images/I/71o+yzqPkML._SY522_.jpg','Don Winslow','thriller',9),('978-8806219352','Se questo è un uomo',1947,'https://m.media-amazon.com/images/I/61dZugeFuJL._SL1261_.jpg','Primo Levi','biografia',11),('978-8817168960','La donna di picche',1834,'https://m.media-amazon.com/images/I/71pgyNs7GLL._SY466_.jpg','Aleksandr Puskin','narrativa',11),('978-8820366452','Manuale di meccanica',2016,'https://m.media-amazon.com/images/I/81jngfPF1OL._SY425_.jpg','Luigi Caligaris','scienze',4),('978-8856656572','Nel Regno della Fantasia',2003,'https://m.media-amazon.com/images/I/81+BhlS2y-L._SY425_.jpg','Geronimo Stilton','narrativa per ragazzi',2),('978-8863555578','Outpost',2022,'https://m.media-amazon.com/images/I/610lysX4M0L._SY466_.jpg','Dmitry Glukhovsky','avventura',4),('978-8867582313','Il fu Mattia Pascal',1904,'https://m.media-amazon.com/images/I/615tweD7PdL._SY466_.jpg','Luigi Pirandello','narrativa',11),('978-8868365622','It',1986,'https://m.media-\namazon.com/images/I/61pveRMfvcL._SY466_.jpg','Stephen King','horror',10),('978-8880339236','Io sono Zero',2015,'https://m.media-amazon.com/images/I/71mBfXkdDuL._SY466_.jpg','Luigi Ballerini','fantascienza',16),('9788817165198','Eugenio Onegin',1825,'https://m.media-amazon.com/images/I/71Quq-CHm7L._SY466_.jpg','Aleksandr Puskin','narrativa',11),('979-1281380769','La damigella sbagliata',2024,'https://m.media-amazon.com/images/I/71Hn5ZX6UyL._SY425_.jpg','Lauren Landish','rosa',21);
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multimedia`
--

DROP TABLE IF EXISTS `multimedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multimedia` (
  `ID_MULTIMEDIA` int unsigned NOT NULL AUTO_INCREMENT,
  `GENERE` varchar(255) NOT NULL,
  `EDITORE` varchar(255) NOT NULL,
  `TITOLO` varchar(255) NOT NULL,
  `TIPO` varchar(45) NOT NULL,
  `IMM_COPERTINA` varchar(510) DEFAULT NULL,
  `ID_BIBLIOTECARIO_REGISTRA` int unsigned NOT NULL,
  PRIMARY KEY (`ID_MULTIMEDIA`),
  KEY `ID_BIBLIOTECARIO_REGISTA_MEDIA_idx` (`ID_BIBLIOTECARIO_REGISTRA`),
  CONSTRAINT `ID_BIBLIOTECARIO_REGISTA_MEDIA` FOREIGN KEY (`ID_BIBLIOTECARIO_REGISTRA`) REFERENCES `bibliotecario` (`ID_BIBLIOTECARIO`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multimedia`
--

LOCK TABLES `multimedia` WRITE;
/*!40000 ALTER TABLE `multimedia` DISABLE KEYS */;
INSERT INTO `multimedia` VALUES (1,'pop','Universal Music Italy','Ok. Respira','CD','https://m.media-amazon.com/images/I/51MiEFVfhqL._AC_SX522_.jpg',1),(2,'punk','Sony Music','London Calling','CD','https://m.media-amazon.com/images/I/71lsBqSZ5zL._AC_SX522_.jpg',1),(3,'animazione','Universal','BARBIE IN LE 12 PRINCIPESSE DANZANTI','DVD','https://m.media-amazon.com/images/I/718pWGeFkFL._AC_SY879_.jpg',2),(4,'rock','Revive','All Is\nViolent All Is Bright','CD','https://m.media-amazon.com/images/I/610xfhmxR0L._AC_SX522_.jpg',4),(5,'jazz','VIDB1','Structuralism','CD','https://m.media-amazon.com/images/I/71oDN3+ZgpL._AC_SX522_.jpg',20);
/*!40000 ALTER TABLE `multimedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizza`
--

DROP TABLE IF EXISTS `organizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizza` (
  `ID_EVENTO_ORGANIZZATO` int unsigned NOT NULL,
  `ID_BIBLIOTECARIO_ORGANIZZATORE` int unsigned NOT NULL,
  `ID_BIBLIOTECA` int unsigned NOT NULL,
  PRIMARY KEY (`ID_EVENTO_ORGANIZZATO`),
  KEY `ID_BIBLIOTECARIO_ORGANIZZATORE_idx` (`ID_BIBLIOTECARIO_ORGANIZZATORE`),
  KEY `ID_BIBLIOTECA_ORGANIZZATRICE_idx` (`ID_BIBLIOTECA`) /*!80000 INVISIBLE */,
  CONSTRAINT `ID_BIBLIOTECA_OSPITANTE` FOREIGN KEY (`ID_BIBLIOTECA`) REFERENCES `biblioteca` (`ID_BIBLIOTECA`) ON UPDATE CASCADE,
  CONSTRAINT `ID_BIBLIOTECARIO_ORGANIZZATORE` FOREIGN KEY (`ID_BIBLIOTECARIO_ORGANIZZATORE`) REFERENCES `bibliotecario` (`ID_BIBLIOTECARIO`) ON UPDATE CASCADE,
  CONSTRAINT `ID_EVENTO_ORGANIZZATO` FOREIGN KEY (`ID_EVENTO_ORGANIZZATO`) REFERENCES `evento` (`ID_EVENTO`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizza`
--

LOCK TABLES `organizza` WRITE;
/*!40000 ALTER TABLE `organizza` DISABLE KEYS */;
INSERT INTO `organizza` VALUES (1,6,2),(2,11,7),(3,6,2),(4,9,6),(5,6,2);
/*!40000 ALTER TABLE `organizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `ID_UTENTE` int unsigned NOT NULL AUTO_INCREMENT,
  `COD_FISCALE` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PASSWORD` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `EMAIL` varchar(320) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `N_TELEFONO` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `INDIRIZZO` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LUOGO_NASCITA` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DATA_NASCITA` date NOT NULL,
  `STATO_ACCOUNT` tinyint unsigned NOT NULL DEFAULT '1',
  `NOTIFICHE_ATTIVE` tinyint unsigned NOT NULL DEFAULT '1',
  `NOME_BATT` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `COGNOME` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ID_UTENTE`),
  UNIQUE KEY `COD_FISCALE_UNIQUE` (`COD_FISCALE`),
  UNIQUE KEY `EMAIL_UNIQUE` (`EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (1,'PLLMNC02P43L840A','monicaPellegrini02','monica.pellegrini@gmail.com','3779821681','Via Roveri Fozzati, 660, 45021, Badia Polesine, RO ','Vicenza','2002-09-03',1,1,'Monica','Pellegrini'),(2,'GRDFRN02G43D840A','francescoGirardello02','francesco.girardello@gmail.com','3426356631','Via San Francesco, 16, 45027, Trecenta, RO ','Trecenta','2002-04-26',1,1,'Francesco','Girardello'),(3,'PRSGLR02P47R880A','gloriaPareschi02','gloria.pareschi@gmail.com','3788827681','Via Roma, 25, 45030, Calto, RO ','Trecenta','2002-02-16',1,1,'Gloria','Pareschi'),(4,'CRFLRR96C45R960A','TRLara1996','lara.croft@gmail.com','3899821771','Corso Del Popolo, 6, 45100, Rovigo, RO ','Londra','1968-02-14',1,1,'Lara','Croft'),(5,'PLLMSM72P55L850A','massimoPellegrini72','massimo.pellegrini@gmail.com','3336636605','Via Roveri Fozzati, 660, 45021, Badia Polesine,\nRO ','Monselice','1972-04-24',1,1,'Massimo','Pellegrini'),(6,'LRRMRS72L43L860A','marisaLora72','marisa.lora@gmail.com','3497533701','Via Roveri Fozzati, 660, 45021, Badia Polesine, RO ','Legnago','1972-04-26',1,1,'Marisa','Lora'),(7,'KRMCTL11P43L870A','ciaoabcd21','caitlyn.kiramman@gmail.com','9999821681','Via Felice Cavalotti, 86, 45100, Rovigo, RO ','Rovigo','2011-01-04',1,1,'Caitlyn','Kiramman'),(8,'SLRLNN11P43L770A','solebellissimo11','leona.solari@gmail.com','3459821181','Via Fratelli Cervi, 2, 45020, Giacciano con Baruchella,\nRO ','Belluno','2011-07-13',1,1,'Leona','Solari'),(9,'DNNLNR11P43R640A','lunabellssima12','diana.lunari@gmail.com','3769821681','Via Madonnina, 2, 45020, Giacciano con Baruchella, RO\n','Vicenza','2012-08-07',1,1,'Diana','Lunari'),(10,'NKKLRC03G43D840A','lorencoNoka03','lorenco.noka@gmail.com','3226356731','Via San Francesco, 88, 45026, Lendinara, RO ','Tirana','2003-01-11',1,1,'Lorenco','Noka'),(11,'VSNLRD93G43D840A','loredanaVisentin93','loredana.visentin@gmail.com','3278356731','Via della Repubblica, 7, 45030, Occhiobello, RO ','Roma','1993-06-29',1,1,'Loredana','Visentin'),(12,'DAIWEI02A04C469M','backend02','wei.dai@hotmail.com','3759721181','Via della Rotta, 33, 41034, Finale Emilia, MO ','Modena','2002-04-01',1,1,'Wei','Dai'),(13,'BSGMTL01S69L840A','tunztunzparapara','mattia.bisignani@gmail.com','3899841671','Via Donato Creti, 1670, 40054, Bologna, BO ','Bologna','2001-04-23',1,1,'Mattia','Bisignani'),(14,'PSVSLV98G47D840A','cacciacanipiopio','silvio.gunner@gmail.com','3225356771','Via Roma, 56, 36016, Thiene, VI','Vicenza','1998-11-11',1,1,'Silvio','Pesavento'),(15,'JSMBRX03P43B780A','jasmineBrixen03','jasmine.brixen@gmail.com','3129821981','Via Corte Surian, 45, 30100, Venezia, VE','Mestre','2003-05-16',1,1,'Jasmine','Brixen'),(16,'QCHNDR02P43B780A','quacchiandreasonico','quacchi.andrea@gmail.com','3129721931','Via Maffei, 13, 45039, Stienta, RO','Stienta','2002-11-18',1,1,'Andrea','Quacchi'),(17,'WAWVLT94G43D760A','vistandforviolet','violet.warwick@hotmail.com','3427356363','Viale degli Scaligeri, 1786, 36100, Vicenza, VI','Catanzaro','1994-12-22',1,1,'Violet','Warwick'),(18,'TRVKYL45G43D840A','123456aaa','kayle.trevisan@gmail.com','3426656661','Contrada del Gatto, 9, 30033, Noale, VE','Trento','1945-10-02',1,1,'Kayle','Trevisan'),(19,'ZANEND77P43Z680A','zanin123456','endi.zanin@gmail.com','3127721654','Via Roma, 13, 45039, Stienta, RO','Stienta','1977-07-19',1,1,'Endi','Zanin'),(20,'LMNAIM04P43Z680A','aimenlimouni','aimen.limouni@gmail.com','3166721654','Via San Giuseppe, 789, 45011, Ca emo, RO','Monselice','2004-02-15',1,1,'Aimen','Limouni'),(21,'GALMTD86G43Z780A','gabbiani1000','matilde.galeta@gmail.com','3527751654','Via Santa Lucia, 18, 45040, Vescovana, PD','Padova','1986-03-19',1,1,'Matilde','Galeta');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente_partecipa_evento`
--

DROP TABLE IF EXISTS `utente_partecipa_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente_partecipa_evento` (
  `ID_UTENTE_PARTECIPANTE` int unsigned NOT NULL,
  `ID_EVENTO` int unsigned NOT NULL,
  PRIMARY KEY (`ID_EVENTO`,`ID_UTENTE_PARTECIPANTE`),
  KEY `ID_UTENTE_PARTECIPANTE_idx` (`ID_UTENTE_PARTECIPANTE`),
  CONSTRAINT `ID_EVENTO` FOREIGN KEY (`ID_EVENTO`) REFERENCES `evento` (`ID_EVENTO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ID_UTENTE_PARTECIPANTE` FOREIGN KEY (`ID_UTENTE_PARTECIPANTE`) REFERENCES `utente` (`ID_UTENTE`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente_partecipa_evento`
--

LOCK TABLES `utente_partecipa_evento` WRITE;
/*!40000 ALTER TABLE `utente_partecipa_evento` DISABLE KEYS */;
INSERT INTO `utente_partecipa_evento` VALUES (1,3),(1,4),(2,3),(3,4),(4,3),(6,3),(7,4),(7,5),(8,5),(9,5),(10,5),(11,1),(11,2),(12,1),(12,4),(13,4),(13,5),(15,1),(15,5),(18,2),(19,3),(21,4);
/*!40000 ALTER TABLE `utente_partecipa_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente_prende_prestito_copia_giornale`
--

DROP TABLE IF EXISTS `utente_prende_prestito_copia_giornale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente_prende_prestito_copia_giornale` (
  `ID_UTENTE` int unsigned NOT NULL,
  `ISSN_PRESTITO` char(9) NOT NULL,
  `INVENTARIO_PRESTITO` int unsigned NOT NULL,
  `COMUNE_PRESTITO` varchar(45) NOT NULL,
  `DATA_INIZIO_PRESTITO` date NOT NULL,
  `DATA_SCADENZA_PRESTITO` date GENERATED ALWAYS AS ((`DATA_INIZIO_PRESTITO` + interval 30 day)) VIRTUAL,
  `DATA_RESTITUZIONE` date DEFAULT NULL,
  PRIMARY KEY (`ID_UTENTE`,`ISSN_PRESTITO`,`INVENTARIO_PRESTITO`,`COMUNE_PRESTITO`,`DATA_INIZIO_PRESTITO`),
  KEY `PRESTITO_COPIA_GIOR_idx` (`ISSN_PRESTITO`,`INVENTARIO_PRESTITO`,`COMUNE_PRESTITO`),
  CONSTRAINT `ID_UTENTE_PRESTITO_COPIA_GIOR` FOREIGN KEY (`ID_UTENTE`) REFERENCES `utente` (`ID_UTENTE`) ON UPDATE CASCADE,
  CONSTRAINT `PRESTITO_COPIA_GIOR` FOREIGN KEY (`ISSN_PRESTITO`, `INVENTARIO_PRESTITO`, `COMUNE_PRESTITO`) REFERENCES `copia_giornale_3` (`ISSN_GIOR`, `INVENTARIO`, `COMUNE`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente_prende_prestito_copia_giornale`
--

LOCK TABLES `utente_prende_prestito_copia_giornale` WRITE;
/*!40000 ALTER TABLE `utente_prende_prestito_copia_giornale` DISABLE KEYS */;
INSERT INTO `utente_prende_prestito_copia_giornale` (`ID_UTENTE`, `ISSN_PRESTITO`, `INVENTARIO_PRESTITO`, `COMUNE_PRESTITO`, `DATA_INIZIO_PRESTITO`, `DATA_RESTITUZIONE`) VALUES (4,'9771-1247',3,'CEN','2020-03-15','2020-03-17'),(20,'9772-0396',5,'CEN','2024-05-17','2024-06-03'),(21,'9770-3917',5,'BAP','2024-01-22','2024-01-24');
/*!40000 ALTER TABLE `utente_prende_prestito_copia_giornale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente_prende_prestito_copia_libro`
--

DROP TABLE IF EXISTS `utente_prende_prestito_copia_libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente_prende_prestito_copia_libro` (
  `ID_UTENTE` int unsigned NOT NULL,
  `ISBN_PRESTITO` varchar(17) NOT NULL,
  `INVENTARIO_PRESTITO` int unsigned NOT NULL,
  `COMUNE_PRESTITO` varchar(45) NOT NULL,
  `DATA_INIZIO_PRESTITO` date NOT NULL,
  `DATA_SCADENZA_PRESTITO` date GENERATED ALWAYS AS ((`DATA_INIZIO_PRESTITO` + interval 30 day)) VIRTUAL,
  `DATA_RESTITUZIONE` date DEFAULT NULL,
  PRIMARY KEY (`ID_UTENTE`,`ISBN_PRESTITO`,`INVENTARIO_PRESTITO`,`COMUNE_PRESTITO`,`DATA_INIZIO_PRESTITO`),
  KEY `PRESTITO_COPIA_LIB_idx` (`ISBN_PRESTITO`,`INVENTARIO_PRESTITO`,`COMUNE_PRESTITO`),
  CONSTRAINT `ID_UTENTE_PRESTITO_COPIA_LIB` FOREIGN KEY (`ID_UTENTE`) REFERENCES `utente` (`ID_UTENTE`) ON UPDATE CASCADE,
  CONSTRAINT `PRESTITO_COPIA_LIB` FOREIGN KEY (`ISBN_PRESTITO`, `INVENTARIO_PRESTITO`, `COMUNE_PRESTITO`) REFERENCES `copia_libro_3` (`ISBN_LIB`, `INVENTARIO`, `COMUNE`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente_prende_prestito_copia_libro`
--

LOCK TABLES `utente_prende_prestito_copia_libro` WRITE;
/*!40000 ALTER TABLE `utente_prende_prestito_copia_libro` DISABLE KEYS */;
INSERT INTO `utente_prende_prestito_copia_libro` (`ID_UTENTE`, `ISBN_PRESTITO`, `INVENTARIO_PRESTITO`, `COMUNE_PRESTITO`, `DATA_INIZIO_PRESTITO`, `DATA_RESTITUZIONE`) VALUES (1,'978-8410245078',2,'LEN','2023-09-14','2023-10-05'),(4,'978-8820366452',3,'ROV','2021-09-03','2021-09-05'),(4,'978-8820366452',3,'ROV','2022-01-25','2022-02-01'),(5,'978-8863555578',5,'ROS','2022-11-06','2022-11-06'),(5,'978-8867582313',2,'TRE','2023-02-02','2023-02-09'),(7,'978-8806217549',3,'ROS','2016-03-07','2016-03-14'),(7,'978-8868365622',1,'LEN','2024-01-13','2024-02-02'),(8,'978-8880339236',1,'STI','2024-06-17',NULL),(9,'978-8867582313',2,'TRE','2024-06-25',NULL),(12,'979-1281380769',1,'OCC','2024-04-19','2024-05-10'),(13,'978-8817168960',4,'GUV','2020-12-01','2021-01-10'),(14,'978-8820366452',3,'ROV','2019-10-06','2019-11-01'),(15,'978-1409515449',2,'BAP','2023-06-01',NULL),(16,'9788817165198',1,'CEN','2024-05-26',NULL),(17,'978-8806219352',1,'GUV','2024-05-12','2024-06-10'),(18,'978-1409515449',2,'BAP','2016-02-14','2016-03-10'),(18,'978-8410245078',2,'GUV','2017-01-12','2017-01-29'),(18,'978-8410245078',5,'ROV','2021-08-21',NULL),(18,'978-8817168960',4,'GUV','2017-06-03','2017-06-30'),(21,'978-8804734567',2,'ROS','2024-06-03',NULL),(21,'979-1281380769',1,'OCC','2024-02-14','2024-02-24');
/*!40000 ALTER TABLE `utente_prende_prestito_copia_libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente_prende_prestito_copia_multimedia`
--

DROP TABLE IF EXISTS `utente_prende_prestito_copia_multimedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente_prende_prestito_copia_multimedia` (
  `ID_UTENTE` int unsigned NOT NULL,
  `ID_MEDIA_PRESTITO` int unsigned NOT NULL,
  `INVENTARIO_PRESTITO` int unsigned NOT NULL,
  `COMUNE_PRESTITO` varchar(45) NOT NULL,
  `DATA_INIZIO_PRESTITO` date NOT NULL,
  `DATA_SCADENZA_PRESTITO` date GENERATED ALWAYS AS ((`DATA_INIZIO_PRESTITO` + interval 30 day)) VIRTUAL,
  `DATA_RESTITUZIONE` date DEFAULT NULL,
  PRIMARY KEY (`ID_UTENTE`,`ID_MEDIA_PRESTITO`,`INVENTARIO_PRESTITO`,`COMUNE_PRESTITO`,`DATA_INIZIO_PRESTITO`),
  KEY `PRESTITO_COPIA_MEDIA_idx` (`ID_MEDIA_PRESTITO`,`INVENTARIO_PRESTITO`,`COMUNE_PRESTITO`),
  CONSTRAINT `ID_UTENTE_PRESTITO_COPIA_MEDIA` FOREIGN KEY (`ID_UTENTE`) REFERENCES `utente` (`ID_UTENTE`) ON UPDATE CASCADE,
  CONSTRAINT `PRESTITO_COPIA_MEDIA` FOREIGN KEY (`ID_MEDIA_PRESTITO`, `INVENTARIO_PRESTITO`, `COMUNE_PRESTITO`) REFERENCES `copia_multimediale_3` (`ID_MULTIMEDIALE`, `INVENTARIO`, `COMUNE`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente_prende_prestito_copia_multimedia`
--

LOCK TABLES `utente_prende_prestito_copia_multimedia` WRITE;
/*!40000 ALTER TABLE `utente_prende_prestito_copia_multimedia` DISABLE KEYS */;
INSERT INTO `utente_prende_prestito_copia_multimedia` (`ID_UTENTE`, `ID_MEDIA_PRESTITO`, `INVENTARIO_PRESTITO`, `COMUNE_PRESTITO`, `DATA_INIZIO_PRESTITO`, `DATA_RESTITUZIONE`) VALUES (1,1,7,'ROV','2023-06-10','2023-07-10'),(1,1,7,'ROV','2023-07-11','2023-08-11'),(1,1,7,'ROV','2023-08-12','2023-09-13'),(1,2,8,'ROV','2022-09-05','2022-10-04'),(1,4,3,'VIL','2022-09-05','2022-10-04'),(1,5,9,'ROV','2022-09-05','2022-10-04'),(2,3,3,'TRE','2020-03-05',NULL);
/*!40000 ALTER TABLE `utente_prende_prestito_copia_multimedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente_wishlist_giornale`
--

DROP TABLE IF EXISTS `utente_wishlist_giornale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente_wishlist_giornale` (
  `ID_UTENTE` int unsigned NOT NULL,
  `ISSN_WISHLIST` char(9) NOT NULL,
  PRIMARY KEY (`ID_UTENTE`,`ISSN_WISHLIST`),
  KEY `ISSN_WISHLIST_idx` (`ISSN_WISHLIST`),
  CONSTRAINT `ID_UTENTE_WISHLIST_GIOR` FOREIGN KEY (`ID_UTENTE`) REFERENCES `utente` (`ID_UTENTE`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ISSN_WISHLIST` FOREIGN KEY (`ISSN_WISHLIST`) REFERENCES `giornale` (`ISSN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente_wishlist_giornale`
--

LOCK TABLES `utente_wishlist_giornale` WRITE;
/*!40000 ALTER TABLE `utente_wishlist_giornale` DISABLE KEYS */;
INSERT INTO `utente_wishlist_giornale` VALUES (8,'0055-3559'),(14,'9770-3917'),(5,'9771-1247'),(19,'9771-1247'),(21,'9771-5941'),(9,'9772-0396'),(18,'9772-7245');
/*!40000 ALTER TABLE `utente_wishlist_giornale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente_wishlist_libro`
--

DROP TABLE IF EXISTS `utente_wishlist_libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente_wishlist_libro` (
  `ID_UTENTE` int unsigned NOT NULL,
  `ISBN_WISHLIST` varchar(17) NOT NULL,
  PRIMARY KEY (`ID_UTENTE`,`ISBN_WISHLIST`),
  KEY `ISBN_WISHLIST_idx` (`ISBN_WISHLIST`),
  CONSTRAINT `ID_UTENTE_WISHLIST_LIB` FOREIGN KEY (`ID_UTENTE`) REFERENCES `utente` (`ID_UTENTE`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ISBN_WISHLIST` FOREIGN KEY (`ISBN_WISHLIST`) REFERENCES `libro` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente_wishlist_libro`
--

LOCK TABLES `utente_wishlist_libro` WRITE;
/*!40000 ALTER TABLE `utente_wishlist_libro` DISABLE KEYS */;
INSERT INTO `utente_wishlist_libro` VALUES (12,'978-1409515449'),(15,'978-1409515449'),(5,'978-8410245078'),(7,'978-8804709930'),(11,'978-8804734567'),(7,'978-8806217549'),(6,'978-8806219352'),(20,'978-8820366452'),(4,'978-8863555578'),(17,'978-8868365622'),(1,'9788817165198'),(3,'979-1281380769'),(21,'979-1281380769');
/*!40000 ALTER TABLE `utente_wishlist_libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente_wishlist_multimediale`
--

DROP TABLE IF EXISTS `utente_wishlist_multimediale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente_wishlist_multimediale` (
  `ID_UTENTE` int unsigned NOT NULL,
  `ID_MEDIA_WISHLIST` int unsigned NOT NULL,
  PRIMARY KEY (`ID_UTENTE`,`ID_MEDIA_WISHLIST`),
  KEY `ID_MEDIA_WISHLIST_idx` (`ID_MEDIA_WISHLIST`),
  CONSTRAINT `ID_MEDIA_WISHLIST` FOREIGN KEY (`ID_MEDIA_WISHLIST`) REFERENCES `multimedia` (`ID_MULTIMEDIA`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ID_UTENTE_WISHLIST_MEDIA` FOREIGN KEY (`ID_UTENTE`) REFERENCES `utente` (`ID_UTENTE`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente_wishlist_multimediale`
--

LOCK TABLES `utente_wishlist_multimediale` WRITE;
/*!40000 ALTER TABLE `utente_wishlist_multimediale` DISABLE KEYS */;
INSERT INTO `utente_wishlist_multimediale` VALUES (1,1),(3,1),(4,1),(21,1),(18,2),(2,3),(20,4),(2,5),(12,5),(20,5);
/*!40000 ALTER TABLE `utente_wishlist_multimediale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viene_registarto_a`
--

DROP TABLE IF EXISTS `viene_registarto_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viene_registarto_a` (
  `ID_UTENTE_REGISTRATO` int unsigned NOT NULL,
  `ID_BIBLIOTECA` int unsigned NOT NULL,
  `ID_BIBLIOTECARIO_REGISTRA` int unsigned NOT NULL,
  PRIMARY KEY (`ID_UTENTE_REGISTRATO`,`ID_BIBLIOTECA`),
  KEY `ID_BIBLIOTECARIO_REGISTRA_idx` (`ID_BIBLIOTECARIO_REGISTRA`),
  KEY `ID_BIBLIOTECA_REGISTRATO_idx` (`ID_BIBLIOTECA`),
  CONSTRAINT `ID_BIBLIOTECA_REGISTRATO` FOREIGN KEY (`ID_BIBLIOTECA`) REFERENCES `biblioteca` (`ID_BIBLIOTECA`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ID_BIBLIOTECARIO_REGISTRA` FOREIGN KEY (`ID_BIBLIOTECARIO_REGISTRA`) REFERENCES `bibliotecario` (`ID_BIBLIOTECARIO`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ID_UTENTE_REGISTRATO` FOREIGN KEY (`ID_UTENTE_REGISTRATO`) REFERENCES `utente` (`ID_UTENTE`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viene_registarto_a`
--

LOCK TABLES `viene_registarto_a` WRITE;
/*!40000 ALTER TABLE `viene_registarto_a` DISABLE KEYS */;
INSERT INTO `viene_registarto_a` VALUES (18,3,1),(2,1,2),(4,3,4),(1,2,6),(2,2,6),(5,2,6),(6,2,6),(12,2,6),(8,6,8),(14,6,8),(9,6,9),(10,4,10),(15,4,10),(11,7,11),(13,7,11),(16,10,16),(17,10,16),(7,9,20),(17,9,20),(12,8,21);
/*!40000 ALTER TABLE `viene_registarto_a` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-18 15:18:02
