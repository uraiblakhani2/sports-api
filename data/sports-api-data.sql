SET NAMES utf8mb4;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';
SET @old_autocommit=@@autocommit;

USE sports-api_db;

--
-- Dumping data for table actor
--

SET AUTOCOMMIT=0;
INSERT INTO country (country_id, country_name, capital_name, continent_name, language, currency_name)
VALUES
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
COMMIT;

--
-- Dumping data for table actor
--

SET AUTOCOMMIT=0;
INSERT INTO sport VALUES
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
COMMIT;

--
-- Dumping data for table address
--

SET AUTOCOMMIT=0;
INSERT INTO league VALUES
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
COMMIT;

--
-- Dumping data for table category
--

SET AUTOCOMMIT=0;
INSERT INTO team VALUES
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
COMMIT;

--
-- Dumping data for table city
--

SET AUTOCOMMIT=0;
INSERT INTO match VALUES
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
COMMIT;

--
-- Dumping data for table country
--
SET AUTOCOMMIT=0;
INSERT INTO match_bet VALUES
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
COMMIT;


--
-- Dumping data for table customer
--

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
SET autocommit=@old_autocommit
