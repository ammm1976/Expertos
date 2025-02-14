CREATE DATABASE  IF NOT EXISTS `expertos` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `expertos`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: expertos
-- ------------------------------------------------------
-- Server version	8.4.2

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
-- Table structure for table `doc_rel_uni`
--

DROP TABLE IF EXISTS `doc_rel_uni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doc_rel_uni` (
  `Doctorados_nombre` varchar(100) NOT NULL,
  `Universidades_nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`Doctorados_nombre`,`Universidades_nombre`),
  KEY `fk_Doctorados_has_Universidades_Universidades1_idx` (`Universidades_nombre`),
  KEY `fk_Doctorados_has_Universidades_Doctorados1_idx` (`Doctorados_nombre`),
  CONSTRAINT `fk_Doctorados_has_Universidades_Doctorados1` FOREIGN KEY (`Doctorados_nombre`) REFERENCES `doctorados` (`nombre`),
  CONSTRAINT `fk_Doctorados_has_Universidades_Universidades1` FOREIGN KEY (`Universidades_nombre`) REFERENCES `universidades` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_rel_uni`
--

LOCK TABLES `doc_rel_uni` WRITE;
/*!40000 ALTER TABLE `doc_rel_uni` DISABLE KEYS */;
/*!40000 ALTER TABLE `doc_rel_uni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctorados`
--

DROP TABLE IF EXISTS `doctorados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctorados` (
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctorados`
--

LOCK TABLES `doctorados` WRITE;
/*!40000 ALTER TABLE `doctorados` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctorados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidades` (
  `nombre` varchar(100) NOT NULL,
  `Titulaciones_Universitarias_Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`nombre`,`Titulaciones_Universitarias_Nombre`),
  KEY `fk_Especialidades_Titulaciones_Universitarias1_idx` (`Titulaciones_Universitarias_Nombre`),
  CONSTRAINT `fk_Especialidades_Titulaciones_Universitarias1` FOREIGN KEY (`Titulaciones_Universitarias_Nombre`) REFERENCES `titulaciones_universitarias` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidades`
--

LOCK TABLES `especialidades` WRITE;
/*!40000 ALTER TABLE `especialidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `especialidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `masters`
--

DROP TABLE IF EXISTS `masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `masters` (
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `masters`
--

LOCK TABLES `masters` WRITE;
/*!40000 ALTER TABLE `masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofertas`
--

DROP TABLE IF EXISTS `ofertas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofertas` (
  `Ofertas` varchar(45) NOT NULL,
  PRIMARY KEY (`Ofertas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofertas`
--

LOCK TABLES `ofertas` WRITE;
/*!40000 ALTER TABLE `ofertas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofertas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `per_rel_doc_rel_uni`
--

DROP TABLE IF EXISTS `per_rel_doc_rel_uni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `per_rel_doc_rel_uni` (
  `Personas_id_persona` int NOT NULL,
  `Doc_Rel_Uni_Doctorados_nombre` varchar(100) NOT NULL,
  `Doc_Rel_Uni_Universidades_nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`Personas_id_persona`,`Doc_Rel_Uni_Doctorados_nombre`,`Doc_Rel_Uni_Universidades_nombre`),
  KEY `fk_Personas_has_Doc_Rel_Uni_Doc_Rel_Uni1_idx` (`Doc_Rel_Uni_Doctorados_nombre`,`Doc_Rel_Uni_Universidades_nombre`),
  KEY `fk_Personas_has_Doc_Rel_Uni_Personas1_idx` (`Personas_id_persona`),
  CONSTRAINT `fk_Personas_has_Doc_Rel_Uni_Doc_Rel_Uni1` FOREIGN KEY (`Doc_Rel_Uni_Doctorados_nombre`, `Doc_Rel_Uni_Universidades_nombre`) REFERENCES `doc_rel_uni` (`Doctorados_nombre`, `Universidades_nombre`),
  CONSTRAINT `fk_Personas_has_Doc_Rel_Uni_Personas1` FOREIGN KEY (`Personas_id_persona`) REFERENCES `personas` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `per_rel_doc_rel_uni`
--

LOCK TABLES `per_rel_doc_rel_uni` WRITE;
/*!40000 ALTER TABLE `per_rel_doc_rel_uni` DISABLE KEYS */;
/*!40000 ALTER TABLE `per_rel_doc_rel_uni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `per_rel_tit_com`
--

DROP TABLE IF EXISTS `per_rel_tit_com`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `per_rel_tit_com` (
  `Personas_id_persona` int NOT NULL,
  `Titulaciones_Complementarias_nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`Personas_id_persona`,`Titulaciones_Complementarias_nombre`),
  KEY `fk_Personas_has_Titulaciones_Complementarias_Titulaciones_C_idx` (`Titulaciones_Complementarias_nombre`),
  KEY `fk_Personas_has_Titulaciones_Complementarias_Personas1_idx` (`Personas_id_persona`),
  CONSTRAINT `fk_Personas_has_Titulaciones_Complementarias_Personas1` FOREIGN KEY (`Personas_id_persona`) REFERENCES `personas` (`id_persona`),
  CONSTRAINT `fk_Personas_has_Titulaciones_Complementarias_Titulaciones_Com1` FOREIGN KEY (`Titulaciones_Complementarias_nombre`) REFERENCES `titulaciones_complementarias` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `per_rel_tit_com`
--

LOCK TABLES `per_rel_tit_com` WRITE;
/*!40000 ALTER TABLE `per_rel_tit_com` DISABLE KEYS */;
/*!40000 ALTER TABLE `per_rel_tit_com` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `per_rel_uni_rel_mas`
--

DROP TABLE IF EXISTS `per_rel_uni_rel_mas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `per_rel_uni_rel_mas` (
  `Personas_id_persona` int NOT NULL,
  `Uni_Rel_Mas_Universidades_nombre` varchar(100) NOT NULL,
  `Uni_Rel_Mas_Masters_nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`Personas_id_persona`,`Uni_Rel_Mas_Universidades_nombre`,`Uni_Rel_Mas_Masters_nombre`),
  KEY `fk_Personas_has_Uni_Rel_Mas_Uni_Rel_Mas1_idx` (`Uni_Rel_Mas_Universidades_nombre`,`Uni_Rel_Mas_Masters_nombre`),
  KEY `fk_Personas_has_Uni_Rel_Mas_Personas1_idx` (`Personas_id_persona`),
  CONSTRAINT `fk_Personas_has_Uni_Rel_Mas_Personas1` FOREIGN KEY (`Personas_id_persona`) REFERENCES `personas` (`id_persona`),
  CONSTRAINT `fk_Personas_has_Uni_Rel_Mas_Uni_Rel_Mas1` FOREIGN KEY (`Uni_Rel_Mas_Universidades_nombre`, `Uni_Rel_Mas_Masters_nombre`) REFERENCES `uni_rel_mas` (`Universidades_nombre`, `Masters_nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `per_rel_uni_rel_mas`
--

LOCK TABLES `per_rel_uni_rel_mas` WRITE;
/*!40000 ALTER TABLE `per_rel_uni_rel_mas` DISABLE KEYS */;
/*!40000 ALTER TABLE `per_rel_uni_rel_mas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `per_rel_uni_rel_tit`
--

DROP TABLE IF EXISTS `per_rel_uni_rel_tit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `per_rel_uni_rel_tit` (
  `Personas_id_persona` int NOT NULL,
  `Uni_Rel_Tit_Universidades_nombre` varchar(100) NOT NULL,
  `Uni_Rel_Tit_Titulaciones_Universitarias_Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`Personas_id_persona`,`Uni_Rel_Tit_Universidades_nombre`,`Uni_Rel_Tit_Titulaciones_Universitarias_Nombre`),
  KEY `fk_Personas_has_Uni_Rel_Tit_Uni_Rel_Tit1_idx` (`Uni_Rel_Tit_Universidades_nombre`,`Uni_Rel_Tit_Titulaciones_Universitarias_Nombre`),
  KEY `fk_Personas_has_Uni_Rel_Tit_Personas1_idx` (`Personas_id_persona`),
  CONSTRAINT `fk_Personas_has_Uni_Rel_Tit_Personas1` FOREIGN KEY (`Personas_id_persona`) REFERENCES `personas` (`id_persona`),
  CONSTRAINT `fk_Personas_has_Uni_Rel_Tit_Uni_Rel_Tit1` FOREIGN KEY (`Uni_Rel_Tit_Universidades_nombre`, `Uni_Rel_Tit_Titulaciones_Universitarias_Nombre`) REFERENCES `uni_rel_tit` (`Universidades_nombre`, `Titulaciones_Universitarias_Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `per_rel_uni_rel_tit`
--

LOCK TABLES `per_rel_uni_rel_tit` WRITE;
/*!40000 ALTER TABLE `per_rel_uni_rel_tit` DISABLE KEYS */;
/*!40000 ALTER TABLE `per_rel_uni_rel_tit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `id_persona` int NOT NULL,
  `fecha_alta` date DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellidos` varchar(200) DEFAULT NULL,
  `plantilla_externo` varchar(9) DEFAULT NULL,
  `horas_formacion_especialidad` int DEFAULT NULL,
  `horas_formacion_no_especialidad` int DEFAULT NULL,
  `horas_aula_virtual` int DEFAULT NULL,
  `herramientas_aula_virtual` varchar(2) DEFAULT NULL,
  `horas_herramientas_aula_virtual` int DEFAULT NULL,
  `cv` varchar(300) DEFAULT NULL,
  `contacto` varchar(200) DEFAULT NULL,
  `linkedIn` varchar(200) DEFAULT NULL,
  `Relaciones_ThePower_tipo_relacion` varchar(45) DEFAULT NULL,
  `Ofertas_Ofertas` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_persona`),
  KEY `fk_Personas_Relaciones_ThePower1_idx` (`Relaciones_ThePower_tipo_relacion`),
  KEY `fk_Personas_Ofertas1_idx` (`Ofertas_Ofertas`),
  CONSTRAINT `fk_Personas_Ofertas1` FOREIGN KEY (`Ofertas_Ofertas`) REFERENCES `ofertas` (`Ofertas`),
  CONSTRAINT `fk_Personas_Relaciones_ThePower1` FOREIGN KEY (`Relaciones_ThePower_tipo_relacion`) REFERENCES `relaciones_thepower` (`tipo_relacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relaciones_thepower`
--

DROP TABLE IF EXISTS `relaciones_thepower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relaciones_thepower` (
  `tipo_relacion` varchar(45) NOT NULL,
  PRIMARY KEY (`tipo_relacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relaciones_thepower`
--

LOCK TABLES `relaciones_thepower` WRITE;
/*!40000 ALTER TABLE `relaciones_thepower` DISABLE KEYS */;
/*!40000 ALTER TABLE `relaciones_thepower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulaciones_complementarias`
--

DROP TABLE IF EXISTS `titulaciones_complementarias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titulaciones_complementarias` (
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulaciones_complementarias`
--

LOCK TABLES `titulaciones_complementarias` WRITE;
/*!40000 ALTER TABLE `titulaciones_complementarias` DISABLE KEYS */;
/*!40000 ALTER TABLE `titulaciones_complementarias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulaciones_universitarias`
--

DROP TABLE IF EXISTS `titulaciones_universitarias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titulaciones_universitarias` (
  `Bolonia` varchar(13) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulaciones_universitarias`
--

LOCK TABLES `titulaciones_universitarias` WRITE;
/*!40000 ALTER TABLE `titulaciones_universitarias` DISABLE KEYS */;
/*!40000 ALTER TABLE `titulaciones_universitarias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uni_rel_mas`
--

DROP TABLE IF EXISTS `uni_rel_mas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uni_rel_mas` (
  `Universidades_nombre` varchar(100) NOT NULL,
  `Masters_nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`Universidades_nombre`,`Masters_nombre`),
  KEY `fk_Universidades_has_Masters_Masters1_idx` (`Masters_nombre`),
  KEY `fk_Universidades_has_Masters_Universidades1_idx` (`Universidades_nombre`),
  CONSTRAINT `fk_Universidades_has_Masters_Masters1` FOREIGN KEY (`Masters_nombre`) REFERENCES `masters` (`nombre`),
  CONSTRAINT `fk_Universidades_has_Masters_Universidades1` FOREIGN KEY (`Universidades_nombre`) REFERENCES `universidades` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uni_rel_mas`
--

LOCK TABLES `uni_rel_mas` WRITE;
/*!40000 ALTER TABLE `uni_rel_mas` DISABLE KEYS */;
/*!40000 ALTER TABLE `uni_rel_mas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uni_rel_tit`
--

DROP TABLE IF EXISTS `uni_rel_tit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uni_rel_tit` (
  `Universidades_nombre` varchar(100) NOT NULL,
  `Titulaciones_Universitarias_Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`Universidades_nombre`,`Titulaciones_Universitarias_Nombre`),
  KEY `fk_Universidades_has_Titulaciones_Universitarias_Titulacion_idx` (`Titulaciones_Universitarias_Nombre`),
  KEY `fk_Universidades_has_Titulaciones_Universitarias_Universida_idx` (`Universidades_nombre`),
  CONSTRAINT `fk_Universidades_has_Titulaciones_Universitarias_Titulaciones1` FOREIGN KEY (`Titulaciones_Universitarias_Nombre`) REFERENCES `titulaciones_universitarias` (`Nombre`),
  CONSTRAINT `fk_Universidades_has_Titulaciones_Universitarias_Universidades1` FOREIGN KEY (`Universidades_nombre`) REFERENCES `universidades` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uni_rel_tit`
--

LOCK TABLES `uni_rel_tit` WRITE;
/*!40000 ALTER TABLE `uni_rel_tit` DISABLE KEYS */;
/*!40000 ALTER TABLE `uni_rel_tit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `universidades`
--

DROP TABLE IF EXISTS `universidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `universidades` (
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universidades`
--

LOCK TABLES `universidades` WRITE;
/*!40000 ALTER TABLE `universidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `universidades` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-14 13:12:00
