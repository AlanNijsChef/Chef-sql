-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 17 dec 2024 om 12:00
-- Serverversie: 10.4.32-MariaDB
-- PHP-versie: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chef`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `bestelling`
--

CREATE TABLE `bestelling` (
  `id` int(11) NOT NULL,
  `klant_id` int(11) DEFAULT NULL,
  `medewerker_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `bestelling`
--

INSERT INTO `bestelling` (`id`, `klant_id`, `medewerker_id`) VALUES
(17, 1, 3),
(18, 2, 4),
(19, 3, 5),
(20, 4, 6),
(21, 1, 7),
(22, 2, 8),
(23, 3, 3),
(24, 4, 4),
(25, 1, 5),
(26, 2, 6),
(27, 3, 7),
(28, 4, 8),
(29, 1, 4),
(30, 2, 3),
(31, 3, 6),
(32, 4, 5);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `bestelregel`
--

CREATE TABLE `bestelregel` (
  `id` int(11) NOT NULL,
  `bestelling_id` int(11) DEFAULT NULL,
  `gerecht_id` int(11) DEFAULT NULL,
  `aantal` int(11) DEFAULT NULL,
  `klaar` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `bestelregel`
--

INSERT INTO `bestelregel` (`id`, `bestelling_id`, `gerecht_id`, `aantal`, `klaar`) VALUES
(85, 17, 1, 2, 0),
(86, 17, 5, 3, 0),
(87, 17, 10, 1, 0),
(88, 18, 2, 4, 0),
(89, 18, 8, 2, 0),
(90, 18, 15, 3, 0),
(91, 19, 3, 1, 0),
(92, 19, 7, 3, 0),
(93, 19, 20, 4, 0),
(94, 20, 4, 2, 0),
(95, 20, 12, 3, 0),
(96, 20, 23, 1, 0),
(97, 21, 6, 4, 0),
(98, 21, 9, 2, 0),
(99, 21, 14, 3, 0),
(100, 22, 1, 1, 0),
(101, 22, 11, 3, 0),
(102, 22, 18, 4, 0),
(103, 23, 2, 2, 0),
(104, 23, 5, 3, 0),
(105, 24, 3, 4, 0),
(106, 24, 13, 2, 0),
(107, 25, 4, 1, 0),
(108, 25, 8, 3, 0),
(109, 26, 5, 4, 0),
(110, 26, 14, 2, 0),
(111, 27, 6, 3, 0),
(112, 27, 9, 1, 0),
(113, 28, 7, 2, 0),
(114, 28, 15, 4, 0),
(115, 29, 1, 3, 0),
(116, 29, 5, 2, 0),
(117, 29, 10, 4, 0),
(118, 29, 20, 1, 0),
(119, 30, 2, 4, 0),
(120, 30, 8, 3, 0),
(121, 30, 15, 2, 0),
(122, 30, 24, 1, 0),
(123, 31, 3, 1, 0),
(124, 31, 6, 3, 0),
(125, 31, 11, 4, 0),
(126, 31, 18, 2, 0),
(127, 32, 4, 2, 0),
(128, 32, 7, 3, 0),
(129, 32, 13, 4, 0),
(130, 32, 22, 1, 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `omschrijving` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `categorie`
--

INSERT INTO `categorie` (`id`, `omschrijving`) VALUES
(1, 'warme eten'),
(2, 'koud eten'),
(3, 'warme drank'),
(4, 'koude drank'),
(5, 'toetjes');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gerecht`
--

CREATE TABLE `gerecht` (
  `id` int(11) NOT NULL,
  `categorie_id` int(11) DEFAULT NULL,
  `omschrijving` char(25) DEFAULT NULL,
  `prijs` float DEFAULT NULL,
  `allergie` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `gerecht`
--

INSERT INTO `gerecht` (`id`, `categorie_id`, `omschrijving`, `prijs`, `allergie`) VALUES
(1, 1, 'Big Mac', 5.99, 1),
(2, 1, 'McChicken', 4.99, 1),
(3, 1, 'Quarter Pounder', 6.49, 1),
(4, 1, 'Cheeseburger', 2.49, 1),
(5, 1, 'Chicken McNuggets 6pcs', 3.99, 1),
(6, 2, 'Side Salad', 1.99, 0),
(7, 2, 'Caesar Salad', 3.49, 1),
(8, 2, 'Apple Slices', 1.29, 0),
(9, 4, 'Coca Cola Small', 1.79, 0),
(10, 4, 'Coca Cola Large', 2.19, 0),
(11, 4, 'Fanta Orange Small', 1.79, 0),
(12, 4, 'Fanta Orange Large', 2.19, 0),
(13, 4, 'Milkshake Strawberry', 2.99, 1),
(14, 4, 'Milkshake Chocolate', 2.99, 1),
(15, 5, 'McFlurry Oreo', 3.49, 1),
(16, 5, 'McFlurry M&M\'s', 3.49, 1),
(17, 5, 'Sundae Caramel', 2.99, 1),
(18, 5, 'Sundae Chocolate', 2.99, 1),
(19, 5, 'Apple Pie', 1.49, 1),
(20, 3, 'Espresso', 1.79, 0),
(21, 3, 'Cappuccino', 2.49, 1),
(22, 3, 'Latte Macchiato', 2.99, 1),
(23, 3, 'Thee', 1.49, 0),
(24, 3, 'Warme Chocolademelk', 2.19, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `klant`
--

CREATE TABLE `klant` (
  `id` int(11) NOT NULL,
  `naam` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `klant`
--

INSERT INTO `klant` (`id`, `naam`) VALUES
(1, 'Henk'),
(2, 'Frederick'),
(3, 'Mark Rutte'),
(4, 'Jack Hallas');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `medewerker`
--

CREATE TABLE `medewerker` (
  `id` int(11) NOT NULL,
  `naam` char(25) DEFAULT NULL,
  `funtie` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `medewerker`
--

INSERT INTO `medewerker` (`id`, `naam`, `funtie`) VALUES
(3, 'Nijs', 'Chef'),
(4, 'Alan', 'Chef'),
(5, 'Rutger', 'Bezorger'),
(6, 'Leandro', 'Bezorger'),
(7, 'Miguel', 'Keukenmedewerker'),
(8, 'Rayen', 'Keukenmedewerker');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `bestelling`
--
ALTER TABLE `bestelling`
  ADD PRIMARY KEY (`id`),
  ADD KEY `klant_id` (`klant_id`),
  ADD KEY `medewerker_id` (`medewerker_id`);

--
-- Indexen voor tabel `bestelregel`
--
ALTER TABLE `bestelregel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bestelling_id` (`bestelling_id`),
  ADD KEY `gerecht_id` (`gerecht_id`);

--
-- Indexen voor tabel `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `gerecht`
--
ALTER TABLE `gerecht`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorie_id` (`categorie_id`);

--
-- Indexen voor tabel `klant`
--
ALTER TABLE `klant`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `medewerker`
--
ALTER TABLE `medewerker`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `bestelling`
--
ALTER TABLE `bestelling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT voor een tabel `bestelregel`
--
ALTER TABLE `bestelregel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT voor een tabel `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT voor een tabel `gerecht`
--
ALTER TABLE `gerecht`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT voor een tabel `klant`
--
ALTER TABLE `klant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `medewerker`
--
ALTER TABLE `medewerker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `bestelling`
--
ALTER TABLE `bestelling`
  ADD CONSTRAINT `bestelling_ibfk_1` FOREIGN KEY (`klant_id`) REFERENCES `klant` (`id`),
  ADD CONSTRAINT `bestelling_ibfk_2` FOREIGN KEY (`medewerker_id`) REFERENCES `medewerker` (`id`);

--
-- Beperkingen voor tabel `bestelregel`
--
ALTER TABLE `bestelregel`
  ADD CONSTRAINT `bestelregel_ibfk_1` FOREIGN KEY (`bestelling_id`) REFERENCES `bestelling` (`id`),
  ADD CONSTRAINT `bestelregel_ibfk_2` FOREIGN KEY (`gerecht_id`) REFERENCES `gerecht` (`id`);

--
-- Beperkingen voor tabel `gerecht`
--
ALTER TABLE `gerecht`
  ADD CONSTRAINT `gerecht_ibfk_1` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
