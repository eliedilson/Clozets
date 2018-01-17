-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema clozet_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema clozet_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `clozet_db` DEFAULT CHARACTER SET utf8 ;
USE `clozet_db` ;

-- -----------------------------------------------------
-- Table `clozet_db`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clozet_db`.`location` (
  `id` INT NOT NULL,
  `location` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clozet_db`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clozet_db`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `birthdate` DATE NOT NULL,
  `password` VARCHAR(199) NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_location1_idx` (`location_id` ASC),
  CONSTRAINT `fk_user_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `clozet_db`.`location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clozet_db`.`post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clozet_db`.`post` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `post` LONGTEXT NULL,
  `image` VARCHAR(50) NULL,
  `date` DATE NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_post_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_post_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `clozet_db`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clozet_db`.`tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clozet_db`.`tag` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tag` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clozet_db`.`post_has_tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clozet_db`.`post_has_tag` (
  `post_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
  PRIMARY KEY (`post_id`, `tag_id`),
  INDEX `fk_post_has_tag_tag1_idx` (`tag_id` ASC),
  INDEX `fk_post_has_tag_post1_idx` (`post_id` ASC),
  CONSTRAINT `fk_post_has_tag_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `clozet_db`.`post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_has_tag_tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `clozet_db`.`tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clozet_db`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clozet_db`.`comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` VARCHAR(45) NULL,
  `date` DATETIME NULL,
  `post_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `post_id`),
  INDEX `fk_comment_post1_idx` (`post_id` ASC),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_comment_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `clozet_db`.`post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `clozet_db`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clozet_db`.`shop`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clozet_db`.`shop` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`id`, `location_id`),
  INDEX `fk_shop_location1_idx` (`location_id` ASC),
  CONSTRAINT `fk_shop_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `clozet_db`.`location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
