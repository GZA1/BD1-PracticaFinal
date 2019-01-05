-- Script creación de la base de datos
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Provincias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Provincias` (
  `codigoProvincia` VARCHAR(15) NOT NULL,
  `Nombre` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`codigoProvincia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Municipios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Municipios` (
  `idMunicipio` VARCHAR(13) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `area` DECIMAL(10,3) NOT NULL,
  `Provincias_codigoProvincia` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idMunicipio`),
  INDEX `fk_Municipios_Provincias1_idx` (`Provincias_codigoProvincia` ASC) VISIBLE,
  CONSTRAINT `fk_Municipios_Provincias1`
    FOREIGN KEY (`Provincias_codigoProvincia`)
    REFERENCES `mydb`.`Provincias` (`codigoProvincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Barrios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Barrios` (
  `idBarrios` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(25) NOT NULL,
  `area` DECIMAL(10) NOT NULL,
  `coord` VARCHAR(45) NOT NULL,
  `zipCode` INT NOT NULL,
  `avgM2price` DECIMAL(10) NOT NULL,
  `Municipios_idMunicipio` INT NOT NULL,
  PRIMARY KEY (`idBarrios`),
  INDEX `fk_Barrios_Municipios1_idx` (`Municipios_idMunicipio` ASC) VISIBLE,
  CONSTRAINT `fk_Barrios_Municipios1`
    FOREIGN KEY (`Municipios_idMunicipio`)
    REFERENCES `mydb`.`Municipios` (`idMunicipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Propietarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Propietarios` (
  `dni` CHAR(9) GENERATED ALWAYS AS () VIRTUAL,
  `nombre` VARCHAR(20) NOT NULL,
  `Apellidos` VARCHAR(40) NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `num` INT NOT NULL,
  `Piso` VARCHAR(5) NULL,
  PRIMARY KEY (`dni`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Viviendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Viviendas` (
  `nºCatastro` VARCHAR(15) NOT NULL,
  `calle` VARCHAR(25) NOT NULL,
  `num` INT NOT NULL,
  `piso` INT NOT NULL,
  `m2` DECIMAL(10) NOT NULL,
  `precioTasacion` DECIMAL(10,3) NOT NULL,
  `Barrios_idBarrios` VARCHAR(10) NOT NULL,
  `Propietarios_dni` CHAR(9) NOT NULL,
  PRIMARY KEY (`nºCatastro`),
  INDEX `fk_Viviendas_Barrios1_idx` (`Barrios_idBarrios` ASC) VISIBLE,
  INDEX `fk_Viviendas_Propietarios1_idx` (`Propietarios_dni` ASC) VISIBLE,
  CONSTRAINT `fk_Viviendas_Barrios1`
    FOREIGN KEY (`Barrios_idBarrios`)
    REFERENCES `mydb`.`Barrios` (`idBarrios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Viviendas_Propietarios1`
    FOREIGN KEY (`Propietarios_dni`)
    REFERENCES `mydb`.`Propietarios` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `mydb`.`Impuestos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Impuestos` (
  `idImpuesto` VARCHAR(15) NOT NULL,
  `fechaInico` DATE NOT NULL,
  `fechaVencimiento` DATE NOT NULL,
  `importe` DECIMAL(10) NOT NULL,
  `fechaActualPago` DATE NOT NULL,
  `fechaInicio` DATE NOT NULL,
  `Viviendas_nºCatastro` VARCHAR(15) NOT NULL,
  `Propietarios_dni` CHAR(9) NOT NULL,
  PRIMARY KEY (`idImpuesto`, `Viviendas_nºCatastro`),
  INDEX `fk_Impuestos_Propietarios1_idx` (`Propietarios_dni` ASC) VISIBLE,
  CONSTRAINT `fk_Impuestos_Viviendas1`
    FOREIGN KEY (`Viviendas_nºCatastro`)
    REFERENCES `mydb`.`Viviendas` (`nºCatastro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Impuestos_Propietarios1`
    FOREIGN KEY (`Propietarios_dni`)
    REFERENCES `mydb`.`Propietarios` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ocupantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ocupantes` (
  `dni` CHAR(9) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellidos` VARCHAR(45) NULL,
  `fNac` DATE NULL,
  `Viviendas_nºCatastro` VARCHAR(15) NOT NULL,
  INDEX `fk_Ocupantes_Viviendas1_idx` (`Viviendas_nºCatastro` ASC) VISIBLE,
  PRIMARY KEY (`dni`),
  CONSTRAINT `fk_Ocupantes_Viviendas1`
    FOREIGN KEY (`Viviendas_nºCatastro`)
    REFERENCES `mydb`.`Viviendas` (`nºCatastro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
