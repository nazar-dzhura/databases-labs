-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lab_1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab_1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_1` DEFAULT CHARACTER SET utf8 ;
USE `lab_1` ;
DROP TABLE IF EXISTS developer;
DROP TABLE IF EXISTS game;
DROP TABLE IF EXISTS `group`;
DROP TABLE IF EXISTS `language`;
DROP TABLE IF EXISTS `status`;
DROP TABLE IF EXISTS system_requirement;
DROP TABLE IF EXISTS `user`;

-- -----------------------------------------------------
-- Table `lab_1`.`developer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_1`.`developer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_1`.`system_requirement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_1`.`system_requirement` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  `minimal` VARCHAR(45) NOT NULL,
  `recomended` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_1`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_1`.`status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `status_UNIQUE` (`status` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_1`.`group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_1`.`group` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_1`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_1`.`user` (
  `id` INT NOT NULL,
  `nickname` VARCHAR(45) NOT NULL,
  `status_id` INT NOT NULL,
  `last_played` DATE,
  `total_playtime` DOUBLE,
  `group_id` INT,
  PRIMARY KEY (`id`),
  INDEX `fk_user_status1_idx` (`status_id` ASC) VISIBLE,
  INDEX `fk_user_group1_idx` (`group_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `lab_1`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_group1`
    FOREIGN KEY (`group_id`)
    REFERENCES `lab_1`.`group` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_1`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_1`.`language` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `language` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `language_UNIQUE` (`language` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_1`.`game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_1`.`game` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `description` VARCHAR(900) NULL,
  `developer_id` INT NOT NULL,
  `system_requirement_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `language_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_game_developer_idx` (`developer_id` ASC) VISIBLE,
  INDEX `fk_game_system_requirement1_idx` (`system_requirement_id` ASC) VISIBLE,
  INDEX `fk_game_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_game_language1_idx` (`language_id` ASC) VISIBLE,
  CONSTRAINT `fk_game_developer`
    FOREIGN KEY (`developer_id`)
    REFERENCES `lab_1`.`developer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_system_requirement1`
    FOREIGN KEY (`system_requirement_id`)
    REFERENCES `lab_1`.`system_requirement` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `lab_1`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_language1`
    FOREIGN KEY (`language_id`)
    REFERENCES `lab_1`.`language` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- developer

INSERT INTO `lab_1`.`developer` (`id`,`name`) VALUES (1,'4A Games');
INSERT INTO `lab_1`.`developer` (`id`,`name`) VALUES (2,'989 Studios');
INSERT INTO `lab_1`.`developer` (`id`,`name`) VALUES (3,'Accolade');
INSERT INTO `lab_1`.`developer` (`id`,`name`) VALUES (4,'NetEase');
INSERT INTO `lab_1`.`developer` (`id`,`name`) VALUES (5,'Red Entertainment');
INSERT INTO `lab_1`.`developer` (`id`,`name`) VALUES (6,'Red Thread Games');
INSERT INTO `lab_1`.`developer` (`id`,`name`) VALUES (7,'Relic Entertainment');
INSERT INTO `lab_1`.`developer` (`id`,`name`) VALUES (8,'Tokyo RPG Factory');
INSERT INTO `lab_1`.`developer` (`id`,`name`) VALUES (9,'Tose');
INSERT INTO `lab_1`.`developer` (`id`,`name`) VALUES (NULL,'Treyarch');

-- game

INSERT INTO `lab_1`.`game` (`id`,`name`,`description`,`developer_id`,`system_requirement_id`,`user_id`,`language_id`) VALUES (1,'PUBG','PUBG: BATTLEGROUNDS is a battle royale shooter that pits 100 players against each other in a struggle for survival. Gather supplies and outwit your opponents to become the last person standing.',2,5,10,1);
INSERT INTO `lab_1`.`game` (`id`,`name`,`description`,`developer_id`,`system_requirement_id`,`user_id`,`language_id`) VALUES (2,'CS:GO','Counter-Strike: Global Offensive (CS: GO) expands upon the team-based action gameplay that it pioneered when it was launched 19 years ago.',5,1,25,1);
INSERT INTO `lab_1`.`game` (`id`,`name`,`description`,`developer_id`,`system_requirement_id`,`user_id`,`language_id`) VALUES (3,'GTA V','Grand Theft Auto V for PC offers players the option to explore the award-winning world of Los Santos and Blaine County in resolutions of up to 4k and beyond, as well as the chance to experience the game running at 60 frames per second.',1,4,12,6);
INSERT INTO `lab_1`.`game` (`id`,`name`,`description`,`developer_id`,`system_requirement_id`,`user_id`,`language_id`) VALUES (4,'CS 1.6','Play the world\'s number 1 online action game. Engage in an incredibly realistic brand of terrorist warfare in this wildly popular team-based game. Ally with teammates to complete strategic missions. Take out enemy sites. Rescue hostages. Your role affects your team\'s success. Your team\'s success affects your role.',5,2,23,3);
INSERT INTO `lab_1`.`game` (`id`,`name`,`description`,`developer_id`,`system_requirement_id`,`user_id`,`language_id`) VALUES (5,'Rust','The only aim in Rust is to survive. Everything wants you to die - the island’s wildlife and other inhabitants, the environment, other survivors. Do whatever it takes to last another night.',6,3,125,8);
INSERT INTO `lab_1`.`game` (`id`,`name`,`description`,`developer_id`,`system_requirement_id`,`user_id`,`language_id`) VALUES (6,'The Witcher® 3: Wild Hunt','The Witcher: Wild Hunt is a story-driven open world RPG set in a visually stunning fantasy universe full of meaningful choices and impactful consequences. In The Witcher, you play as professional monster hunter Geralt of Rivia tasked with finding a child of prophecy in a vast open world rich with merchant cities, pirate islands, dangerous mountain passes, and forgotten caverns to explore.',1255,26,16,2);
INSERT INTO `lab_1`.`game` (`id`,`name`,`description`,`developer_id`,`system_requirement_id`,`user_id`,`language_id`) VALUES (7,'Rocket League','Rocket League is a high-powered hybrid of arcade-style soccer and vehicular mayhem with easy-to-understand controls and fluid, physics-driven competition. Rocket League includes casual and competitive Online Matches, a fully-featured offline Season Mode, special “Mutators” that let you change the rules entirely, hockey and basketball-inspired Extra Modes, and more than 500 trillion possible cosmetic customization combinations.',223,32,364,9);
INSERT INTO `lab_1`.`game` (`id`,`name`,`description`,`developer_id`,`system_requirement_id`,`user_id`,`language_id`) VALUES (8,'Terraria','Dig, Fight, Explore, Build: The very world is at your fingertips as you fight for survival, fortune, and glory. Will you delve deep into cavernous expanses in search of treasure and raw materials with which to craft ever-evolving gear, machinery, and aesthetics? Perhaps you will choose instead to seek out ever-greater foes to test your mettle in combat? Maybe you will decide to construct your own city to house the host of mysterious allies you may encounter along your travels?',127,245,4785,9);
INSERT INTO `lab_1`.`game` (`id`,`name`,`description`,`developer_id`,`system_requirement_id`,`user_id`,`language_id`) VALUES (9,'DEATH STRANDING','From legendary game creator Hideo Kojima comes an all-new, genre-defying experience. Stay connected with the \"Social Strand System™”.',458,234,5679,6);
INSERT INTO `lab_1`.`game` (`id`,`name`,`description`,`developer_id`,`system_requirement_id`,`user_id`,`language_id`) VALUES (10,'I Am Fish','I Am Fish is a charming, physics-based adventure starring four intrepid fish friends, forcibly separated from their home in a pet shop fish tank. Over the course of the game you join them as they swim, fly, roll and chomp their way to the open ocean from the far-flung corners of Barnardshire (the smallest county in England) in their bid for freedom and to re-unite once again.',234,323,3457,35);

-- group

INSERT INTO `lab_1`.`group` (`id`,`name`) VALUES (1,'OG');
INSERT INTO `lab_1`.`group` (`id`,`name`) VALUES (2,'Team Liquid');
INSERT INTO `lab_1`.`group` (`id`,`name`) VALUES (3,'PSD');
INSERT INTO `lab_1`.`group` (`id`,`name`) VALUES (4,'Evil');
INSERT INTO `lab_1`.`group` (`id`,`name`) VALUES (5,'Temp Spirit');
INSERT INTO `lab_1`.`group` (`id`,`name`) VALUES (6,'Virtus.pro');
INSERT INTO `lab_1`.`group` (`id`,`name`) VALUES (7,'Vici');
INSERT INTO `lab_1`.`group` (`id`,`name`) VALUES (8,'Newbee');
INSERT INTO `lab_1`.`group` (`id`,`name`) VALUES (9,'Navi');
INSERT INTO `lab_1`.`group` (`id`,`name`) VALUES (10,'T1');
INSERT INTO `lab_1`.`group` (`id`,`name`) VALUES (11,'Fnatic');

-- language

INSERT INTO `lab_1`.`language` (`id`,`language`) VALUES (1,'English');
INSERT INTO `lab_1`.`language` (`id`,`language`) VALUES (2,'Ukranian');
INSERT INTO `lab_1`.`language` (`id`,`language`) VALUES (3,'Russian');
INSERT INTO `lab_1`.`language` (`id`,`language`) VALUES (4,'Dutch');
INSERT INTO `lab_1`.`language` (`id`,`language`) VALUES (5,'Sweden');
INSERT INTO `lab_1`.`language` (`id`,`language`) VALUES (6,'Chinese');
INSERT INTO `lab_1`.`language` (`id`,`language`) VALUES (7,'Japanese');
INSERT INTO `lab_1`.`language` (`id`,`language`) VALUES (8,'Spanish');
INSERT INTO `lab_1`.`language` (`id`,`language`) VALUES (9,'Korean');
INSERT INTO `lab_1`.`language` (`id`,`language`) VALUES (10,'Hindi');
INSERT INTO `lab_1`.`language` (`id`,`language`) VALUES (11,'French');

-- status

INSERT INTO `lab_1`.`status` (`id`,`status`) VALUES (1,'In game');
INSERT INTO `lab_1`.`status` (`id`,`status`) VALUES (2,'Away');
INSERT INTO `lab_1`.`status` (`id`,`status`) VALUES (3,'Offline');
INSERT INTO `lab_1`.`status` (`id`,`status`) VALUES (4,'Invisible');
INSERT INTO `lab_1`.`status` (`id`,`status`) VALUES (5,'Online');

-- system_requirement

INSERT INTO `lab_1`.`system_requirement` (`id`,`type`,`minimal`,`recomended`) VALUES (NULL,'CPU','i5-4430','i7-7700');
INSERT INTO `lab_1`.`system_requirement` (`id`,`type`,`minimal`,`recomended`) VALUES (NULL,'GPU','1050','2080ti');
INSERT INTO `lab_1`.`system_requirement` (`id`,`type`,`minimal`,`recomended`) VALUES (NULL,'RAM','8 Gb','16 Gb');
INSERT INTO `lab_1`.`system_requirement` (`id`,`type`,`minimal`,`recomended`) VALUES (NULL,'Storage','40 Gb','50 Gb');
INSERT INTO `lab_1`.`system_requirement` (`id`,`type`,`minimal`,`recomended`) VALUES (NULL,'DirectX','Version 11','Version 11');
INSERT INTO `lab_1`.`system_requirement` (`id`,`type`,`minimal`,`recomended`) VALUES (NULL,'Network','Broadband Internet connection','Broadband Internet connection');
INSERT INTO `lab_1`.`system_requirement` (`id`,`type`,`minimal`,`recomended`) VALUES (NULL,'OS','64-bit Windows 7, Windows 8.1, Windows 10','64-bit Windows 7, Windows 8.1, Windows 10');

-- user 

INSERT INTO `lab_1`.`user` (`id`,`nickname`,`status_id`,`last_played`,`total_playtime`,`group_id`) VALUES (1,'Cartman',2,'02.10.2021',472,8);
INSERT INTO `lab_1`.`user` (`id`,`nickname`,`status_id`,`last_played`,`total_playtime`,`group_id`) VALUES (2,'Stan',4,'03.10.2021',1276,NULL);
INSERT INTO `lab_1`.`user` (`id`,`nickname`,`status_id`,`last_played`,`total_playtime`,`group_id`) VALUES (3,'Kyle',1,'22.11.2021',11,5);
INSERT INTO `lab_1`.`user` (`id`,`nickname`,`status_id`,`last_played`,`total_playtime`,`group_id`) VALUES (4,'Kenny',3,NULL,NULL,2);
INSERT INTO `lab_1`.`user` (`id`,`nickname`,`status_id`,`last_played`,`total_playtime`,`group_id`) VALUES (5,'Bart',1,'09.09.2021',375,7);
INSERT INTO `lab_1`.`user` (`id`,`nickname`,`status_id`,`last_played`,`total_playtime`,`group_id`) VALUES (6,'Rick',4,'25.08.2021',1357,9);
INSERT INTO `lab_1`.`user` (`id`,`nickname`,`status_id`,`last_played`,`total_playtime`,`group_id`) VALUES (7,'Morty',2,'27.04.2021',4557,1);
INSERT INTO `lab_1`.`user` (`id`,`nickname`,`status_id`,`last_played`,`total_playtime`,`group_id`) VALUES (8,'Robert',2,'14.07.2021',266,10);
INSERT INTO `lab_1`.`user` (`id`,`nickname`,`status_id`,`last_played`,`total_playtime`,`group_id`) VALUES (9,'Eva',1,'25.11.2021',53,NULL);
INSERT INTO `lab_1`.`user` (`id`,`nickname`,`status_id`,`last_played`,`total_playtime`,`group_id`) VALUES (10,'Tom',3,'28.09.2021',1356,6);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
