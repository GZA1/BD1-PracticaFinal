-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema AdminViviendas
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `AdminViviendas` ;

-- -----------------------------------------------------
-- Schema AdminViviendas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `AdminViviendas` DEFAULT CHARACTER SET utf8 ;
USE `AdminViviendas` ;

-- -----------------------------------------------------
-- Table `AdminViviendas`.`Provincias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdminViviendas`.`Provincias` (
  `codigoProvincia` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`codigoProvincia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AdminViviendas`.`Municipios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdminViviendas`.`Municipios` (
  `idMunicipio` VARCHAR(13) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `area` DECIMAL(10,3) NOT NULL,
  `codigoProvincia` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idMunicipio`),
  INDEX `fk_Municipios_Provincias1_idx` (`codigoProvincia` ASC) VISIBLE,
  CONSTRAINT `fk_Municipios_Provincias1`
    FOREIGN KEY (`codigoProvincia`)
    REFERENCES `AdminViviendas`.`Provincias` (`codigoProvincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AdminViviendas`.`Barrios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdminViviendas`.`Barrios` (
  `idBarrios` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(25) NOT NULL,
  `area` DECIMAL(10,3) NOT NULL,
  `coord` VARCHAR(45) NOT NULL,
  `zipCode` INT NOT NULL,
  `avgM2price` DECIMAL(10,3) NOT NULL,
  `idMunicipio` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`idBarrios`),
  INDEX `fk_Barrios_Municipios1_idx` (`idMunicipio` ASC) VISIBLE,
  CONSTRAINT `fk_Barrios_Municipios1`
    FOREIGN KEY (`idMunicipio`)
    REFERENCES `AdminViviendas`.`Municipios` (`idMunicipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AdminViviendas`.`Propietarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdminViviendas`.`Propietarios` (
  `dni` CHAR(9) NOT NULL,
  `nombre` VARCHAR(20) NOT NULL,
  `apellidos` VARCHAR(40) NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `num` INT NOT NULL,
  `piso` VARCHAR(5) NULL,
  PRIMARY KEY (`dni`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AdminViviendas`.`Viviendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdminViviendas`.`Viviendas` (
  `nºCatastro` VARCHAR(28) NOT NULL,
  `calle` VARCHAR(25) NOT NULL,
  `num` INT NOT NULL,
  `piso` INT NULL,
  `m2` DECIMAL(10,3) NOT NULL,
  `precioTasacion` DECIMAL(10,3) NOT NULL,
  `idBarrios` VARCHAR(10) NOT NULL,
  `dni` CHAR(9) NOT NULL,
  PRIMARY KEY (`nºCatastro`),
  INDEX `fk_Viviendas_Barrios1_idx` (`idBarrios` ASC) VISIBLE,
  INDEX `fk_Viviendas_Propietarios1_idx` (`dni` ASC) VISIBLE,
  CONSTRAINT `fk_Viviendas_Barrios1`
    FOREIGN KEY (`idBarrios`)
    REFERENCES `AdminViviendas`.`Barrios` (`idBarrios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Viviendas_Propietarios1`
    FOREIGN KEY (`dni`)
    REFERENCES `AdminViviendas`.`Propietarios` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `AdminViviendas`.`Impuestos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdminViviendas`.`Impuestos` (
  `idImpuesto` VARCHAR(28) NOT NULL,
  `fechaInico` DATE NOT NULL,
  `fechaVencimiento` DATE NOT NULL,
  `importe` DECIMAL(10,3) NOT NULL,
  `fechaActualPago` DATE NULL,
  `Viviendas_nºCatastro` VARCHAR(28) NOT NULL,
  `dni` CHAR(9) NOT NULL,
  PRIMARY KEY (`idImpuesto`, `Viviendas_nºCatastro`),
  INDEX `fk_Impuestos_Propietarios1_idx` (`dni` ASC) VISIBLE,
  CONSTRAINT `fk_Impuestos_Viviendas1`
    FOREIGN KEY (`Viviendas_nºCatastro`)
    REFERENCES `AdminViviendas`.`Viviendas` (`nºCatastro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Impuestos_Propietarios1`
    FOREIGN KEY (`dni`)
    REFERENCES `AdminViviendas`.`Propietarios` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AdminViviendas`.`Ocupantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdminViviendas`.`Ocupantes` (
  `dni` CHAR(9) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellidos` VARCHAR(45) NULL,
  `fNac` DATE NULL,
  `nºCatastro` VARCHAR(28) NOT NULL,
  INDEX `fk_Ocupantes_Viviendas1_idx` (`nºCatastro` ASC) VISIBLE,
  PRIMARY KEY (`dni`),
  CONSTRAINT `fk_Ocupantes_Viviendas1`
    FOREIGN KEY (`nºCatastro`)
    REFERENCES `AdminViviendas`.`Viviendas` (`nºCatastro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `AdminViviendas`.`Provincias`
-- -----------------------------------------------------
START TRANSACTION;
USE `AdminViviendas`;
INSERT INTO `AdminViviendas`.`Provincias` (`codigoProvincia`, `nombre`) VALUES ('6122326HHH', 'Valadolid');
INSERT INTO `AdminViviendas`.`Provincias` (`codigoProvincia`, `nombre`) VALUES ('7245675RTY', 'Segovia');

COMMIT;


-- -----------------------------------------------------
-- Data for table `AdminViviendas`.`Municipios`
-- -----------------------------------------------------
START TRANSACTION;
USE `AdminViviendas`;
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('40063', 'Cuellar', 348.66, '7245675RTY');
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('47075', 'Iscar', 60.5, '6122326HHH');
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('47122', 'Portillo', 64.42, '6122326HHH');
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('47076', 'Laguna de duero', 33.5, '6122326HHH');
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('47023', 'Boecillo', 77.5, '6122326HHH');
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('40004', 'Aguilafuente', 66.3, '7245675RTY');
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('47005', 'Alcazarén', 82.5, '6122326HHH');
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('47030', 'Campaspero', 50.3, '6122326HHH');
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('47063', 'Fompedraza', 49, '6122326HHH');
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('47067', 'Fuente el sol', 33.9, '6122326HHH');
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('47082', 'Matapozuelos', 66.2, '6122326HHH');
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('40001', 'Abades', 31.98, '7245675RTY');
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('40013', 'Aldeasoña', 18.67, '7245675RTY');
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('40020', 'Arcones', 31.75, '7245675RTY');
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('40041', 'Cantimpalos', 26.90, '7245675RTY');
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('40161', 'Carabias', 25.86, '7245675RTY');
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('40043', 'Carbonero el Mayor', 66.35, '7245675RTY');
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('40076', 'El Espinar', 205.10, '7245675RTY');
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('40086', 'Fuentepelayo', 30.90, '7245675RTY');
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('40093', 'Gallegos', 21.80, '7245675RTY');
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('40131', 'Monterrubio', 25.54, '7245675RTY');
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('40134', 'Mozoncillo', 42.74, '7245675RTY');
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('40003', 'Adrados', 18.19, '7245675RTY');
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('40109', 'Languilla', 26.66, '7245675RTY');
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('40110', 'Lastras de Cuellar', 65.42, '7245675RTY');
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('40200', 'Valladolid', 554.6, '6122326HHH');
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('40300', 'Segovia', 74.1, '7245675RTY');

COMMIT;


-- -----------------------------------------------------
-- Data for table `AdminViviendas`.`Barrios`
-- -----------------------------------------------------
START TRANSACTION;
USE `AdminViviendas`;
INSERT INTO `AdminViviendas`.`Barrios` (`idBarrios`, `nombre`, `area`, `coord`, `zipCode`, `avgM2price`, `idMunicipio`) VALUES ('7500', 'Brujas', 45.6, '15.64842,24.12847', 40100, 1000, '40063');
INSERT INTO `AdminViviendas`.`Barrios` (`idBarrios`, `nombre`, `area`, `coord`, `zipCode`, `avgM2price`, `idMunicipio`) VALUES ('7501', 'Caballeros', 18.2, '15.84621,24.51743', 40300, 1200, '40063');
INSERT INTO `AdminViviendas`.`Barrios` (`idBarrios`, `nombre`, `area`, `coord`, `zipCode`, `avgM2price`, `idMunicipio`) VALUES ('7502', 'Las Canonjías', 47.3, '15.65784,21.35486', 40200, 1300, '40063');
INSERT INTO `AdminViviendas`.`Barrios` (`idBarrios`, `nombre`, `area`, `coord`, `zipCode`, `avgM2price`, `idMunicipio`) VALUES ('7503', 'Parquesol', 29.5, '17.24854,19.25847', 47100, 1500, '47075');
INSERT INTO `AdminViviendas`.`Barrios` (`idBarrios`, `nombre`, `area`, `coord`, `zipCode`, `avgM2price`, `idMunicipio`) VALUES ('7504', 'La Rondilla', 13.3, '17.36548,25.15487', 47200, 900, '47122');
INSERT INTO `AdminViviendas`.`Barrios` (`idBarrios`, `nombre`, `area`, `coord`, `zipCode`, `avgM2price`, `idMunicipio`) VALUES ('7505', 'Covaresa', 18.4, '19.35487,54.21584', 47300, 1200, '47076');
INSERT INTO `AdminViviendas`.`Barrios` (`idBarrios`, `nombre`, `area`, `coord`, `zipCode`, `avgM2price`, `idMunicipio`) VALUES ('7506', 'Caballeros', 35.5, '40.949430,-4.119209	', 40001, 800, '47023');
INSERT INTO `AdminViviendas`.`Barrios` (`idBarrios`, `nombre`, `area`, `coord`, `zipCode`, `avgM2price`, `idMunicipio`) VALUES ('7507', 'Judería', 42, '44.923261,-4.923226', 40002, 500, '40004');
INSERT INTO `AdminViviendas`.`Barrios` (`idBarrios`, `nombre`, `area`, `coord`, `zipCode`, `avgM2price`, `idMunicipio`) VALUES ('7508', 'San Millán', 20, '41.322418,-3.651515', 40003, 1200, '47005');
INSERT INTO `AdminViviendas`.`Barrios` (`idBarrios`, `nombre`, `area`, `coord`, `zipCode`, `avgM2price`, `idMunicipio`) VALUES ('7509', 'El Salvador', 23.5, '43.051551,-6.651056', 40004, 1150, '40131');
INSERT INTO `AdminViviendas`.`Barrios` (`idBarrios`, `nombre`, `area`, `coord`, `zipCode`, `avgM2price`, `idMunicipio`) VALUES ('7510', 'San Marcos', 28.8, '35.215121,-4.551815', 40005, 1450, '40200');

COMMIT;


-- -----------------------------------------------------
-- Data for table `AdminViviendas`.`Propietarios`
-- -----------------------------------------------------
START TRANSACTION;
USE `AdminViviendas`;
INSERT INTO `AdminViviendas`.`Propietarios` (`dni`, `nombre`, `apellidos`, `calle`, `num`, `piso`) VALUES ('73793158G', 'Pedro', 'Ramiro López', 'Avenida Martin Lopez', 5, '3 F');
INSERT INTO `AdminViviendas`.`Propietarios` (`dni`, `nombre`, `apellidos`, `calle`, `num`, `piso`) VALUES ('71297004V', 'Jaime', 'Pérez Miranda', 'Calle Camilo José Cela', 7, '4 D');
INSERT INTO `AdminViviendas`.`Propietarios` (`dni`, `nombre`, `apellidos`, `calle`, `num`, `piso`) VALUES ('62269663S', 'Raúl', 'Migua Otero', 'Calle Arcediano Gomez', 23, '2 C');
INSERT INTO `AdminViviendas`.`Propietarios` (`dni`, `nombre`, `apellidos`, `calle`, `num`, `piso`) VALUES ('44892211Y', 'Carla', 'Verdugo Velasco', 'Calle Viejo Cuartel', 11, '3 B');
INSERT INTO `AdminViviendas`.`Propietarios` (`dni`, `nombre`, `apellidos`, `calle`, `num`, `piso`) VALUES ('41679701K', 'Juana', 'Cruz Madrigal', 'Calle del colegio', 10, '1 B');
INSERT INTO `AdminViviendas`.`Propietarios` (`dni`, `nombre`, `apellidos`, `calle`, `num`, `piso`) VALUES ('60758270K', 'Laura', 'Velasco Lorenzo', 'Calle Antigua enfermeria', 5, '1 E');
INSERT INTO `AdminViviendas`.`Propietarios` (`dni`, `nombre`, `apellidos`, `calle`, `num`, `piso`) VALUES ('81139896J', 'Martín', 'Bravo Velasco ', 'Calle estrella', 4, '2 E');
INSERT INTO `AdminViviendas`.`Propietarios` (`dni`, `nombre`, `apellidos`, `calle`, `num`, `piso`) VALUES ('19655225T', 'Oscar', 'Llorente Luengo', 'Calle de la luna', 7, '2 D');
INSERT INTO `AdminViviendas`.`Propietarios` (`dni`, `nombre`, `apellidos`, `calle`, `num`, `piso`) VALUES ('94328497T', 'Anabel', 'Verdugo Madrigal', 'Calle El Calvario', 18, '3 C');
INSERT INTO `AdminViviendas`.`Propietarios` (`dni`, `nombre`, `apellidos`, `calle`, `num`, `piso`) VALUES ('20039032Y', 'Lorenzo', 'West Garcia', 'Calle la Resina', 13, '4 E');
INSERT INTO `AdminViviendas`.`Propietarios` (`dni`, `nombre`, `apellidos`, `calle`, `num`, `piso`) VALUES ('59408410P', 'Juan', 'Senovilla Laporte', 'Avenida Salamanca', 19, '2 A');
INSERT INTO `AdminViviendas`.`Propietarios` (`dni`, `nombre`, `apellidos`, `calle`, `num`, `piso`) VALUES ('59804933B', 'Juanjo', 'Casillas Sevilla', 'Calle Topacio', 28, '1 A');
INSERT INTO `AdminViviendas`.`Propietarios` (`dni`, `nombre`, `apellidos`, `calle`, `num`, `piso`) VALUES ('23310054Z', 'Abril', 'Madrid Suarez', 'Calle Ramón Martín', 1, '1 E');
INSERT INTO `AdminViviendas`.`Propietarios` (`dni`, `nombre`, `apellidos`, `calle`, `num`, `piso`) VALUES ('50445509T', 'Maria', 'Pascual Garcia', 'Calle Urraca', 14, '3 D');
INSERT INTO `AdminViviendas`.`Propietarios` (`dni`, `nombre`, `apellidos`, `calle`, `num`, `piso`) VALUES ('64105041Q', 'Marcos', 'Garcia Galicia', 'Avenida Gamazo', 15, '4 A');

COMMIT;


-- -----------------------------------------------------
-- Data for table `AdminViviendas`.`Viviendas`
-- -----------------------------------------------------
START TRANSACTION;
USE `AdminViviendas`;
INSERT INTO `AdminViviendas`.`Viviendas` (`nºCatastro`, `calle`, `num`, `piso`, `m2`, `precioTasacion`, `idBarrios`, `dni`) VALUES ('9872023 VH5797S 0001 WX', 'Calle Luna', 7, 1, 200, 200000, '7500', '73793158G');
INSERT INTO `AdminViviendas`.`Viviendas` (`nºCatastro`, `calle`, `num`, `piso`, `m2`, `precioTasacion`, `idBarrios`, `dni`) VALUES ('9666525 RR5168T 8541 GG', 'Calle Lorenzo Gonzalez', 2, 2, 60, 120500, '7501', '73793158G');
INSERT INTO `AdminViviendas`.`Viviendas` (`nºCatastro`, `calle`, `num`, `piso`, `m2`, `precioTasacion`, `idBarrios`, `dni`) VALUES ('9112515 SC5184F 9952 FR', 'Avda. Camilo Sexto', 5, NULL, 400, 450000, '7503', '73793158G');
INSERT INTO `AdminViviendas`.`Viviendas` (`nºCatastro`, `calle`, `num`, `piso`, `m2`, `precioTasacion`, `idBarrios`, `dni`) VALUES ('9001259 ZE7812S 2288 YY', 'Calle El Caldero', 12, 2, 90, 250000, '7502', '20039032Y');
INSERT INTO `AdminViviendas`.`Viviendas` (`nºCatastro`, `calle`, `num`, `piso`, `m2`, `precioTasacion`, `idBarrios`, `dni`) VALUES ('9110254 WS448O 3354 QW', 'Avda. Don Calero Martinez', 10, 2, 95, 220500, '7505', '41679701K');
INSERT INTO `AdminViviendas`.`Viviendas` (`nºCatastro`, `calle`, `num`, `piso`, `m2`, `precioTasacion`, `idBarrios`, `dni`) VALUES ('7445852 LP8524O 1119 ZX', 'Calle Sésamo Bravo', 11, 2, 83, 150000, '7504', '71297004V');
INSERT INTO `AdminViviendas`.`Viviendas` (`nºCatastro`, `calle`, `num`, `piso`, `m2`, `precioTasacion`, `idBarrios`, `dni`) VALUES ('7445852 HG2591T 0202 VN', 'Avda. Paco Casado', 3, 1, 350, 330000, '7507', '59804933B');
INSERT INTO `AdminViviendas`.`Viviendas` (`nºCatastro`, `calle`, `num`, `piso`, `m2`, `precioTasacion`, `idBarrios`, `dni`) VALUES ('8956211 VB6518F 0025 VV', 'Calle El Portal ', 15, NULL, 523, 452500, '7509', '20039032Y');
INSERT INTO `AdminViviendas`.`Viviendas` (`nºCatastro`, `calle`, `num`, `piso`, `m2`, `precioTasacion`, `idBarrios`, `dni`) VALUES ('1888254 CF4511R 9955 NB', 'Calle El Jorobado Danés', 10, 2, 122, 192300, '7510', '23310054Z');
INSERT INTO `AdminViviendas`.`Viviendas` (`nºCatastro`, `calle`, `num`, `piso`, `m2`, `precioTasacion`, `idBarrios`, `dni`) VALUES ('2255255 CC8858Y 0110 SA', 'Avda. Zapataria ', 11, 3, 162, 126850, '7509', '73793158G');
INSERT INTO `AdminViviendas`.`Viviendas` (`nºCatastro`, `calle`, `num`, `piso`, `m2`, `precioTasacion`, `idBarrios`, `dni`) VALUES ('2255877 ZZ9523J 7751 MN', 'Avda. Punta Cuntera', 5, 5, 63, 115300, '7505', '44892211Y');
INSERT INTO `AdminViviendas`.`Viviendas` (`nºCatastro`, `calle`, `num`, `piso`, `m2`, `precioTasacion`, `idBarrios`, `dni`) VALUES ('9522624 YP4525P 0005 KK', 'Avda. La Sevillana Marena', 2, 1, 80, 175300, '7506', '94328497T');

COMMIT;


-- -----------------------------------------------------
-- Data for table `AdminViviendas`.`Impuestos`
-- -----------------------------------------------------
START TRANSACTION;
USE `AdminViviendas`;
INSERT INTO `AdminViviendas`.`Impuestos` (`idImpuesto`, `fechaInico`, `fechaVencimiento`, `importe`, `fechaActualPago`, `Viviendas_nºCatastro`, `dni`) VALUES ('YYYY84512', '2018-10-17', '2018-12-26', 300, '2018-11-02', '9872023 VH5797S 0001 WX', '73793158G');
INSERT INTO `AdminViviendas`.`Impuestos` (`idImpuesto`, `fechaInico`, `fechaVencimiento`, `importe`, `fechaActualPago`, `Viviendas_nºCatastro`, `dni`) VALUES ('TYFF47855', '2018-08-11', '2018-11-22', 562.25, '2018-10-15', '9666525 RR5168T 8541 GG', '73793158G');
INSERT INTO `AdminViviendas`.`Impuestos` (`idImpuesto`, `fechaInico`, `fechaVencimiento`, `importe`, `fechaActualPago`, `Viviendas_nºCatastro`, `dni`) VALUES ('YYGR95631', '2018-09-19', '2018-12-25', 956.32, '2018-11-12', '9112515 SC5184F 9952 FR', '73793158G');
INSERT INTO `AdminViviendas`.`Impuestos` (`idImpuesto`, `fechaInico`, `fechaVencimiento`, `importe`, `fechaActualPago`, `Viviendas_nºCatastro`, `dni`) VALUES ('VFRY45223', '2018-08-25', '2018-10-21', 200.65, '2018-09-05', '9001259 ZE7812S 2288 YY', '20039032Y');
INSERT INTO `AdminViviendas`.`Impuestos` (`idImpuesto`, `fechaInico`, `fechaVencimiento`, `importe`, `fechaActualPago`, `Viviendas_nºCatastro`, `dni`) VALUES ('XRGZ45123', '2018-11-29', '2019-01-17', 201.90, '2018-12-26', '9110254 WS448O 3354 QW', '41679701K');
INSERT INTO `AdminViviendas`.`Impuestos` (`idImpuesto`, `fechaInico`, `fechaVencimiento`, `importe`, `fechaActualPago`, `Viviendas_nºCatastro`, `dni`) VALUES ('XTTR12558', '2018-07-02', '2018-09-12', 362.15, '2018-08-29', '7445852 LP8524O 1119 ZX', '71297004V');
INSERT INTO `AdminViviendas`.`Impuestos` (`idImpuesto`, `fechaInico`, `fechaVencimiento`, `importe`, `fechaActualPago`, `Viviendas_nºCatastro`, `dni`) VALUES ('XGRG74584', '2018-02-15', '2018-05-13', 253.02, '2018-02-28', '7445852 HG2591T 0202 VN', '59804933B');
INSERT INTO `AdminViviendas`.`Impuestos` (`idImpuesto`, `fechaInico`, `fechaVencimiento`, `importe`, `fechaActualPago`, `Viviendas_nºCatastro`, `dni`) VALUES ('XXWR41054', '2018-04-18', '2018-06-26', 426.332, '2018-05-08', '8956211 VB6518F 0025 VV', '20039032Y');
INSERT INTO `AdminViviendas`.`Impuestos` (`idImpuesto`, `fechaInico`, `fechaVencimiento`, `importe`, `fechaActualPago`, `Viviendas_nºCatastro`, `dni`) VALUES ('HBBE99633', '2018-01-30', '2018-03-11', 481.30, NULL, '1888254 CF4511R 9955 NB', '23310054Z');
INSERT INTO `AdminViviendas`.`Impuestos` (`idImpuesto`, `fechaInico`, `fechaVencimiento`, `importe`, `fechaActualPago`, `Viviendas_nºCatastro`, `dni`) VALUES ('NJMJ51225', '2018-10-22', '2019-02-02', 305.9, '2018-02-01', '2255255 CC8858Y 0110 SA', '73793158G');
INSERT INTO `AdminViviendas`.`Impuestos` (`idImpuesto`, `fechaInico`, `fechaVencimiento`, `importe`, `fechaActualPago`, `Viviendas_nºCatastro`, `dni`) VALUES ('KKL575456', '2018-12-15', '2019-03-29', 557.5, NULL, '9522624 YP4525P 0005 KK', '94328497T');

COMMIT;


-- -----------------------------------------------------
-- Data for table `AdminViviendas`.`Ocupantes`
-- -----------------------------------------------------
START TRANSACTION;
USE `AdminViviendas`;
INSERT INTO `AdminViviendas`.`Ocupantes` (`dni`, `nombre`, `apellidos`, `fNac`, `nºCatastro`) VALUES ('74564234Q', 'Pedro', 'Alvarez Callado', '1982-12-17', '9872023 VH5797S 0001 WX');
INSERT INTO `AdminViviendas`.`Ocupantes` (`dni`, `nombre`, `apellidos`, `fNac`, `nºCatastro`) VALUES ('16512788T', 'Juan', 'Perez Adrados', '1949-01-05', '9666525 RR5168T 8541 GG');
INSERT INTO `AdminViviendas`.`Ocupantes` (`dni`, `nombre`, `apellidos`, `fNac`, `nºCatastro`) VALUES ('90095607S', 'Alvaro', 'Pascual Ramirez', '1975-07-15', '9112515 SC5184F 9952 FR');
INSERT INTO `AdminViviendas`.`Ocupantes` (`dni`, `nombre`, `apellidos`, `fNac`, `nºCatastro`) VALUES ('20911089H', 'Carmen', 'Ruiz De la fuente', '1989-11-02', '9001259 ZE7812S 2288 YY');
INSERT INTO `AdminViviendas`.`Ocupantes` (`dni`, `nombre`, `apellidos`, `fNac`, `nºCatastro`) VALUES ('04915024Q', 'Raquel', 'Alberas Aizaga', '1949-05-01', '9110254 WS448O 3354 QW');
INSERT INTO `AdminViviendas`.`Ocupantes` (`dni`, `nombre`, `apellidos`, `fNac`, `nºCatastro`) VALUES ('72692306R', 'Miguel', 'Encinas Escalante', '1976-02-22', '9110254 WS448O 3354 QW');
INSERT INTO `AdminViviendas`.`Ocupantes` (`dni`, `nombre`, `apellidos`, `fNac`, `nºCatastro`) VALUES ('69790544B', 'Irene', 'Martinez Contreras', '1989-06-27', '7445852 HG2591T 0202 VN');
INSERT INTO `AdminViviendas`.`Ocupantes` (`dni`, `nombre`, `apellidos`, `fNac`, `nºCatastro`) VALUES ('71860541P', 'Imma', 'Baptista Escalero', '1992-12-30', '1888254 CF4511R 9955 NB');
INSERT INTO `AdminViviendas`.`Ocupantes` (`dni`, `nombre`, `apellidos`, `fNac`, `nºCatastro`) VALUES ('64105041Q', 'Carmen', 'Menosa Escudero', '1974-11-21', '2255255 CC8858Y 0110 SA');
INSERT INTO `AdminViviendas`.`Ocupantes` (`dni`, `nombre`, `apellidos`, `fNac`, `nºCatastro`) VALUES ('25613098E', 'Lauren', 'Green Jones', '1930-09-12', '2255877 ZZ9523J 7751 MN');
INSERT INTO `AdminViviendas`.`Ocupantes` (`dni`, `nombre`, `apellidos`, `fNac`, `nºCatastro`) VALUES ('68496613Z', 'Rafael', 'Gustavson Drarksen', '1968-03-09', '9522624 YP4525P 0005 KK');

COMMIT;

