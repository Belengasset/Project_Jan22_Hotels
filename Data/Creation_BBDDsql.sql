-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Hoteles
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Hoteles
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Hoteles` DEFAULT CHARACTER SET utf8 ;
USE `Hoteles` ;

-- -----------------------------------------------------
-- Table `Hoteles`.`Hoteles_google`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hoteles`.`Hoteles_google` (
  `idHoteles_google` INT NOT NULL AUTO_INCREMENT,
  `Hoteles_name` VARCHAR(100) NOT NULL,
  `Google_rate` DECIMAL(1) NOT NULL,
  `Google_Habs` DECIMAL(1) NULL,
  `Google_Location` DECIMAL(1) NULL,
  `Google_Service` DECIMAL(1) NULL,
  PRIMARY KEY (`idHoteles_google`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hoteles`.`Hoteles_trip`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hoteles`.`Hoteles_trip` (
  `idHoteles_trip` INT NOT NULL AUTO_INCREMENT,
  `Hoteles_name` VARCHAR(100) NOT NULL,
  `Trip_Rate` DECIMAL(1) NOT NULL,
  `Trip_Location` DECIMAL(1) NULL,
  `Trip_Cleanliness` DECIMAL(1) NULL,
  `Trip_Service` DECIMAL(1) NULL,
  `Trip_Value` DECIMAL(1) NULL,
  PRIMARY KEY (`idHoteles_trip`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hoteles`.`Hotel_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hoteles`.`Hotel_type` (
  `idHotel_type` INT NOT NULL AUTO_INCREMENT,
  `Hotel_name` VARCHAR(100) NOT NULL,
  `Rooms` INT NOT NULL,
  `Hotel_type` VARCHAR(45) NOT NULL,
  `Hotel_theme` VARCHAR(45) NOT NULL,
  `Hotel_year_creation` YEAR(4) NOT NULL,
  `Hotel_century_creation` INT NOT NULL,
  PRIMARY KEY (`idHotel_type`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hoteles`.`Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hoteles`.`Location` (
  `idLocation` INT NOT NULL AUTO_INCREMENT,
  `City` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `Region` VARCHAR(45) NOT NULL,
  `Latitud` DECIMAL(6) NULL,
  `Longitud` DECIMAL(6) NULL,
  PRIMARY KEY (`idLocation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hoteles`.`Travel_Leisure_ranking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hoteles`.`Travel_Leisure_ranking` (
  `idHoteles_ranking` INT NOT NULL AUTO_INCREMENT,
  `Hotel_name` VARCHAR(100) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `Score` DECIMAL(2) NOT NULL,
  `Rank` INT NOT NULL,
  `2021_Rank` DECIMAL(1) NULL,
  `Past_rank` DECIMAL(1) NULL,
  `Rank_year` YEAR(4) NOT NULL,
  `Location_idLocation` INT NOT NULL,
  `Hoteles_google_idHoteles_google` INT NOT NULL,
  `Hoteles_trip_idHoteles_trip` INT NOT NULL,
  `Hotel_type_idHotel_type` INT NOT NULL,
  PRIMARY KEY (`idHoteles_ranking`),
  INDEX `fk_Hoteles_ranking_Location_idx` (`Location_idLocation` ASC) VISIBLE,
  INDEX `fk_Travel_Leisure_ranking_Hoteles_google1_idx` (`Hoteles_google_idHoteles_google` ASC) VISIBLE,
  INDEX `fk_Travel_Leisure_ranking_Hoteles_trip1_idx` (`Hoteles_trip_idHoteles_trip` ASC) VISIBLE,
  INDEX `fk_Travel_Leisure_ranking_Hotel_type1_idx` (`Hotel_type_idHotel_type` ASC) VISIBLE,
  CONSTRAINT `fk_Hoteles_ranking_Location`
    FOREIGN KEY (`Location_idLocation`)
    REFERENCES `Hoteles`.`Location` (`idLocation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Travel_Leisure_ranking_Hoteles_google1`
    FOREIGN KEY (`Hoteles_google_idHoteles_google`)
    REFERENCES `Hoteles`.`Hoteles_google` (`idHoteles_google`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Travel_Leisure_ranking_Hoteles_trip1`
    FOREIGN KEY (`Hoteles_trip_idHoteles_trip`)
    REFERENCES `Hoteles`.`Hoteles_trip` (`idHoteles_trip`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Travel_Leisure_ranking_Hotel_type1`
    FOREIGN KEY (`Hotel_type_idHotel_type`)
    REFERENCES `Hoteles`.`Hotel_type` (`idHotel_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
