CREATE DATABASE  IF NOT EXISTS `FantasyLeague-Test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `FantasyLeague-Test`;
-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: FantasyLeague-Test
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `City`
--

DROP TABLE IF EXISTS `City`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `City` (
  `CityId` int(11) NOT NULL AUTO_INCREMENT,
  `CityName` varchar(100) NOT NULL,
  PRIMARY KEY (`CityId`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DeviceType`
--

DROP TABLE IF EXISTS `DeviceType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeviceType` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Event`
--

DROP TABLE IF EXISTS `Event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RealGameId` int(11) NOT NULL,
  `RealTeamId` int(11) NOT NULL,
  `PlayerId` int(11) NOT NULL,
  `EventTypeId` int(11) NOT NULL,
  `EventId` int(20) NOT NULL,
  `Time` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Event_RealGame_idx` (`RealGameId`),
  KEY `FK_Event_EventType_idx` (`EventTypeId`),
  KEY `FK_Event_Player_idx` (`PlayerId`),
  KEY `FK_Event_RealTeam_idx` (`RealTeamId`),
  CONSTRAINT `FK_Event_EventType` FOREIGN KEY (`EventTypeId`) REFERENCES `EventType` (`EventTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Event_Player` FOREIGN KEY (`PlayerId`) REFERENCES `Player` (`PlayerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Event_RealGame` FOREIGN KEY (`RealGameId`) REFERENCES `RealGame` (`RealGameId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Event_RealTeam` FOREIGN KEY (`RealTeamId`) REFERENCES `RealTeam` (`RealTeamId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=173792 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EventType`
--

DROP TABLE IF EXISTS `EventType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EventType` (
  `EventTypeId` int(11) NOT NULL,
  `EventTypeName` varchar(150) NOT NULL,
  PRIMARY KEY (`EventTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FantasyLeague`
--

DROP TABLE IF EXISTS `FantasyLeague`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FantasyLeague` (
  `FantasyLeagueId` int(11) NOT NULL,
  `LeagueCode` varchar(30) NOT NULL,
  `LeagueName` varchar(150) NOT NULL,
  `CountryCode` varchar(30) NOT NULL,
  `RealLeagueId` int(11) NOT NULL,
  PRIMARY KEY (`FantasyLeagueId`),
  KEY `FK_FantasyLeague_RealLeague` (`RealLeagueId`),
  CONSTRAINT `FK_FantasyLeague_RealLeague` FOREIGN KEY (`RealLeagueId`) REFERENCES `RealLeague` (`RealLeagueId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FantasyLeagueSimulationTime`
--

DROP TABLE IF EXISTS `FantasyLeagueSimulationTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FantasyLeagueSimulationTime` (
  `Id` int(11) NOT NULL,
  `DefaultDateTime` datetime(6) NOT NULL,
  `UpdatedTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GameStatus`
--

DROP TABLE IF EXISTS `GameStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GameStatus` (
  `GameStatusId` int(11) NOT NULL,
  `GameStatusDescription` varchar(150) NOT NULL,
  PRIMARY KEY (`GameStatusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Gamer`
--

DROP TABLE IF EXISTS `Gamer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Gamer` (
  `GamerId` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(150) DEFAULT NULL,
  `Password` varchar(150) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Surname` varchar(100) DEFAULT NULL,
  `Phone` varchar(30) DEFAULT NULL,
  `PhotoURL` longtext DEFAULT NULL,
  `FacebookId` varchar(50) DEFAULT NULL,
  `GoogleId` varchar(50) DEFAULT NULL,
  `DeviceId` varchar(100) NOT NULL,
  `DeviceTypeId` int(11) NOT NULL,
  `DeviceModelName` varchar(250) NOT NULL,
  `CityId` int(11) NOT NULL,
  `RealTeamId` int(11) NOT NULL,
  `CreatedDate` datetime(6) NOT NULL,
  `FacebookToken` longtext DEFAULT NULL,
  `FacebookExpirationDate` datetime(6) DEFAULT NULL,
  `GoogleToken` longtext DEFAULT NULL,
  `GoogleExpirationDate` datetime(6) DEFAULT NULL,
  `Token` longtext DEFAULT NULL,
  `TwitterId` varchar(50) DEFAULT NULL,
  `TwitterToken` longtext DEFAULT NULL,
  `TwitterTokenSecret` longtext DEFAULT NULL,
  `TwitterExpirationDate` datetime(6) DEFAULT NULL,
  `Birthday` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`GamerId`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  KEY `Gamer_Email_IDX` (`Email`),
  KEY `Gamer_DeviceModelName_IDX` (`DeviceModelName`),
  KEY `Gamer_DeviceId_IDX` (`DeviceId`),
  KEY `Gamer_DeviceType_FK` (`DeviceTypeId`),
  KEY `Gamer_City_FK` (`CityId`),
  KEY `Gamer_RealTeam_FK` (`RealTeamId`),
  CONSTRAINT `Gamer_City_FK` FOREIGN KEY (`CityId`) REFERENCES `City` (`CityId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Gamer_DeviceType_FK` FOREIGN KEY (`DeviceTypeId`) REFERENCES `DeviceType` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Gamer_RealTeam_FK` FOREIGN KEY (`RealTeamId`) REFERENCES `RealTeam` (`RealTeamId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1083 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GamerGift`
--

DROP TABLE IF EXISTS `GamerGift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GamerGift` (
  `GamerId` int(11) NOT NULL,
  `GiftId` int(11) NOT NULL,
  PRIMARY KEY (`GamerId`,`GiftId`),
  KEY `FK_GamerGift_Gift_idx` (`GiftId`),
  CONSTRAINT `FK_GamerGift_Gamer` FOREIGN KEY (`GamerId`) REFERENCES `Gamer` (`GamerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_GamerGift_Gift` FOREIGN KEY (`GiftId`) REFERENCES `Gift` (`GiftId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GamerPeriod`
--

DROP TABLE IF EXISTS `GamerPeriod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GamerPeriod` (
  `GamerId` int(11) NOT NULL,
  `PeriodId` int(11) NOT NULL,
  `GamerTotalBudget` decimal(29,4) NOT NULL,
  `GamerUsedBudget` decimal(29,4) NOT NULL,
  `OnlineMinuteSpent` int(11) NOT NULL,
  PRIMARY KEY (`GamerId`,`PeriodId`),
  KEY `GamerPeriod_GamerId_IDX` (`GamerId`,`PeriodId`),
  KEY `GamerPeriod_Period_FK` (`PeriodId`),
  CONSTRAINT `GamerPeriod_Gamer_FK` FOREIGN KEY (`GamerId`) REFERENCES `Gamer` (`GamerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `GamerPeriod_Period_FK` FOREIGN KEY (`PeriodId`) REFERENCES `Period` (`PeriodId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GamerTeam`
--

DROP TABLE IF EXISTS `GamerTeam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GamerTeam` (
  `TeamId` int(11) NOT NULL AUTO_INCREMENT,
  `TeamBudget` decimal(19,4) NOT NULL,
  `TeamName` varchar(50) NOT NULL,
  `GamerId` int(11) NOT NULL,
  `FantasyLeagueId` int(11) NOT NULL,
  PRIMARY KEY (`TeamId`),
  UNIQUE KEY `TeamName_UNIQUE` (`TeamName`),
  KEY `GamerTeam_GamerId_IDX` (`GamerId`),
  KEY `GamerTeam_FantasyLeague_FK` (`FantasyLeagueId`),
  CONSTRAINT `GamerTeam_FantasyLeague_FK` FOREIGN KEY (`FantasyLeagueId`) REFERENCES `FantasyLeague` (`FantasyLeagueId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `GamerTeam_Gamer_FK` FOREIGN KEY (`GamerId`) REFERENCES `Gamer` (`GamerId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Gift`
--

DROP TABLE IF EXISTS `Gift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Gift` (
  `GiftId` int(11) NOT NULL AUTO_INCREMENT,
  `GiftTypeId` int(11) NOT NULL,
  `GiftName` varchar(150) NOT NULL,
  `GiftDescription` longtext NOT NULL,
  `GiftImagePath` longtext NOT NULL,
  `GiftImageOrientationVertical` tinyint(1) NOT NULL,
  PRIMARY KEY (`GiftId`),
  KEY `FK_Gift_GiftType_idx` (`GiftTypeId`),
  CONSTRAINT `FK_Gift_GiftType` FOREIGN KEY (`GiftTypeId`) REFERENCES `GiftType` (`GiftTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GiftType`
--

DROP TABLE IF EXISTS `GiftType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GiftType` (
  `GiftTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `GiftTypeName` varchar(200) NOT NULL,
  PRIMARY KEY (`GiftTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LineUpType`
--

DROP TABLE IF EXISTS `LineUpType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LineUpType` (
  `LineUpTypeId` int(11) NOT NULL,
  `NumberOfDefence` int(11) NOT NULL,
  `NumberOfMidfield` int(11) NOT NULL,
  `NumberOfForward` int(11) NOT NULL,
  `LineUpName` varchar(20) NOT NULL,
  PRIMARY KEY (`LineUpTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Log`
--

DROP TABLE IF EXISTS `Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `text` longtext COLLATE armscii8_bin NOT NULL,
  `owner` varchar(256) COLLATE armscii8_bin NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Log_LogType_idx` (`type`),
  CONSTRAINT `fk_Log_LogType` FOREIGN KEY (`type`) REFERENCES `LogType` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5673 DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LogType`
--

DROP TABLE IF EXISTS `LogType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LogType` (
  `id` int(11) NOT NULL,
  `text` varchar(32) COLLATE armscii8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Opta_XmlInput`
--

DROP TABLE IF EXISTS `Opta_XmlInput`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Opta_XmlInput` (
  `XmlInputId` int(11) NOT NULL AUTO_INCREMENT,
  `FeedType` int(11) DEFAULT NULL,
  `FeedParameters` varchar(540) DEFAULT NULL,
  `DefaultFileName` varchar(300) DEFAULT NULL,
  `MimeType` varchar(100) DEFAULT NULL,
  `Encoding` varchar(50) DEFAULT NULL,
  `ContentLength` double DEFAULT NULL,
  `MetaId` int(19) DEFAULT NULL,
  `FeedId` int(19) DEFAULT NULL,
  `DateCreated` datetime(6) DEFAULT NULL,
  `ServerDateCreated` datetime(6) DEFAULT NULL,
  `ServerTimestamp` datetime(6) DEFAULT NULL,
  `TransferComplated` tinyint(1) DEFAULT NULL,
  `TransferCompletedDate` datetime(6) DEFAULT NULL,
  `TransferBeginDate` datetime(6) DEFAULT NULL,
  `TransferError` longtext DEFAULT NULL,
  `Content` longtext DEFAULT NULL,
  `Processed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`XmlInputId`),
  KEY `XmlIndex` (`FeedType`)
) ENGINE=InnoDB AUTO_INCREMENT=22166 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Opta_XmlInput_Raw`
--

DROP TABLE IF EXISTS `Opta_XmlInput_Raw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Opta_XmlInput_Raw` (
  `XmlInputId` int(11) NOT NULL AUTO_INCREMENT,
  `FeedType` int(11) DEFAULT NULL,
  `FeedParameters` varchar(540) DEFAULT NULL,
  `DefaultFileName` varchar(300) DEFAULT NULL,
  `MimeType` varchar(100) DEFAULT NULL,
  `Encoding` varchar(50) DEFAULT NULL,
  `ContentLength` double DEFAULT NULL,
  `MetaId` int(11) DEFAULT NULL,
  `FeedId` int(11) DEFAULT NULL,
  `DateCreated` datetime(6) DEFAULT NULL,
  `TransferComplated` tinyint(1) DEFAULT NULL,
  `TransferCompletedDate` datetime(6) DEFAULT NULL,
  `TransferBeginDate` datetime(6) DEFAULT NULL,
  `TransferError` longtext DEFAULT NULL,
  `Content` longtext DEFAULT NULL,
  PRIMARY KEY (`XmlInputId`),
  KEY `XmlIndex` (`FeedType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Period`
--

DROP TABLE IF EXISTS `Period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Period` (
  `PeriodId` int(11) NOT NULL AUTO_INCREMENT,
  `StartDate` datetime(6) NOT NULL,
  `EndDate` datetime(6) NOT NULL,
  `SeasonId` int(11) NOT NULL,
  `MatchDay` int(11) NOT NULL,
  PRIMARY KEY (`PeriodId`),
  KEY `FK_Period_Season` (`SeasonId`),
  CONSTRAINT `FK_Period_Season` FOREIGN KEY (`SeasonId`) REFERENCES `Season` (`SeasonId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PeriodFantasyStanding`
--

DROP TABLE IF EXISTS `PeriodFantasyStanding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PeriodFantasyStanding` (
  `FantasyStandingId` int(11) NOT NULL,
  `GamerTeamId` int(11) NOT NULL,
  `PeriodId` int(11) NOT NULL,
  `TotalPosition` int(11) NOT NULL,
  `TotalPoint` int(11) NOT NULL,
  `PeriodPoint` int(11) NOT NULL,
  `PeriodPosition` int(11) NOT NULL,
  PRIMARY KEY (`FantasyStandingId`),
  KEY `PeriodFantasyStanding_GamerTeam_FK` (`GamerTeamId`),
  KEY `FK_PeriodFantasyStanding_Period` (`PeriodId`),
  CONSTRAINT `FK_PeriodFantasyStanding_Period` FOREIGN KEY (`PeriodId`) REFERENCES `Period` (`PeriodId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PeriodFantasyStanding_GamerTeam_FK` FOREIGN KEY (`GamerTeamId`) REFERENCES `GamerTeam` (`TeamId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PeriodicRealStanding`
--

DROP TABLE IF EXISTS `PeriodicRealStanding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PeriodicRealStanding` (
  `PeriodicRealStandingId` int(11) NOT NULL AUTO_INCREMENT,
  `SeasonId` int(11) NOT NULL,
  `RealTeamId` int(11) NOT NULL,
  `PeriodId` int(11) NOT NULL,
  `Position` int(11) NOT NULL,
  `Played` int(11) NOT NULL,
  `Won` int(11) NOT NULL,
  `Drawn` int(11) NOT NULL,
  `Lost` int(11) NOT NULL,
  `Point` int(11) NOT NULL,
  `For` int(11) NOT NULL,
  `Against` int(11) NOT NULL,
  `Diff` int(11) NOT NULL,
  PRIMARY KEY (`PeriodicRealStandingId`),
  KEY `FK_PeriodicRealStanding_RealTeam` (`RealTeamId`),
  KEY `FK_PeriodicRealStanding_Season_idx` (`SeasonId`),
  KEY `FK_PeriodicRealStanding_Period_idx1` (`PeriodId`),
  CONSTRAINT `FK_PeriodicRealStanding_Period` FOREIGN KEY (`PeriodId`) REFERENCES `Period` (`PeriodId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_PeriodicRealStanding_RealTeam` FOREIGN KEY (`RealTeamId`) REFERENCES `RealTeam` (`RealTeamId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_PeriodicRealStanding_Season` FOREIGN KEY (`SeasonId`) REFERENCES `Season` (`SeasonId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13516 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PeriodicSquadPlayer`
--

DROP TABLE IF EXISTS `PeriodicSquadPlayer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PeriodicSquadPlayer` (
  `LineId` int(11) NOT NULL AUTO_INCREMENT,
  `SquadId` int(11) NOT NULL,
  `PlayerId` int(11) NOT NULL,
  `SquadPositionId` int(11) NOT NULL,
  `RealTeamId` int(11) NOT NULL,
  `IsCaptain` tinyint(1) NOT NULL,
  PRIMARY KEY (`LineId`),
  UNIQUE KEY `UNIQUE_SquadId_SquadPositionId` (`SquadId`,`SquadPositionId`),
  UNIQUE KEY `UNIQUE_SquadId_PlayerId` (`SquadId`,`PlayerId`),
  KEY `FK_PeriodicSquadPlayer_Position` (`SquadPositionId`),
  KEY `FK_PeriodicSquadPlayer_Squad` (`SquadId`),
  KEY `PeriodicSquadPlayer_RealTeam_FK` (`RealTeamId`),
  KEY `FK_PeriodicSquadPlayer_Player` (`PlayerId`),
  CONSTRAINT `FK_PeriodicSquadPlayer_Player` FOREIGN KEY (`PlayerId`) REFERENCES `Player` (`PlayerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_PeriodicSquadPlayer_Squad` FOREIGN KEY (`SquadId`) REFERENCES `Squad` (`SquadId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PeriodicSquadPlayer_RealTeam_FK` FOREIGN KEY (`RealTeamId`) REFERENCES `RealTeam` (`RealTeamId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13691 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Player`
--

DROP TABLE IF EXISTS `Player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Player` (
  `PlayerId` int(11) NOT NULL,
  `PlayerUId` varchar(30) DEFAULT NULL,
  `PositionId` int(11) NOT NULL,
  `RealPositionId` int(11) NOT NULL,
  `RealPositionSide` varchar(100) NOT NULL,
  `FullName` varchar(200) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `KnownName` varchar(200) DEFAULT NULL,
  `TransferPrice` decimal(29,4) DEFAULT NULL,
  `BirthDate` datetime(6) NOT NULL,
  `Weight` double NOT NULL,
  `Height` double NOT NULL,
  `JerseyNum` int(11) NOT NULL,
  `JoinDate` datetime(6) NOT NULL,
  `Country` varchar(200) DEFAULT NULL,
  `PreferredFoot` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PlayerId`),
  KEY `FK_Player_Position` (`PositionId`),
  CONSTRAINT `FK_Player_Position` FOREIGN KEY (`PositionId`) REFERENCES `Position` (`PositionId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PlayerState`
--

DROP TABLE IF EXISTS `PlayerState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlayerState` (
  `PlayerId` int(11) NOT NULL,
  `Week` int(11) NOT NULL,
  `State` int(11) NOT NULL,
  PRIMARY KEY (`PlayerId`,`Week`),
  KEY `fk_PlayerState_1_idx` (`PlayerId`),
  KEY `fk_PlayerState_Period_idx` (`Week`),
  KEY `fk_PlayerState_PlayerStateDefinition_idx` (`State`),
  CONSTRAINT `fk_PlayerState_Period` FOREIGN KEY (`Week`) REFERENCES `Period` (`PeriodId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlayerState_Player` FOREIGN KEY (`PlayerId`) REFERENCES `Player` (`PlayerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlayerState_PlayerStateDefinition` FOREIGN KEY (`State`) REFERENCES `PlayerStateDefinition` (`PlayerStateId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PlayerStateDefinition`
--

DROP TABLE IF EXISTS `PlayerStateDefinition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlayerStateDefinition` (
  `PlayerStateId` int(11) NOT NULL AUTO_INCREMENT,
  `StateDefinition` varchar(45) COLLATE utf16_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`PlayerStateId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Position`
--

DROP TABLE IF EXISTS `Position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Position` (
  `PositionId` int(11) NOT NULL AUTO_INCREMENT,
  `PositionName` varchar(200) NOT NULL,
  PRIMARY KEY (`PositionId`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RealGame`
--

DROP TABLE IF EXISTS `RealGame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RealGame` (
  `RealGameId` int(11) NOT NULL,
  `RealGameUId` varchar(30) NOT NULL,
  `PeriodId` int(11) DEFAULT NULL,
  `HomeRealTeamId` int(11) NOT NULL,
  `AwayRealTeamId` int(11) NOT NULL,
  `GameDate` datetime(6) NOT NULL,
  `Venue` varchar(200) DEFAULT NULL,
  `City` varchar(200) DEFAULT NULL,
  `HomeTeamFinalScore` int(11) DEFAULT NULL,
  `AwayTeamFinalScore` int(11) DEFAULT NULL,
  `Attandance` int(11) DEFAULT NULL,
  `StateId` int(11) DEFAULT NULL,
  `Processed` tinyint(1) NOT NULL,
  PRIMARY KEY (`RealGameId`),
  KEY `FK_RealGame_RealTeam` (`HomeRealTeamId`),
  KEY `FK_RealGame_RealTeam1` (`AwayRealTeamId`),
  KEY `FK_RealGame_Period` (`PeriodId`),
  KEY `FK_RealGame_State_idx` (`StateId`),
  CONSTRAINT `FK_RealGame_Period` FOREIGN KEY (`PeriodId`) REFERENCES `Period` (`PeriodId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_RealGame_RealGameState` FOREIGN KEY (`StateId`) REFERENCES `RealGameState` (`StateId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_RealGame_RealTeam` FOREIGN KEY (`HomeRealTeamId`) REFERENCES `RealTeam` (`RealTeamId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_RealGame_RealTeam1` FOREIGN KEY (`AwayRealTeamId`) REFERENCES `RealTeam` (`RealTeamId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RealGameState`
--

DROP TABLE IF EXISTS `RealGameState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RealGameState` (
  `StateId` int(11) NOT NULL,
  `StateDescription` varchar(50) NOT NULL,
  PRIMARY KEY (`StateId`),
  UNIQUE KEY `StateId_UNIQUE` (`StateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RealLeague`
--

DROP TABLE IF EXISTS `RealLeague`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RealLeague` (
  `RealLeagueId` int(11) NOT NULL,
  `LeagueCode` varchar(30) NOT NULL,
  `LeagueName` varchar(200) NOT NULL,
  `CountryCode` varchar(20) NOT NULL,
  PRIMARY KEY (`RealLeagueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RealTeam`
--

DROP TABLE IF EXISTS `RealTeam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RealTeam` (
  `RealTeamId` int(11) NOT NULL,
  `Uid` varchar(20) NOT NULL,
  `RealLeagueId` int(11) NOT NULL,
  `TeamName` varchar(150) NOT NULL,
  PRIMARY KEY (`RealTeamId`),
  KEY `FK_RealTeam_RealLeague` (`RealLeagueId`),
  CONSTRAINT `FK_RealTeam_RealLeague` FOREIGN KEY (`RealLeagueId`) REFERENCES `RealLeague` (`RealLeagueId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RealTeamSquadSeasonal`
--

DROP TABLE IF EXISTS `RealTeamSquadSeasonal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RealTeamSquadSeasonal` (
  `LineId` int(11) NOT NULL AUTO_INCREMENT,
  `SeasonId` int(11) NOT NULL,
  `RealTeamId` int(11) NOT NULL,
  `PlayerId` int(11) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `JoinDate` datetime(6) DEFAULT NULL,
  `FinishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`LineId`),
  KEY `FK_RealTeamSquadSeasonal_Season` (`SeasonId`),
  KEY `FK_RealTeamSquadSeasonal_RealTeam` (`RealTeamId`),
  KEY `FK_RealTeamSquadSeasonal_Player_idx` (`PlayerId`),
  CONSTRAINT `FK_RealTeamSquadSeasonal_Player` FOREIGN KEY (`PlayerId`) REFERENCES `Player` (`PlayerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_RealTeamSquadSeasonal_RealTeam` FOREIGN KEY (`RealTeamId`) REFERENCES `RealTeam` (`RealTeamId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_RealTeamSquadSeasonal_Season` FOREIGN KEY (`SeasonId`) REFERENCES `Season` (`SeasonId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=715 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Rule`
--

DROP TABLE IF EXISTS `Rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rule` (
  `RuleId` int(11) NOT NULL,
  `RuleName` varchar(200) NOT NULL,
  `IsPlayerRule` tinyint(1) NOT NULL,
  PRIMARY KEY (`RuleId`),
  UNIQUE KEY `RuleId_UNIQUE` (`RuleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RuleScope`
--

DROP TABLE IF EXISTS `RuleScope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RuleScope` (
  `RuleScopeId` int(11) NOT NULL AUTO_INCREMENT,
  `RuleId` int(11) NOT NULL,
  `PositionId` int(11) NOT NULL,
  PRIMARY KEY (`RuleScopeId`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RuleStatisticType`
--

DROP TABLE IF EXISTS `RuleStatisticType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RuleStatisticType` (
  `RuleStatisticTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `RuleId` int(11) NOT NULL,
  `StatisticTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`RuleStatisticTypeId`),
  KEY `FK_RuleStatistic_Rule_idx` (`RuleId`),
  KEY `FK_RuleStatisticType_StatisticType_idx` (`StatisticTypeId`),
  CONSTRAINT `FK_RuleStatisticType_Rule` FOREIGN KEY (`RuleId`) REFERENCES `Rule` (`RuleId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_RuleStatisticType_StatisticType` FOREIGN KEY (`StatisticTypeId`) REFERENCES `StatisticType` (`StatisticTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Season`
--

DROP TABLE IF EXISTS `Season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Season` (
  `SeasonId` int(11) NOT NULL AUTO_INCREMENT,
  `FantasyLeagueId` int(11) DEFAULT NULL,
  `RealLeagueId` int(11) DEFAULT NULL,
  `SeasonName` varchar(200) NOT NULL,
  `OptaSeasonsId` varchar(30) DEFAULT NULL,
  `StartDate` datetime(6) NOT NULL,
  `EndDate` datetime(6) NOT NULL,
  PRIMARY KEY (`SeasonId`),
  KEY `FK_Season_FantasyLeague` (`FantasyLeagueId`),
  KEY `FK_Season_RealLeague` (`RealLeagueId`),
  CONSTRAINT `FK_Season_FantasyLeague` FOREIGN KEY (`FantasyLeagueId`) REFERENCES `FantasyLeague` (`FantasyLeagueId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Season_RealLeague` FOREIGN KEY (`RealLeagueId`) REFERENCES `RealLeague` (`RealLeagueId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Squad`
--

DROP TABLE IF EXISTS `Squad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Squad` (
  `SquadId` int(11) NOT NULL AUTO_INCREMENT,
  `GamerTeamId` int(11) DEFAULT NULL,
  `LineUpTypeId` int(11) NOT NULL,
  `PeriodId` int(11) NOT NULL,
  PRIMARY KEY (`SquadId`),
  KEY `FK_Squad_LineUpType` (`LineUpTypeId`),
  KEY `Squad_GamerTeam_FK` (`GamerTeamId`),
  KEY `FK_Squad_Period` (`PeriodId`),
  CONSTRAINT `FK_Squad_LineUpType` FOREIGN KEY (`LineUpTypeId`) REFERENCES `LineUpType` (`LineUpTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Squad_Period` FOREIGN KEY (`PeriodId`) REFERENCES `Period` (`PeriodId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Squad_GamerTeam_FK` FOREIGN KEY (`GamerTeamId`) REFERENCES `GamerTeam` (`TeamId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=693 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Statistic`
--

DROP TABLE IF EXISTS `Statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Statistic` (
  `StatisticId` int(11) NOT NULL AUTO_INCREMENT,
  `StatisticTypeId` int(11) NOT NULL,
  `PlayerId` int(11) NOT NULL,
  `PeriodId` int(11) NOT NULL,
  `GameId` int(11) NOT NULL,
  `Value` decimal(18,2) NOT NULL,
  PRIMARY KEY (`StatisticId`),
  KEY `StatTypePlayerGame` (`StatisticTypeId`,`PlayerId`,`GameId`),
  KEY `FK_Statistic_Period` (`PeriodId`),
  KEY `FK_Statistic_RealGame` (`GameId`),
  KEY `FK_Statistic_Player` (`PlayerId`),
  CONSTRAINT `FK_Statistic_Period` FOREIGN KEY (`PeriodId`) REFERENCES `Period` (`PeriodId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Statistic_Player` FOREIGN KEY (`PlayerId`) REFERENCES `Player` (`PlayerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Statistic_RealGame` FOREIGN KEY (`GameId`) REFERENCES `RealGame` (`RealGameId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Statistic_StatisticType` FOREIGN KEY (`StatisticTypeId`) REFERENCES `StatisticType` (`StatisticTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=211772 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StatisticGainPointByRule`
--

DROP TABLE IF EXISTS `StatisticGainPointByRule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StatisticGainPointByRule` (
  `LineId` int(11) NOT NULL AUTO_INCREMENT,
  `StatisticId` int(11) NOT NULL,
  `RuleId` int(11) NOT NULL,
  `GainPoint` int(11) NOT NULL,
  PRIMARY KEY (`LineId`),
  KEY `FK_StatisticGainPointByRule_Statistic` (`StatisticId`),
  KEY `FK_StatisticGainPointByRule_Rule_idx` (`RuleId`),
  CONSTRAINT `FK_StatisticGainPointByRule_Rule` FOREIGN KEY (`RuleId`) REFERENCES `Rule` (`RuleId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_StatisticGainPointByRule_Statistic` FOREIGN KEY (`StatisticId`) REFERENCES `Statistic` (`StatisticId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16868 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StatisticType`
--

DROP TABLE IF EXISTS `StatisticType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StatisticType` (
  `StatisticTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `StatisticTypeName` varchar(200) NOT NULL,
  `StatisticTypeNameTR` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`StatisticTypeId`),
  KEY `StatisticTypeName` (`StatisticTypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TeamGainPointByRule`
--

DROP TABLE IF EXISTS `TeamGainPointByRule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TeamGainPointByRule` (
  `LineId` int(11) NOT NULL AUTO_INCREMENT,
  `GamerTeamId` int(11) NOT NULL,
  `PeriodId` int(11) NOT NULL,
  `RuleId` int(11) NOT NULL,
  `GainPoint` int(11) NOT NULL,
  PRIMARY KEY (`LineId`),
  KEY `FK_GamerTeam_idx` (`GamerTeamId`),
  KEY `FK_TeamGainPoint_GamerTeam_idx` (`GamerTeamId`),
  KEY `FK_TeamGainPoint_Rule_idx` (`RuleId`),
  KEY `FK_TeamGainPointByRule_Period_idx` (`PeriodId`),
  CONSTRAINT `FK_TeamGainPointByRule_GamerTeam` FOREIGN KEY (`GamerTeamId`) REFERENCES `GamerTeam` (`TeamId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TeamGainPointByRule_Period` FOREIGN KEY (`PeriodId`) REFERENCES `Period` (`PeriodId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TeamGainPointByRule_Rule` FOREIGN KEY (`RuleId`) REFERENCES `Rule` (`RuleId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sysdiagrams`
--

DROP TABLE IF EXISTS `sysdiagrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysdiagrams` (
  `name` varchar(160) NOT NULL,
  `principal_id` int(11) NOT NULL,
  `diagram_id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `definition` longblob DEFAULT NULL,
  PRIMARY KEY (`diagram_id`),
  UNIQUE KEY `UK_principal_name` (`principal_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'FantasyLeague-Test'
--

--
-- Dumping routines for database 'FantasyLeague-Test'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-11 11:51:19
