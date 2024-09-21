-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: odontologia
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `abonos`
--

DROP TABLE IF EXISTS `abonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abonos` (
  `id_abono` int NOT NULL AUTO_INCREMENT,
  `cantidad` double DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_paciente` varchar(20) NOT NULL,
  `id_cuenta` int NOT NULL,
  PRIMARY KEY (`id_abono`),
  KEY `fk_abono_pac` (`id_paciente`),
  KEY `fk_conc_tip` (`id_cuenta`),
  CONSTRAINT `fk_abono_pac` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`),
  CONSTRAINT `fk_conc_tip` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`id_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abonos`
--

LOCK TABLES `abonos` WRITE;
/*!40000 ALTER TABLE `abonos` DISABLE KEYS */;
INSERT INTO `abonos` VALUES (1,100,'2020-06-08','20200608014623',1),(2,250,'2020-06-08','20200608042627',3),(3,100,'2020-06-08','20200608205325',4),(4,100,'2020-06-10','20200610043619',5),(5,123,'2020-06-10','20200607054411',2),(6,150,'2020-06-21','20200607054411',2),(7,172,'2020-06-21','20200607054411',2);
/*!40000 ALTER TABLE `abonos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agenda`
--

DROP TABLE IF EXISTS `agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agenda` (
  `id_agenda` int NOT NULL AUTO_INCREMENT,
  `id_paciente` varchar(20) NOT NULL,
  `fecha_agenda` date DEFAULT NULL,
  `motivo` varchar(300) DEFAULT NULL,
  `atendido` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_agenda`),
  KEY `fk_agenda_paciente` (`id_paciente`),
  CONSTRAINT `fk_agenda_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda`
--

LOCK TABLES `agenda` WRITE;
/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
INSERT INTO `agenda` VALUES (1,'20200608014623','2020-06-09','Revision a encias periodicamente',1),(2,'20200607054411','2020-06-09','solo revicion',1),(4,'20200608042627','2020-06-13','Lipieza de muelas',0),(5,'20200608042627','2020-06-25','Revicion de las placas generadas',0),(6,'20200608205325','2020-06-09','la patita',1),(7,'20200610043619','2020-06-14','chequeo',0),(8,'20200608214515','2020-06-12','Limpieza ',0);
/*!40000 ALTER TABLE `agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alergia`
--

DROP TABLE IF EXISTS `alergia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alergia` (
  `id_antecedente` int NOT NULL,
  `nombre_alergia` varchar(100) DEFAULT NULL,
  KEY `fk_alerg_anteced` (`id_antecedente`),
  CONSTRAINT `fk_alerg_anteced` FOREIGN KEY (`id_antecedente`) REFERENCES `antecedentes` (`id_antecedente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alergia`
--

LOCK TABLES `alergia` WRITE;
/*!40000 ALTER TABLE `alergia` DISABLE KEYS */;
INSERT INTO `alergia` VALUES (12,'gatitos'),(15,'flores');
/*!40000 ALTER TABLE `alergia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anteced_habit`
--

DROP TABLE IF EXISTS `anteced_habit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anteced_habit` (
  `id_antecedente` int NOT NULL,
  `id_habito` int NOT NULL,
  KEY `fk_antec_habit` (`id_antecedente`),
  KEY `fk_habit_antec` (`id_habito`),
  CONSTRAINT `fk_antec_habit` FOREIGN KEY (`id_antecedente`) REFERENCES `antecedentes` (`id_antecedente`),
  CONSTRAINT `fk_habit_antec` FOREIGN KEY (`id_habito`) REFERENCES `habito` (`id_habito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anteced_habit`
--

LOCK TABLES `anteced_habit` WRITE;
/*!40000 ALTER TABLE `anteced_habit` DISABLE KEYS */;
INSERT INTO `anteced_habit` VALUES (8,7),(11,2),(20,4),(20,7),(21,1),(21,2),(21,7);
/*!40000 ALTER TABLE `anteced_habit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `antecedentes`
--

DROP TABLE IF EXISTS `antecedentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `antecedentes` (
  `id_antecedente` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `higiene_bucal` varchar(5) NOT NULL,
  `alimentacion` varchar(5) NOT NULL,
  `id_paciente` varchar(20) NOT NULL,
  `motivo_visita` varchar(200) NOT NULL,
  PRIMARY KEY (`id_antecedente`),
  KEY `fk_atec_pacient` (`id_paciente`),
  CONSTRAINT `fk_atec_pacient` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antecedentes`
--

LOCK TABLES `antecedentes` WRITE;
/*!40000 ALTER TABLE `antecedentes` DISABLE KEYS */;
INSERT INTO `antecedentes` VALUES (1,'2020-06-07','Buena','Buena','20200607054411','Limpieza en los dientes'),(2,'2020-06-07','Buena','Buena','20200607055135','Revicion'),(3,'2020-06-07','Buena','Buena','20200607055610','Revicion'),(4,'2020-06-07','Buena','Buena','20200607060711','dolores en el cuello'),(5,'2020-06-07','Buena','Mala','20200607060900','asdfsdfasdf'),(6,'2020-06-07','Buena','Buena','20200607061328','qwer'),(7,'2020-06-07','Mala','Buena','20200607062040','sdfasdf'),(8,'2020-06-07','Buena','Buena','20200607062413','asdfas'),(9,'2020-06-07','Mala','Buena','20200607062707','asdfasf'),(10,'2020-06-07','Buena','Buena','20200607062936','wqerqwerq'),(11,'2020-06-08','Buena','Buena','20200608010954','sdfasdf'),(12,'2020-06-08','Buena','Buena','20200608014623','malestares en los dientes'),(13,'2020-06-08','Buena','Buena','20200608042627','Dolor en encias'),(14,'2020-06-08','Buena','Buena','20200608205325','le duele la patita'),(15,'2020-06-08','Buena','Buena','20200608212928','revicion'),(16,'2020-06-08','Buena','Buena','20200608213240','le duele la muela '),(17,'2020-06-08','Buena','Buena','20200608214113','sencibilidad'),(18,'2020-06-08','Buena','Buena','20200608214515','dolor de muelas'),(19,'2020-06-08','Mala','Buena','20200608214725','malestarres'),(20,'2020-06-10','Buena','Buena','20200610043619','dolor de muelas'),(21,'2020-06-21','Buena','Buena','20200608214515','Nadamas');
/*!40000 ALTER TABLE `antecedentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anticonceptivo`
--

DROP TABLE IF EXISTS `anticonceptivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anticonceptivo` (
  `id_antecedente` int NOT NULL,
  `nombre_antico` varchar(100) NOT NULL,
  KEY `fk_antic_antc` (`id_antecedente`),
  CONSTRAINT `fk_antic_antc` FOREIGN KEY (`id_antecedente`) REFERENCES `antecedentes` (`id_antecedente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anticonceptivo`
--

LOCK TABLES `anticonceptivo` WRITE;
/*!40000 ALTER TABLE `anticonceptivo` DISABLE KEYS */;
INSERT INTO `anticonceptivo` VALUES (12,'no definido'),(20,'no definido'),(21,'no definido');
/*!40000 ALTER TABLE `anticonceptivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta` (
  `id_consulta` int NOT NULL AUTO_INCREMENT,
  `nombre_consulta` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_consulta`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` VALUES (1,'EMERGENCIA'),(2,'REVISION'),(3,'LESION DE CARIES'),(4,'LIMPIEZA'),(5,'PUENTE'),(6,'PROSTODONCIA'),(7,'EXTRACCIONES');
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `correo`
--

DROP TABLE IF EXISTS `correo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `correo` (
  `id_paciente` varchar(20) NOT NULL,
  `correo` varchar(300) DEFAULT NULL,
  KEY `fk_corr_pac` (`id_paciente`),
  CONSTRAINT `fk_corr_pac` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correo`
--

LOCK TABLES `correo` WRITE;
/*!40000 ALTER TABLE `correo` DISABLE KEYS */;
INSERT INTO `correo` VALUES ('20200607054411','sakura@gmail.com'),('20200607055135','sakura@gmail.com'),('20200607055610','sakura@gmail.com'),('20200607060711','correo@gmail.com'),('20200607060900','g@gmail.com'),('20200607061328','q@gmail.com'),('20200607062040','d@gmail.com'),('20200607062413','s@gmail.com'),('20200607062707','sdfasdfas'),('20200607062936','g@gmail.com'),('20200608010954','asdf@gmail.com'),('20200608014623','g@gmail.com'),('20200608042627','no definido!'),('20200608205325','@vichito.comcacheton'),('20200608212928','g@gmail.com'),('20200608213240','el@hotmail.com'),('20200608214113','no definido!'),('20200608214515','no definido!'),('20200608214725','r@hotmail.com'),('20200610043619','gari@gmail.com');
/*!40000 ALTER TABLE `correo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta` (
  `id_cuenta` int NOT NULL AUTO_INCREMENT,
  `id_paciente` varchar(20) NOT NULL,
  `cantidad` double DEFAULT NULL,
  PRIMARY KEY (`id_cuenta`),
  KEY `fk_cuent_paci` (`id_paciente`),
  CONSTRAINT `fk_cuent_paci` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES (1,'20200608014623',400),(2,'20200607054411',555),(3,'20200608042627',750),(4,'20200608205325',0),(5,'20200610043619',400),(6,'20200608214515',120);
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domicilio`
--

DROP TABLE IF EXISTS `domicilio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domicilio` (
  `id_domicilio` int NOT NULL AUTO_INCREMENT,
  `id_paciente` varchar(20) NOT NULL,
  `nombre_domicilio` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_domicilio`),
  KEY `fk_dom_paci` (`id_paciente`),
  CONSTRAINT `fk_dom_paci` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domicilio`
--

LOCK TABLES `domicilio` WRITE;
/*!40000 ALTER TABLE `domicilio` DISABLE KEYS */;
INSERT INTO `domicilio` VALUES (1,'20200607054411','El rancho perdido'),(2,'20200607055135','Rancho escondido'),(3,'20200607055610','Rancho escondido'),(4,'20200607060711','no definido '),(5,'20200607060900','sdfasdf'),(6,'20200607061328','123'),(7,'20200607062040','asdfasdfa'),(8,'20200607062413','asdasdfaf'),(9,'20200607062707','drqer'),(10,'20200607062936','rqwerqw'),(11,'20200608010954','wqeqwe'),(12,'20200608014623','casas viejas'),(13,'20200608042627','Paso casas blancas'),(14,'20200608205325','lajitas'),(15,'20200608212928','la mora'),(16,'20200608213240','las lomas'),(17,'20200608214113','san gabriel'),(18,'20200608214515','san gabriel'),(19,'20200608214725','rancho nuevo'),(20,'20200610043619','casa salas');
/*!40000 ALTER TABLE `domicilio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embarazada`
--

DROP TABLE IF EXISTS `embarazada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `embarazada` (
  `id_antecedente` int NOT NULL,
  `meses` varchar(2) DEFAULT NULL,
  KEY `fk_embarazada` (`id_antecedente`),
  CONSTRAINT `fk_embarazada` FOREIGN KEY (`id_antecedente`) REFERENCES `antecedentes` (`id_antecedente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embarazada`
--

LOCK TABLES `embarazada` WRITE;
/*!40000 ALTER TABLE `embarazada` DISABLE KEYS */;
INSERT INTO `embarazada` VALUES (8,'4'),(9,'5'),(10,'2'),(11,'4'),(12,'6'),(13,'4'),(20,'6'),(21,'4');
/*!40000 ALTER TABLE `embarazada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habito`
--

DROP TABLE IF EXISTS `habito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habito` (
  `id_habito` int NOT NULL AUTO_INCREMENT,
  `nombre_habito` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_habito`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habito`
--

LOCK TABLES `habito` WRITE;
/*!40000 ALTER TABLE `habito` DISABLE KEYS */;
INSERT INTO `habito` VALUES (1,'BRINCOMANIA'),(2,'CONTRACCIONES MUSCULARES'),(3,'HABITOS DE MORDIDA'),(4,'RESPIRACION BUCAL'),(5,'ESTA BAJO TRATAMIENTO'),(6,'LENGUA'),(7,'ENCIA'),(8,'CARRILLOS');
/*!40000 ALTER TABLE `habito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospitalizado`
--

DROP TABLE IF EXISTS `hospitalizado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospitalizado` (
  `id_antecedente` int NOT NULL,
  `motivo` varchar(60) DEFAULT NULL,
  KEY `fk_hospitalizado` (`id_antecedente`),
  CONSTRAINT `fk_hospitalizado` FOREIGN KEY (`id_antecedente`) REFERENCES `antecedentes` (`id_antecedente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospitalizado`
--

LOCK TABLES `hospitalizado` WRITE;
/*!40000 ALTER TABLE `hospitalizado` DISABLE KEYS */;
/*!40000 ALTER TABLE `hospitalizado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamento`
--

DROP TABLE IF EXISTS `medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamento` (
  `id_antecedente` int NOT NULL,
  `nombre_medicamento` varchar(100) DEFAULT NULL,
  KEY `fk_medic_anteced` (`id_antecedente`),
  CONSTRAINT `fk_medic_anteced` FOREIGN KEY (`id_antecedente`) REFERENCES `antecedentes` (`id_antecedente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamento`
--

LOCK TABLES `medicamento` WRITE;
/*!40000 ALTER TABLE `medicamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `id_paciente` varchar(20) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `ap_apellido` varchar(30) DEFAULT NULL,
  `am_apellido` varchar(30) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `estadoCivil` varchar(30) DEFAULT NULL,
  `ocupacion` varchar(100) DEFAULT NULL,
  `escolaridad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES ('20200607054411','Sakura','Hernandez','Hernandez','F','1992-09-11','SOLTERO','Labores del Hogar','SECUNDARIA'),('20200607055135','Sakura','Hernandez','Hernandez','F','1992-07-30','CASADO','labores del hogar','SECUNDARIA'),('20200607055610','Sakura','Hernandez','Hernandez','F','1992-07-30','CASADO','labores del hogar','SECUNDARIA'),('20200607060711','jhosep','perez','leon','F','1999-01-02','CASADO','obrero','PREESCOLAR'),('20200607060900','asfasdf','asdfasdf','asdfasdf','F','2020-06-12','CASADO','asdfasdfasd','PRIMARIA'),('20200607061328','asdfasdf','asdfasdf','asdfasdf','F','2020-06-13','SOLTERO','asfdasdf','PREESCOLAR'),('20200607062040','asdfasdf','asdfasdf','fasdfasdf','F','2020-06-27','CASADO','asdfadsf','SECUNDARIA'),('20200607062413','asdfasdf','asdfasdf','asdfsdf','F','2020-06-20','CASADO','fasdfasdfa','PRIMARIA'),('20200607062707','asdfasdf','asdfasdf','asdfasdfasd','F','1993-06-24','SOLTERO','asdfasdf','PREESCOLAR'),('20200607062936','qwerq','qwerqwer','qwerqwer','F','1996-06-21','SOLTERO','qwerqwer','PREESCOLAR'),('20200608010954','asdfasdf','asdfasdfasd','fasdfasdf','F','2020-06-04','CASADO','asdfasdf','PRIMARIA'),('20200608014623','Mohana','Sosa','Lopez','F','1983-06-10','CASADO','Labores del hogar','PREESCOLAR'),('20200608042627','Sabrina','Avila','Martinez','F','1997-02-01','CASADO','Doctora','CARRERA'),('20200608205325','vikingo ','vichito','vichote','M','2018-04-03','SOLTERO','caceria','MEDIA SUPERIOR'),('20200608212928','juanito   ','lopez','hernandez','M','1998-06-07','CASADO','panadero','SECUNDARIA'),('20200608213240','Jack ','hernandez ','valentin ','M','1998-01-02','CASADO','obrero','SECUNDARIA'),('20200608214113','Jose   ','perez    ','leon','M','1998-01-04','CASADO','obrero','SECUNDARIA'),('20200608214515','jose','avila','sosa','M','1992-06-07','CASADO','campecino','PRIMARIA'),('20200608214725','joel','hernandez','rivera','M','1992-02-02','CASADO','no definido','SECUNDARIA'),('20200610043619','gari','hernandez','hernandez','F','1996-06-07','CASADO','cazadora','BACHILLERATO');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `padeci_paciente`
--

DROP TABLE IF EXISTS `padeci_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `padeci_paciente` (
  `id_paciente` varchar(20) NOT NULL,
  `id_padecimiento` int NOT NULL,
  `fecha` date DEFAULT NULL,
  KEY `fk_pad_pac` (`id_paciente`),
  KEY `fk_pac_pad` (`id_padecimiento`),
  CONSTRAINT `fk_pac_pad` FOREIGN KEY (`id_padecimiento`) REFERENCES `padecimiento` (`id_padecimiento`),
  CONSTRAINT `fk_pad_pac` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `padeci_paciente`
--

LOCK TABLES `padeci_paciente` WRITE;
/*!40000 ALTER TABLE `padeci_paciente` DISABLE KEYS */;
INSERT INTO `padeci_paciente` VALUES ('20200607054411',6,'2020-06-07'),('20200607054411',12,'2020-06-07'),('20200607055135',2,'2020-06-07'),('20200607055610',2,'2020-06-07'),('20200607060711',2,'2020-06-07'),('20200607060900',2,'2020-06-07'),('20200607062040',3,'2020-06-07'),('20200608010954',4,'2020-06-08'),('20200608212928',11,'2020-06-08'),('20200610043619',12,'2020-06-10'),('20200610043619',13,'2020-06-10'),('20200608214515',5,'2020-06-21'),('20200608214515',8,'2020-06-21'),('20200608214515',9,'2020-06-21'),('20200608214515',10,'2020-06-21'),('20200608214515',11,'2020-06-21'),('20200608214515',12,'2020-06-21');
/*!40000 ALTER TABLE `padeci_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `padecimiento`
--

DROP TABLE IF EXISTS `padecimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `padecimiento` (
  `id_padecimiento` int NOT NULL AUTO_INCREMENT,
  `nombre_padecimiento` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_padecimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `padecimiento`
--

LOCK TABLES `padecimiento` WRITE;
/*!40000 ALTER TABLE `padecimiento` DISABLE KEYS */;
INSERT INTO `padecimiento` VALUES (1,'APARATO RESPIRATORIO'),(2,'APARATO CARDIOBASCULAR'),(3,'APARATO DIGESTIVO'),(4,'SISTEMA NERVIOSO'),(5,'PROBLEMAS DE COAGULACION'),(6,'DESMAYOS'),(7,'VERTIGOS Y MAREOS'),(8,'DIABETES'),(9,'TIROIDES'),(10,'FIEBRE REUMATICA'),(11,'HIPERTENSION'),(12,'FUMA'),(13,'BEBE ALCOHOL'),(14,'CONSUME DROGAS');
/*!40000 ALTER TABLE `padecimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tejidos_blandos`
--

DROP TABLE IF EXISTS `tejidos_blandos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tejidos_blandos` (
  `id_tejidos` int NOT NULL AUTO_INCREMENT,
  `id_paciente` varchar(20) NOT NULL,
  `frenillo` varchar(5) DEFAULT NULL,
  `mejilla` varchar(20) DEFAULT NULL,
  `labios` varchar(50) DEFAULT NULL,
  `paladar` varchar(50) DEFAULT NULL,
  `encia` varchar(50) DEFAULT NULL,
  `lengua` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id_tejidos`),
  KEY `fk_tejid_pacien` (`id_paciente`),
  CONSTRAINT `fk_tejid_pacien` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tejidos_blandos`
--

LOCK TABLES `tejidos_blandos` WRITE;
/*!40000 ALTER TABLE `tejidos_blandos` DISABLE KEYS */;
INSERT INTO `tejidos_blandos` VALUES (1,'20200607054411','Alta','normal','normal','normal','normal','normal'),(2,'20200607055135','Alta','normal','normal','normal','normal','normal'),(3,'20200607055610','Alta','normal','normal','normal','normal','normal'),(4,'20200607060711','Alta','normal','normal','normal','normal','normal'),(5,'20200607060900','Media','ertwer','twertwer','twertwer','twertw','ertwertwer'),(6,'20200607061328','Media','asdfasfd','asdfasdf','asdfasdf','asdfasd','fasdfasdf'),(7,'20200607062040','Alta','dsfasdfa','asdfasdf','asdfasd','fasdfa','dsfasdf'),(8,'20200607062413','Alta','sdfgsdfg','dfgsdf','gsdfgsdf','gsdfgsdfg','sdfgsdf'),(9,'20200607062707','Alta','asdfasfasdfas','dfasdfas','dfasdfas','dfasdfas','dfasdfasd'),(10,'20200607062936','Media','sdfgdfg','sdfgsdfg','sdfgsdf','gsdfgsdf','gsdfgsdf'),(11,'20200608010954','Media','sadcasd','fasdfasdf','asdfasdf','asdfasdf','asdfasdf'),(12,'20200608014623','Alta','asdfaasdfasdfa','sdfasdfas','dfasdfasdfasd','fasdfasd','fasdfasdfas'),(13,'20200608042627','Media','Rosador','Humectado','No aplica','Rosado','Con areas blancas falta higiene'),(14,'20200608205325','Baja','normal','normal','normal','normal','normal'),(15,'20200608212928','Media','medio','normal','medio','normal','medio'),(16,'20200608213240','Alta','medio','medio','normal','normal','normal'),(17,'20200608214113','Alta','medio','medio','normal','normal','no aplica'),(18,'20200608214515','Media','media','normal','normal','normal','normal'),(19,'20200608214725','Media','normal','normal','normal','normal','normal'),(20,'20200610043619','Media','normal','normal','normal','normal','normal');
/*!40000 ALTER TABLE `tejidos_blandos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono`
--

DROP TABLE IF EXISTS `telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono` (
  `id_paciente` varchar(20) NOT NULL,
  `num_tel` varchar(10) DEFAULT NULL,
  KEY `fk_corr_tel` (`id_paciente`),
  CONSTRAINT `fk_corr_tel` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono`
--

LOCK TABLES `telefono` WRITE;
/*!40000 ALTER TABLE `telefono` DISABLE KEYS */;
INSERT INTO `telefono` VALUES ('20200607054411','7891232112'),('20200607055135','7891233221'),('20200607055610','7891233221'),('20200607060711','7893452332'),('20200607060900','1231231233'),('20200607061328','1231231231'),('20200607062040','1231231231'),('20200607062413','1231231231'),('20200607062707','1231232314'),('20200607062936','1231231231'),('20200608010954','1231231231'),('20200608014623','9871231233'),('20200608042627','7897891232'),('20200608205325','7891476887'),('20200608212928','7894566545'),('20200608213240','7892344324'),('20200608214113','7891231236'),('20200608214515','9687564345'),('20200608214725','7869787564'),('20200610043619','7896456345');
/*!40000 ALTER TABLE `telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_consulta`
--

DROP TABLE IF EXISTS `tipo_consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_consulta` (
  `id_antecedente` int NOT NULL,
  `id_consulta` int NOT NULL,
  KEY `fk_antec_cons` (`id_antecedente`),
  KEY `fk_cons_antec` (`id_consulta`),
  CONSTRAINT `fk_antec_cons` FOREIGN KEY (`id_antecedente`) REFERENCES `antecedentes` (`id_antecedente`),
  CONSTRAINT `fk_cons_antec` FOREIGN KEY (`id_consulta`) REFERENCES `consulta` (`id_consulta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_consulta`
--

LOCK TABLES `tipo_consulta` WRITE;
/*!40000 ALTER TABLE `tipo_consulta` DISABLE KEYS */;
INSERT INTO `tipo_consulta` VALUES (1,2),(2,2),(3,2),(4,2),(5,1),(6,1),(7,1),(8,2),(9,2),(10,2),(11,2),(12,1),(13,6),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,4);
/*!40000 ALTER TABLE `tipo_consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `totalventas`
--

DROP TABLE IF EXISTS `totalventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `totalventas` (
  `id_ventas` int NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(100) NOT NULL,
  `concepto_pago` varchar(50) NOT NULL,
  `cantidad` double NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_ventas`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `totalventas`
--

LOCK TABLES `totalventas` WRITE;
/*!40000 ALTER TABLE `totalventas` DISABLE KEYS */;
INSERT INTO `totalventas` VALUES (1,'Al mostrador','Consulta',100,'2020-06-06'),(2,'Mohana Sosa Lopez','Abono a cuenta',100,'2020-06-08'),(3,'Mohana Sosa Lopez','Abono a cuenta',100,'2020-06-08'),(4,'Al mostrador','Consulta',200,'2020-06-08'),(5,'Al mostrador','consulta',50,'2020-06-08'),(6,'Al mostrador','curetas',70,'2020-06-08'),(7,'Al mostrador','Consulta',0,'2020-06-08'),(8,'Al mostrador','Toallitas',60,'2020-06-08'),(9,'Al mostrador','Consulta',0,'2020-06-08'),(10,'Al mostrador','Toallitas',15,'2020-06-08'),(11,'Al mostrador','Consulta',0,'2020-06-08'),(12,'Al mostrador','Consulta',100,'2020-06-08'),(13,'Al mostrador','Toallitas humedas',50,'2020-06-08'),(14,'Al mostrador','Consulta',9,'2020-06-08'),(15,'Sabrina Avila Martinez','Abono a cuenta',250,'2020-06-08'),(16,'Al mostrador','Consulta',175,'2020-06-08'),(17,'Al mostrador','gastos',120,'2020-06-08'),(18,'Al mostrador','Consulta',200,'2020-06-08'),(19,'vikingo  vichito vichote','Abono a cuenta',100,'2020-06-08'),(20,'Al mostrador','Consulta',342,'2020-06-10'),(21,'gari hernandez hernandez','Abono a cuenta',100,'2020-06-10'),(22,'Sakura Hernandez Hernandez','Abono a cuenta',123,'2020-06-10'),(23,'Al mostrador','Consulta',100,'2020-06-20'),(26,'Sakura Hernandez Hernandez','Abono a cuenta',150,'2020-06-21'),(27,'Sakura Hernandez Hernandez','Abono a cuenta',172,'2020-06-21');
/*!40000 ALTER TABLE `totalventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamiento`
--

DROP TABLE IF EXISTS `tratamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratamiento` (
  `id_antecedente` int NOT NULL,
  `tipo_tratamiento` varchar(100) DEFAULT NULL,
  `observaciones` varchar(200) DEFAULT NULL,
  KEY `fk_tratamient_anteced` (`id_antecedente`),
  CONSTRAINT `fk_tratamient_anteced` FOREIGN KEY (`id_antecedente`) REFERENCES `antecedentes` (`id_antecedente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamiento`
--

LOCK TABLES `tratamiento` WRITE;
/*!40000 ALTER TABLE `tratamiento` DISABLE KEYS */;
INSERT INTO `tratamiento` VALUES (1,'Labarse los dientes todos los dias ','Se laba la boca muy pocas veces'),(2,'No correr todas las mañanas','No salir a corrrer hasta dentro de un mes'),(3,'No correr todas las mañanas','No salir a corrrer hasta dentro de un mes'),(4,'no definido por el momento','aun nos se han definido los datos'),(5,'aun no se ha definido','twertwert'),(6,'pendiente definir','asdfasdfa'),(7,'asdfasdfasdfa','asdfasdf'),(8,'no definido','gsdfgsdfgsdfg'),(9,'no definido','fasdfasdfa'),(10,'qwerqwer','gsdfgsdfg'),(11,'sdcasdfasdf','asdfasdfasdfasdf'),(12,'no salir al sol por muhco tiempo','dfasdfasdfasdf'),(13,'Pulpectomania pieza 85, corona pieza 84','Se presento a  consulta por obsesa con fistula en pieza 85\nse habrio la cabidad ys e manda a su casa con lavados '),(14,'no correr, dormir, comer saludablemente, beber agua,','bien y bonito'),(15,'no definido por el momento','no se deje al alcance de los niños'),(16,'no se puede definir por el momento','no se ha defiido conpresicion'),(17,'no se debe de asoleat mucho hace calor','pendiente de agregar'),(18,'no se ha definido','no se ha podido definir'),(19,'no definido','nod efinido por el momento'),(20,'cazar menos','no se automedique'),(21,'no defnido por ahora','Aqui las observaciones');
/*!40000 ALTER TABLE `tratamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor`
--

DROP TABLE IF EXISTS `tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tutor` (
  `id_paciente` varchar(20) NOT NULL,
  `nombre_tutor` varchar(100) DEFAULT NULL,
  `num_tel` varchar(10) DEFAULT NULL,
  KEY `fk_corr_repres` (`id_paciente`),
  CONSTRAINT `fk_corr_repres` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor`
--

LOCK TABLES `tutor` WRITE;
/*!40000 ALTER TABLE `tutor` DISABLE KEYS */;
INSERT INTO `tutor` VALUES ('20200607054411','Savala Hernandez Lopez','7891235667'),('20200607055135','Gari Hernandez Lopez','7891235656'),('20200607055610','Gari Hernandez Lopez','7891235656'),('20200607060711','no definido','7891232356'),('20200607060900','asdfasdf','1231231231'),('20200607061328','qwerqw','1231231231'),('20200607062040','sdfasfasf','1231231231'),('20200607062413','asdfasfd','2321321231'),('20200607062707','qwerqwe','1231231231'),('20200607062936','erqwer','1231231231'),('20200608010954','qwerqwer','1231231231'),('20200608014623','Michito vichi','9891238384'),('20200608042627','Jose Roberto Ruis','7890989876'),('20200608205325','jade','7891208645'),('20200608212928','miguel del angel hernandez','1234567890'),('20200608213240','Jose perez','7892344565'),('20200608214113','Adolfo herrera','7893445675'),('20200608214515','rivera herrera','8976546345'),('20200608214725','Rene rivera','7687968765'),('20200610043619','vikingo vichito','7896546345');
/*!40000 ALTER TABLE `tutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `nombre_user` varchar(30) DEFAULT NULL,
  `pass` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (7,'Administrador','d033e22ae348aeb5660fc2140aec35850c4da997');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-28 14:48:05
