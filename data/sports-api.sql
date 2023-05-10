-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2023 at 06:57 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

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

-- --------------------------------------------------------

--
-- Table structure for table `convertor`
--

CREATE TABLE `convertor` (
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(50) NOT NULL,
  `currency_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `convertor`
--

INSERT INTO `convertor` (`currency_id`, `currency_code`, `currency_name`) VALUES
(1, '1inch', '1inch Network'),
(2, 'aave', 'Aave'),
(3, 'ada', 'Cardano'),
(4, 'aed', 'United Arab Emirates Dirham'),
(5, 'afn', 'Afghan afghani'),
(6, 'algo', 'Algorand'),
(7, 'all', 'Albanian lek'),
(8, 'amd', 'Armenian dram'),
(9, 'amp', 'Synereo'),
(10, 'ang', 'Netherlands Antillean Guilder'),
(11, 'aoa', 'Angolan kwanza'),
(12, 'ar', 'Arweave'),
(13, 'ars', 'Argentine peso'),
(14, 'atom', 'Atomic Coin'),
(15, 'aud', 'Australian dollar'),
(16, 'avax', 'Avalanche'),
(17, 'awg', 'Aruban florin'),
(18, 'axs', 'AXS'),
(19, 'azn', 'Azerbaijani manat'),
(20, 'bake', 'BakeryToken'),
(21, 'bam', 'Bosnia-Herzegovina Convertible Mark'),
(22, 'bat', 'Basic Attention Token'),
(23, 'bbd', 'Bajan dollar'),
(24, 'bch', 'Bitcoin Cash'),
(25, 'bdt', 'Bangladeshi taka'),
(26, 'bgn', 'Bulgarian lev'),
(27, 'bhd', 'Bahraini dinar'),
(28, 'bif', 'Burundian Franc'),
(29, 'bmd', 'Bermudan dollar'),
(30, 'bnb', 'Binance Coin'),
(31, 'bnd', 'Brunei dollar'),
(32, 'bob', 'Bolivian boliviano'),
(33, 'brl', 'Brazilian real'),
(34, 'bsd', 'Bahamian dollar'),
(35, 'bsv', 'Bitcoin SV'),
(36, 'bsw', 'Biswap'),
(37, 'btc', 'Bitcoin'),
(38, 'btcb', 'Bitcoin BEP2'),
(39, 'btg', 'Bitcoin Gold'),
(40, 'btn', 'Bhutan currency'),
(41, 'busd', 'Binance USD'),
(42, 'bwp', 'Botswanan Pula'),
(43, 'byn', 'New Belarusian Ruble'),
(44, 'byr', 'Belarusian Ruble'),
(45, 'bzd', 'Belize dollar'),
(46, 'cad', 'Canadian dollar'),
(47, 'cake', 'PancakeSwap'),
(48, 'cdf', 'Congolese franc'),
(49, 'celo', 'Celo'),
(50, 'chf', 'Swiss franc'),
(51, 'chz', 'Chiliz'),
(52, 'clp', 'Chilean peso'),
(53, 'cny', 'Chinese Yuan'),
(54, 'comp', 'Compound Coin'),
(55, 'cop', 'Colombian peso'),
(56, 'crc', 'Costa Rican Colón'),
(57, 'cro', 'Crypto.com Chain Token'),
(58, 'crv', 'Cravy'),
(59, 'cuc', 'Cuban peso'),
(60, 'cup', 'Cuban Peso'),
(61, 'cve', 'Cape Verdean escudo'),
(62, 'cvx', 'Convex Finance'),
(63, 'czk', 'Czech koruna'),
(64, 'dai', 'Dai'),
(65, 'dash', 'Dash'),
(66, 'dcr', 'Decred'),
(67, 'dfi', 'DfiStarter'),
(68, 'djf', 'Djiboutian franc'),
(69, 'dkk', 'Danish krone'),
(70, 'doge', 'Dogecoin'),
(71, 'dop', 'Dominican peso'),
(72, 'dot', 'Dotcoin'),
(73, 'dzd', 'Algerian dinar'),
(74, 'egld', 'Elrond'),
(75, 'egp', 'Egyptian pound'),
(76, 'enj', 'Enjin Coin'),
(77, 'eos', 'EOS'),
(78, 'ern', 'Eritrean nakfa'),
(79, 'etb', 'Ethiopian birr'),
(80, 'etc', 'Ethereum Classic'),
(81, 'eth', 'Ether'),
(82, 'eur', 'Euro'),
(83, 'fei', 'Fei USD'),
(84, 'fil', 'FileCoin'),
(85, 'fjd', 'Fijian dollar'),
(86, 'fkp', 'Falkland Islands pound'),
(87, 'flow', 'Flow'),
(88, 'frax', 'Frax'),
(89, 'ftm', 'Fantom'),
(90, 'ftt', 'FarmaTrust'),
(91, 'gala', 'Gala'),
(92, 'gbp', 'Pound sterling'),
(93, 'gel', 'Georgian lari'),
(94, 'ggp', 'GGPro'),
(95, 'ghs', 'Ghanaian cedi'),
(96, 'gip', 'Gibraltar pound'),
(97, 'gmd', 'Gambian dalasi'),
(98, 'gnf', 'Guinean franc'),
(99, 'gno', 'Gnosis'),
(100, 'grt', 'Golden Ratio Token'),
(101, 'gt', 'GateToken'),
(102, 'gtq', 'Guatemalan quetzal'),
(103, 'gyd', 'Guyanaese Dollar'),
(104, 'hbar', 'Hedera'),
(105, 'hkd', 'Hong Kong dollar'),
(106, 'hnl', 'Honduran lempira'),
(107, 'hnt', 'Helium'),
(108, 'hot', 'Hydro Protocol'),
(109, 'hrk', 'Croatian kuna'),
(110, 'ht', 'Huobi Token'),
(111, 'htg', 'Haitian gourde'),
(112, 'huf', 'Hungarian forint'),
(113, 'icp', 'Internet Computer'),
(114, 'idr', 'Indonesian rupiah'),
(115, 'ils', 'Israeli New Shekel'),
(116, 'imp', 'CoinIMP'),
(117, 'inj', 'Injective'),
(118, 'inr', 'Indian rupee'),
(119, 'iqd', 'Iraqi dinar'),
(120, 'irr', 'Iranian rial'),
(121, 'isk', 'Icelandic króna'),
(122, 'jep', 'Jersey Pound'),
(123, 'jmd', 'Jamaican dollar'),
(124, 'jod', 'Jordanian dinar'),
(125, 'jpy', 'Japanese yen'),
(126, 'kas', ''),
(127, 'kava', 'Kava'),
(128, 'kcs', 'Kucoin'),
(129, 'kda', 'Kadena'),
(130, 'kes', 'Kenyan shilling'),
(131, 'kgs', 'Kyrgystani Som'),
(132, 'khr', 'Cambodian riel'),
(133, 'klay', 'Klaytn'),
(134, 'kmf', 'Comorian franc'),
(135, 'knc', 'Kyber Network'),
(136, 'kpw', 'North Korean won'),
(137, 'krw', 'South Korean won'),
(138, 'ksm', 'Kusama'),
(139, 'kwd', 'Kuwaiti dinar'),
(140, 'kyd', 'Cayman Islands dollar'),
(141, 'kzt', 'Kazakhstani tenge'),
(142, 'lak', 'Laotian Kip'),
(143, 'lbp', 'Lebanese pound'),
(144, 'leo', 'LEOcoin'),
(145, 'link', 'ChainLink'),
(146, 'lkr', 'Sri Lankan rupee'),
(147, 'lrc', 'Loopring'),
(148, 'lrd', 'Liberian dollar'),
(149, 'lsl', 'Lesotho loti'),
(150, 'ltc', 'Litecoin'),
(151, 'ltl', 'Lithuanian litas'),
(152, 'luna', 'Luna Coin'),
(153, 'lvl', 'Latvian lats'),
(154, 'lyd', 'Libyan dinar'),
(155, 'mad', 'Moroccan dirham'),
(156, 'mana', 'Decentraland'),
(157, 'matic', 'Polygon'),
(158, 'mdl', 'Moldovan leu'),
(159, 'mdl', 'Moldovan leu'),
(160, 'mga', 'Malagasy ariary'),
(161, 'mina', 'Mina'),
(162, 'miota', 'IOTA'),
(163, 'mkd', 'Macedonian denar'),
(164, 'mkr', 'Maker'),
(165, 'mmk', 'Myanmar Kyat'),
(166, 'mnt', 'Mongolian tugrik'),
(167, 'mop', 'Macanese pataca'),
(168, 'mro', 'Mauritanian ouguiya'),
(169, 'mur', 'Mauritian rupee'),
(170, 'mvr', 'Maldivian rufiyaa'),
(171, 'mwk', 'Malawian kwacha'),
(172, 'mxn', 'Mexican peso'),
(173, 'myr', 'Malaysian ringgit'),
(174, 'mzn', 'Mozambican Metical'),
(175, 'nad', 'Namibian dollar'),
(176, 'near', 'NEAR Protocol'),
(177, 'neo', 'NEO'),
(178, 'nexo', 'NEXO'),
(179, 'ngn', 'Nigerian naira'),
(180, 'nio', 'Nicaraguan córdoba'),
(181, 'nok', 'Norwegian krone'),
(182, 'npr', 'Nepalese rupee'),
(183, 'nzd', 'New Zealand dollar'),
(184, 'okb', 'Okex'),
(185, 'omr', 'Omani rial'),
(186, 'one', 'Menlo One'),
(187, 'pab', 'Panamanian balboa'),
(188, 'paxg', 'PAX Gold'),
(189, 'pen', 'Sol'),
(190, 'pgk', 'Papua New Guinean kina'),
(191, 'php', 'Philippine peso'),
(192, 'pkr', 'Pakistani rupee'),
(193, 'pln', 'Poland złoty'),
(194, 'pyg', 'Paraguayan guarani'),
(195, 'qar', 'Qatari Rial'),
(196, 'qnt', 'Quant'),
(197, 'qtum', 'QTUM'),
(198, 'ron', 'Romanian leu'),
(199, 'rsd', 'Serbian dinar'),
(200, 'rub', 'Russian ruble'),
(201, 'rune', 'THORChain (ERC20)'),
(202, 'rwf', 'Rwandan Franc'),
(203, 'sand', 'BeachCoin'),
(204, 'sar', 'Saudi riyal'),
(205, 'sbd', 'Solomon Islands dollar'),
(206, 'scr', 'Seychellois rupee'),
(207, 'sdg', 'Sudanese pound'),
(208, 'sek', 'Swedish krona'),
(209, 'sgd', 'Singapore dollar'),
(210, 'shib', 'Shiba Inu'),
(211, 'shp', 'Saint Helena pound'),
(212, 'sle', ''),
(213, 'sll', 'Sierra Leonean leone'),
(214, 'sol', 'Sola'),
(215, 'sos', 'Somali shilling'),
(216, 'srd', 'Surinamese dollar'),
(217, 'std', 'São Tomé and Príncipe Dobra (pre-2018)'),
(218, 'stx', 'Stox'),
(219, 'svc', 'Salvadoran Colón'),
(220, 'syp', 'Syrian pound'),
(221, 'szl', 'Swazi lilangeni'),
(222, 'thb', 'Thai baht'),
(223, 'theta', 'Theta'),
(224, 'tjs', 'Tajikistani somoni'),
(225, 'tmt', 'Turkmenistani manat'),
(226, 'tnd', 'Tunisian dinar'),
(227, 'top', 'Tongan Paʻanga'),
(228, 'trx', 'TRON'),
(229, 'try', 'Turkish lira'),
(230, 'ttd', 'Trinidad & Tobago Dollar'),
(231, 'tusd', 'True USD'),
(232, 'twd', 'New Taiwan dollar'),
(233, 'tzs', 'Tanzanian shilling'),
(234, 'uah', 'Ukrainian hryvnia'),
(235, 'ugx', 'Ugandan shilling'),
(236, 'uni', 'Universe'),
(237, 'usd', 'United States dollar'),
(238, 'usdc', 'USD Coin'),
(239, 'usdp', 'USDP Stablecoin'),
(240, 'usdt', 'Tether'),
(241, 'uyu', 'Uruguayan peso'),
(242, 'uzs', 'Uzbekistani som'),
(243, 'vef', 'Sovereign Bolivar'),
(244, 'ves', ''),
(245, 'vet', 'Vechain'),
(246, 'vnd', 'Vietnamese dong'),
(247, 'vuv', 'Vanuatu vatu'),
(248, 'waves', 'Waves'),
(249, 'wbtc', 'Wrapped Bitcoin'),
(250, 'wemix', 'WEMIX'),
(251, 'wst', 'Samoan tala'),
(252, 'xaf', 'Central African CFA franc'),
(253, 'xag', 'Silver Ounce'),
(254, 'xau', 'XauCoin'),
(255, 'xcd', 'East Caribbean dollar'),
(256, 'xch', 'Chia'),
(257, 'xdc', 'XDC Network'),
(258, 'xdr', 'Special Drawing Rights'),
(259, 'xec', 'Eternal Coin'),
(260, 'xem', 'NEM'),
(261, 'xlm', 'Stellar'),
(262, 'xmr', 'Monero'),
(263, 'xof', 'West African CFA franc'),
(264, 'xpf', 'CFP franc'),
(265, 'xrp', 'XRP'),
(266, 'xtz', 'Tezos'),
(267, 'yer', 'Yemeni rial'),
(268, 'zar', 'South African rand'),
(269, 'zec', 'ZCash'),
(270, 'zil', 'Zilliqa'),
(271, 'zmk', 'Zambian kwacha'),
(272, 'zmw', 'Zambian Kwacha'),
(273, 'zwl', 'Zimbabwean Dollar');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

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
(10, 'South Africa', 'Pretoria', 'Africa', 'English, Afrikaans, Zulu, Xhosa, Southern Sotho', 'South African Rand'),
(12, 'United Arab Emirates', 'Abu Dhabi', 'Asia', 'Arabic, English', 'UAE Dirham'),
(13, 'Afghanistan', 'Kabul', 'Asia', 'Pashto, Dari', 'Afghan afghani'),
(14, 'Antigua and Barbuda', 'Saint John\'s', 'North America', 'English', 'Eastern Caribbean Dollar'),
(15, 'Anguilla', 'The Valley', 'North America', 'English', 'Eastern Caribbean Dollar'),
(16, 'Albania', 'Tirana', 'Europe', 'Albanian', 'Lek'),
(17, 'Armenia', 'Yerevan', 'Asia', 'Armenian', 'Armenian dram'),
(18, 'Angola', 'Luanda', 'Africa', 'Portuguese', 'Angolan kwanza'),
(19, 'Antarctica', 'N/A', 'Antarctica', 'N/A', 'N/A'),
(20, 'Argentina', 'Buenos Aires', 'South America', 'Spanish', 'Argentine peso'),
(21, 'American Samoa', 'Pago Pago', 'Oceania', 'Samoan, English', 'US Dollar'),
(22, 'Austria', 'Vienna', 'Europe', 'German', 'Euro'),
(23, 'Australia', 'Canberra', 'Oceania', 'English', 'Australian Dollar'),
(24, 'Aruba', 'Oranjestad', 'North America', 'Dutch, Papiamento, English, Spanish', 'Aruban florin'),
(25, 'Åland Islands', 'Mariehamn', 'Europe', 'Swedish', 'Euro'),
(26, 'Azerbaijan', 'Baku', 'Asia', 'Azerbaijani, Russian', 'Azerbaijani manat'),
(27, 'Bosnia and Herzegovina', 'Sarajevo', 'Europe', 'Bosnian, Croatian, Serbian', 'Convertible mark'),
(28, 'Barbados', 'Bridgetown', 'North America', 'English', 'Barbadian dollar'),
(29, 'Bangladesh', 'Dhaka', 'Asia', 'Bengali', 'Bangladeshi taka'),
(30, 'Belgium', 'Brussels', 'Europe', 'Dutch, French, German', 'Euro'),
(31, 'Burkina Faso', 'Ouagadougou', 'Africa', 'French', 'West African CFA franc'),
(32, 'Bulgaria', 'Sofia', 'Europe', 'Bulgarian', 'Bulgarian lev'),
(33, 'Bahrain', 'Manama', 'Asia', 'Arabic', 'Bahraini dinar'),
(34, 'Burundi', 'Gitega', 'Africa', 'Kirundi, French', 'Burundian franc'),
(35, 'Benin', 'Porto-Novo', 'Africa', 'French', 'West African CFA franc'),
(36, 'Saint Barthélemy', 'Gustavia', 'North America', 'French', 'Euro'),
(37, 'Bermuda', 'Hamilton', 'North America', 'English', 'Bermudian dollar'),
(38, 'Brunei Darussalam', 'Bandar Seri Begawan', 'Asia', 'Malay, English', 'Brunei dollar'),
(39, 'Bolivia', 'La Paz, Sucre', 'South America', 'Spanish, Quechua, Aymara', 'Bolivian boliviano'),
(40, 'Caribbean Netherlands', 'Kralendijk', 'North America', 'Dutch, Papiamento', 'US Dollar'),
(41, 'Brazil', 'Brasília', 'South America', 'Portuguese', 'Brazilian real'),
(42, 'Bahamas', 'Nassau', 'North America', 'English', 'Bahamian dollar'),
(43, 'Bhutan', 'Thimphu', 'Asia', 'Dzongkha, English', 'Bhutanese ngultrum'),
(44, 'Bouvet Island', 'N/A', 'Antarctica', 'N/A', 'N/A'),
(45, 'Botswana', 'Gaborone', 'Africa', 'English, Tswana', 'Botswana pula'),
(46, 'Belarus', 'Minsk', 'Europe', 'Belarusian, Russian', 'Belarusian ruble'),
(47, 'Belize', 'Belmopan', 'North America', 'English', 'Belize dollar'),
(48, 'Canada', 'Ottawa', 'North America', 'English, French', 'Canadian dollar'),
(49, 'Cocos (Keeling) Islands', 'West Island', 'Asia', 'Malay, English', 'Australian dollar'),
(50, 'Democratic Republic of Congo', 'Kinshasa', 'Africa', 'French, Lingala, Swahili', 'Congolese franc'),
(51, 'Central African Republic', 'Bangui', 'Africa', 'French, Sango', 'Central African CFA franc'),
(52, 'Congo', 'Brazzaville', 'Africa', 'French', 'Central African CFA franc'),
(53, 'Switzerland', 'Bern', 'Europe', 'German, French, Italian, Romansh', 'Swiss franc'),
(54, 'Ivory Coast', 'Yamoussoukro', 'Africa', 'French', 'West African CFA franc'),
(55, 'Cook Islands', 'Avarua', 'Oceania', 'English, Cook Islands Maori', 'Cook Islands dollar'),
(56, 'Chile', 'Santiago', 'South America', 'Spanish', 'Chilean peso'),
(57, 'Cameroon', 'Yaoundé', 'Africa', 'French, English', 'Central African CFA franc'),
(58, 'China', 'Beijing', 'Asia', 'Mandarin', 'Chinese yuan renminbi'),
(59, 'Colombia', 'Bogotá', 'South America', 'Spanish', 'Colombian peso'),
(60, 'Costa Rica', 'San José', 'North America', 'Spanish', 'Costa Rican colón'),
(61, 'Cuba', 'Havana', 'North America', 'Spanish', 'Cuban peso'),
(62, 'Cape Verde', 'Praia', 'Africa', 'Portuguese, Cape Verdean Creole', 'Cape Verdean escudo'),
(63, 'Curaçao', 'Willemstad', 'North America', 'Dutch, Papiamento', 'Netherlands Antillean guilder'),
(64, 'Christmas Island', 'Flying Fish Cove', 'Asia', 'English', 'Australian dollar'),
(65, 'Cyprus', 'Nicosia', 'Europe', 'Greek, Turkish, English', 'Euro'),
(66, 'Czech Republic', 'Prague', 'Europe', 'Czech', 'Czech koruna'),
(67, 'Germany', 'Berlin', 'Europe', 'German', 'Euro'),
(68, 'Djibouti', 'Djibouti', 'Africa', 'French, Arabic', 'Djiboutian franc'),
(69, 'Denmark', 'Copenhagen', 'Europe', 'Danish', 'Danish krone'),
(70, 'Dominica', 'Roseau', 'North America', 'English', 'Eastern Caribbean Dollar'),
(71, 'Dominican Republic', 'Santo Domingo', 'North America', 'Spanish', 'Dominican peso'),
(72, 'Algeria', 'Algiers', 'Africa', 'Arabic, French, Berber dialects', 'Algerian dinar'),
(73, 'Ecuador', 'Quito', 'South America', 'Spanish', 'US dollar'),
(74, 'Estonia', 'Tallinn', 'Europe', 'Estonian', 'Euro'),
(75, 'Egypt', 'Cairo', 'Africa', 'Arabic', 'Egyptian pound'),
(76, 'Western Sahara', 'El Aaiún', 'Africa', 'Arabic', 'Moroccan dirham'),
(77, 'England', 'London', 'Europe', 'English', 'British pound sterling'),
(78, 'Eritrea', 'Asmara', 'Africa', 'Tigrinya, Arabic, English, Tigre, Saho, Bilen', 'Eritrean nakfa'),
(79, 'Spain', 'Madrid', 'Europe', 'Spanish', 'Euro'),
(80, 'Ethiopia', 'Addis Ababa', 'Africa', 'Amharic, Oromo, Tigrinya, Somali', 'Ethiopian birr'),
(81, 'Europe', 'N/A', 'Europe', 'N/A', 'Euro'),
(82, 'Finland', 'Helsinki', 'Europe', 'Finnish, Swedish', 'Euro'),
(83, 'Fiji', 'Suva', 'Oceania', 'English, Fijian, Fiji Hindi', 'Fijian dollar'),
(84, 'Falkland Islands', 'Stanley', 'South America', 'English', 'Falkland Islands pound'),
(85, 'Micronesia, Federated States of', 'Palikir', 'Oceania', 'English', 'US dollar'),
(86, 'Faroe Islands', 'Tórshavn', 'Europe', 'Faroese, Danish', 'Faroese króna'),
(87, 'France', 'Paris', 'Europe', 'French', 'Euro'),
(88, 'Gabon', 'Libreville', 'Africa', 'French', 'Central African CFA franc'),
(89, 'United Kingdom', 'London', 'Europe', 'English', 'British pound sterling'),
(90, 'Georgia', 'Tbilisi', 'Asia', 'Georgian', 'Georgian lari'),
(91, 'French Guiana', 'Cayenne', 'South America', 'French', 'Euro'),
(92, 'Guernsey', 'St. Peter Port', 'Europe', 'English', 'Guernsey pound'),
(93, 'Ghana', 'Accra', 'Africa', 'English', 'Ghanaian cedi'),
(94, 'Gibraltar', 'Gibraltar', 'Europe', 'English', 'Gibraltar pound'),
(95, 'Greenland', 'Nuuk', 'North America', 'Greenlandic, Danish', 'Danish krone'),
(96, 'Gambia', 'Banjul', 'Africa', 'English', 'Gambian dalasi'),
(97, 'Guinea', 'Conakry', 'Africa', 'French', 'Guinean franc'),
(98, 'Guadeloupe', 'Basse-Terre', 'North America', 'French', 'Euro'),
(99, 'Equatorial Guinea', 'Malabo', 'Africa', 'Spanish, French', 'Central African CFA franc'),
(100, 'Greece', 'Athens', 'Europe', 'Greek', 'Euro'),
(101, 'South Georgia', 'King Edward Point', 'Antarctica', 'English', 'Pound sterling'),
(102, 'Guatemala', 'Guatemala City', 'North America', 'Spanish', 'Guatemalan quetzal'),
(103, 'Guam', 'Hagåtña', 'Oceania', 'English, Chamorro, Japanese', 'US dollar'),
(104, 'Guinea-Bissau', 'Bissau', 'Africa', 'Portuguese, Creole', 'West African CFA franc'),
(105, 'Guyana', 'Georgetown', 'South America', 'English', 'Guyanese dollar'),
(106, 'Hong Kong', 'Hong Kong', 'Asia', 'Cantonese, English', 'Hong Kong dollar'),
(107, 'Heard and McDonald Islands', 'N/A', 'Antarctica', 'English', 'Australian dollar'),
(108, 'Honduras', 'Tegucigalpa', 'North America', 'Spanish', 'Honduran lempira'),
(109, 'Croatia', 'Zagreb', 'Europe', 'Croatian', 'Croatian kuna'),
(110, 'Haiti', 'Port-au-Prince', 'North America', 'Haitian Creole, French', 'Haitian gourde'),
(111, 'Hungary', 'Budapest', 'Europe', 'Hungarian', 'Hungarian forint'),
(112, 'International', 'N/A', 'Worldwide', 'N/A', 'N/A'),
(113, 'Indonesia', 'Jakarta', 'Asia', 'Indonesian', 'Indonesian rupiah'),
(114, 'Ireland', 'Dublin', 'Europe', 'Irish, English', 'Euro'),
(115, 'Israel', 'Jerusalem', 'Asia', 'Hebrew, Arabic', 'Israeli new shekel'),
(116, 'Isle of Man', 'Douglas', 'Europe', 'English, Manx Gaelic', 'Manx pound'),
(117, 'India', 'New Delhi', 'Asia', 'Hindi, English', 'Indian rupee'),
(118, 'British Indian Ocean Territory', 'Diego Garcia', 'Asia', 'English', 'US dollar'),
(119, 'Iraq', 'Baghdad', 'Asia', 'Arabic, Kurdish', 'Iraqi dinar'),
(120, 'Iran', 'Tehran', 'Asia', 'Persian', 'Iranian rial'),
(121, 'Iceland', 'Reykjavik', 'Europe', 'Icelandic', 'Icelandic króna'),
(122, 'Italy', 'Rome', 'Europe', 'Italian', 'Euro'),
(123, 'Jersey', 'Saint Helier', 'Europe', 'English', 'Jersey pound'),
(124, 'Jamaica', 'Kingston', 'North America', 'English', 'Jamaican dollar'),
(125, 'Jordan', 'Amman', 'Asia', 'Arabic', 'Jordanian dinar'),
(126, 'Japan', 'Tokyo', 'Asia', 'Japanese', 'Japanese yen'),
(127, 'Kenya', 'Nairobi', 'Africa', 'Swahili, English', 'Kenyan shilling'),
(128, 'Kyrgyzstan', 'Bishkek', 'Asia', 'Kyrgyz, Russian', 'Kyrgyzstani som'),
(129, 'Cambodia', 'Phnom Penh', 'Asia', 'Khmer', 'Cambodian riel'),
(130, 'Kiribati', 'South Tarawa', 'Oceania', 'English, Kiribati', 'Australian dollar'),
(131, 'Comoros', 'Moroni', 'Africa', 'Comorian, Arabic, French', 'Comorian franc'),
(132, 'Saint Kitts and Nevis', 'Basseterre', 'North America', 'English', 'Eastern Caribbean dollar'),
(133, 'North Korea', 'Pyongyang', 'Asia', 'Korean', 'North Korean won'),
(134, 'South Korea', 'Seoul', 'Asia', 'Korean', 'South Korean won'),
(135, 'Kuwait', 'Kuwait City', 'Asia', 'Arabic', 'Kuwaiti dinar'),
(136, 'Cayman Islands', 'George Town', 'North America', 'English', 'Cayman Islands dollar'),
(137, 'Kazakhstan', 'Nur-Sultan', 'Asia', 'Kazakh, Russian', 'Kazakhstani tenge'),
(138, 'Lao People\'s Democratic Republic', 'Vientiane', 'Asia', 'Lao', 'Lao kip'),
(139, 'Lebanon', 'Beirut', 'Asia', 'Arabic, French, English', 'Lebanese pound'),
(140, 'Saint Lucia', 'Castries', 'North America', 'English', 'Eastern Caribbean dollar'),
(141, 'Liechtenstein', 'Vaduz', 'Europe', 'German', 'Swiss franc'),
(142, 'Sri Lanka', 'Colombo', 'Asia', 'Sinhala, Tamil, English', 'Sri Lankan rupee'),
(143, 'Liberia', 'Monrovia', 'Africa', 'English', 'Liberian dollar'),
(144, 'Lesotho', 'Maseru', 'Africa', 'Sesotho, English', 'Lesotho loti'),
(145, 'Lithuania', 'Vilnius', 'Europe', 'Lithuanian, Russian', 'Euro'),
(146, 'Luxembourg', 'Luxembourg', 'Europe', 'Luxembourgish, French, German', 'Euro'),
(147, 'Latvia', 'Riga', 'Europe', 'Latvian, Russian', 'Euro'),
(148, 'Libya', 'Tripoli', 'Africa', 'Arabic', 'Libyan dinar'),
(149, 'Morocco', 'Rabat', 'Africa', 'Arabic, Berber', 'Moroccan dirham'),
(150, 'Monaco', 'Monaco-Ville', 'Europe', 'French, English', 'Euro'),
(151, 'Moldova', 'Chisinau', 'Europe', 'Moldovan, Romanian, Russian', 'Moldovan leu'),
(152, 'Montenegro', 'Podgorica', 'Europe', 'Montenegrin, Serbian', 'Euro'),
(153, 'Saint-Martin (France)', 'Marigot', 'North America', 'French, Dutch, English', 'Euro'),
(154, 'Madagascar', 'Antananarivo', 'Africa', 'Malagasy, French', 'Malagasy ariary'),
(155, 'Marshall Islands', 'Majuro', 'Oceania', 'Marshallese, English', 'US dollar'),
(156, 'Macedonia', 'Skopje', 'Europe', 'Macedonian', 'Macedonian denar'),
(157, 'Mali', 'Bamako', 'Africa', 'French', 'West African CFA franc'),
(158, 'Myanmar', 'Naypyidaw', 'Asia', 'Burmese, English', 'Burmese kyat'),
(159, 'Mongolia', 'Ulaanbaatar', 'Asia', 'Mongolian', 'Mongolian tögrög'),
(160, 'Macau', 'Macau', 'Asia', 'Cantonese, Portuguese', 'Macanese pataca'),
(161, 'Northern Mariana Islands', 'Saipan', 'Oceania', 'English, Chamorro, Carolinian', 'US dollar'),
(162, 'Martinique', 'Fort-de-France', 'North America', 'French', 'Euro'),
(163, 'Mauritania', 'Nouakchott', 'Africa', 'Arabic, French, Pulaar', 'Mauritanian ouguiya'),
(164, 'Montserrat', 'Plymouth', 'North America', 'English', 'Eastern Caribbean dollar'),
(165, 'Malta', 'Valletta', 'Europe', 'Maltese, English', 'Euro'),
(166, 'Mauritius', 'Port Louis', 'Africa', 'English, French', 'Mauritian rupee'),
(167, 'Maldives', 'Malé', 'Asia', 'Dhivehi', 'Maldivian rufiyaa'),
(168, 'Malawi', 'Lilongwe', 'Africa', 'English, Chichewa', 'Malawian kwacha'),
(169, 'Mexico', 'Mexico City', 'North America', 'Spanish', 'Mexican peso'),
(170, 'Malaysia', 'Kuala Lumpur', 'Asia', 'Malay', 'Malaysian ringgit'),
(171, 'Mozambique', 'Maputo', 'Africa', 'Portuguese', 'Mozambican metical'),
(172, 'Northern Ireland', 'Belfast', 'Europe', 'English', 'Pound sterling'),
(173, 'Namibia', 'Windhoek', 'Africa', 'English', 'Namibian dollar'),
(174, 'New Caledonia', 'Nouméa', 'Oceania', 'French', 'CFP franc'),
(175, 'Niger', 'Niamey', 'Africa', 'French', 'West African CFA franc'),
(176, 'Norfolk Island', 'Kingston', 'Oceania', 'English', 'Australian dollar'),
(177, 'Nigeria', 'Abuja', 'Africa', 'English', 'Nigerian naira'),
(178, 'Nicaragua', 'Managua', 'North America', 'Spanish', 'Nicaraguan córdoba'),
(179, 'The Netherlands', 'Amsterdam', 'Europe', 'Dutch', 'Euro'),
(180, 'Norway', 'Oslo', 'Europe', 'Norwegian, Sami', 'Norwegian krone'),
(181, 'Nepal', 'Kathmandu', 'Asia', 'Nepali, English, Maithili, Bhojpuri, Tharu', 'Nepalese rupee'),
(182, 'Nauru', 'Yaren District', 'Oceania', 'Nauruan, English', 'Australian dollar'),
(183, 'Niue', 'Alofi', 'Oceania', 'Niuean, English', 'New Zealand dollar'),
(184, 'New Zealand', 'Wellington', 'Oceania', 'English, Māori, New Zealand Sign Language', 'New Zealand dollar'),
(185, 'Oman', 'Muscat', 'Asia', 'Arabic', 'Omani rial'),
(186, 'Panama', 'Panama City', 'North America', 'Spanish', 'Panamanian balboa'),
(187, 'Peru', 'Lima', 'South America', 'Spanish, Quechua, Aymara', 'Peruvian sol'),
(188, 'French Polynesia', 'Papeete', 'Oceania', 'French, Tahitian', 'CFP franc'),
(189, 'Papua New Guinea', 'Port Moresby', 'Oceania', 'Tok Pisin, English, Hiri Motu, Kuman, Melpa', 'Papua New Guinean kina'),
(190, 'Philippines', 'Manila', 'Asia', 'Filipino, English', 'Philippine peso'),
(191, 'Pakistan', 'Islamabad', 'Asia', 'Urdu', 'Pakistani rupee'),
(192, 'Poland', 'Warsaw', 'Europe', 'Polish', 'Polish złoty'),
(193, 'St. Pierre and Miquelon', 'Saint-Pierre', 'North America', 'French', 'Euro'),
(194, 'Pitcairn', 'Adamstown', 'Oceania', 'English', 'New Zealand dollar'),
(195, 'Puerto Rico', 'San Juan', 'North America', 'Spanish, English', 'US dollar'),
(196, 'Palestine, State of', 'Ramallah', 'Asia', 'Arabic, Hebrew', 'Israeli new shekel'),
(197, 'Portugal', 'Lisbon', 'Europe', 'Portuguese', 'Euro'),
(198, 'Palau', 'Ngerulmud', 'Oceania', 'Palauan, English', 'US dollar'),
(199, 'Paraguay', 'Asunción', 'South America', 'Spanish, Guarani', 'Paraguayan guaraní'),
(200, 'Qatar', 'Doha', 'Asia', 'Arabic', 'Qatari riyal'),
(201, 'Réunion', 'Saint-Denis', 'Africa', 'French', 'Euro'),
(202, 'Romania', 'Bucharest', 'Europe', 'Romanian', 'Romanian leu'),
(203, 'Serbia', 'Belgrade', 'Europe', 'Serbian', 'Serbian dinar'),
(204, 'Russian Federation', 'Moscow', 'Europe/Asia', 'Russian', 'Russian ruble'),
(205, 'Rwanda', 'Kigali', 'Africa', 'Kinyarwanda, English, French', 'Rwandan franc'),
(206, 'Scotland', 'Edinburgh', 'Europe', 'English, Scots, Scottish Gaelic', 'Pound sterling'),
(207, 'Saudi Arabia', 'Riyadh', 'Asia', 'Arabic', 'Saudi riyal'),
(208, 'Solomon Islands', 'Honiara', 'Oceania', 'English', 'Solomon Islands dollar'),
(209, 'Seychelles', 'Victoria', 'Africa', 'Seychellois Creole, English, French', 'Seychellois rupee'),
(210, 'Sudan', 'Khartoum', 'Africa', 'Arabic, English', 'Sudanese pound'),
(211, 'Sweden', 'Stockholm', 'Europe', 'Swedish', 'Swedish krona'),
(212, 'Singapore', 'Singapore', 'Asia', 'English, Malay, Chinese, Tamil', 'Singapore dollar'),
(213, 'St. Helena', 'Jamestown', 'Africa', 'English', 'Saint Helena pound'),
(214, 'Slovenia', 'Ljubljana', 'Europe', 'Slovenian', 'Euro'),
(215, 'Svalbard and Jan Mayen Islands', 'Longyearbyen', 'Europe/Arctic', 'Norwegian', 'Norwegian krone'),
(216, 'Slovakia', 'Bratislava', 'Europe', 'Slovak', 'Euro'),
(217, 'Sierra Leone', 'Freetown', 'Africa', 'English', 'Sierra Leonean leone'),
(218, 'San Marino', 'San Marino', 'Europe', 'Italian', 'Euro'),
(219, 'Senegal', 'Dakar', 'Africa', 'French', 'West African CFA franc'),
(220, 'Somalia', 'Mogadishu', 'Africa', 'Somali, Arabic', 'Somali shilling'),
(221, 'Suriname', 'Paramaribo', 'South America', 'Dutch', 'Surinamese dollar'),
(222, 'South Sudan', 'Juba', 'Africa', 'English', 'South Sudanese pound'),
(223, 'Sao Tome and Principe', 'São Tomé', 'Africa', 'Portuguese', 'São Tomé and Príncipe dobra'),
(224, 'El Salvador', 'San Salvador', 'North America', 'Spanish', 'United States dollar'),
(225, 'Sint Maarten (Dutch part)', 'Philipsburg', 'North America', 'Dutch, English', 'Netherlands Antillean guilder'),
(226, 'Syria', 'Damascus', 'Asia', 'Arabic', 'Syrian pound'),
(227, 'Swaziland', 'Lobamba', 'Africa', 'Swati, English', 'Swazi lilangeni'),
(228, 'Turks and Caicos Islands', 'Cockburn Town', 'North America', 'English', 'United States dollar'),
(229, 'Chad', 'N\'Djamena', 'Africa', 'French, Arabic', 'Central African CFA franc'),
(230, 'French Southern Territories', 'Port-aux-Français', 'Antarctica', 'French', 'Euro'),
(231, 'Togo', 'Lomé', 'Africa', 'French', 'West African CFA franc'),
(232, 'Thailand', 'Bangkok', 'Asia', 'Thai', 'Thai baht'),
(233, 'Tajikistan', 'Dushanbe', 'Asia', 'Tajik, Russian', 'Tajikistani somoni'),
(234, 'Tokelau', 'Nukunonu', 'Oceania', 'Tokelauan, English', 'New Zealand dollar'),
(235, 'Timor-Leste', 'Dili', 'Asia', 'Tetum, Portuguese', 'United States dollar'),
(236, 'Turkmenistan', 'Ashgabat', 'Asia', 'Turkmen', 'Turkmenistan manat'),
(237, '', '', '', '', ''),
(238, 'Tunisia', 'Tunis', 'Africa', 'Arabic, French', 'Tunisian dinar'),
(239, 'Tonga', 'Nuku\'alofa', 'Oceania', 'Tongan, English', 'Tongan paʻanga'),
(240, 'Turkey', 'Ankara', 'Asia/Europe', 'Turkish', 'Turkish lira'),
(241, 'Trinidad and Tobago', 'Port of Spain', 'North America', 'English', 'Trinidad and Tobago dollar'),
(242, 'Tuvalu', 'Funafuti', 'Oceania', 'Tuvaluan, English', 'Tuvaluan dollar'),
(243, 'Taiwan', 'Taipei', 'Asia', 'Mandarin', 'New Taiwan dollar'),
(244, 'Tanzania', 'Dodoma', 'Africa', 'Swahili, English', 'Tanzanian shilling'),
(245, 'Ukraine', 'Kyiv (Kiev)', 'Europe', 'Ukrainian, Russian', 'Ukrainian hryvnia'),
(246, 'Uganda', 'Kampala', 'Africa', 'English, Swahili', 'Ugandan shilling'),
(247, 'United States Minor Outlying Islands', 'N/A', 'Oceania', 'English', 'United States dollar'),
(248, 'United States', 'Washington, D.C.', 'North America', 'English', 'United States dollar'),
(249, 'Uruguay', 'Montevideo', 'South America', 'Spanish', 'Uruguayan peso'),
(250, 'Uzbekistan', 'Tashkent', 'Asia', 'Uzbek, Russian', 'Uzbekistani soʻm'),
(251, 'Vatican', 'Vatican City', 'Europe', 'Italian, Latin', 'Euro'),
(252, 'Saint Vincent and the Grenadines', 'Kingstown', 'North America', 'English', 'Eastern Caribbean dollar'),
(253, 'Venezuela', 'Caracas', 'South America', 'Spanish', 'Venezuelan bolívar'),
(254, 'British Virgin Islands', 'Road Town', 'North America', 'English', 'United States dollar'),
(255, 'U.S. Virgin Islands', 'Charlotte Amalie', 'North America', 'English', 'United States dollar'),
(256, 'Vietnam', 'Hanoi', 'Asia', 'Vietnamese', 'Vietnamese đồng'),
(257, 'Vanuatu', 'Port Vila', 'Oceania', 'Bislama, English, French', 'Vanuatu vatu'),
(258, 'Wallis and Futuna', 'Mata-Utu', 'Oceania', 'French, Wallisian, Futunan', 'CFP franc'),
(259, 'Samoa', 'Apia', 'Oceania', 'Samoan, English', 'Samoan tālā'),
(260, 'Kosovo', 'Pristina', 'Europe', 'Albanian, Serbian', 'Euro'),
(261, 'Yemen', 'Sana\'a', 'Asia', 'Arabic', 'Yemeni rial'),
(262, 'Mayotte', 'Mamoudzou', 'Africa', 'French', 'Euro'),
(263, 'South Africa', 'Pretoria', 'Africa', 'Afrikaans, English, Zulu, Xhosa, Southern Sotho, T', 'South African rand'),
(264, 'Zambia', 'Lusaka', 'Africa', 'English', 'Zambian kwacha'),
(265, 'Zimbabwe', 'Harare', 'Africa', 'English, Shona, Ndebele, South Ndebele, Chewa,', '');

-- --------------------------------------------------------

--
-- Table structure for table `league`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `ws_log`
--

CREATE TABLE `ws_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(150) NOT NULL,
  `user_action` varchar(255) NOT NULL,
  `logged_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ws_log`
--

INSERT INTO `ws_log` (`id`, `email`, `user_action`, `logged_at`, `user_id`) VALUES
(1, '123@gmail.com', '127.0.0.1 /sports-api/players', '2023-05-07 10:35:21', 1),
(2, '123@gmail.com', '127.0.0.1 /sports-api/teams', '2023-05-08 07:45:29', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ws_users`
--

CREATE TABLE `ws_users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '2022-12-01 08:11:50'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ws_users`
--

INSERT INTO `ws_users` (`user_id`, `first_name`, `last_name`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'Fiacre', '123', '123@gmail.com', '$2y$15$vodPx/M768Wn8VUX0ixhGujMDjKaW8wCRxlEbuFUQ0p3B5v3oD5kS', '', '2023-05-07 08:10:29'),
(2, 'Uraib', '123', '123@gmail.com', '$2y$15$YG0e4FzBAMacVJ35FsN0puFV43nMcjkc.Pt3MGwvUqbONy/K/UrCS', '', '2023-05-07 09:53:39'),
(3, 'John', '123', '123@gmail.com', '$2y$15$lZ2g/vmxPyxU1Gj0hfA/NuN5URGyLHOncFepIpuNJlYZuw6gIAlXS', 'admin', '2023-05-07 10:05:14'),
(4, 'Test', '123', '123@gmail.com', '$2y$15$aknVSsemNlBdqMLx6wux.ePZtu0g9LFDjV7ANYCGmKhW1CqjwrsBC', '', '2023-05-07 10:24:11'),
(5, 'Test', '123', '123@gmail.com', '$2y$15$U/AxEIpOaLGy4CVWvRRqEuV5tF05iGVvbGXx0zKLoqyGOClvW4veS', '', '2023-05-07 10:25:17'),
(6, 'Test', '123', '123@gmail.com', '$2y$15$Tw9YNJz5mh9xWkc9rsPsBuShb6gTdnt96EPlXMU1W2467G02gVIWy', '', '2023-05-08 07:44:25');

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
-- Indexes for table `ws_log`
--
ALTER TABLE `ws_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ws_users`
--
ALTER TABLE `ws_users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;

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
-- AUTO_INCREMENT for table `ws_log`
--
ALTER TABLE `ws_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ws_users`
--
ALTER TABLE `ws_users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `team_to_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
