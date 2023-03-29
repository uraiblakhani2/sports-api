-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2023 at 05:47 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_name`, `capital_name`, `continent_name`, `language`, `currency_name`) VALUES
(1, 'United States', 'Washington, D.C.', 'North America', 'English', 'US Dollar'),
(2, 'Canada', 'Ottawa', 'North America', 'English, French', 'Canadian Dollar'),
(3, 'United Kingdom', 'London', 'Europe', 'English', 'British Pound Sterling'),
(4, 'Germany', 'Berlin', 'Europe', 'German', 'Euro'),
(5, 'France', 'Paris', 'Europe', 'French', 'Euro'),
(6, 'Australia', 'Canberra', 'Oceania', 'English', 'Australian Dollar'),
(7, 'Japan', 'Tokyo', 'Asia', 'Japanese', 'Japanese Yen'),
(8, 'China', 'Beijing', 'Asia', 'Mandarin', 'Chinese Yuan Renminbi'),
(9, 'Brazil', 'Brasília', 'South America', 'Portuguese', 'Brazilian Real'),
(10, 'South Africa', 'Pretoria', 'Africa', 'English, Afrikaans, Zulu, Xhosa, Southern Sotho', 'South African Rand');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `league`
--

INSERT INTO `league` (`league_id`, `sport_id`, `start_date`, `end_date`, `nbOfTeams`, `organization`, `league_name`) VALUES
(1, 1, '2023-03-22', '2024-03-22', 30, 'National Basketball Association', 'NBA'),
(2, 2, '2023-04-01', '2023-10-31', 30, 'Major League Baseball', 'MLB'),
(3, 3, '2023-07-22', '2023-08-07', 32, 'International Swimming Federation', 'World Aquatics Championships'),
(4, 4, '2023-08-01', '2023-08-15', 10, 'International Air Sports Federation', 'World Air Games'),
(5, 5, '2023-04-01', '2023-09-30', 10, 'International Cricket Council', 'ICC Cricket World Cup'),
(6, 6, '2023-06-14', '2023-07-15', 32, 'Fédération Internationale de Football Association', 'FIFA World Cup'),
(7, 7, '2023-07-01', '2023-07-23', 22, 'Union Cycliste Internationale', 'Tour de France'),
(8, 8, '2023-11-20', '2023-11-26', 16, 'International Table Tennis Federation', 'World Table Tennis Championships'),
(9, 9, '2023-02-06', '2023-02-19', 12, 'International Ski Federation', 'FIS Alpine World Ski Championships'),
(10, 10, '2023-08-25', '2023-09-03', 16, 'International Boxing Association', 'AIBA World Boxing Championships');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `match`
--

INSERT INTO `match` (`match_id`, `sport_id`, `country_id`, `league_id`, `home_team_id`, `away_team_id`, `home_score`, `away_score`, `match_date`, `stadium_name`) VALUES
(1, 1, 1, 1, 1, 2, 112, 98, '2023-03-24', 'Staples Center'),
(2, 1, 1, 1, 3, 4, 105, 96, '2023-03-24', 'TD Garden'),
(3, 1, 1, 1, 5, 6, 120, 110, '2023-03-24', 'Old Trafford'),
(4, 1, 1, 1, 7, 8, 95, 87, '2023-03-24', 'Allianz Arena'),
(5, 1, 1, 1, 9, 10, 103, 109, '2023-03-24', 'Sydney Cricket Ground'),
(6, 2, 1, 2, 1, 3, 4, 2, '2023-03-25', 'Rogers Centre'),
(7, 2, 1, 2, 2, 4, 6, 3, '2023-03-25', 'Yankee Stadium'),
(8, 2, 1, 2, 5, 6, 1, 0, '2023-03-25', 'Wembley Stadium'),
(9, 2, 1, 2, 7, 8, 3, 1, '2023-03-25', 'Olympiastadion Berlin'),
(10, 2, 1, 2, 9, 10, 2, 2, '2023-03-25', 'Stade de France');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `match_bet`
--

INSERT INTO `match_bet` (`match_bet_id`, `match_id`, `team_id`, `bet_amount`, `return_amount`) VALUES
(1, 1, 1, 200, 380),
(2, 1, 2, 150, 270),
(3, 2, 3, 500, 950),
(4, 2, 4, 300, 570),
(5, 3, 5, 400, 760),
(6, 3, 6, 250, 475),
(7, 4, 7, 100, 190),
(8, 4, 8, 350, 665),
(9, 5, 9, 450, 855),
(10, 5, 10, 200, 380);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`player_id`, `country_id`, `team_id`, `player_name`, `player_number`, `age`, `gender`, `height`, `weight`, `nbMatchPlayed`, `status`) VALUES
(1, 1, 1, 'LeBron James', 23, 38, 'Male', 80, 250, 10, 'active'),
(2, 1, 1, 'Anthony Davis', 3, 29, 'Male', 82, 253, 9, 'active'),
(3, 1, 2, 'Ja Morant', 12, 22, 'Male', 75, 174, 4, 'active'),
(4, 1, 3, 'Jayson Tatum', 0, 24, 'Male', 80, 210, 5, 'active'),
(5, 1, 4, 'Pascal Siakam', 43, 28, 'Male', 81, 230, 6, 'active'),
(6, 3, 5, 'Marcus Rashford', 10, 25, 'Male', 72, 154, 7, 'active');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ranking`
--

