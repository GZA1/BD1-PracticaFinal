CREATE DATABASE  IF NOT EXISTS `adminviviendas` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `adminviviendas`;
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
INSERT INTO `barrios` VALUES ('7500','Brujas',275.501,'11.42407,20.44401',45435,1040.573,'40063'),('7501','Caballeros',22.186,'-44.26082,-35.88040',44270,868.153,'40063'),('7502','Las Canonjías',33.159,'-10.74961,-41.47661',41989,1981.381,'40063'),('7503','Parquesol',13.638,'49.70558,-9.06115',40446,576.063,'40200'),('7504','Rondilla',8.880,'-22.10323,-36.38175',46752,1717.249,'40200'),('7505','Covaresa',28.646,'-30.71532,-11.21731',42884,1459.236,'40200'),('7506','Abades',10.205,'15.98820,45.23976',46258,581.776,'40001'),('7507','Adrados',46.650,'-3.57460,4.45862',42641,525.629,'40003'),('7508','Aguilafuente',9.272,'-7.66400,33.20293',47120,1931.366,'40004'),('7509','Aldeasoña',9.546,'14.23699,40.87887',44934,1036.706,'40013'),('7510','Arconcillos',47.233,'11.91727,-21.96870',44352,1818.945,'40020'),('7511','Huerta',39.395,'-31.61761,12.60908',44631,524.960,'40020'),('7512','Castillejo',20.581,'18.13385,-13.20623',46365,1811.830,'40020'),('7513','La Mata',49.359,'-19.49258,6.81303',47403,1884.133,'40020'),('7514','Colladillo',42.687,'-8.08256,8.34082',45276,1321.046,'40020'),('7515','Cantimpalos',39.122,'-35.07558,-2.85809',47274,698.837,'40041'),('7516','Carbonero el Mayor',47.062,'-22.41654,7.50676',40382,1270.952,'40043'),('7517','El Espinar',24.185,'8.97876,16.99226',44642,1837.226,'40076'),('7518','San Rafael',37.250,'40.88878,-10.55644',41964,566.401,'40076'),('7519','La Estación de El Espinar',26.816,'-20.88413,-49.85827',41068,1495.699,'40076'),('7520','Los Ángeles de San Rafael',46.317,'9.94347,-25.73264',43320,1020.949,'40076'),('7521','Fuentepelayo',27.109,'-8.53705,9.92308',46018,1945.453,'40086'),('7522','Gallegos de la Sierra',30.262,'41.59925,39.58234',45849,1952.343,'40093'),('7523','Languilla',34.148,'-16.60678,22.64903',45045,1960.705,'40109'),('7524','Lastras de Cuéllar',48.967,'46.38490,38.80897',44391,620.358,'40110'),('7525','San Esteban',38.952,'3.17301,-10.48175',43045,1577.096,'40110'),('7526','La Serreta',25.167,'-41.34233,-41.15781',41459,1469.949,'40110'),('7527','Santa María de Sacedón',35.871,'-0.97815,-10.69767',43955,939.853,'40110'),('7528','Monterrubio',49.226,'-46.57333,-27.70505',40095,1086.332,'40131'),('7529','Mozoncillo',46.337,'-7.96718,-15.41542',43745,955.526,'40134'),('7530','Carabias',10.116,'15.73885,44.58780',46057,1922.732,'40161'),('7531','Ciruelos',26.185,'0.83717,-37.04431',40981,837.017,'40161'),('7532','Pradales',38.992,'-39.71364,-25.18200',47458,1875.511,'40161'),('7533','Segovia',40.465,'-31.04813,8.32690',42782,1983.708,'40300'),('7534','San Lorenzo',45.605,'4.42087,-48.59308',43501,719.588,'40300'),('7535','Nueva Segovia',23.846,'15.48226,-48.22858',40992,1351.060,'40300'),('7536','Cristo del Mercado',25.905,'12.06702,20.96764',45490,954.241,'40300'),('7537','San Marcos',25.476,'-13.33641,-3.18915',41925,1698.272,'40300'),('7538','San Millán',17.255,'46.51314,-49.13476',41182,1570.073,'40300'),('7539','San José',10.549,'-2.36101,-48.79724',45047,678.139,'40300'),('7540','El Salvador',36.540,'-35.18239,13.82083',45972,1726.912,'40300'),('7541','San Andrés',43.258,'29.70124,-6.54399',46254,1407.704,'40300'),('7542','Santa Eulalia',35.618,'8.65389,39.15267',45584,1723.256,'40300'),('7543','Alcazarén',49.256,'-2.91673,-9.62428',44850,1730.251,'47005'),('7544','Boecillo',17.689,'44.93640,40.09004',45251,1369.025,'47023'),('7545','Campaspero',46.738,'39.95475,21.51788',47018,861.082,'47030'),('7546','Fompedraza',30.733,'-36.29079,46.99075',43506,922.375,'47063'),('7547','Fuente el sol',9.191,'12.09172,32.51856',42105,1760.487,'47067'),('7548','Íscar',23.544,'3.94988,-3.87898',45500,581.216,'47075'),('7549','Laguna de Duero',14.362,'37.78404,26.50389',41533,1494.875,'47076'),('7550','Torrelago',38.355,'21.64012,-14.16849',45138,705.372,'47076'),('7551','El Villar',39.086,'-12.34606,11.03274',47376,1668.668,'47076'),('7552','Matapozuelos',10.828,'-18.98211,-33.76140',47051,1879.712,'47082'),('7553','Barrio del Colegio',47.969,'-48.51157,-29.01639',40036,1089.693,'47082'),('7554','Portillo',47.843,'8.09217,-45.15762',43994,1027.247,'47122'),('7555','Arrabal de Portillo',16.674,'-25.73502,-6.50374',43574,1894.145,'47122'),('7556','Campo Grande',18.795,'24.45105,30.28718',46246,1243.283,'40200'),('7557','Delicias',11.081,'-31.09314,3.99628',41060,564.728,'40200'),('7558','Las Viudas',41.807,'46.02216,-15.26983',46846,855.970,'40200'),('7559','Universidad',32.857,'-11.67571,-44.08956',41166,1327.480,'40200'),('7560','Pajarillos',19.440,'44.94752,28.47148',40601,532.397,'40200'),('7561','Las Flores',44.715,'-15.20663,-40.79686',43330,1708.527,'40200'),('7562','Los Viveros',40.071,'-2.02703,-43.94221',46909,705.153,'40200'),('7563','Barrio España',9.173,'-44.65955,48.87964',46270,1928.679,'40200'),('7564','San Pablo',23.493,'-30.25719,25.42693',41432,1448.754,'40200'),('7565','Huerta del Rey',33.140,'-27.08675,-23.03224',45287,1243.881,'40200'),('7566','La Victoria',27.348,'49.53916,-1.29337',43593,1676.877,'40200'),('7567','Girón',30.895,'2.35141,39.12096',47084,1630.849,'40200'),('7568','Arturo Eyries',10.084,'-19.67953,-32.29184',47806,1021.587,'40200'),('7569','Cuatro de Marzo',41.506,'-48.69611,13.14663',40945,1545.014,'40200'),('7570','Pinar de Antequera',10.793,'5.36425,-11.79892',41993,649.399,'40200');
/*!40000 ALTER TABLE `barrios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `valBarrio` BEFORE UPDATE ON `barrios` FOR EACH ROW BEGIN
	IF  NEW.area - OLD.area > 200 THEN
		SET NEW.avgM2price = OLD.avgM2price * 1.06;
	END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `impuestos`
--

DROP TABLE IF EXISTS `impuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `impuestos` (
  `idImpuesto` int(11) NOT NULL AUTO_INCREMENT,
  `fechaInicio` date NOT NULL,
  `fechaVencimiento` date NOT NULL,
  `importe` decimal(10,3) NOT NULL,
  `fechaActualPago` date DEFAULT NULL,
  `dni` char(9) NOT NULL,
  `idViviendas` int(11) NOT NULL,
  PRIMARY KEY (`idImpuesto`),
  UNIQUE KEY `idImpuesto_UNIQUE` (`idImpuesto`),
  KEY `fk_Impuestos_Propietarios1_idx` (`dni`),
  KEY `fk_Impuestos_Viviendas1_idx` (`idViviendas`),
  CONSTRAINT `fk_Impuestos_Propietarios1` FOREIGN KEY (`dni`) REFERENCES `propietarios` (`dni`),
  CONSTRAINT `fk_Impuestos_Viviendas1` FOREIGN KEY (`idViviendas`) REFERENCES `viviendas` (`idViviendas`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impuestos`
--

LOCK TABLES `impuestos` WRITE;
/*!40000 ALTER TABLE `impuestos` DISABLE KEYS */;
INSERT INTO `impuestos` VALUES (1,'2018-10-17','2018-12-26',330.000,'2018-11-02','73793158G',1),(2,'2018-08-11','2018-11-22',562.250,'2018-10-15','73793158G',2),(3,'2018-09-19','2018-12-25',986.320,'2018-11-12','73793158G',3),(4,'2018-08-25','2018-10-21',200.650,'2018-09-05','20039032Y',4),(5,'2018-11-29','2019-01-17',201.900,'2018-12-26','41679701K',5),(6,'2018-07-02','2018-09-12',362.150,'2018-08-29','71297004V',6),(7,'2018-02-15','2018-05-13',283.020,'2018-02-28','59804933B',7),(8,'2018-04-18','2018-06-26',456.332,'2018-05-08','20039032Y',8),(9,'2018-01-30','2018-03-11',481.300,NULL,'23310054Z',9),(10,'2018-10-22','2019-02-02',335.900,'2018-02-01','73793158G',10),(11,'2018-12-15','2019-03-29',557.500,NULL,'94328497T',12),(12,'2019-06-04','2019-08-04',480.000,NULL,'73793158G',1),(13,'2019-06-27','2019-08-27',530.990,NULL,'59804933B',7);
/*!40000 ALTER TABLE `impuestos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `descZona` BEFORE INSERT ON `impuestos` FOR EACH ROW BEGIN
	DECLARE propViv VARCHAR(25);
    DECLARE eurM decimal(10, 3);
    SELECT m.nombre into propViv
    FROM Municipios m, Barrios b
    WHERE m.idMunicipio = b.idMunicipio AND idBarrios = (SELECT idBarrios FROM Viviendas v WHERE v.idViviendas = new.idViviendas);

	IF propViv = "Cuellar" THEN
		SELECT avgM2price into eurM FROM barrios WHERE idBarrios = (SELECT idBarrios FROM Viviendas v WHERE v.idViviendas = new.idViviendas);
		SET new.importe = new.importe * 0.90;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `plazoMinImpuesto` BEFORE INSERT ON `impuestos` FOR EACH ROW BEGIN
	IF datediff(NEW.fechaVencimiento, NEW.fechaInicio) < 60 THEN
		SET NEW.fechaVencimiento = date_add(NEW.fechaInicio, INTERVAL 2 MONTH);
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
INSERT INTO `municipios` VALUES ('40001','Abades',31.980,'7245675RTY'),('40003','Adrados',18.190,'7245675RTY'),('40004','Aguilafuente',66.300,'7245675RTY'),('40013','Aldeasoña',18.670,'7245675RTY'),('40020','Arcones',31.750,'7245675RTY'),('40041','Cantimpalos',26.900,'7245675RTY'),('40043','Carbonero el Mayor',66.350,'7245675RTY'),('40063','Cuellar',348.660,'7245675RTY'),('40076','El Espinar',205.100,'7245675RTY'),('40086','Fuentepelayo',30.900,'7245675RTY'),('40093','Gallegos de la Sierra',21.800,'7245675RTY'),('40109','Languilla',26.660,'7245675RTY'),('40110','Lastras de Cuellar',65.420,'7245675RTY'),('40131','Monterrubio',25.540,'7245675RTY'),('40134','Mozoncillo',42.740,'7245675RTY'),('40161','Carabias',25.860,'7245675RTY'),('40200','Valladolid',554.600,'6122326HHH'),('40300','Segovia',74.100,'7245675RTY'),('47005','Alcazarén',82.500,'6122326HHH'),('47023','Boecillo',77.500,'6122326HHH'),('47030','Campaspero',50.300,'6122326HHH'),('47063','Fompedraza',49.000,'6122326HHH'),('47067','Fuente el sol',33.900,'6122326HHH'),('47075','Iscar',60.500,'6122326HHH'),('47076','Laguna de duero',33.500,'6122326HHH'),('47082','Matapozuelos',66.200,'6122326HHH'),('47122','Portillo',64.420,'6122326HHH');
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
  `idViviendas` int(11) NOT NULL,
  PRIMARY KEY (`dni`),
  KEY `fk_Ocupantes_Viviendas1_idx` (`idViviendas`),
  CONSTRAINT `fk_Ocupantes_Viviendas1` FOREIGN KEY (`idViviendas`) REFERENCES `viviendas` (`idViviendas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocupantes`
--

LOCK TABLES `ocupantes` WRITE;
/*!40000 ALTER TABLE `ocupantes` DISABLE KEYS */;
INSERT INTO `ocupantes` VALUES ('04915024Q','Raquel','Alberas Aizaga','1973-12-01',1),('16512788T','Juan','Perez Adrados','1980-03-11',2),('20911089H','Carmen','Ruiz De la fuente','1939-11-02',4),('25613098E','Lauren','Green Jones','1970-09-12',11),('47543333U','Javier','Gutiérrez Del Río','1938-11-15',3),('64105041Q','Carmen','Menosa Escudero','1924-11-21',10),('68496613Z','Rafael','Gustavson Drarksen','1968-03-09',11),('69790544B','Irene','Martinez Contreras','1989-06-27',7),('71860541P','Imma','Baptista Escalero','1992-12-30',9),('72692306R','Miguel','Encinas Escalante','1976-02-22',6),('74564234Q','Pedro','Alvarez Callado','1982-12-17',1),('90095607S','Alvaro','Pascual Ramirez','1975-07-15',3);
/*!40000 ALTER TABLE `ocupantes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mudanza` AFTER UPDATE ON `ocupantes` FOR EACH ROW BEGIN
	if( new.idViviendas != old.idViviendas ) then
        UPDATE Viviendas v
        SET precioTasacion = precioTasacion - precioTasacion * 0.03
        WHERE v.idViviendas = new.idViviendas;
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  `idViviendas` int(11) NOT NULL AUTO_INCREMENT,
  `nºCatastro` varchar(28) NOT NULL,
  `calle` varchar(25) NOT NULL,
  `num` int(11) NOT NULL,
  `piso` varchar(5) DEFAULT NULL,
  `m2` decimal(10,3) NOT NULL,
  `precioTasacion` decimal(10,3) NOT NULL,
  `idBarrios` varchar(10) NOT NULL,
  `dni` char(9) NOT NULL,
  PRIMARY KEY (`idViviendas`),
  UNIQUE KEY `idViviendas_UNIQUE` (`idViviendas`),
  KEY `fk_Viviendas_Barrios1_idx` (`idBarrios`),
  KEY `fk_Viviendas_Propietarios1_idx` (`dni`),
  CONSTRAINT `fk_Viviendas_Barrios1` FOREIGN KEY (`idBarrios`) REFERENCES `barrios` (`idBarrios`),
  CONSTRAINT `fk_Viviendas_Propietarios1` FOREIGN KEY (`dni`) REFERENCES `propietarios` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viviendas`
--

LOCK TABLES `viviendas` WRITE;
/*!40000 ALTER TABLE `viviendas` DISABLE KEYS */;
INSERT INTO `viviendas` VALUES (1,'9872023 VH5797S 0001 WX','Calle Luna',7,'1 A',210.000,203700.000,'7500','73793158G'),(2,'9666525 RR5168T 8541 GG','Calle Lorenzo Gonzalez',2,'2 A',60.000,120500.000,'7501','73793158G'),(3,'9112515 SC5184F 9952 FR','Avda. Camilo Sexto',5,NULL,400.000,450000.000,'7503','73793158G'),(4,'9001259 ZE7812S 2288 YY','Calle El Caldero',12,'2 C',90.000,262500.000,'7519','20039032Y'),(5,'9110254 WS448O 3354 QW','Avda. Don Calero Martinez',10,'2 B',95.000,220500.000,'7505','41679701K'),(6,'7445852 LP8524O 1119 ZX','Calle Sésamo Bravo',11,'2 A',83.000,150000.000,'7512','71297004V'),(7,'7445852 HG2591T 0202 VN','Avda. Paco Casado',3,'1 C',350.000,330000.000,'7507','59804933B'),(8,'8956211 VB6518F 0025 VV','Calle El Portal ',15,NULL,523.000,452500.000,'7543','20039032Y'),(9,'1888254 CF4511R 9955 NB','Calle El Jorobado Danés',10,'2 B',122.000,192300.000,'7534','23310054Z'),(10,'2255255 CC8858Y 0110 SA','calle Gaviota',11,'3 B',162.000,126850.000,'7560','73793158G'),(11,'2255877 ZZ9523J 7751 MN','Avda. Punta Cuntera',5,'5 A',63.000,115300.000,'7569','44892211Y'),(12,'9522624 YP4525P 0005 KK','Avda. La Sevillana Marena',2,'1 D',80.000,175300.000,'7506','94328497T'),(13,'1388754 CX8466H 0666 PO','Avda. Palencia',1,'1 A',107.000,107640.000,'7510','64105041Q'),(14,'2688754 CY7466H 0666 IO','Avda. Ejemplo',1,'1 A',200.000,190000.000,'7536','64105041Q');
/*!40000 ALTER TABLE `viviendas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `depreciacionVivienda` BEFORE INSERT ON `viviendas` FOR EACH ROW BEGIN
	declare areaBarrio decimal(10,3);
	select area into areaBarrio
	from Barrios b
	where b.idBarrios = new.idBarrios;
	if(areaBarrio < 40) then
		set new.precioTasacion = new.precioTasacion - ( new.precioTasacion * 0.05 );
    end if;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cambioMetrosCuadrados` BEFORE UPDATE ON `viviendas` FOR EACH ROW BEGIN
    if( new.m2 > 0 ) then
		set new.precioTasacion = new.precioTasacion * new.m2 / old.m2;
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'adminviviendas'
--

--
-- Dumping routines for database 'adminviviendas'
--
/*!50003 DROP FUNCTION IF EXISTS `areaMediaMunicipios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `areaMediaMunicipios`(prov varchar(45)) RETURNS decimal(10,2)
begin
	DECLARE areaMedia decimal(10,2);
	SELECT avg(area) INTO areaMedia
    FROM Municipios m, Provincias p
    WHERE p.nombre = prov AND m.codigoProvincia = p.codigoProvincia;
    return areaMedia;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `dniOcupanteMasMayor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `dniOcupanteMasMayor`() RETURNS char(9) CHARSET utf8
begin
	DECLARE dniOc char(9);
	SELECT dni INTO dniOc FROM Ocupantes WHERE fNac = (SELECT min(fNAc) FROM Ocupantes);
    return dniOc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `poblacionBarrio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `poblacionBarrio`( nomBarrio VARCHAR(25) ) RETURNS int(11)
begin
	DECLARE recuento INTEGER;
	SELECT count(*) INTO recuento FROM Barrios b, Ocupantes o, Viviendas v
    WHERE v.idViviendas = o.idViviendas AND b.nombre = nomBarrio;
    return recuento;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `recaudacionAnual` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `recaudacionAnual`( año INTEGER ) RETURNS decimal(15,4)
begin
	DECLARE recTotal decimal(15,3);
	SELECT SUM(importe) INTO recTotal FROM Impuestos WHERE (SELECT year(fechaActualPago)) = año;
    return recTotal;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `valorBarrio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `valorBarrio`(nombreBarrio VARCHAR(45)) RETURNS decimal(10,3)
begin
	DECLARE precioTotal decimal(10,3);
	SELECT SUM(precioTasacion) into precioTotal
    FROM viviendas v, barrios b
    WHERE v.idBarrios = b.idBarrios AND b.nombre = nombreBarrio;
    return precioTotal;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `encuentraViviendas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `encuentraViviendas`(IN nombreProp VARCHAR(20), IN apellidosProp VARCHAR(40))
begin
	SELECT v.nºCatastro, v.calle, v.num, v.piso, v.m2, v.precioTasacion, b.nombre
    FROM Viviendas v, Propietarios p, Barrios b
    WHERE v.dni = p.dni AND v.idBarrios = b.idBarrios AND p.nombre = nombreProp AND p.apellidos = apellidosProp;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `incPrecioViviendasMunic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `incPrecioViviendasMunic`(IN municipio varchar(45), IN porcentaje decimal)
begin
	update Municipios m, Barrios b, Viviendas v
    set precioTasacion = precioTasacion + precioTasacion * porcentaje/100
    where m.nombre = municipio and m.idMunicipio = b.idMunicipio and v.idBarrios = b.idBarrios;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarCasas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarCasas`(IN  barrio VARCHAR(45))
begin
	SELECT v.nºCatastro, v.calle, v.num, v.piso, v.m2, v.precioTasacion, v.dni, p.nombre, p.apellidos
    FROM Viviendas v, Barrios b, Propietarios p
    WHERE b.nombre = barrio AND v.idBarrios = b.idBarrios AND v.dni = p.dni;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarHabitantesMunicipio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarHabitantesMunicipio`(IN muni VARCHAR(25))
BEGIN
	SELECT o.nombre as nombre, o.apellidos as apellidos, o.dni as dni FROM ocupantes o, Viviendas v, Municipios m, Barrios b 
    WHERE v.idBarrios = b.idBarrios AND o.idViviendas = v.idViviendas AND b.idMunicipio = m.idMunicipio
    AND m.nombre = muni
    UNION
    SELECT p.nombre as nombre, p.apellidos as apellidos, p.dni as dni FROM propietarios p, Viviendas v, Municipios m, Barrios b 
    WHERE v.idBarrios = b.idBarrios AND p.dni = v.dni AND b.idMunicipio = m.idMunicipio
    AND m.nombre = muni
    ORDER BY nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `numImpuestosDeuda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `numImpuestosDeuda`(IN elDni VARCHAR(15) , OUT total integer)
begin
	SELECT COUNT(*) INTO total FROM Impuestos i, Propietarios p WHERE i.dni = p.dni AND p.dni = elDni AND i.fechaActualPago IS NULL;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `subirImpuestosM2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `subirImpuestosM2`(iN incremento DECIMAL(10,3), IN tamaño DECIMAL(10,3))
begin
	UPDATE Impuestos i, Viviendas v SET i.importe = (i.importe + incremento)
    WHERE i.idViviendas = v.idViviendas AND v.M2 >= tamaño;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-04 20:29:22
