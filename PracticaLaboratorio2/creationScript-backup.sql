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
-- Table `AdminViviendas`.`Viviendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdminViviendas`.`Viviendas` (
  `idVivienda` INT NOT NULL AUTO_INCREMENT,
  `nºCatastro` VARCHAR(28) NOT NULL,
  `calle` VARCHAR(25) NOT NULL,
  `num` INT NOT NULL,
  `piso` VARCHAR(5) NULL,
  `m2` DECIMAL(10,3) NOT NULL,
  `precioTasacion` DECIMAL(10,3) NOT NULL,
  `idBarrios` VARCHAR(10) NOT NULL,
  `dni` CHAR(9) NOT NULL,
  INDEX `fk_Viviendas_Barrios1_idx` (`idBarrios` ASC) VISIBLE,
  INDEX `fk_Viviendas_Propietarios1_idx` (`dni` ASC) VISIBLE,
  PRIMARY KEY (`idVivienda`),
  UNIQUE INDEX `idVivienda_UNIQUE` (`idVivienda` ASC) VISIBLE,
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
  `idImpuesto` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fechaInico` DATE NOT NULL,
  `fechaVencimiento` DATE NOT NULL,
  `importe` DECIMAL(10,3) NOT NULL,
  `fechaActualPago` DATE NULL,
  `dni` CHAR(9) NOT NULL,
  `idVivienda` INT NOT NULL,
  PRIMARY KEY (`idImpuesto`),
  INDEX `fk_Impuestos_Propietarios1_idx` (`dni` ASC) VISIBLE,
  INDEX `fk_Impuestos_Viviendas1_idx` (`idVivienda` ASC) VISIBLE,
  CONSTRAINT `fk_Impuestos_Propietarios1`
    FOREIGN KEY (`dni`)
    REFERENCES `AdminViviendas`.`Propietarios` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Impuestos_Viviendas1`
    FOREIGN KEY (`idVivienda`)
    REFERENCES `AdminViviendas`.`Viviendas` (`idVivienda`)
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
  `idVivienda` INT NOT NULL,
  PRIMARY KEY (`dni`),
  INDEX `fk_Ocupantes_Viviendas1_idx` (`idVivienda` ASC) VISIBLE,
  CONSTRAINT `fk_Ocupantes_Viviendas1`
    FOREIGN KEY (`idVivienda`)
    REFERENCES `AdminViviendas`.`Viviendas` (`idVivienda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
