-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2023 at 06:12 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sports-api`
--
CREATE DATABASE IF NOT EXISTS `sports-api` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sports-api`;

-- --------------------------------------------------------

--
-- Table structure for table `convertor`
--

DROP TABLE IF EXISTS `convertor`;
CREATE TABLE `convertor` (
  `convertor_id int` int(11) NOT NULL,
  `country_id` varchar(50) NOT NULL,
  `currency` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(50) NOT NULL,
  `capital_name` varchar(50) NOT NULL,
  `continent_name` varchar(50) NOT NULL,
  `language` varchar(50) NOT NULL,
  `currency_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `league`
--

DROP TABLE IF EXISTS `league`;
CREATE TABLE `league` (
  `league_id` int(11) NOT NULL,
  `sport_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `nbOfTeams` int(11) NOT NULL,
  `organization` varchar(50) NOT NULL,
  `league_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `match`
--

DROP TABLE IF EXISTS `match`;
CREATE TABLE `match` (
  `match_id` int(11) NOT NULL,
  `sport_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `league_id` int(11) NOT NULL,
  `home_team_id` int(11) NOT NULL,
  `away_team_id` int(11) NOT NULL,
  `home_score` int(11) NOT NULL,
  `away_score` int(11) NOT NULL,
  `match_date` date NOT NULL,
  `stadium_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `match_bet`
--

DROP TABLE IF EXISTS `match_bet`;
CREATE TABLE `match_bet` (
  `match_bet_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `bet_amount` double NOT NULL,
  `return_amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
CREATE TABLE `player` (
  `player_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `player_name` varchar(50) NOT NULL,
  `player_number` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `height` double NOT NULL,
  `weight` double NOT NULL,
  `nbMatchPlayed` int(11) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ranking`
--

DROP TABLE IF EXISTS `ranking`;
CREATE TABLE `ranking` (
  `Ranking_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `league_id` int(11) NOT NULL,
  `games_won` int(11) NOT NULL,
  `games_lost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sport`
--

DROP TABLE IF EXISTS `sport`;
CREATE TABLE `sport` (
  `sport_id` int(11) NOT NULL,
  `sport_name` varchar(50) NOT NULL,
  `sport_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `team_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `team_name` varchar(50) NOT NULL,
  `manager_name` varchar(50) NOT NULL,
  `ceo_name` varchar(50) NOT NULL,
  `team_court_name` varchar(50) NOT NULL,
  `team_color` varchar(50) NOT NULL,
  `team_sponsor` varchar(50) NOT NULL,
  `team_coach` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `league`
--
ALTER TABLE `league`
  ADD PRIMARY KEY (`league_id`),
  ADD KEY `league_to_sport` (`sport_id`);

--
-- Indexes for table `match`
--
ALTER TABLE `match`
  ADD PRIMARY KEY (`match_id`),
  ADD KEY `match_to_sport` (`sport_id`),
  ADD KEY `match_to_country` (`country_id`),
  ADD KEY `match_to_league` (`league_id`),
  ADD KEY `match_to_away_team` (`away_team_id`),
  ADD KEY `match_to_home_team` (`home_team_id`);

--
-- Indexes for table `match_bet`
--
ALTER TABLE `match_bet`
  ADD PRIMARY KEY (`match_bet_id`),
  ADD KEY `match_bet_to_match` (`match_id`),
  ADD KEY `match_bet_to_team` (`team_id`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `player_to_country` (`country_id`),
  ADD KEY `player_to_team` (`team_id`);

--
-- Indexes for table `ranking`
--
ALTER TABLE `ranking`
  ADD PRIMARY KEY (`Ranking_id`),
  ADD KEY `ranking_to_team` (`team_id`),
  ADD KEY `ranking_to_league` (`league_id`);

--
-- Indexes for table `sport`
--
ALTER TABLE `sport`
  ADD PRIMARY KEY (`sport_id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`team_id`),
  ADD KEY `team_to_country` (`country_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `league`
--
ALTER TABLE `league`
  MODIFY `league_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `match`
--
ALTER TABLE `match`
  MODIFY `match_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `match_bet`
--
ALTER TABLE `match_bet`
  MODIFY `match_bet_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `player_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ranking`
--
ALTER TABLE `ranking`
  MODIFY `Ranking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sport`
--
ALTER TABLE `sport`
  MODIFY `sport_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `league`
--
ALTER TABLE `league`
  ADD CONSTRAINT `league_to_sport` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`sport_id`);

--
-- Constraints for table `match`
--
ALTER TABLE `match`
  ADD CONSTRAINT `match_to_away_team` FOREIGN KEY (`away_team_id`) REFERENCES `team` (`team_id`),
  ADD CONSTRAINT `match_to_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`),
  ADD CONSTRAINT `match_to_home_team` FOREIGN KEY (`home_team_id`) REFERENCES `team` (`team_id`),
  ADD CONSTRAINT `match_to_league` FOREIGN KEY (`league_id`) REFERENCES `league` (`league_id`),
  ADD CONSTRAINT `match_to_sport` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`sport_id`);

--
-- Constraints for table `match_bet`
--
ALTER TABLE `match_bet`
  ADD CONSTRAINT `match_bet_to_match` FOREIGN KEY (`match_id`) REFERENCES `match` (`match_id`),
  ADD CONSTRAINT `match_bet_to_team` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`);

--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `player_to_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`),
  ADD CONSTRAINT `player_to_team` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`);

--
-- Constraints for table `ranking`
--
ALTER TABLE `ranking`
  ADD CONSTRAINT `ranking_to_league` FOREIGN KEY (`league_id`) REFERENCES `league` (`league_id`),
  ADD CONSTRAINT `ranking_to_team` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`);

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `team_to_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
