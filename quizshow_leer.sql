-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 27. Mrz 2025 um 18:52
-- Server-Version: 11.7.2-MariaDB
-- PHP-Version: 8.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `quizshow_leer`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fragen`
--

CREATE TABLE `fragen` (
  `fragenid` bigint(20) UNSIGNED NOT NULL,
  `frage` varchar(500) NOT NULL,
  `thema` bigint(20) UNSIGNED NOT NULL,
  `schwierigkeit` bigint(20) UNSIGNED NOT NULL,
  `antwort1` varchar(500) NOT NULL,
  `antwort2` varchar(500) NOT NULL,
  `antwort3` varchar(500) NOT NULL,
  `antwort4` varchar(500) NOT NULL,
  `antwortrichtig` int(11) NOT NULL,
  `gestellt` tinyint(1) NOT NULL,
  `aktiv` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `roles`
--

CREATE TABLE `roles` (
  `roleid` bigint(20) UNSIGNED NOT NULL,
  `rolename` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `roles`
--

INSERT INTO `roles` (`roleid`, `rolename`) VALUES
(1, 'Administrator'),
(2, 'Streaming'),
(3, 'Moderator');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `schwierigkeiten`
--

CREATE TABLE `schwierigkeiten` (
  `schwierigkeitsID` bigint(20) UNSIGNED NOT NULL,
  `schwierigkeitsname` varchar(50) NOT NULL,
  `punkte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `schwierigkeiten`
--

INSERT INTO `schwierigkeiten` (`schwierigkeitsID`, `schwierigkeitsname`, `punkte`) VALUES
(1, 'Leicht', 100),
(2, 'Etwas schwer', 200),
(3, 'Mittelschwer', 300),
(4, 'Schwer', 400);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `themen`
--

CREATE TABLE `themen` (
  `themenid` bigint(20) UNSIGNED NOT NULL,
  `themenname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `uid` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `role` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`uid`, `username`, `password`, `role`) VALUES
(1, 'admin', '$2y$12$lQTRYT3dfvifcm6qmJW3HO5MsEiczPThfIoW765BkIacK0b8zt1Yu', 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `fragen`
--
ALTER TABLE `fragen`
  ADD PRIMARY KEY (`fragenid`),
  ADD UNIQUE KEY `fragenid` (`fragenid`),
  ADD KEY `rel_fragen-schwierigkeit` (`schwierigkeit`),
  ADD KEY `rel-fragen-thema` (`thema`);

--
-- Indizes für die Tabelle `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roleid`),
  ADD UNIQUE KEY `roleid` (`roleid`);

--
-- Indizes für die Tabelle `schwierigkeiten`
--
ALTER TABLE `schwierigkeiten`
  ADD PRIMARY KEY (`schwierigkeitsID`),
  ADD UNIQUE KEY `schwierigkeitsID` (`schwierigkeitsID`);

--
-- Indizes für die Tabelle `themen`
--
ALTER TABLE `themen`
  ADD PRIMARY KEY (`themenid`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `uid` (`uid`),
  ADD KEY `rel_users-role` (`role`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `fragen`
--
ALTER TABLE `fragen`
  MODIFY `fragenid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `roles`
--
ALTER TABLE `roles`
  MODIFY `roleid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `schwierigkeiten`
--
ALTER TABLE `schwierigkeiten`
  MODIFY `schwierigkeitsID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `themen`
--
ALTER TABLE `themen`
  MODIFY `themenid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `uid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `fragen`
--
ALTER TABLE `fragen`
  ADD CONSTRAINT `rel-fragen-thema` FOREIGN KEY (`thema`) REFERENCES `themen` (`themenid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rel_fragen-schwierigkeit` FOREIGN KEY (`schwierigkeit`) REFERENCES `schwierigkeiten` (`schwierigkeitsID`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `rel_users-role` FOREIGN KEY (`role`) REFERENCES `roles` (`roleid`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
