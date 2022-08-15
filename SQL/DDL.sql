CREATE DATABASE `Fortunes`;

CREATE TABLE `Log` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Readings` longtext NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Date` timestamp NOT NULL,
  `Type` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
);
CREATE TABLE `Tarot` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `UpMeaning` longtext NOT NULL,
  `DownMeaning` longtext NOT NULL,
  `Love` longtext NOT NULL,
  `YesNo` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
);
CREATE TABLE `Tea` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Description` longtext NOT NULL,
  `Image` varchar(256) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
);
CREATE TABLE `LogTarot` (
  `LogsID` int NOT NULL,
  `TarotsID` int NOT NULL,
  PRIMARY KEY (`LogsID`,`TarotsID`),
  KEY `Taort_ID_idx` (`TarotsID`),
  KEY `Log_ID_idx` (`LogsID`),
  CONSTRAINT `Log_ID` FOREIGN KEY (`LogsID`) REFERENCES `Log` (`ID`),
  CONSTRAINT `Tarot_ID` FOREIGN KEY (`TarotsID`) REFERENCES `Tarot` (`ID`)
);
CREATE TABLE `LogTea` (
  `LogsID` int NOT NULL,
  `TeasID` int NOT NULL,
  PRIMARY KEY (`LogsID`,`TeasID`),
  KEY `Tea_ID_idx` (`TeasID`),
  CONSTRAINT `LogTea_ID` FOREIGN KEY (`LogsID`) REFERENCES `Log` (`ID`),
  CONSTRAINT `Tea_ID` FOREIGN KEY (`TeasID`) REFERENCES `Tea` (`ID`)
);