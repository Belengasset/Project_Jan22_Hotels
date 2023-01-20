-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Hoteles
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Hoteles
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Hoteles` DEFAULT CHARACTER SET utf8mb3 ;
USE `Hoteles` ;

-- -----------------------------------------------------
-- Table `Hoteles`.`Hotel_theme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hoteles`.`Hotel_theme` (
  `idHotel_type` VARCHAR(100) NOT NULL,
  `Rooms` INT NOT NULL,
  `Hotel_type` VARCHAR(45) NOT NULL,
  `Hotel_theme` VARCHAR(45) NOT NULL,
  `Hotel_year_creation` INT NOT NULL,
  `Hotel_century_creation` INT NOT NULL,
  PRIMARY KEY (`idHotel_type`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Hoteles`.`Hoteles_google_rev`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hoteles`.`Hoteles_google_rev` (
  `idHoteles_google` VARCHAR(100) NOT NULL,
  `Google_rate` FLOAT NOT NULL,
  `Google_habs` FLOAT NULL DEFAULT NULL,
  `Google_location` FLOAT NULL DEFAULT NULL,
  `Google_service` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`idHoteles_google`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Hoteles`.`Hoteles_tripad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hoteles`.`Hoteles_tripad` (
  `idHoteles_trip` VARCHAR(100) NOT NULL,
  `Trip_rate` FLOAT NOT NULL,
  `Trip_location` FLOAT NULL DEFAULT NULL,
  `Trip_cleanliness` FLOAT NULL DEFAULT NULL,
  `Trip_service` FLOAT NULL DEFAULT NULL,
  `Trip_value` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`idHoteles_trip`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Hoteles`.`Location_city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hoteles`.`Location_city` (
  `idLocation` VARCHAR(100) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `Region` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLocation`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Hoteles`.`Travel_Leisure_ranking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hoteles`.`Travel_Leisure_ranking` (
  `idHoteles_ranking` INT NOT NULL AUTO_INCREMENT,
  `Hotel_name` VARCHAR(100) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `Score` FLOAT NOT NULL,
  `Ranking` INT NOT NULL,
  `2021_Ranking` FLOAT NULL DEFAULT NULL,
  `Past_ranking` FLOAT NULL DEFAULT NULL,
  `ranking_year` INT NOT NULL,
  `Hoteles_trip_idHoteles_trip` VARCHAR(100) NOT NULL,
  `Hoteles_google_idHoteles_google` VARCHAR(100) NOT NULL,
  `Hotel_type_idHotel_type` VARCHAR(100) NOT NULL,
  `Location_idLocation` VARCHAR(100) NOT NULL,
  `Hoteles_tripad_idHoteles_trip` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idHoteles_ranking`),
  INDEX `fk_Travel_Leisure_ranking_Hoteles_google1_idx` (`Hoteles_google_idHoteles_google` ASC) VISIBLE,
  INDEX `fk_Travel_Leisure_ranking_Hotel_type1_idx` (`Hotel_type_idHotel_type` ASC) VISIBLE,
  INDEX `fk_Travel_Leisure_ranking_Location1_idx` (`Location_idLocation` ASC) VISIBLE,
  INDEX `fk_Travel_Leisure_ranking_Hoteles_tripad1_idx` (`Hoteles_tripad_idHoteles_trip` ASC) VISIBLE,
  CONSTRAINT `fk_Travel_Leisure_ranking_Hotel_type1`
    FOREIGN KEY (`Hotel_type_idHotel_type`)
    REFERENCES `Hoteles`.`Hotel_theme` (`idHotel_type`),
  CONSTRAINT `fk_Travel_Leisure_ranking_Hoteles_google1`
    FOREIGN KEY (`Hoteles_google_idHoteles_google`)
    REFERENCES `Hoteles`.`Hoteles_google_rev` (`idHoteles_google`),
  CONSTRAINT `fk_Travel_Leisure_ranking_Location1`
    FOREIGN KEY (`Location_idLocation`)
    REFERENCES `Hoteles`.`Location_city` (`idLocation`),
  CONSTRAINT `fk_Travel_Leisure_ranking_Hoteles_tripad1`
    FOREIGN KEY (`Hoteles_tripad_idHoteles_trip`)
    REFERENCES `Hoteles`.`Hoteles_tripad` (`idHoteles_trip`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