INSERT INTO `ranking` (`Ranking_id`, `team_id`, `league_id`, `games_won`, `games_lost`) VALUES
(1, 1, 1, 5, 4),
(2, 2, 1, 3, 6),
(3, 3, 1, 7, 2),
(4, 4, 2, 8, 1),
(5, 5, 3, 6, 4),
(6, 6, 4, 10, 0),
(7, 7, 4, 5, 5),
(8, 8, 5, 9, 1),
(9, 9, 6, 12, 2),
(10, 10, 7, 7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sport`
--

DROP TABLE IF EXISTS `sport`;
CREATE TABLE `sport` (
  `sport_id` int(11) NOT NULL,
  `sport_name` varchar(50) NOT NULL,
  `sport_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sport`
--

INSERT INTO `sport` (`sport_id`, `sport_name`, `sport_type`) VALUES
(1, 'Basketball', 'Ground sport'),
(2, 'Baseball', 'Ground sport'),
(3, 'Swimming', 'Water sport'),
(4, 'Flying Plane', 'Air sport'),
(5, 'Cricket', 'Ground sport'),
(6, 'Soccer', 'Ground sport'),
(7, 'Cycling', 'Ground sport'),
(8, 'Table Tennis', 'Indoor sport'),
(9, 'Skiing', 'Winter sport'),
(10, 'Boxing', 'Combat sport');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`team_id`, `country_id`, `team_name`, `manager_name`, `ceo_name`, `team_court_name`, `team_color`, `team_sponsor`, `team_coach`) VALUES
(1, 1, 'Los Angeles Lakers', 'Magic Johnson', 'Jeanie Buss', 'Staples Center', 'Yellow and Purple', 'Nike', 'Frank Vogel'),
(2, 1, 'Memphis Grizzlies', 'Zach Kleiman', 'Robert J. Pera', 'FedExForum', 'Navy and Light Blue', 'Nike', 'Taylor Jenkins'),
(3, 1, 'Boston Celtics', 'Danny Ainge', 'Wyc Grousbeck', 'TD Garden', 'Green and White', 'Nike', 'Ime Udoka'),
(4, 2, 'Toronto Raptors', 'Masai Ujiri', 'Larry Tanenbaum', 'Scotiabank Arena', 'Red and Black', 'Nike', 'Nick Nurse'),
(5, 3, 'Manchester United', 'Ed Woodward', 'Joel Glazer', 'Old Trafford', 'Red and White', 'Adidas', 'Ole Gunnar Solskjær'),
(6, 4, 'Bayern Munich', 'Oliver Kahn', 'Herbert Hainer', 'Allianz Arena', 'Red and White', 'Adidas', 'Julian Nagelsmann'),
(7, 4, 'Borussia Dortmund', 'Hans-Joachim Watzke', 'Reinhard Rauball', 'Signal Iduna Park', 'Yellow and Black', 'Puma', 'Marco Rose'),
(8, 5, 'Paris Saint-Germain', 'Nasser Al-Khelaifi', 'Tamim bin Hamad Al Thani', 'Parc des Princes', 'Blue and Red', 'Nike', 'Mauricio Pochettino'),
(9, 6, 'Sydney Swans', 'Tom Harley', 'Andrew Pridham', 'Sydney Cricket Ground', 'Red and White', 'Puma', 'John Longmire'),
(10, 7, 'Yomiuri Giants', 'Kazuo Kuriyama', 'Yoshinobu Takahashi', 'Tokyo Dome', 'Orange and Black', 'Mizuno', 'Tatsunori Hara');

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
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `league`
--
ALTER TABLE `league`
  MODIFY `league_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `match`
--
ALTER TABLE `match`
  MODIFY `match_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `match_bet`
--
ALTER TABLE `match_bet`
  MODIFY `match_bet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `player_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ranking`
--
ALTER TABLE `ranking`
  MODIFY `Ranking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sport`
--
ALTER TABLE `sport`
  MODIFY `sport_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
