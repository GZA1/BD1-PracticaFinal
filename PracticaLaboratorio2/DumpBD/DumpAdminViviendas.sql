-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: adminviviendas
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `barrios`
--

DROP TABLE IF EXISTS `barrios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `barrios` (
  `idBarrios` varchar(10) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `area` decimal(10,3) NOT NULL,
  `coord` varchar(45) NOT NULL,
  `zipCode` int(11) NOT NULL,
  `avgM2price` decimal(10,3) NOT NULL,
  `idMunicipio` varchar(13) NOT NULL,
  PRIMARY KEY (`idBarrios`),
  KEY `fk_Barrios_Municipios1_idx` (`idMunicipio`),
  CONSTRAINT `fk_Barrios_Municipios1` FOREIGN KEY (`idMunicipio`) REFERENCES `municipios` (`idMunicipio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barrios`
--

LOCK TABLES `barrios` WRITE;
/*!40000 ALTER TABLE `barrios` DISABLE KEYS */;
INSERT INTO `barrios` VALUES ('7500','Brujas',45.600,'15.64842,24.12847',40100,1000.000,'40063'),('7501','Caballeros',18.200,'15.84621,24.51743',40300,1200.000,'40063'),('7502','Las Canonjías',47.300,'15.65784,21.35486',40200,1300.000,'40063'),('7503','Parquesol',29.500,'17.24854,19.25847',47100,1500.000,'47075'),('7504','La Rondilla',13.300,'17.36548,25.15487',47200,900.000,'47122'),('7505','Covaresa',18.400,'19.35487,54.21584',47300,1200.000,'47076'),('7506','Caballeros',35.500,'40.949430,-4.119209	',40001,800.000,'47023'),('7507','Judería',42.000,'44.923261,-4.923226',40002,500.000,'40004'),('7508','San Millán',20.000,'41.322418,-3.651515',40003,1200.000,'47005'),('7509','El Salvador',23.500,'43.051551,-6.651056',40004,1150.000,'40131'),('7510','San Marcos',28.800,'35.215121,-4.551815',40005,1450.000,'40200');
/*!40000 ALTER TABLE `barrios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impuestos`
--

DROP TABLE IF EXISTS `impuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `impuestos` (
  `idImpuesto` varchar(28) NOT NULL,
  `fechaInico` date NOT NULL,
  `fechaVencimiento` date NOT NULL,
  `importe` decimal(10,3) NOT NULL,
  `fechaActualPago` date DEFAULT NULL,
  `nºCatastro` varchar(28) NOT NULL,
  `dni` char(9) NOT NULL,
  PRIMARY KEY (`idImpuesto`,`nºCatastro`),
  KEY `fk_Impuestos_Propietarios1_idx` (`dni`),
  KEY `fk_Impuestos_Viviendas1` (`nºCatastro`),
  CONSTRAINT `fk_Impuestos_Propietarios1` FOREIGN KEY (`dni`) REFERENCES `propietarios` (`dni`),
  CONSTRAINT `fk_Impuestos_Viviendas1` FOREIGN KEY (`nºCatastro`) REFERENCES `viviendas` (`nºCatastro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impuestos`
--

LOCK TABLES `impuestos` WRITE;
/*!40000 ALTER TABLE `impuestos` DISABLE KEYS */;
INSERT INTO `impuestos` VALUES ('HBBE99633','2018-01-30','2018-03-11',481.300,NULL,'1888254 CF4511R 9955 NB','23310054Z'),('KKL575456','2018-12-15','2019-03-29',557.500,NULL,'9522624 YP4525P 0005 KK','94328497T'),('NJMJ51225','2018-10-22','2019-02-02',305.900,'2018-02-01','2255255 CC8858Y 0110 SA','73793158G'),('TYFF47855','2018-08-11','2018-11-22',562.250,'2018-10-15','9666525 RR5168T 8541 GG','73793158G'),('VFRY45223','2018-08-25','2018-10-21',200.650,'2018-09-05','9001259 ZE7812S 2288 YY','20039032Y'),('XGRG74584','2018-02-15','2018-05-13',253.020,'2018-02-28','7445852 HG2591T 0202 VN','59804933B'),('XRGZ45123','2018-11-29','2019-01-17',201.900,'2018-12-26','9110254 WS448O 3354 QW','41679701K'),('XTTR12558','2018-07-02','2018-09-12',362.150,'2018-08-29','7445852 LP8524O 1119 ZX','71297004V'),('XXWR41054','2018-04-18','2018-06-26',426.332,'2018-05-08','8956211 VB6518F 0025 VV','20039032Y'),('YYGR95631','2018-09-19','2018-12-25',956.320,'2018-11-12','9112515 SC5184F 9952 FR','73793158G'),('YYYY84512','2018-10-17','2018-12-26',300.000,'2018-11-02','9872023 VH5797S 0001 WX','73793158G');
/*!40000 ALTER TABLE `impuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipios`
--

DROP TABLE IF EXISTS `municipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `municipios` (
  `idMunicipio` varchar(13) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `area` decimal(10,3) NOT NULL,
  `codigoProvincia` varchar(15) NOT NULL,
  PRIMARY KEY (`idMunicipio`),
  KEY `fk_Municipios_Provincias1_idx` (`codigoProvincia`),
  CONSTRAINT `fk_Municipios_Provincias1` FOREIGN KEY (`codigoProvincia`) REFERENCES `provincias` (`codigoProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipios`
--

LOCK TABLES `municipios` WRITE;
/*!40000 ALTER TABLE `municipios` DISABLE KEYS */;
INSERT INTO `municipios` VALUES ('40001','Abades',31.980,'7245675RTY'),('40003','Adrados',18.190,'7245675RTY'),('40004','Aguilafuente',66.300,'7245675RTY'),('40013','Aldeasoña',18.670,'7245675RTY'),('40020','Arcones',31.750,'7245675RTY'),('40041','Cantimpalos',26.900,'7245675RTY'),('40043','Carbonero el Mayor',66.350,'7245675RTY'),('40063','Cuellar',348.660,'7245675RTY'),('40076','El Espinar',205.100,'7245675RTY'),('40086','Fuentepelayo',30.900,'7245675RTY'),('40093','Gallegos',21.800,'7245675RTY'),('40109','Languilla',26.660,'7245675RTY'),('40110','Lastras de Cuellar',65.420,'7245675RTY'),('40131','Monterrubio',25.540,'7245675RTY'),('40134','Mozoncillo',42.740,'7245675RTY'),('40161','Carabias',25.860,'7245675RTY'),('40200','Valladolid',554.600,'6122326HHH'),('40300','Segovia',74.100,'7245675RTY'),('47005','Alcazarén',82.500,'6122326HHH'),('47023','Boecillo',77.500,'6122326HHH'),('47030','Campaspero',50.300,'6122326HHH'),('47063','Fompedraza',49.000,'6122326HHH'),('47067','Fuente el sol',33.900,'6122326HHH'),('47075','Iscar',60.500,'6122326HHH'),('47076','Laguna de duero',33.500,'6122326HHH'),('47082','Matapozuelos',66.200,'6122326HHH'),('47122','Portillo',64.420,'6122326HHH');
/*!40000 ALTER TABLE `municipios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocupantes`
--

DROP TABLE IF EXISTS `ocupantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ocupantes` (
  `dni` char(9) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `fNac` date DEFAULT NULL,
  `nºCatastro` varchar(28) NOT NULL,
  PRIMARY KEY (`dni`),
  KEY `fk_Ocupantes_Viviendas1_idx` (`nºCatastro`),
  CONSTRAINT `fk_Ocupantes_Viviendas1` FOREIGN KEY (`nºCatastro`) REFERENCES `viviendas` (`nºCatastro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocupantes`
--

LOCK TABLES `ocupantes` WRITE;
/*!40000 ALTER TABLE `ocupantes` DISABLE KEYS */;
INSERT INTO `ocupantes` VALUES ('04915024Q','Raquel','Alberas Aizaga','1973-12-01','9110254 WS448O 3354 QW'),('16512788T','Juan','Perez Adrados','1980-03-11','9666525 RR5168T 8541 GG'),('20911089H','Carmen','Ruiz De la fuente','1939-11-02','9001259 ZE7812S 2288 YY'),('25613098E','Lauren','Green Jones','1970-09-12','2255877 ZZ9523J 7751 MN'),('47543333U','Javier','Gutiérrez Del Río','1938-11-15','9112515 SC5184F 9952 FR'),('64105041Q','Carmen','Menosa Escudero','1924-11-21','2255255 CC8858Y 0110 SA'),('68496613Z','Rafael','Gustavson Drarksen','1968-03-09','9522624 YP4525P 0005 KK'),('69790544B','Irene','Martinez Contreras','1989-06-27','7445852 HG2591T 0202 VN'),('71860541P','Imma','Baptista Escalero','1992-12-30','1888254 CF4511R 9955 NB'),('72692306R','Miguel','Encinas Escalante','1976-02-22','9110254 WS448O 3354 QW'),('74564234Q','Pedro','Alvarez Callado','1982-12-17','9872023 VH5797S 0001 WX'),('90095607S','Alvaro','Pascual Ramirez','1975-07-15','9112515 SC5184F 9952 FR');
/*!40000 ALTER TABLE `ocupantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propietarios`
--

DROP TABLE IF EXISTS `propietarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `propietarios` (
  `dni` char(9) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `calle` varchar(45) NOT NULL,
  `num` int(11) NOT NULL,
  `piso` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietarios`
--

LOCK TABLES `propietarios` WRITE;
/*!40000 ALTER TABLE `propietarios` DISABLE KEYS */;
INSERT INTO `propietarios` VALUES ('19655225T','Oscar','Llorente Luengo','Calle de la luna',7,'2 D'),('20039032Y','Lorenzo','West Garcia','Calle la Resina',13,'4 E'),('23310054Z','Abril','Madrid Suarez','Calle Ramón Martín',1,'1 E'),('41679701K','Juana','Cruz Madrigal','Calle del colegio',10,'1 B'),('44892211Y','Carla','Verdugo Velasco','Calle Viejo Cuartel',11,'3 B'),('50445509T','Maria','Pascual Garcia','Calle Urraca',14,'3 D'),('59408410P','Juan','Senovilla Laporte','Avenida Salamanca',19,'2 A'),('59804933B','Juanjo','Casillas Sevilla','Calle Topacio',28,'1 A'),('60758270K','Laura','Velasco Lorenzo','Calle Antigua enfermeria',5,'1 E'),('62269663S','Raúl','Migua Otero','Calle Arcediano Gomez',23,'2 C'),('64105041Q','Marcos','Garcia Galicia','Avenida Gamazo',15,'4 A'),('71297004V','Jaime','Pérez Miranda','Calle Camilo José Cela',7,'4 D'),('73793158G','Pedro','Ramiro López','Avenida Martin Lopez',5,'3 F'),('81139896J','Martín','Bravo Velasco ','Calle estrella',4,'2 E'),('94328497T','Anabel','Verdugo Madrigal','Calle El Calvario',18,'3 C');
/*!40000 ALTER TABLE `propietarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `provincias` (
  `codigoProvincia` varchar(15) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`codigoProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES ('6122326HHH','Valladolid'),('7245675RTY','Segovia');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viviendas`
--

DROP TABLE IF EXISTS `viviendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `viviendas` (
  `nºCatastro` varchar(28) NOT NULL,
  `calle` varchar(25) NOT NULL,
  `num` int(11) NOT NULL,
  `piso` varchar(5) DEFAULT NULL,
  `m2` decimal(10,3) NOT NULL,
  `precioTasacion` decimal(10,3) NOT NULL,
  `idBarrios` varchar(10) NOT NULL,
  `dni` char(9) NOT NULL,
  PRIMARY KEY (`nºCatastro`),
  KEY `fk_Viviendas_Barrios1_idx` (`idBarrios`),
  KEY `fk_Viviendas_Propietarios1_idx` (`dni`),
  CONSTRAINT `fk_Viviendas_Barrios1` FOREIGN KEY (`idBarrios`) REFERENCES `barrios` (`idBarrios`),
  CONSTRAINT `fk_Viviendas_Propietarios1` FOREIGN KEY (`dni`) REFERENCES `propietarios` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viviendas`
--

LOCK TABLES `viviendas` WRITE;
/*!40000 ALTER TABLE `viviendas` DISABLE KEYS */;
INSERT INTO `viviendas` VALUES ('1388754 CX8466H 0666 PO','Avda. Palencia',1,'1 A',107.000,107640.000,'7510','64105041Q'),('1888254 CF4511R 9955 NB','Calle El Jorobado Danés',10,'2 B',122.000,192300.000,'7510','23310054Z'),('2255255 CC8858Y 0110 SA','Avda. Zapataria ',11,'3 B',162.000,126850.000,'7509','73793158G'),('2255877 ZZ9523J 7751 MN','Avda. Punta Cuntera',5,'5 A',63.000,115300.000,'7505','44892211Y'),('7445852 HG2591T 0202 VN','Avda. Paco Casado',3,'1 C',350.000,330000.000,'7507','59804933B'),('7445852 LP8524O 1119 ZX','Calle Sésamo Bravo',11,'2 A',83.000,150000.000,'7504','71297004V'),('8956211 VB6518F 0025 VV','Calle El Portal ',15,NULL,523.000,452500.000,'7509','20039032Y'),('9001259 ZE7812S 2288 YY','Calle El Caldero',12,'2 C',90.000,250000.000,'7502','20039032Y'),('9110254 WS448O 3354 QW','Avda. Don Calero Martinez',10,'2 B',95.000,220500.000,'7505','41679701K'),('9112515 SC5184F 9952 FR','Avda. Camilo Sexto',5,NULL,400.000,450000.000,'7503','73793158G'),('9522624 YP4525P 0005 KK','Avda. La Sevillana Marena',2,'1 D',80.000,175300.000,'7506','94328497T'),('9666525 RR5168T 8541 GG','Calle Lorenzo Gonzalez',2,'2 A',60.000,120500.000,'7501','73793158G'),('9872023 VH5797S 0001 WX','Calle Luna',7,'1 A',200.000,200000.000,'7500','73793158G');
/*!40000 ALTER TABLE `viviendas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-22 19:06:37
