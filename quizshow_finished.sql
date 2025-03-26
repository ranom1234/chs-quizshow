-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 25. Jun 2024 um 19:23
-- Server-Version: 11.4.2-MariaDB
-- PHP-Version: 8.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `quizshow`
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

--
-- Daten für Tabelle `fragen`
--

INSERT INTO `fragen` (`fragenid`, `frage`, `thema`, `schwierigkeit`, `antwort1`, `antwort2`, `antwort3`, `antwort4`, `antwortrichtig`, `gestellt`, `aktiv`) VALUES
(1, 'Wer war der erste Präsident der Vereinigten Staaten? ', 1, 1, 'Abraham Lincoln', 'George Washington', 'Thomas Jefferson', 'John Adams', 2, 1, 0),
(2, 'In welchem Jahr begann der Zweite Weltkrieg? ', 1, 1, '1935', '1940', '1939', '1941', 3, 0, 0),
(3, 'Welcher Pharao ließ die Pyramiden von Gizeh erbauen? ', 1, 1, 'Tutanchamun', 'Ramses II', 'Cheops', 'Echnaton', 3, 0, 0),
(4, 'Wer entdeckte Amerika im Jahr 1492? ', 1, 1, 'Ferdinand Magellan', 'Marco Polo', 'Christoph Kolumbus', 'Vasco da Gama', 3, 1, 0),
(5, 'Was war die Hauptstadt des Römischen Reiches? ', 1, 1, 'Athen', 'Karthago', 'Rom', 'Alexandria', 3, 1, 0),
(6, 'Welcher deutsche Kaiser wurde 1871 in Versailles zum Kaiser ausgerufen? ', 1, 2, 'Wilhelm I.', 'Friedrich III.', 'Wilhelm II.', 'Otto von Bismarck', 1, 1, 0),
(7, 'Welche Stadt wurde 79 n. Chr. durch den Ausbruch des Vesuvs zerstört? ', 1, 2, 'Pompeji', 'Rom', 'Neapel', 'Herculaneum', 1, 1, 0),
(8, 'Wer schrieb das Buch \"Der Ursprung der Arten\"?', 1, 2, 'Isaac Newton', 'Charles Darwin', 'Albert Einstein', 'Galileo Galilei', 2, 1, 0),
(9, 'Welche Schlacht markierte das Ende der napoleonischen Kriege?', 1, 2, 'Schlacht bei Leipzig', 'Schlacht bei Austerlitz', 'Schlacht von Waterloo', 'Schlacht bei Trafalgar', 3, 0, 0),
(10, 'Welche Mauer trennte Deutschland während des Kalten Krieges?', 1, 2, 'Chinesische Mauer', 'Berliner Mauer', 'Hadrianwall', 'Maginot-Linie', 2, 0, 0),
(11, 'Wer war der erste Kaiser des Heiligen Römischen Reiches? ', 1, 3, 'Karl der Große', 'Otto der Große', 'Friedrich Barbarossa', 'Heinrich IV', 1, 0, 0),
(12, 'Welche Reformbewegung führte Martin Luther im 16. Jahrhundert an? ', 1, 3, 'Renaissance', 'Aufklärung', 'Reformation', 'Humanismus', 3, 1, 0),
(13, 'Welches Land wurde 1948 als unabhängiger Staat gegründet?', 1, 3, 'Indien', 'Pakistan', 'Israel', 'Südkorea', 3, 1, 0),
(14, 'Wer war der letzte König von Frankreich vor der Französischen Revolution?', 1, 3, 'Ludwig XIV.', 'Ludwig XV.', 'Ludwig XVI.', 'Karl X.', 3, 1, 0),
(15, 'Wie starb Elisabeth von Österreich-Ungarn?', 1, 3, 'Bei einem Reitunfall', 'An einer Krankheit', 'Durch ein Attentat', 'Bei einem Schiffsunglück', 3, 0, 0),
(16, 'Welcher Vertrag beendete den Dreißigjährigen Krieg?', 1, 4, 'Vertrag von Tordesillas', 'Westfälischer Friede', 'Vertrag von Utrecht', 'Wiener Kongress', 2, 1, 0),
(17, 'Wer führte die Mongolen im 13. Jahrhundert zu einer Welteroberung? ', 1, 4, 'Kublaj Khan', 'Genghis Khan', 'Timur', 'Attila', 2, 0, 0),
(18, 'Welches Ereignis wird als Beginn der Französischen Revolution angesehen?', 1, 4, 'Die Hinrichtung von Ludwig XVI.', 'Der Sturm auf die Bastille', 'Die Ausrufung der Republik', 'Der Marsch der Frauen nach Versailles', 2, 1, 0),
(19, 'Welches Ereignis gilt als Auslöser für den Ersten Weltkrieg?', 1, 4, 'Der Überfall auf Polen', 'Der Mord an Franz Ferdinand', 'Der Untergang der Lusitania', 'Der Eintritt der USA in den Krieg', 2, 0, 0),
(20, 'Welcher ägyptische König wurde im Tal der Könige entdeckt? ', 1, 4, 'Ramses II.', 'Echnaton', 'Tuntanchamun', 'Thutmosis III.', 3, 1, 0),
(21, 'Welche Einheit misst die Intensität von Erdbeben? ', 2, 1, 'Grad Celsius', 'Richter-Skala', 'Watt', 'Kilogramm', 2, 1, 0),
(22, 'Welche berühmte Formel beschreibt die Äquivalenz von Masse und Energie? ', 2, 1, 'Newtons Gesetz', 'Eulers Formel', 'Einsteins E=mc^2', 'Plancks Konstante', 3, 1, 0),
(23, 'Was ist das chemische Symbol für Wasser?', 2, 1, 'Wo', 'H2O', 'O2', 'HCl', 2, 0, 0),
(24, 'Welcher Planet ist der dritte von der Sonne in unserem Sonnensystem?', 2, 1, 'Mars', 'Erde', 'Venus', 'Merkur', 2, 0, 0),
(25, 'Welcher berühmte Naturwissenschaftler entdeckte das Gesetz der Gravitation?', 2, 1, 'Isaac Newton', 'Albert Einstein', 'Galileo Galilei', 'Nikola Telsa', 1, 1, 0),
(26, 'Was ist das am häufigsten vorkommendes Gas in der Erdatmosphäre?', 2, 2, 'Sauerstoff', 'Kohlendioxid', 'Stickstoff', 'Wasserstoff', 3, 1, 0),
(27, 'Was ist die chemische Bezeichnung für Kochsalz', 2, 2, 'NaCl', 'KCl', 'HCl', 'CaCl2', 1, 0, 0),
(28, 'Welche Einheit misst die Lautstärke eines Tons?', 2, 2, 'Kilowatt', 'Ohm', 'Newton', 'Decibel', 4, 1, 0),
(29, 'Was ist die kleinste Einheit eines chemischen Elements, das seine chemischen Eigenschaften behält? ', 2, 2, 'Molekül', 'Isotop', 'Atom', 'Ion', 3, 1, 0),
(30, 'Welcher berühmte Naturwissenschaftler ist bekannt für seine Theorie der Evolution durch natürliche Auslese?', 2, 2, 'Charles Darwin', 'Gregor Mendel', 'Louis Pasteur', 'Marie Curie', 1, 0, 0),
(31, 'Was ist die chemische Formel für Methan? ', 2, 3, 'CO2', 'H2O', 'C6H12O6', 'CH4', 4, 0, 0),
(32, 'Welches Tier ist bekannt für seine Fähigkeit, die Farbe seiner Haut zu ändern, um sich zu tarnen?', 2, 3, 'Chamäleon', 'Geier', 'Elefant', 'Delfin', 1, 1, 0),
(33, 'Welcher Planet hat die längste Umlaufzeit um die Sonne in unserem Sonnensystem? ', 2, 3, 'Mars', 'Jupiter', 'Saturn', 'Neptun', 4, 0, 0),
(34, 'Was ist der zweithäufigste chemische Bestandteil der Erdatmosphäre? ', 2, 3, 'Sauerstoff', 'Kohlendioxid', 'Argon', 'Methan', 3, 1, 0),
(35, 'Welche Einheit misst die elektrische Ladung?', 2, 3, 'Ohm', 'Ampere', 'Volt', 'Coulomb', 4, 1, 0),
(36, 'Welche chemische Verbindung macht etwa 78% der Atmosphäre der Erde aus? ', 2, 4, 'Kohlendioxid', 'Stickstoff', 'Sauerstoff', 'Methan', 2, 1, 0),
(37, 'Was ist der kleinste Planet in unserem Sonnensystem?', 2, 4, 'Mars', 'Merkur', 'Venus', 'Erde', 2, 0, 0),
(38, 'Welches Tier ist bekannt für seine Fähigkeit, Ultraschall zu verwenden, um Beute zu orten? ', 2, 4, 'Fledermaus', 'Delfin', 'Echse', 'Krake', 1, 1, 0),
(39, 'Welches Element hat die höchste Dichte bei Normalbedingungen?', 2, 4, 'Blei', 'Platin', 'Gold', 'Osmium', 4, 1, 0),
(40, 'Welcher berühmte Wissenschaftler ist bekannt für seine Theorie der Relativität und seine Arbeit über die Quantentheorie des Lichts?', 2, 4, 'Isaac Newton', 'Albert Einstein', 'Niels Bohr', 'Max Planck', 2, 0, 0),
(41, 'Welche Sportart wird auch als America\'s Pastime bezeichnet?', 3, 1, 'American Football', 'Baseball', 'Basketball', 'Hockey', 2, 0, 0),
(42, 'Wann fand das erste moderne Olympische Spiel statt?', 3, 1, '1896', '1904', '1920', '1936', 1, 1, 0),
(43, 'Welche Sportart hat den Super Bowl als ihre jährliche Meisterschaft?', 3, 1, 'Baseball', 'Basketball', 'American Football', 'Hockey', 3, 1, 0),
(44, 'Welcher Sport verwendet Begriffe wie Birdie und Eagle, um verschiedene Ergebnisse auf einem Kurs zu beschreiben?', 3, 1, 'Leichtathletik', 'Schwimmen', 'Golf', 'Radfahren', 3, 1, 0),
(45, 'Wann wurde die FIFA gegründet, der Weltverband für Fußball? ', 3, 1, '1890', '1904', '1928', '1946', 2, 1, 0),
(46, 'Welche olympische Sportart wird auf einer 400-Meter-Bahn mit Hürden und Staffeln ausgetragen?', 3, 2, 'Sprint', 'Marathon', 'Hindernislauf', 'Leichtathletik', 3, 1, 0),
(47, 'Welche Sportart verwendet einen \"Puck\" und hat den Stanley Cup als ihre prestigeträchtige Trophäe?', 3, 2, 'Eishockey', 'Lacrosse', 'Polo', 'Ringen', 1, 1, 0),
(48, 'Welches Jahr fand die erste Fußball-Weltmeisterschaft statt?', 3, 2, '1930', '1954', '1970', '1986', 1, 0, 0),
(49, 'Welche Sportart hat den \"Grand Slam\" als die vier wichtigsten Turniere des Jahres?', 3, 2, 'Tennis', 'Golf', 'Cricket', 'Rugby', 1, 1, 0),
(50, 'Welche Sportart verwendet den Begriff \"Touchdown\" für das Erzielen von Punkten und hat die National Football League (NFL) als ihre führende Liga?', 3, 2, 'Rugby', 'American Football', 'Basketball', 'Baseball', 2, 1, 0),
(51, 'Welches Land dominierte den Fußball in den 1970er Jahren, gewann drei Weltmeisterschaften und wurde als \"Die goldene Generation\" bezeichnet? ', 3, 3, 'Italien', 'Deutschland', 'Brasilien', 'Niederlande', 3, 1, 0),
(52, 'Welche Tennisspielerin hält den Rekord für die meisten Grand-Slam-Titel im Damen-Einzel?', 3, 3, 'Serena Williams', 'Steffi Graf', 'Martina Navratilova', 'Margaret Court', 4, 1, 0),
(53, 'Welcher Schwimmer hat den Weltrekord für die meisten Goldmedaillen bei Olympischen Spielen mit 8 Goldmedaillen in einer einzigen Olympiade gebrochen?', 3, 3, 'Mark Spitz', 'Ian Thorpe', 'Michael Phelps', 'Ryan Lochte', 3, 0, 0),
(54, 'Wann fand das erste Tennisturnier Wimbledon statt?', 3, 3, '1868', '1877', '1901', '1924', 2, 1, 0),
(55, 'Welche Leichtathletin hält den Weltrekord im Marathon der Frauen, der bei 2 Stunden, 14 Minuten und 4 Sekunden liegt?', 3, 3, 'Paula Radcliffe', 'Mark Keitany', 'Tirunesh Dibaba', 'Brigid Kosgei', 1, 1, 0),
(56, 'Wann wurde der erste Basketball entwickelt?', 3, 4, '1861', '1891', '1904', '1920', 2, 1, 0),
(57, 'Welches Team gewann die NBA-Meisterschaft sechs Mal in den 1990er Jahren unter der Führung von Michael Jordan?', 3, 4, 'Boston Celtics', 'Los Angeles Lakers', 'Chicago Bulls', 'Houston Rockets', 3, 1, 0),
(58, 'Wann fand die erste Tour de France statt?', 3, 4, '1885', '1903', '1920', '1947', 2, 1, 0),
(59, 'Wer war der erste Mensch, der die vier Grand-Slam-Titel im selben Jahr, auch als Grand Slam bezeichnet, im Herren-Einzel gewann?', 3, 4, 'Roger Federer', 'Rafael Nadal', 'Rod Laver', 'Novak Djokovic', 3, 0, 0),
(60, 'Welches Team hat die meisten UEFA Champions League Titel gewonnen?', 3, 4, 'Real Madrid', 'FC Barcelona', 'Bayern München', 'AC Mailand', 1, 1, 0),
(61, 'Wer malte die \"Mona Lisa\"? ', 4, 1, 'Vincent van Gogh', 'Pablo Picasso', 'Leonardo da Vinci', 'Claude Monet', 3, 1, 0),
(62, 'Welche berühmte Skulptur schuf Michelangelo?', 4, 1, 'Die Venus von Milo', 'Der Denker', 'David', 'Der Diskobolos', 3, 1, 0),
(63, 'Welcher Künstler ist für seine surrealistischen Werke bekannt, insbesondere für \"Die Beständigkeit der Erinnerung\"?', 4, 1, 'Salvador Dali', 'Henri Matisse', 'René Magritte', 'Marc Chagall', 1, 0, 0),
(64, 'In welchem Land befindet sich das Museum Louvre?', 4, 1, 'Italien', 'Spanien', 'Frankreich', 'Deutschland', 3, 1, 0),
(65, 'Welcher Stil ist charakteristisch für die Werke von Jackson Pollock?', 4, 1, 'Impressionismus', 'Kubismus', 'Abstrakter Expressionismus', 'Surrealismus', 3, 1, 0),
(66, 'Wer entwarf die Kuppel des Petersdoms in Rom?', 4, 2, 'Donatello', 'Leonardo da Vinci', 'Michelangelo', 'Raphael', 3, 1, 0),
(67, 'Welche Epoche wird durch Künstler wie Botticelli, Leonardo da Vinci und Michelangelo repräsentiert?', 4, 2, 'Barock', 'Romantik', 'Renaissance', 'Gotik', 3, 1, 0),
(68, 'Welche Gemäldeserie von Claude Monet zeigt eine Brücke über einen Seerosenteich?', 4, 2, 'Die Kathedralen von Rouen', 'Die Seerosen', 'Die Heuhaufen', 'Die japanische Brücke', 4, 1, 0),
(69, 'Wer schrieb das Stück \"Hamlet\"? ', 4, 2, 'Friedrich Schiller', 'Johann Wolfgang von Goethe', 'William Shakespeare', 'Molière', 3, 1, 0),
(70, 'Welche Kunstrichtung wird durch Künstler wie Georges Braque und Pablo Picasso repräsentiert? ', 4, 2, 'Impressionismus', 'Kubismus', 'Surrealismus', 'Dadaismus', 2, 0, 0),
(71, 'Welche Skulptur ist eine der bekanntesten Arbeiten von Auguste Rodin?', 4, 3, 'Die Pietà', 'Der Denker', 'Der Kuss', 'Der Schrei', 2, 1, 0),
(72, 'Welche japanische Kunstform umfasst die Teezeremonie, Ikebana und das No-Theater?', 4, 3, 'Shinto', 'Zen', 'Wabi-Sabi', 'Chanoyu', 4, 0, 0),
(73, 'Welches Gemälde zeigt eine sternenklare Nacht über einer Stadt?', 4, 3, 'Die Sternennacht', 'Die Nachtwache', 'Die Geburt der Venus', 'Der Garten der Lüste', 1, 1, 0),
(74, 'Wer schuf die Skulptur \"Der Denker\"? ', 4, 3, 'Auguste Rodin', 'Constantin Brâncuși', 'Henry Moore', 'Alberto Giacometti', 1, 1, 0),
(75, 'Welcher Künstler malte das Deckengemälde in der Sixtinischen Kapelle?', 4, 3, 'Leonardo da Vinci', 'Raphael', 'Michelangelo', 'Caravaggio', 3, 1, 0),
(76, 'Welcher Architekt entwarf das Guggenheim-Museum in Bilbao?', 4, 4, 'Frank Lloyd Wright', 'Zaha Hadid', 'Frank Gehry', 'Le Corbusier', 3, 1, 0),
(77, 'Welche Epoche wird durch den Maler Hieronymus Bosch und sein Werk \"Der Garten der Lüste\" repräsentiert?', 4, 4, 'Renaissance', 'Barock', 'Gotik', 'Manierismus', 1, 1, 0),
(78, 'Wer schuf das berühmte Gemälde \"Guernica\"?', 4, 4, 'Salvador Dali', 'Pablo Picasso', 'Joan Miró', 'Francisco Goya', 2, 1, 0),
(79, 'Welcher Architekt ist für den Bau der Kirche Sagrada Família in Barcelona verantwortlich? ', 4, 4, 'Antoni Gaudi', 'Santiago Calatrava', 'Rafael Moneo', 'Ricardo Bofill', 1, 1, 0),
(80, 'Welcher Kunststil wird durch den Künstler Wassily Kandinsky repräsentiert?', 4, 4, 'Impressionismus', 'Expressionismus', 'Realismus', 'Surrealismus', 2, 0, 0),
(81, '    Wer wird als \"King of Pop\" bezeichnet?', 5, 1, 'Elvis Presley', 'Michael Jackson', 'Prince', 'Freddie Mercury', 2, 1, 0),
(82, 'Welche Band hat das Album \"Abbey Road\" veröffentlicht?', 5, 1, 'The Rolling Stones', 'The Beatles', 'Pink Floyd', 'Led Zeppelin', 2, 1, 0),
(83, 'Welcher Komponist schrieb die 9. Sinfonie?', 5, 1, 'Johann Sebastian Bach', 'Ludwig van Beethoven', 'Wolfgang Amadeus Mozart', 'Franz Schubert', 2, 1, 0),
(84, 'Welche Sängerin ist bekannt für den Hit \"Like a Virgin\"?', 5, 1, 'Whitney Houston', 'Celine Dion', 'Madonna', 'Mariah Carey', 3, 1, 0),
(85, 'Welcher US-amerikanische Rapper ist auch als Slim Shady bekannt?', 5, 1, 'Jay-Z', 'Eminem', 'Tupac Shakur', 'Kanye West', 2, 0, 0),
(86, 'Welche Rockband veröffentlichte das Album \"Dark Side of the Moon\"?', 5, 2, 'Led Zeppelin', 'Pink Floyd', 'The Who', 'Queen', 2, 0, 0),
(87, ' Welche Oper von George Bizet erzählt die Geschichte einer feurigen Zigeunerin?', 5, 2, 'Aida', 'Carmen', 'La Traviata', 'Tosca', 2, 1, 0),
(88, 'Welches Jahr wird als das \"Geburtsjahr des Jazz\" angesehen?', 5, 2, '1901', '1917', '1923', '1930', 2, 1, 0),
(89, 'Welche Band war bekannt für den Hit \"Bohemian Rhapsody\"?', 5, 2, 'The Beatles', 'Queen', 'The Rolling Stones', 'The Who', 2, 1, 0),
(90, 'Wer war der Frontmann der Band Nirvana?', 5, 2, 'Eddie Vedder', 'Chris Cornell', 'Kurt Cobain', 'Layne Staley', 3, 1, 0),
(91, 'Welcher Komponist ist für seine \"Vier Jahreszeiten\" bekannt? ', 5, 3, 'Johann Sebastian Bach', 'Antonio Vivaldi', 'George Frideric Handel', 'Joseph Haydn', 2, 1, 0),
(92, 'Welche Sängerin hatte einen großen Erfolg mit dem Album \"21\"?', 5, 3, 'Adele', 'Taylor Swift', 'Beyoncé', 'Lady Gaga', 1, 1, 0),
(93, '    Welche Band war bekannt für den Hit \"Hotel California\"?', 5, 3, 'Fleetwood Mac', 'The Eagles', 'Lynyrd Skynyrd', 'The Doors', 2, 0, 0),
(94, 'Wer komponierte die Oper \"Die Zauberflöte\"? ', 5, 3, 'Ludwig van Beethoven', 'Franz Schubert', 'Wolfgang Amadeus Mozart', 'Giuseppe Verdi', 3, 1, 0),
(95, 'Welcher Jazzmusiker ist bekannt für das Album \"Kind of Blue\"?', 5, 3, 'John Coltrane', 'Charlie Parker', 'Miles Davis', 'Thelonious Monk', 3, 1, 0),
(96, 'Welcher Komponist ist bekannt für seine \"Unvollendete Sinfonie\"?', 5, 4, 'Johannes Brahms', 'Gustav Mahler', 'Franz Schubert', 'Richard Wagner', 3, 1, 1),
(97, 'Welches Jahr markiert den Beginn des Barockzeitalters in der Musik?', 5, 4, '1600', '1650', '1700', '1750', 1, 1, 0),
(98, 'Welcher Komponist schrieb die Oper \"Der Ring des Nibelungen\"?', 5, 4, 'Richard Wagner', 'Giacomo Puccini', 'Giuseppe Verdi', 'Hector Berlioz', 1, 1, 0),
(99, 'Welcher amerikanische Komponist schrieb das Werk \"Rhapsody in Blue\"?', 5, 4, 'Leonard Bernstein', 'Aaron Copland', 'George Gershwin', 'Samuel Barber', 3, 1, 0),
(100, 'Welches Werk wird oft als die erste Oper angesehen? ', 5, 4, 'L\'Orfeo von Monteverdi', 'Dido and Aeneas von Purcell', 'La Traviata von Verdi', 'Don Giovanni von Mozart', 1, 0, 0),
(101, 'Wer spielt die Rolle des Jack Dawson im Film \"Titanic\" von 1997?', 6, 1, 'Leonardo DiCaprio', 'Tom Hardy', 'Ryan Reynolds', 'Brad Pitt', 1, 1, 0),
(102, 'Welche Farbe hatten Dorothy\'s Schuhe im Film \"Der Zauberer von Oz\"?', 6, 1, 'Rot', 'Gelb', 'Gold', 'Platin', 1, 1, 0),
(103, 'Wer ist der Hauptcharakter der Zeichentrickserie \"Die Simpsons\"?', 6, 1, 'Homer', 'Peter', 'Bart', 'Brian', 1, 1, 0),
(104, 'In welcher TV-Serie leben sechs Freunde in New York City mit den Namen J, C, R, R, M, P?', 6, 1, 'How I Met Your Mother', 'Friends', 'The Big Bang Theory', 'New Girl', 2, 1, 0),
(105, 'Wer ist der bekannteste Widersacher von Batman?', 6, 1, 'The Joker', 'Lex Luthor', 'Magneto', 'Green Goblin', 1, 1, 0),
(106, 'In welcher TV-Serie lautet der berühmte Satz \"Winter is Coming\"?', 6, 2, 'Game of Thrones', 'Herr der Ringe', 'The walking Dead', 'Stranger Things', 1, 1, 0),
(107, 'In welcher Filmreihe gibt es einen Charakter namens Legolas?', 6, 2, 'Der Herr der Ringe', 'Game of Thrones', 'Star Wars', 'Harry Potter', 1, 1, 0),
(108, 'Welche TV-Serie handelt von einer Gruppe Überlebender, die versuchen, sich in einer postapokalyptischen Welt vor Zombies zu schützen?', 6, 2, 'Stranger Things', 'The Walking Dead', 'Breaking Bad', 'Game of Thrones', 2, 1, 0),
(109, 'In welchem Film reist ein Team von Wissenschaftlern durch ein Wurmloch im Weltraum, um nach einer neuen bewohnbaren Welt für die Menschheit zu suchen?', 6, 2, 'Gravity', 'Der Marsianer', 'Interstellar', 'Arrival', 3, 1, 0),
(110, 'In welcher TV-Serie lautet der vollständige Name des Hauptcharakters Walter White?', 6, 2, 'The Sopranos', 'Breaking Bead', 'Better Call Saul', 'Fargo', 2, 1, 0),
(111, 'Wer spielte die Rolle des Forrest Gump im gleichnamigen Film von 1994?', 6, 3, 'Tom Hanks', 'Tom Cruise', 'Brad Pitt', 'Jim Carrey', 1, 1, 0),
(112, 'Welcher Schauspieler verkörpert den Superhelden Tony Stark alias 	Iron Man im Marvel Cinematic Universe? ', 6, 3, 'Chris Hemsworth', 'Chris Evans', 'Robert Downey Jr.', 'Mark Ruffalo', 3, 1, 0),
(113, 'In welchem Film führt eine junge Frau eine Beziehung mit einem Vampir und einem Werwolf? ', 6, 3, 'Underworld', 'Blade', 'Interview mit einem Vampier', 'Twilight', 4, 1, 0),
(114, 'Welcher Film handelt von einem Mann, der sich in eine virtuelle Realität begibt, um Informationen über einen Wirtschaftsspion zu extrahieren?  ', 6, 3, 'Tron', 'The Matrix', 'Minority Report', 'Total Recall', 2, 1, 0),
(115, 'Welcher Schauspieler verkörperte den Joker im Film \"The Dark Knight\" von Christopher Nolan? ', 6, 3, 'Heath Ledger', 'Joaquin Phoenix', 'Jared Leto', 'Jack Nicholson', 1, 1, 0),
(116, 'In welchem Film von 1999 spielt Edward Norton einen Erzähler, der 	an einer multiplen Persönlichkeitsstörung leidet und sich mit einer unkonventionellen Therapie befasst? ', 6, 4, 'American Psycho', 'The Sixth Sense', 'Fight Club', 'Memento', 3, 1, 0),
(117, 'In welchem Film spielt Meryl Streep eine ehrgeizige Modedesignerin, die ihre Assistentin, gespielt von Anne Hathaway, tyrannisiert? ', 6, 4, 'Julie & Julia', 'The Iron Lady', 'Doubt - Macht des Zweifels', 'The Devil Wears Prada', 4, 1, 0),
(118, 'Welcher Schauspieler spielte die Hauptrolle in einem Biopic über den legendären Musiker Ray Charles? ', 6, 4, 'Will Smith', 'Denzel Washington', 'Forest Whitaker', 'Jamie Foxx', 4, 1, 0),
(119, 'In welchem Film spielt Natalie Portman eine Ballerina, die von ihrem obsessiven Streben nach Perfektion in den Wahnsinn getrieben wird?', 6, 4, 'Black Swan', 'Jackie', 'Closer', 'V wie Vendetta', 1, 1, 0),
(120, 'In welchem Film spielen Ben Stiller und Owen Wilson zwei Model-Agenten, die einen Mordfall aufklären?', 6, 4, 'Nachts im Museum', 'Tropic Thunder', 'Starsky & Hutch', 'Zoolander', 4, 1, 0),
(121, 'Welcher berühmte Musiker ist bekannt für seinen Hit \"Imagine\" und sein Engagement für den Weltfrieden? ', 7, 1, 'Bob Dylan', 'John Lennon', 'Paul McCartney', 'Mick Jagger', 2, 1, 0),
(122, 'Welche bekannte Sängerin ist für ihr \"Bad Romance\" und ihre extravaganten Bühnenoutfits bekannt? ', 7, 1, 'Katy Perry', 'Taylor Swift', 'Lady Gaga', 'Rihanna', 3, 1, 0),
(123, 'Welcher erfolgreiche Unternehmer gründete das Unternehmen SpaceX und Tesla Motors? ', 7, 1, 'Jeff Bezos', 'Bill Gates', 'Elon Musk', 'Mark Zuckerberg', 3, 0, 0),
(124, 'Welche bekannte TV-Persönlichkeit moderiert die Talkshow \"The Oprah Winfrey Show\", die von 1986 bis 2011 lief? ', 7, 1, 'Ellen DeGeneres', 'Tyra Banks', 'Oprah Winfrey', 'Wendy Williams', 3, 1, 0),
(125, 'Welcher berühmte Physiker und Autor ist bekannt für sein Buch \"Eine kurze Geschichte der Zeit\"?', 7, 1, 'Richard Dawkins', 'Stephen Hawking', 'Neil deGrasse Tyson', 'Carl Sagan', 2, 1, 0),
(126, 'Welche bekannte Schriftstellerin ist für ihre Harry-Potter-Buchreihe bekannt und wurde zur ersten Milliardärin durch Schreiben? ', 7, 2, 'J.K. Rowling', 'Suzanne Collins', 'Stephenie Meyer', 'Veronica Roth', 1, 1, 0),
(127, 'Welcher berühmte Musiker wurde als Leadsänger der Band Queen bekannt und starb 1991 an den Folgen von AIDS?', 7, 2, 'Freddie Mercury', 'David Bowie', 'Elton John', 'Mick Jagger', 1, 1, 0),
(128, 'Welche bekannte TV-Persönlichkeit und Geschäftsfrau ist bekannt für ihre Reality-TV-Show \"Keeping Up with the Kardashians\" und ihre Kosmetikmarke?', 7, 2, 'Paris Hilton', 'Kim Kardashin', 'Kylie Jenner', 'Taylor Swift', 2, 0, 0),
(129, 'Welcher bekannte Sportler gewann sechs NBA-Meisterschaften mit den Chicago Bulls und ist für sein Air Jordan-Sneaker-Imperium bekannt?', 7, 2, 'Kobe Bryant', 'Magic Johnson', 'Shaquille O\'Neal', 'Michael Jordan', 4, 1, 0),
(130, 'Welcher berühmte Politiker war der erste schwarze Präsident der Vereinigten Staaten von Amerika?', 7, 2, 'Joe Biden', 'Donald Trump', 'Barack Obama', 'George W. Bush', 3, 1, 0),
(131, 'Welcher berühmte Sänger und Songschreiber wurde als \"The Boss\" bekannt und ist für Hits wie \"Born in the U.S.A.\" bekannt?', 7, 3, 'Bob Dylan', 'Billy Joel', 'Bruce Springsteen', 'David Bowie', 3, 1, 0),
(132, 'Welcher bekannte Entertainer und Komiker war der langjährige Moderator der \"Late Show\" und ist bekannt für seine humorvolle Art und politischen Kommentare?', 7, 3, 'David Letterman', 'Jimmy Fallon', 'Stephen Colbert', 'Conan O\'Brien', 1, 0, 0),
(133, 'Welche berühmte Schauspielerin und Sängerin war die erste Frau, die einen Oscar für beste Hauptdarstellerin und einen Grammy für beste weibliche Gesangsdarbietung gewann?', 7, 3, 'Barbra Streisand', 'Cher', 'Audrey Hepburn', 'Judy Garland', 1, 1, 0),
(134, 'Welcher berühmte Musiker und Friedensaktivist gründete die Band \"The Plastic Ono Band\" und war mit John Lennon verheiratet?', 7, 3, 'Yoko Ono', 'Linda McCartney', 'Yoko Kanno', 'Yoko Shimomura', 1, 1, 0),
(135, 'Welcher bekannte Autor und Aktivist wurde für seine Rolle im Kampf gegen die Apartheid in Südafrika mit dem Friedensnobelpreis ausgezeichnet?', 7, 3, 'Desmond Tutu', 'Martin Luther King Jr.', 'Mahatma Gandhi', 'Nelson Mandela', 4, 1, 0),
(136, 'Welcher berühmte Physiker und Kosmologe entwickelte die Theorie der Schwarzen Löcher und veröffentlichte das Buch \"Der große Entwurf\"?', 7, 4, 'Richard Feynman', 'Albert Einstein', 'Carl Sagan', 'Stephen Hawking', 4, 1, 0),
(137, 'Welcher berühmte Künstler und Maler war bekannt für seine Werke wie \"Campbell\'s Soup Cans\" und \"Marilyn Diptych\"?', 7, 4, 'Jackson Pollock', 'Mark Rothko', 'Andy Warhol', 'Roy Lichtenstein', 3, 0, 0),
(138, 'Welche berühmte Schriftstellerin und Aktivistin wurde für ihre Autobiografie \"Ich weiß, warum der gefangene Vogel singt\" bekannt? ', 7, 4, 'Maya Angelou', 'Toni Morrison', 'Zora Neale Hurston', 'Alice Walker', 1, 1, 0),
(139, 'Welcher berühmte Sänger und Songwriter ist bekannt für Hits wie \"Imagine\" und wurde 1980 ermordet?', 7, 4, 'John Lennon', 'Bob Marley', 'Jim Morrison', 'Kurt Cobain', 1, 1, 0),
(140, 'Welcher Sänger/Band veröffentlichte 2023 das Album \"Memento Mori\" und spielte auf ihrer Tour in Klagenfurt?', 7, 4, 'Ghost', 'Ed Sheeran', 'Depeche Mode', 'Sting', 3, 1, 0),
(141, 'Welche dieser Früchte ist gelb und wird oft in Smoothies verwendet?', 8, 1, 'Erdbeere', 'Banane', 'Himbeere', 'Blaubeere', 2, 1, 0),
(142, 'Was ist die Hauptzutat in Guacamole? ', 8, 1, 'Avocado', 'Tomate', 'Paprika', 'Zwiebel', 1, 1, 0),
(143, 'Welche Art von Teigwaren ist flach und lang und wird oft mit Tomatensauce serviert? ', 8, 1, 'Penne', 'Farfalle', 'Spaghetti', 'Ravioli', 3, 1, 0),
(144, 'Was ist das Nationalgericht von Mexiko, bestehend aus gefalteten Tortillas mit Fleischfüllung?', 8, 1, 'Enchiladas', 'Tacos', 'Quesadillas', 'Burritos', 2, 0, 0),
(145, 'Welches Getränk wird traditionell in England mit Milch und Zucker serviert?', 8, 1, 'Kaffee', 'Eistee', 'Limonade', 'Tee', 4, 1, 0),
(146, 'Welche Spirituose wird oft als \"Wasser des Lebens\" bezeichnet und wird aus gemälzter Gerste hergestellt?', 8, 2, 'Whisky', 'Rum', 'Vodka', 'Tequila', 1, 1, 0),
(147, 'Welches Gewürz wird häufig zur Herstellung von Curry verwendet und verleiht ihm seine gelbe Farbe?', 8, 2, 'Paprika', 'Kurkuma', 'Kreuzkümmel', 'Oregano', 2, 1, 0),
(148, 'Welches Fleischgericht stammt traditionell aus der italienischen Küche und besteht aus dünn geschnittenen Fleischscheiben in einer Tomatensauce?', 8, 2, 'Paella', 'Ratatouille', 'Gulasch', 'Scaloppine', 4, 0, 0),
(149, 'Welche Art von Käse wird oft als \"König der Käse\" bezeichnet und stammt aus der Region um Parma in Italien?', 8, 2, 'Gouda', 'Mozzarella', 'Parmesan', 'Cheddar', 3, 1, 0),
(150, 'Was ist ein traditionelles japanisches Gericht, bestehend aus rohem Fisch auf Reis?', 8, 2, 'Sushi', 'Ramen', 'Sashimi', 'Miso-Suppe', 1, 1, 0),
(151, 'Welche französische Süßspeise besteht aus Blätterteigschichten und wird oft mit Vanillecreme gefüllt?', 8, 3, 'Croissant', 'Eclair', 'Crème brûlèe', 'Millefeuille', 4, 1, 0),
(152, 'Was ist das Hauptmerkmal von Prosecco, einem beliebten italienischen Schaumwein?', 8, 3, 'Starkes Aroma', 'Süßer Geschmak', 'Leichter Körper', 'Hoher Alkoholgehalt', 3, 0, 0),
(153, 'Welche Pilzsorte wird oft als \"Pfifferling\" bezeichnet und ist für ihren milden, leicht nussigen Geschmack bekannt?', 8, 3, 'Champignon', 'Shiitake', 'Morchel', 'Eierschwammerl', 4, 1, 0),
(154, 'Welches Getränk wird durch Fermentation von Trauben hergestellt und ist ein Grundpfeiler der französischen Weintradition?', 8, 3, 'Sake', 'Tequila', 'Vodka', 'Wein', 4, 1, 0),
(155, 'Was ist das beliebteste Getränk in Deutschland während des Oktoberfestes in München?', 8, 3, 'Wein', 'Bier', 'Gin Tonic', 'Vodka', 2, 1, 0),
(156, 'Welches Gewürz, das aus den Stempelfäden einer Krokusblume gewonnen wird, ist das teuerste Gewürz der Welt?', 8, 4, 'Safran', 'Vanille', 'Zimt', 'Muskatnuss', 1, 1, 0),
(157, 'Welche italienische Region ist berühmt für ihre Produktion von Parmaschinken, Parmesankäse und Balsamico-Essig?', 8, 4, 'Toskana', 'Sizilien', 'Emilia-Romagna', 'Lombardei', 3, 1, 0),
(158, 'Welche Käsesorte stammt aus der Region um Neapel und wird oft auf Pizza verwendet?', 8, 4, 'Gouda', 'Cheddar', 'Mozzarella', 'Parmesan', 3, 1, 0),
(159, 'Welches Obst ist berühmt für seine Rolle in der Legende von Sir Isaac Newton, der angeblich die Gravitation entdeckte, als er eines davon unter einem Baum sah?', 8, 4, 'Birne', 'Apfel', 'Orange', 'Pfirsich', 2, 1, 0),
(160, 'Welches Dessert besteht aus geschichtetem Gebäck, das mit Sahne oder Mascarpone-Käse und Kaffee getränkt ist?', 8, 4, 'Tiramisu', 'CrèmeBrûlée', 'Eclair', 'Panna Cotta', 1, 0, 0),
(161, 'Welcher berühmte französische Modedesigner ist bekannt für sein Label Chanel?', 9, 1, 'Giorgio Armani', 'Ralph Lauren', 'Karl Lagerfeld', 'Calvin Klein', 3, 1, 0),
(162, 'Welche berühmte Modedesignerin wurde bekannt für ihre Einführung des „Kleinen Schwarzen“ und gilt als Pionierin der Damenmode im 20. Jahrhundert?', 9, 1, 'Gabrielle Chanel', 'Elsa Schiaparelli', 'Madeleine Vionnet', 'Jeanne Lanvin', 1, 0, 0),
(163, 'Welche amerikanische Schauspielerin und Unternehmerin gründete die Kosmetikmarke \"Fenty Beauty\"?', 9, 1, 'Kim Kardashian', 'Rihanna', 'Beyoncé', 'Jennifer Lopez', 2, 0, 0),
(164, 'Welche italienische Modemarke ist bekannt für ihre luxuriösen Sportwagen und ihre Modelinie \"Prêt-à-porter\"?', 9, 1, 'Lamborghini', 'Maserati', 'Ferrari', 'Alfa Romea', 3, 1, 0),
(165, 'Welches Modehaus ist für seine ikonischen roten Sohlen an den Schuhen bekannt?', 9, 1, 'Jimmy Choo', 'Christian Dior', 'Christian Louboutin', 'Manolo Blahnik', 3, 1, 0),
(166, 'Welche berühmte britische Modedesignerin ist bekannt für ihre Printkleider und wurde als \"Queen of Prints\" bezeichnet?', 9, 2, 'Stella McCartney', 'Vivienne Westwood', 'Mary Quant', 'Diane von Fürstenberg', 2, 1, 0),
(167, 'Welche Modestile dominierten die 1980er Jahre mit ihren übertriebenen Silhouetten und auffälligen Farben?', 9, 2, 'Grunge', 'Minimalismus', 'Neue Romantik', 'New Wave', 3, 0, 0),
(168, 'Welcher französische Modedesigner ist bekannt für seine exzentrischen Kreationen und wurde als \"Enfant Terrible\" der Mode bezeichnet?', 9, 2, 'Jean-Paul Gaultier', 'Christian Lacroix', 'Yves Saint Laurent', 'Pierre Cardin', 1, 1, 0),
(169, 'Welcher Modedesigner wurde bekannt für seine Zusammenarbeit mit dem Filmregisseur Alfred Hitchcock und entwarf unter anderem das berühmte \"Bird Dress\"?', 9, 2, 'Hubert de Givenchy', 'Christian Dior', 'Valentino Garavani', 'Gianni Versace', 1, 1, 0),
(170, 'Welche britische Modedesignerin ist bekannt für ihre punkigen und avantgardistischen Designs und gründete das Modelabel \"Alexander McQueen\"?', 9, 2, 'Kate Moss', 'Stella McCartney', 'Vivienne Westwood', 'Sarah Burton', 3, 0, 0),
(171, 'Welcher Modedesigner ist bekannt für seine minimalistischen und zeitlosen Entwürfe und wurde als \"Kaiser\" der Mode bezeichnet?', 9, 3, 'Tom Ford', 'Karl Lagerfeld', 'Calvin Klein', 'Giorgio Armani', 2, 1, 0),
(172, 'Welche Modestile dominierten die 1970er Jahre mit ihrem Einfluss aus der Hippie-Kultur und dem Disko-Stil?', 9, 3, 'Grunge', 'Glam Rock', 'Boho-Chick', 'Minimalismus', 3, 1, 0),
(173, 'Welche Modestile waren typisch für die 1940er Jahre, geprägt durch Rationierungen und Einflüsse aus dem Krieg? ', 9, 3, 'Rockability', 'Utility Fashion', 'Teddy Boy Style', 'Fashion', 2, 0, 0),
(174, 'Welches Modehaus ist für seine \"No Logo\"-Philosophie bekannt und wurde durch seinen Gründer als eine Anti-Mode-Marke etabliert?', 9, 3, 'Alexander Wang', 'Raf Simons', 'Maison Margiela', 'Balenciaga', 3, 1, 0),
(175, 'Welche amerikanische Modedesignerin ist bekannt für ihre Entwürfe für die First Lady Michelle Obama und ihr Engagement für Nachhaltigkeit in der Mode?', 9, 3, 'Donna Karan', 'Tory Burch', 'Stella McCartney', 'Vera Wang', 3, 0, 0),
(176, 'Welcher japanische Modedesigner ist bekannt für seine avantgardistischen und technologisch inspirierten Kleider und gründete das Label \"Comme des Garçons\"?', 9, 4, 'Issey Miyake', 'Yohji Yamamoto', 'Rei Kawakubo', 'Junya Watanabe', 3, 1, 0),
(177, 'Welche historische Epoche beeinflusste die Mode des späten 17. Jahrhunderts mit ihren opulenten Kleidern, Schleifen und Reifröcken?', 9, 4, 'Barock', 'Rokoko', 'Renaissance', 'Viktorianisch', 1, 1, 0),
(178, 'Welcher belgische Modedesigner ist bekannt für seine minimalistischen und avantgardistischen Entwürfe und wurde als Mode-Ikone der 1980er und 1990er Jahre gefeiert?', 9, 4, 'Martin Margiela', 'Ann Demeulemeester', 'Raf Simons', 'Dries Van Noten', 3, 0, 0),
(179, 'Welche amerikanische Modedesignerin und Unternehmerin ist bekannt für ihre Luxusmarke und ihre Zusammenarbeit mit Puma für eine Sportbekleidungslinie?', 9, 4, 'Vera Wang', 'Tory Burch', 'Donna Karan', 'Rihanna', 4, 1, 0),
(180, 'Welcher italienische Modedesigner ist bekannt für seine kreative Leitung bei einem Modehaus und seine kontroversen politischen Aussagen?', 9, 4, 'Miuccia Prada', 'Stefano Gabbana', 'Riccardo Tisci', 'Alessandro Michele', 1, 0, 0),
(181, 'Was ist der erste Buchstabe im Alphabet?', 10, 1, 'B', 'A', 'D', 'C', 2, 1, 0),
(182, 'Toms Mutter hat drei Kinder: Tick, Trick und ...?', 10, 1, 'Track', 'Trick', 'Tom', 'Weiß man nicht', 3, 0, 0),
(183, 'Einige Monate haben 31 Tage, andere 30. Wie viele Monate haben 28 Tage?', 10, 2, 'Ein Monat', 'Erst drei Jahre keiner, dann in einem Jahr ein Monat', 'Alle Monate', 'Keiner', 3, 1, 0),
(184, 'Wie viele Exemplare pro Tierart nahm Moses mit auf die Arche?', 10, 2, '2', '3', '7', 'Er ging nicht auf die Arche', 4, 0, 0),
(185, 'Ein Obsthändler hat einen BMI-Wert von 25. Was wiegt er?', 10, 3, '90kg', 'Obst', '100kg', 'Man weiß es nicht', 2, 1, 0),
(186, 'Du hast eine Schachtel mit Streichhölzern und kommst in einen kalten Raum. Dort findest du eine Petroleumlampe, etwas Holz und einen Kamin. Was zündest du zuerst an?', 10, 3, 'Petroleumlampe', 'Holz', 'Kamin', 'Streichholz', 4, 0, 0),
(187, 'Wie oft kann man 1 von 20 abziehen?', 10, 4, '1 Mal', '19 Mal', '20 Mal', 'Unendlich Mal', 1, 1, 0),
(188, 'Ein Wettrennen. Du überholst den Läufer auf Platz zwei. Auf welchem Platz bist du dann?', 10, 4, 'Erster', 'Zweiter', 'Dritter', 'Vierte', 2, 0, 0),
(189, 'Auf einer Stange sitzen zehn Tauben. Ein Jäger schießt eine Taube ab. Wie viele bleiben sitzen?', 10, 1, 'Keine', '9', '10', '5', 1, 0, 0),
(190, 'Was ist schwerer (Vakuum): ein Kubikmeter Gold oder ein Kubikmeter Wasser?', 10, 2, 'Ein Kubikmeter Gold', 'Ein Kubikmeter Wasser', 'Beide sind gleich schwer', 'Man weiß es nicht', 1, 1, 0),
(191, 'Was ist schwerer (Vakuum): ein Kilo Gold oder ein Kilo Federn?', 10, 3, 'Ein Kilo Gold', 'Ein Kilo Federn', 'Beides ist gleich schwer', 'Man weiß es nicht', 3, 0, 0),
(192, 'Kann ein Mensch, der westlich von New York lebt, in Manchester begraben sein?', 10, 4, 'Ja', 'Nein', 'Man weiß es nicht', 'Nur wenn er in Manchester gestorben ist', 1, 0, 0),
(193, 'Ein Bauer hat 10 Schafe. Alle sterben, außer 9. Wie viele Schafe hat er noch?', 10, 1, '1 Schaf', '9 Schafe', '10 Schafe', 'Keine Schafe', 2, 1, 0),
(194, 'Berlin wird am Anfang mit einem \"B\" und hinten mit \"h\" geschrieben. Stimmt das? ', 10, 2, 'Ja', 'Nein', 'Berlin wird nur mit \"B\" geschrieben.', 'Kann man nicht wissen', 1, 0, 0),
(195, 'Wenn 30 Männer eine Villa in 10 Monaten bauen, wie lange dauert es, dieselbe Villa zu bauen, wenn man nur 15 Männer hat.', 10, 3, '0 Monate', '15 Monate', '20 Monate', 'Weiß man nicht', 1, 1, 0),
(196, 'Welche Ente läuft auf zwei Beinen?', 10, 4, 'Keine Ente', 'Donald Duck', 'Jede Ente', 'Weiß man nicht', 3, 1, 0),
(197, 'Was ist am tiefsten? Teller Oder Tasse?', 10, 1, 'Teller', 'Oder', 'Tasse', 'Weiß man nicht', 2, 1, 0),
(198, 'Welcher war der höchste Berg der Welt, bevor der Mount Everest entdeckt wurde?', 10, 2, 'Mount Godwin Austen', 'Mount Everest', 'Zugspitze', 'Großglockner', 2, 1, 0),
(199, 'Was ist beim Elefanten klein und beim Floh groß?', 10, 3, 'Der Saugrüssel', 'Das F', 'Die Familie', 'Der Wille', 2, 1, 0),
(200, '3 Katzen fressen 3 Mäuse in 3 Minuten. Wie lange brauchen dann 100 Katzen für 100 Mäuse?', 10, 4, '100 Minuten', '300 Minuten', '1 Minute', '3 Minuten', 4, 1, 0),
(201, 'Wer ist der griechische Gott des Meeres?', 11, 1, 'Zeus', 'Poseidon', 'Hades', 'Apollo', 2, 1, 0),
(202, 'Wer ist der nordische Gott des Donners?', 11, 1, 'Odin', 'Thor', 'Loki', 'Freyja', 2, 1, 0),
(203, 'Welche mythologische Figur ist bekannt für ihre Verwandlungsfähigkeit?', 11, 1, 'Herkules', 'Persephone', 'Medusa', 'Proteus', 4, 1, 0),
(204, 'Welche mythologische Gestalt hatte den Kopf eines Löwen und den Körper eines Menschen?', 11, 1, 'Zentaur', 'Minotaurus', 'Zyklop', 'Sphinx', 2, 0, 0),
(205, 'Welche mythologische Kreatur ist halb Pferd und halb Mensch?', 11, 1, 'Zentaur', 'Chimnäre', 'Harpyie', 'Sirene', 1, 1, 0),
(206, 'Wer ist die Göttin der Liebe und Schönheit in der griechischen Mythologie?', 11, 2, 'Athena', 'Aphrodite', 'Hera', 'Artemis', 2, 1, 0),
(207, 'Welcher Held ist bekannt für seinen Zug zur Unterwelt, um seine geliebte Frau Eurydike zurückzubringen?', 11, 2, 'Herakles', 'Odysseus', 'Orpheus', 'Achilles', 3, 0, 0),
(208, 'Wer ist der Hauptgott in der ägyptischen Mythologie, der oft als Falke dargestellt wird?', 11, 2, 'Ra', 'Osiris', 'Anubis', 'Horus', 4, 1, 0),
(209, 'Welche Figur in der nordischen Mythologie ist für seine Listigkeit und seinen Trickreichtum bekannt?', 11, 2, 'Odin', 'Freyr', 'Loki', 'Balder', 3, 1, 0),
(210, 'Welche mythologische Figur ist bekannt für das Halten des Himmels über ihren Schultern?', 11, 2, 'Atlas', 'Prometheus', 'Sisyphos', 'Herakles', 1, 1, 0),
(211, 'Welche mythologische Gestalt ist bekannt für das Verwandeln von Menschen in Stein mit ihrem Blick?', 11, 3, 'Medusa', 'Gorgon', 'Echidna', 'Lamia', 1, 1, 0),
(212, 'Welche Farbe hatte der Faden der Ariadne?', 11, 3, 'Gelbd', 'Gold', 'Blau', 'Rot', 4, 1, 0),
(213, 'Welcher Held aus der griechischen Mythologie wird oft als der Sohn der Göttin Thetis und des sterblichen Königs Peleus beschrieben?', 11, 3, 'Achilles', 'Hector', 'Perseus', 'Theseus', 1, 1, 0),
(214, 'Welche mythologische Figur ist der Fährmann der Toten in der griechischen Mythologie?', 11, 3, 'Charon', 'Hermes', 'Thanatos', 'Hades', 1, 1, 0),
(215, 'Wer ist der Herrscher der Unterwelt in der römischen Mythologie?', 11, 3, 'Pluto', 'Jupiter', 'Hades', 'Neptune', 1, 0, 0),
(216, 'Wer ist der Hauptgott der Maya-Mythologie, der als Schöpfergott und Regengott verehrt wird?', 11, 4, 'Quetzalcoatl', 'Huitzilpochtli', 'Xipe Totec', 'Itzamna', 4, 1, 0),
(217, 'Welche mythologische Figur ist bekannt für das Entfachen des Trojanischen Krieges durch das Goldene Apfel der Zwietracht?', 11, 4, 'Hera', 'Aphrodite', 'Artemis', 'Eris', 4, 1, 0),
(218, 'Welches mythische Wesen ist halb Mensch und halb Pferd und steht im Dienst von Artemis? ', 11, 4, 'Harpyie', 'Zentaur', 'Satyr', 'Nymph', 2, 0, 0),
(219, 'Welcher griechische Held ist bekannt für seine 12 Arbeiten, die er im Auftrag des Königs Eurystheus absolvierte?', 11, 4, 'Theseus', 'Perseus', 'Herakles', 'Jason', 3, 1, 0),
(220, 'Welche mythologische Figur wurde für ihre Schönheit von Paris zur schönsten Göttin gewählt, was zum Trojanischen Krieg führte?', 11, 4, 'Hera', 'Athena', 'Aphrodite', 'Artemis', 3, 1, 0),
(221, 'Welche Sprache wird hauptsächlich in Spanien gesprochen?', 12, 1, 'Französich', 'Italienisch', 'Spanisch', 'Portugiesisch', 3, 0, 0),
(222, 'Was ist die Amtssprache von Deutschland? ', 12, 1, 'Englisch', 'Französisch', 'Deutsch', 'Niederländisch', 3, 0, 0),
(223, 'Welche Sprache verwendet das kyrillische Alphabet?', 12, 1, 'Griechisch', 'Russisch', 'Arabisch', 'Hebräisch', 2, 1, 0),
(224, 'Wie viele Buchstaben hat das englische Alphabet?', 12, 1, '24', '26', '28', '30', 2, 1, 0),
(225, 'Was ist die meistgesprochene Muttersprache der Welt?', 12, 1, 'Englisch', 'Mandarin', 'Spanisch', 'Hindi', 4, 1, 0),
(226, 'Welche Sprache wird in Brasilien gesprochen?', 12, 2, 'Spanisch', 'Französisch', 'Italienisch', 'Portugiesisch', 4, 1, 0),
(227, 'Wie viele Fälle gibt es im Deutschen?', 12, 2, '2', '3', '4', '5', 3, 0, 0),
(228, 'Was ist die offizielle Sprache in Argentinien?', 12, 2, 'Portugiesisch', 'Italienisch', 'Spanisch', 'Englisch', 3, 1, 0),
(229, 'Wie viele Zeiten gibt es im Englischen?', 12, 2, '8', '12', '14', '16', 2, 1, 0),
(230, 'Welches der folgenden ist ein germanisches Alphabet?', 12, 2, 'Griechisches Alphabet', 'Runenalphabet', 'Lateinisches Alphabet', 'Hebräisches Alphabet', 2, 0, 0),
(231, 'Welche Sprache hat keine Artikel?', 12, 3, 'Deutsch', 'Russisch', 'Englisch', 'Französisch', 2, 0, 0),
(232, 'Was bedeutet der Begriff \"Morphem\" in der Linguistik?', 12, 3, 'Der kleinste lautliche Unterschied', 'Die kleinste bedeutungstragende Einheit', 'Ein Wort mit mehreren Bedeutungen', 'Eine Gruppe von Wörtern', 2, 1, 0),
(233, 'Welche Sprache hat die meisten Muttersprachler in Afrika?', 12, 3, 'Swahili', 'Hausa', 'Arabisch', 'Yoruba', 3, 1, 0),
(234, 'Was ist der Begriff für eine Sprachfamilie, die unter anderem Deutsch, Englisch und Schwedisch umfasst?', 12, 3, 'Romanische Sprachen', 'Slawische Sprachen', 'Germanische Sprachen', 'Semitische Sprachen', 3, 1, 0),
(235, 'Wie heißt die Wissenschaft, die sich mit der Bedeutung von Wörtern beschäftigt?', 12, 3, 'Phonetik', 'Morphologie', 'Semantik', 'Syntax', 4, 0, 0),
(236, 'Welches Land hat die meisten Amtssprachen?', 12, 4, 'Indien', 'Südafrika', 'Schweiz', 'Kanada', 2, 1, 0),
(237, 'China wird im Chinesischen auch nach der Staatsgründung durch Mao Zedong als \"Zhōngguó\" bezeichnet. Aber was heißt das übersetzt?', 12, 4, 'China', 'Nördlicher Staat', 'Zentraler Staat', 'Sonnenstaat', 3, 1, 0),
(238, 'Welcher Linguist ist bekannt für die Theorie der Universalgrammatik?', 12, 4, 'Ferdinand de Saussure', 'Edward Sapir', 'Noam Chomsky', 'Leonard Boomfield', 3, 1, 0),
(239, 'Was bedeutet der Begriff \"Diglossie\"?', 12, 4, 'Eine Sprache mit zwei Alphabeten', 'Die Verwendung von zwei Sprachvarietäten in einer Gesellschaft', 'Die Vermischung von zwei Sprachen', 'Das Erlernen einer zweiten Sprache', 2, 0, 0),
(240, 'Wie nennt man den Prozess, bei dem Laute am Ende eines Wortes weggelassen werden?', 12, 4, 'Assimilation', 'Elision', 'Dissimilation', 'Epenthese', 2, 0, 0),
(241, 'Welche Religion hat den Propheten Muhammad als ihren Gründer und das heilige Buch namens Koran?', 13, 1, 'Christentum', 'Judentum', 'Buddhismus', 'Islam', 4, 1, 0),
(242, 'Welches jüdische Fest wird auch als \"Fest der Lichter\" bezeichnet und dauert acht Tage?', 13, 1, 'Jom Kippur', 'Chanukka', 'Purim', 'Sukkot', 2, 1, 0),
(243, 'Welches christliche Fest feiern Christen zur Erinnerung an die Geburt Jesu Christi?', 13, 1, 'Ostern', 'Pfingsten', 'Weihnachten', 'Fronleichnam', 3, 1, 0),
(244, 'Wer war der Gründer des Christentums und wird als der Sohn Gottes verehrt?', 13, 1, 'Moses', 'Jesus Christus', 'Paulus von Tarsus', 'Johannes der Täufer', 2, 1, 0),
(245, 'Welches muslimische Fest markiert das Ende des Fastenmonats Ramadan?', 13, 1, 'Eid al-Fitr', 'Eid al-Adha', 'Mawlid al-Nabi', 'Laylat al-Qadr', 1, 0, 0),
(246, 'Welcher heilige Fluss ist für Hindus heilig?', 13, 2, 'Nil', 'Tigris', 'Indus', 'Ganges', 4, 0, 0),
(247, 'Welches christliche Fest wird 40 Tage nach Ostern gefeiert und erinnert an die Himmelfahrt Jesu Christi?', 13, 2, 'Weihnachten', 'Fronleichnam', 'Pfingsten', 'Mariä Himmelfahrt', 2, 1, 0),
(248, 'Wer war der Gründer des Sikhismus und was ist ihr heiliges Buch?', 13, 2, 'Guru Nanak / Guru Granth Sahib', 'Siddhartha Gautama / Tripitaka', 'Muhammad / Koran', 'Moses / Torah', 1, 1, 0),
(249, 'Welche Religion verehrt die heilige Stadt Mekka und hält die Pilgerfahrt nach Mekka (Haddsch) für eine der fünf Säulen des Glaubens?', 13, 2, 'Judentum', 'Islam', 'Buddhismus', 'Christentum', 2, 1, 0),
(250, 'Welche heilige Schrift der Juden enthält die fünf Bücher von Moses und bildet die Grundlage für das jüdische Gesetz und die Ethik?', 13, 2, 'Talmud', 'Torah', 'Bibel', 'Koran', 2, 1, 0),
(251, 'Welche christliche Konfession ist bekannt für ihre strenge Lebensweise, Enthaltsamkeit und asketische Praxis?', 13, 3, 'Katholizismus', 'Orthodoxes Christentum', 'Protestantismus', 'Amish', 4, 1, 0),
(252, 'Welche Religion hat die „Vier Edlen Wahrheiten“ und den „Achtgliedrigen Pfad“ als zentrale Lehren?', 13, 3, 'Daoismus', 'Buddhismus', 'Hinduismus', 'Jainismus', 2, 1, 0),
(253, 'Welches hinduistische Fest wird in Indien und Nepal als \"Festival of Lights\" gefeiert und symbolisiert den Sieg des Lichts über die Dunkelheit?', 13, 3, 'Diwali', 'Holi', 'Navaratri', 'Rashka Bandhan', 1, 0, 0),
(254, 'Welche spirituelle Tradition betont die Einheit allen Seins, die Bedeutung der Meditation und hat ihre Wurzeln in Indien?', 13, 3, 'Zen-Buddhismus', 'Sufismus', 'Hare Krishna', 'Advaita Vedanta', 4, 1, 0),
(255, 'Welche Religion ist bekannt für ihre Praktiken wie das Fasten im Ramadan, die Pilgerfahrt nach Mekka und die täglichen Gebete?', 13, 3, 'Sikhismus', 'Zoroastrismus', 'Islam', 'Judentum', 3, 1, 0),
(256, 'Welche religiöse Bewegung in Japan verehrt die Naturgeister (Kami), hat Schreine als heilige Orte und feiert Feste wie das Hanami?', 13, 4, 'Shintoismus', 'Daoismus', 'Konfuzianismus', 'Zen-Buddhismus', 1, 1, 0),
(257, 'Welche hinduistische Gottheit gilt als der Schöpfer, Bewahrer und Zerstörer des Universums und wird oft mit den Attributen Dreizack, Schlange und Löwe dargestellt?', 13, 4, 'Shiva', 'Vishnu', 'Brahma', 'Krishna', 1, 1, 0),
(258, 'Welche religiöse Bewegung betont die Gewaltlosigkeit (Ahimsa), den Verzicht auf weltliche Besitztümer und respektiert alle Lebensformen?', 13, 4, 'Daoismus', 'Zen-Buddhismus', 'Jainismus', 'Sufismus', 3, 0, 0),
(259, 'Welche christliche Konfession ist bekannt für ihre strikte Einhaltung des Sabbats, die Taufe durch Untertauchen und ihre Zurückhaltung gegenüber politischen Engagements?', 13, 4, 'Katholizismus', 'Orthodoxes Christentum', 'Adventisten', 'Lutheraner', 3, 1, 0),
(260, 'Welche spirituelle Tradition betont die Existenz Gottes als eine absolute Realität und die Illusion der getrennten individuellen Existenz?', 13, 4, 'Hare Krishna', 'Zen-Buddhismus', 'Advaita Vedanta', 'Sufismus', 3, 1, 0),
(261, 'Der Befriff RAM bedeutet', 14, 1, 'Random Advanced Memory', 'Real Available Memory', 'Random Access Memory', 'Real Advanced Memory', 3, 0, 0),
(262, 'Der Begriff ROM bedeutet', 14, 1, 'Random Only Memory', 'Read Only Memory', 'Real Offline Memory', 'Random Offline memory', 2, 1, 0),
(263, 'Der Begriff CPU bedeutet', 14, 1, 'Central Processing Unit', 'Cheap Packaging Unit', 'Central Providing Unit', 'Central Providing Unit', 1, 0, 0),
(264, 'Der Begriff BIOS bedeutet', 14, 1, 'Basic Input Operating System', 'Basic Input Output System', 'Basic Input Opening System', 'Basic Integer Operating System', 2, 1, 0),
(265, 'Der Begriff UEFI bedeutet', 14, 1, 'Unified Extra Firmware Interface', 'Unified Extensions For Interfaces', 'Unified Extra Files Interface', 'Unified Extensible Firmware Interface', 4, 0, 0),
(266, 'Welches Betriebssystem wird am häufigsten verwendet', 14, 2, 'Windows', 'Android', 'iOS', 'MacOS', 2, 0, 0),
(267, 'Was versteht man unter einem Mainframe?', 14, 2, 'Einen zentralen Großcomputer', 'Einen lokalen Server', 'Einen Bilderrahmen', 'Einen Druckserver', 1, 1, 0),
(268, 'Wie viele Bits ergeben ein Byte?', 14, 2, '4', '12', '2', '8', 4, 1, 0),
(269, 'Aus welchen Worten setzt sich der Begriff Informatik zusammen? ', 14, 2, 'Intelligenz und Mathematik', 'Information und Merchandise', 'Intelligenz und Maschine', 'Information und Mathematik', 4, 0, 0),
(270, ' Was kann man mit dem \"Kurzzeitspeicher\" des Gehirns vergleichen?', 14, 2, 'Festplatte', 'Bildschirm', 'Arbeitsspeicher', 'Tastatur', 3, 0, 0),
(271, 'Was ist das EVA-Prinzip?', 14, 3, 'Eingabe, Verwechslung, Annahme', 'Eingabe, Verarbeitung, Annahme', 'Eingabe, Verarbeitung, Ausgabe', 'Abgabe, Verarbeitung, Annahme', 3, 1, 0),
(272, 'Was unterscheidet Linux von Windows?', 14, 3, 'Linux ist kein Betriebssystem', 'Windows ist kein Betriebssystem', 'Linux hat keinen Bootloader', 'Windows hat keinen Bootloader', 1, 0, 0),
(273, 'Was versteht man unter RAID Volumes?', 14, 3, 'Ein optimiertes Speichersystem für Server', 'Eine Spiegelung einer Festplatte', 'Eine Konvertierung in ein anderes Dateisystem', 'Ein Virtueller Server-Raum', 2, 0, 0),
(274, 'Was versteht man unter einer Fork-Bomb?', 14, 3, 'Ein Prozess der den Bildschirm mit Gabeln bombardiert', 'Ein Prozess der sich beim Ausführen in neue Prozesse spaltet', 'Ein Prozess der jemandem Administratorrechte beschafft', 'Ein Prozess der die Festplatte formatiert', 2, 1, 0),
(275, 'Für was wird \"sudo\" vor Linux Befehlen angeheftet?', 14, 3, 'Dekorationszwecke', 'Um den Prozess gesichert auszuführen', 'Um eine Datei zu öffnen', 'Um einen Prozess mit Administratorrechten auszuführen', 4, 0, 0),
(276, 'Welcher Prozess ist EINE Forkbomb', 14, 4, 'sudo forkbomb', ':(){ :|:& };:', ':(fork){ :|:& };:', ':(forkbomb){ :|:& };:', 2, 0, 0),
(277, 'Was bedeutet DE im Bezug auf Betriebssysteme?', 14, 4, 'Deutschland', 'Desktop Environment', 'Denial Executor', 'Desktop Enroll', 2, 1, 0),
(278, 'Wie wird die Zahl 23 in Binär geschrieben?', 14, 4, '11001', '11111', '1000', '10111', 4, 0, 0),
(279, 'Welcher Farbe entspricht #FFFFFF', 14, 4, 'Weiß', 'Rot', 'Blau', 'Schwarz', 1, 0, 0),
(280, 'Was bedeutet CDN?', 14, 4, 'Controlling Directional Networks', 'Content Delivery Network', 'Central Delayed Network', 'Controlling Damages Network', 2, 1, 0),
(281, 'Welches Tier ist bekannt dafür, der \"König der Tiere\" genannt zu werden?', 15, 1, 'Löwe', 'Elefant', 'Tiger', 'Wolf', 1, 1, 0),
(282, 'Welches dieser Tiere kann fliegen?', 15, 1, 'Elefant', 'Pinguin', 'Adler', 'Wal', 3, 1, 0),
(283, 'Welche dieser Arten ist ein Säugetier?', 15, 1, 'Hai', 'Delfin', 'Krokodil', 'Eidechse', 2, 1, 0),
(284, 'Welches Tier ist für seine schwarz-weißen Streifen bekannt?', 15, 1, 'Zebra', 'Leopard', 'Panther', 'Giraffe', 1, 0, 0),
(285, 'Welches Tier ist das größte lebende Landtier?', 15, 1, 'Nashorn', 'Giraffe', 'Elefant', 'Büffel', 3, 1, 0),
(286, 'Welches dieser Tiere ist ein Pflanzenfresser?', 15, 2, 'Löwe', 'Wolf', 'Kaninchen', 'Fuchs', 3, 1, 0),
(287, 'Welches Tier kann seine Farbe ändern, um sich an seine Umgebung anzupassen?', 15, 2, 'Chamäleon', 'Krokodil', 'Schlange', 'Schildkröte', 1, 1, 0),
(288, 'Welches Säugetier kann als einziges fliegen?', 15, 2, 'Flughund', 'Fledermaus', 'Kolibri', 'Maulwurf', 2, 1, 0),
(289, 'Welches Tier hat den stärksten Bissdruck?', 15, 2, 'Krokodil', 'Löwe', 'Hai', 'Tiger', 1, 1, 0),
(290, 'Welches Tier wird als das schnellste Landtier der Welt angesehen?', 15, 2, 'Gepard', 'Löwe', 'Gazelle', 'Leopard', 1, 0, 0),
(291, 'Welches Tier ist für seine Fähigkeit bekannt, sich im Dunkeln zu orientieren, indem es Ultraschallwellen aussendet?', 15, 3, 'Eule', 'Fledermaus', 'Wolf', 'Fuchs', 2, 1, 0),
(292, 'Welches Tier ist das größte Raubtier der Erde?', 15, 3, 'Löwe', 'Grizzlybär', 'Weißer Hai', 'Eisbär', 4, 1, 0),
(293, 'Welches dieser Tiere lebt in der Arktis?', 15, 3, 'Känguru', 'Eisbär', 'Pinguin', 'Elefant', 2, 0, 0),
(294, 'Welches Tier hält einen Rekord für die längste Wanderung?', 15, 3, 'Afrikanischer Elefant', 'Monarchfalter', 'Blauwal', 'Zugvogel (Arktische Küstenseeschwalbe)', 4, 1, 0),
(295, 'Welches Tier hat die längste Lebensdauer?', 15, 3, 'Elefant', 'Galapagos-Riesenschildkröte', 'Blauwal', 'Rote Waldameise', 2, 1, 0),
(296, 'Welches Tier hat ein Herz, das etwa 10% seines Körpergewichts ausmacht?', 15, 4, 'Blauwal', 'Elefant', 'Känguru', 'Pferd', 1, 1, 0),
(297, 'Welches Tier hat die meisten Zähne? ', 15, 4, 'Krokodil', 'Schnecke', 'Hai', 'Walross', 2, 1, 0),
(298, 'Welches Tier ist in der Lage, extrem lange ohne Wasser auszukommen?', 15, 4, 'Dromedar', 'Giraffe', 'Koala', 'Puma', 1, 0, 0),
(299, 'Welches Tier kann am längsten ohne Schlaf auskommen?', 15, 4, 'Mensch', 'Elefant', 'Delphin', 'Wal', 3, 1, 0),
(300, 'Welches Tier ist für seine extrem giftigen Stacheln bekannt, die tödlich für Menschen sein können?', 15, 4, 'Skorpion', 'Schwarze Witwe', 'Steinwels', 'Kegelschnecke', 4, 1, 0),
(301, 'Welches Sternzeichen ist vom 21. März bis 19. April aktiv?', 16, 1, 'Stier', 'Widder', 'Zwillinge', 'Fische', 2, 0, 0),
(302, 'Welches Sternzeichen ist für den Monat Juli bekannt?', 16, 1, 'Löwe', 'Krebs', 'Jungfrau', 'Waage', 2, 0, 0);
INSERT INTO `fragen` (`fragenid`, `frage`, `thema`, `schwierigkeit`, `antwort1`, `antwort2`, `antwort3`, `antwort4`, `antwortrichtig`, `gestellt`, `aktiv`) VALUES
(303, 'Welches Sternzeichen wird oft als besonders emotional beschrieben?', 16, 1, 'Steinbock', 'Zwillinge', 'Krebs', 'Schütze', 3, 1, 0),
(304, 'Welche Planeten sind in der Astrologie als persönliche Planeten bekannt?', 16, 1, 'Saturn und Uranus', 'Venus und Mars', 'Neptun und Pluto', 'Jupiter und Saturn', 2, 0, 0),
(305, 'Welches Sternzeichen ist vom 23. August bis 22. September aktiv?', 16, 1, 'Löwe', 'Jungfrau', 'Waage', 'Skorpion', 2, 1, 0),
(306, 'Welches Sternzeichen wird von dem Planeten Venus regiert?', 16, 2, 'Skorpion', 'Fische', 'Waage', 'Schütze', 3, 0, 0),
(307, 'Welche Elemente sind den Sternzeichen zugeordnet?', 16, 2, 'Metall, Holz, Wasser, Erde', 'Feuer, Wasser, Licht, Dunkel', 'Erde, Wasser, Luft, Metall', 'Erde, Wasser, Luft, Feuer', 4, 1, 0),
(308, 'Welche der folgenden Sternzeichen sind Erdzeichen?', 16, 2, 'Stier, Jungfrau, Steinbock', 'Widder, Löwe, Schütze', 'Krebs, Skorpion, Fische', 'Zwillinge, Waage, Wassermann', 1, 1, 0),
(309, 'Welche der folgenden Eigenschaften wird typischerweise dem Sternzeichen Zwillinge zugeschrieben?', 16, 2, 'Praktisch und bodenständig', 'Emotional und sensibel', 'Neugierig und kommunikativ', 'Ehrgeizig und diszipliniert', 3, 0, 0),
(310, 'Welches Sternzeichen ist als der „König der Tiere“ bekannt?', 16, 2, 'Löwe', 'Widder', 'Stier', 'Schütze', 1, 0, 0),
(311, 'Welches Sternzeichen ist mit dem Element Wasser verbunden und regiert vom Planeten Neptun?', 16, 3, 'Skorpion', 'Fische', 'Krebs', 'Steinbock', 2, 0, 0),
(312, 'Welcher Planet ist der Herrscher über das Sternzeichen Wassermann?', 16, 3, 'Saturn', 'Uranus', 'Jupiter', 'Merkur', 2, 0, 0),
(313, 'Welche drei Sternzeichen gehören zu den Luftzeichen?', 16, 3, 'Zwillinge, Waage, Wassermann', 'Krebs, Skorpion, Fische', 'Widder, Löwe, Schütze', 'Stier, Jungfrau, Steinbock', 1, 1, 0),
(314, 'Welches Sternzeichen wird oft als besonders zielstrebig und ehrgeizig beschrieben?', 16, 3, 'Schütze', 'Zwillinge', 'Steinbock', 'Waage', 3, 1, 0),
(315, 'Welches Sternzeichen ist bekannt für seine Leidenschaft und Intensität?', 16, 3, 'Löwe', 'Widder', 'Jungfrau', 'Skorpion', 4, 0, 0),
(316, 'Welches Sternzeichen ist dem Planeten Pluto zugeordnet?', 16, 4, 'Skorpion', 'Steinbock', 'Schütze', 'Waage', 1, 1, 0),
(317, 'Welcher Astrologische Begriff beschreibt die Position eines Planeten im 10. Haus?', 16, 4, 'Aszendent', 'Medium Coeli (MC)', 'Imum Coeli (IC)', 'Deszendent', 2, 0, 0),
(318, 'In der traditionellen Astrologie, welcher Planet wird als der „Große Wohltäter“ bezeichnet?', 16, 4, 'Venus', 'Jupiter', 'Saturn', 'Merkur', 2, 0, 0),
(319, 'Welche Bedeutung hat das Sternzeichen im 1. Haus in einem Geburtshoroskop?', 16, 4, 'Es beschreibt die Kommunikation und geistigen Fähigkeiten ', 'Es zeigt die Beziehungen und Partnerschaften an', 'Es beschreibt die Persönlichkeit und das äußere Erscheinungsbild', 'Es zeigt die Karriere und das öffentliche Ansehen an', 3, 1, 0),
(320, 'Welches Sternzeichen wird mit den Körperteilen Knöchel und Unterschenkel in Verbindung gebracht?', 16, 4, 'Wassermann', 'Steinbock', 'Fische', 'Jungfrau', 1, 0, 0),
(321, 'Was ist der medizinische Begriff für Bluthochdruck?', 17, 1, 'Hypotonie', 'Hypertonie', 'Hypoglykämie', 'Hyperglykämie', 2, 1, 0),
(322, 'Welches Organ ist für die Produktion von Insulin verantwortlich?', 17, 1, 'Leber', 'Niere', 'Bauspeicheldrüse', 'Magen', 3, 1, 0),
(323, 'Wie viele Kammern hat das menschliche Herz?', 17, 1, '2', '3', '4', '5', 3, 0, 0),
(324, 'Welches Vitamin wird hauptsächlich durch Sonneneinstrahlung in der Haut produziert?', 17, 1, 'Vitamin A', 'Vitamin B12', 'Vitamin C', 'Vitamin D', 4, 1, 0),
(325, 'Wie wird der medizinische Fachbereich genannt, der sich mit Hautkrankheiten befasst?', 17, 1, 'Kardiologie', 'Dermatologie', 'Neurologie', 'Gastroenterologie', 2, 1, 0),
(326, 'Welche Blutgruppe gilt als Universalspender?', 17, 2, 'A', 'B', 'AB', '0', 4, 1, 0),
(327, 'Was ist die Hauptfunktion der roten Blutkörperchen? ', 17, 2, 'Immunabwehr', 'Sauerstofftransport', 'Blutgerinnung', 'Nährstofftransport', 2, 1, 0),
(328, 'Welche Krankheit wird durch das Bakterium Mycobacterium tuberculosis verursacht?', 17, 2, 'Cholera', 'Tuberkulose', 'Typhus', 'Pest', 2, 1, 0),
(329, 'Welches Mineral ist wichtig für die Blutgerinnung?', 17, 2, 'Kalzium', 'Magnesium', 'Kalium', 'Eisen', 1, 1, 0),
(330, 'Wie viele Knochen hat ein erwachsener Mensch? ', 17, 2, '186', '206', '226', '246', 2, 0, 0),
(331, 'Welche Struktur im Auge ist für die Fokussierung des Lichts auf die Netzhaut verantwortlich?', 17, 3, 'Hornhaut', 'Pupille', 'Linse', 'Iris', 3, 1, 0),
(332, 'Welche der folgenden Erkrankungen wird durch einen Mangel an Vitamin B12 verursacht?', 17, 3, 'Skorbut', 'Rachitis', 'Perniziöse Anämie', 'Beriberi', 3, 1, 0),
(333, 'Was ist der medizinische Fachbegriff für die Entfernung des Blinddarms?', 17, 3, 'Appendektomie', 'Cholezystektomie', 'Gastrektomie', 'Hysterektomie', 1, 0, 0),
(334, 'Welches Hormon wird von der Schilddrüse produziert?', 17, 3, 'Insulin', 'Adrenalin', 'Thyroxin', 'Cortisol', 3, 1, 0),
(335, 'Welcher Teil des Gehirns ist hauptsächlich für die Koordination und das Gleichgewicht zuständig?', 17, 3, 'Großhirn', 'Kleinhirn', 'Zwischenhirn', 'Hirnstamm', 2, 1, 0),
(336, 'Welches Enzym ist für die Spaltung von Proteinen im Magen verantwortlich?', 17, 4, 'Amylase', 'Lipase', 'Pepsin', 'Trypsin', 3, 1, 0),
(337, 'Welche Krankheit wird durch das Epstein-Barr-Virus (EBV) verursacht?', 17, 4, 'Hepatitis', 'Pfeiffersches Drüsenfieber', 'Gelbfieber', 'Malaria', 2, 1, 0),
(338, 'Wie nennt man die Wissenschaft, die sich mit den Hormonen und dem endokrinen System beschäftigt? ', 17, 4, 'Nephrologie', 'Endokrinologie', 'Onkologie', 'Rheumatologie', 2, 1, 0),
(339, 'Was ist der medizinische Begriff für die Netzhautablösung? ', 17, 4, 'Retinopathie', 'Glaukom', 'Katarakt', 'Amotio retinae', 4, 1, 0),
(340, 'Welches Antibiotikum wurde als erstes entdeckt und von wem?', 17, 4, 'Penicilin von Alexander Fleming', 'Penicilin von Selman Waksman', 'Tetracyclin von Benjamin Duggar', 'Tetracyclin von George Lesher', 1, 0, 0),
(341, 'Welches ist das größte Land der Welt nach Fläche?', 18, 1, 'Kanada', 'China', 'USA', 'Russland', 4, 1, 0),
(342, 'Wie viele Kontinente gibt es auf der Erde?', 18, 1, '5', '6', '7', '8', 3, 1, 0),
(343, 'Wer schrieb das Theaterstück \"Romeo und Julia\"?', 18, 1, 'Johann Wolfgang von Goethe', 'Friedrich Schiller', 'William Shakespeare', 'Charles Dickens', 3, 0, 0),
(344, 'Welches Element hat das chemische Symbol O?', 18, 1, 'Gold', 'Silber', 'Sauerstoff', 'Wasserstoff', 3, 0, 0),
(345, 'Wie heißt das größte Organ des menschlichen Körpers?', 18, 1, 'Herz', 'Lunge', 'Leber', 'Haut', 4, 1, 0),
(346, 'Welches Land hat die meisten Einwohner?', 18, 2, 'USA', 'Indien', 'China', 'Indonesien', 3, 1, 0),
(347, 'Wie heißt der Prozess, bei dem Pflanzen Lichtenergie in chemische Energie umwandeln? ', 18, 2, 'Respiration', 'Photosynthese', 'Transpiration', 'Fermentation', 2, 1, 0),
(348, 'In welchem Jahr begann der Zweite Weltkrieg?', 18, 2, '1937', '1938', '1933', '1939', 4, 1, 0),
(349, 'Was ist die Hauptstadt von Australien?', 18, 2, 'Sydney', 'Melbourne', 'Canberra', 'Adelaide', 3, 0, 0),
(350, 'Welches Tier ist bekannt dafür, dass es im Durchschnitt die längste Lebensdauer hat?', 18, 2, 'Elefant', 'Schildkröte', 'Blauwal', 'Adler', 2, 0, 0),
(351, 'Wer entwickelte die Relativitätstheorie?', 18, 3, 'Albert Einstein', 'Isaac Newton', 'Niels Bohr', 'Galileo Galilei', 1, 0, 0),
(352, 'Wie viele Planeten hat unser Sonnensystem?', 18, 3, '7', '8', '9', '10', 2, 1, 0),
(353, 'Was ist die Hauptstadt von Kanada?', 18, 3, 'Toronto', 'Vancouver', 'Ottawa', 'Montreal', 3, 0, 0),
(354, 'Wie viele Bundesländer hat Deutschland?', 18, 3, '14', '15', '16', '17', 3, 1, 0),
(355, 'Was ist die größte Wüste der Welt?', 18, 3, 'Gobi', 'Sahara', 'Kalahari', 'Atacama', 2, 1, 0),
(356, 'Wer schrieb \"Die Physiker\"?', 18, 4, 'Bertolt Brecht', 'Max Frish', 'Friedrich Dürrenmatt', 'Heinrich Böll', 3, 1, 0),
(357, 'Was ist die chemische Formel für Ammoniak?', 18, 4, 'H2O', 'CO2', 'NH3', 'CH4', 3, 1, 0),
(358, 'Für welches Element steht Au im Periodensystem', 18, 4, 'Ununoctium', 'Gold', 'Quecksilber', 'Röntgenium', 2, 1, 0),
(359, 'Welcher französische Kaiser wurde 1815 in der Schlacht von Waterloo besiegt?', 18, 4, 'Ludwig XIV.', 'Napoleon Bonaparte', 'Karl der Große', 'Ludwig XVI.', 2, 0, 0),
(360, 'In welchem Jahr fiel die Berliner Mauer?', 18, 4, '1991', '1963', '1945', '1989', 4, 0, 0),
(361, 'Welches Spielzeug ist eine berühmte Puppe, die 1959 von Mattel eingeführt wurde?', 19, 1, 'Cindy', 'Bratz', 'Barbie', 'American Girl', 3, 1, 0),
(362, 'Welche Farbe hat das Kleid der Prinzessin in dem klassischen Brettspiel \"Candyland\"?', 19, 1, 'Blau', 'Gelb', 'Pink', 'Grün', 3, 1, 0),
(363, 'Was ist das Ziel des Spiels \"Jenga\"?', 19, 1, 'Alle Steine zu entfernen', 'Die höchste Anzahl an Punkten zu erzielen', 'Den Turm nicht zum Einsturz zu bringen', 'Den Gegner zu besiegen', 3, 0, 0),
(364, 'Welches dieser Spielzeuge besteht hauptsächlich aus kleinen, ineinander steckbaren Plastiksteinen?', 19, 1, 'Playmobil', 'Lincoln Logs', 'K NEX', 'Lego', 4, 1, 0),
(365, 'Wie viele Spieler werden für ein traditionelles Schachspiel benötigt?', 19, 1, '1', '2', '3', '4', 2, 0, 0),
(366, 'Was ist das Ziel des Spiels \"Monopoly\"?', 19, 2, 'Alle Straßen zu kaufen', 'Die meisten Häußer zu bauen', 'Alle Mitspieler in den Bankrott zu treiben', 'Die längste Spielzeit zu erreichen', 3, 1, 0),
(367, 'Welches Spielzeug enthält Figuren wie He-Man und Skeletor?', 19, 2, 'Transformers', 'G.I. Joe', 'Masters of the Universe', 'Thundercats', 3, 1, 0),
(368, 'Was ist die Hauptsprache im Spiel \"Scrabble\"?', 19, 2, 'Französisch', 'Deutsch', 'Englisch', 'Spanisch', 3, 0, 0),
(369, 'Welches Brettspiel enthält die Karten \"Chance\" und \"Community Chest\"?', 19, 2, 'Cluedo', 'Risiko', 'Monopoly', 'Siedler von Catan', 3, 1, 0),
(370, 'Welche Farbe hat die Zahl 1 in Uno?', 19, 2, 'Blau', 'Grün', 'Rot', 'Gelb', 3, 0, 0),
(371, 'Welche Spielzeugfirma produziert die \"Hot Wheels\" Autos?', 19, 3, 'Hasbro', 'Mattel', 'Lego', 'Fisher-Price', 2, 1, 0),
(372, 'Wie heißt die Figur mit dem ikonischen grünen Hut und dem Schwert aus der \"The Legend of Zelda\"-Spielreihe?', 19, 3, 'Mario', 'Link', 'Samus', 'Kirby', 2, 1, 0),
(373, 'In welchem Jahr wurde das erste \"Pokémon\"-Spiel veröffentlicht?', 19, 3, '1992', '1996', '1998', '2000', 2, 0, 0),
(374, 'Wie heißt das Spiel, bei dem Spieler um den Planeten reisen und Fragen beantworten müssen, um farbige Keile zu gewinnen? ', 19, 3, 'Risiko', 'Siedler von Catan', 'Trivial Pursuit', 'Carcasonne', 3, 1, 0),
(375, 'Welches Spielzeug basiert auf einem mechanischen Tier, das \"wachst\" und \"aufzieht\"?', 19, 3, 'Furby', 'Tamagotchi', 'My Little Pony', 'Transformers', 2, 0, 0),
(376, 'Wer erfand das Spiel \"Schach\"?', 19, 4, 'Chinesen', 'Inder', 'Perser', 'Ägypter', 2, 0, 0),
(377, 'Wie viele Original-Pokémon gab es in der ersten Generation?', 19, 4, '121', '151', '199', '293', 2, 1, 0),
(378, 'Welche Farbe hat der Oberkörper von \"Super Mario\"?', 19, 4, 'Grün', 'Gelb', 'Rot', 'Blau', 3, 0, 0),
(379, 'In welchem Jahr wurde das Spiel \"Twister\" veröffentlicht?', 19, 4, '1955', '1966', '1977', '1988', 2, 1, 0),
(380, 'Welches Unternehmen hat das berühmte Spiel \"Magic: The Gathering\" veröffentlicht?', 19, 4, 'Bandai', 'Wizard of the Coast', 'Konami', 'Upper Deck', 2, 1, 0),
(381, 'Welcher Fluss ist der längste der Welt?', 20, 1, 'Amazonas', 'Nil', 'Yangtse', 'Mississippi', 2, 0, 0),
(382, 'In welchem Land befindet sich der Amazonas-Regenwald hauptsächlich?', 20, 1, 'Kolumbien', 'Peru', 'Brasilien', 'Venezuela', 3, 0, 0),
(383, 'Welches ist das größte Land der Welt nach Fläche?', 20, 1, 'Kanada', 'China', 'USA', 'Russland', 4, 1, 0),
(384, 'Welcher ist der höchste Berg der Welt?', 20, 1, 'K2', 'Großglockner', 'Mount Everest', 'Lhotse', 3, 0, 0),
(385, 'Welche Wüste ist die größte der Welt?', 20, 1, 'Gobi', 'Kalahari', 'Sahara', 'Atacama', 3, 0, 0),
(386, 'Welcher Kontinent hat die meisten Länder?', 20, 2, 'Asien', 'Afrika', 'Europa', 'Südamerika', 2, 0, 0),
(387, 'Welcher Fluss fließt durch Paris?', 20, 2, 'Themse', 'Seine', 'Donau', 'Rhein', 2, 1, 0),
(388, 'Was ist die Hauptstadt von Australien', 20, 2, 'Sydney', 'Brisbane', 'Melbourne', 'Canberra', 4, 0, 0),
(389, 'Welche Insel liegt westlich von Italien und gehört zu Frankreich?', 20, 2, 'Sizilien', 'Sardinien', 'Korsika', 'Kreta', 3, 0, 0),
(390, 'Welches ist das einzige Land in Südamerika, dessen Amtssprache Portugiesisch ist?', 20, 2, 'Argentinien', 'Venezuela', 'Brasilien', 'Kolumbien', 3, 0, 0),
(391, 'Welche Stadt ist die südlichste Hauptstadt der Welt? ', 20, 3, 'Canberra, Australien', 'Wellington, Neuseeland', 'Santiago, Chile', 'Montevideo, Uruguay', 2, 0, 0),
(392, 'Welches ist das einzige Land, das zwei Kontinente überspannt?', 20, 3, 'Ägypten', 'Türkei', 'Russland', 'Griechenland', 2, 0, 0),
(393, 'Welcher See ist der tiefste der Welt?', 20, 3, 'Tanganjikasee', 'Baikalsee', 'Viktoriasee', 'Huronsee', 2, 0, 0),
(394, 'Welches Land hat die meisten aktiven Vulkane?', 20, 3, 'USA', 'Indonesien', 'Japan', 'Chile', 2, 0, 0),
(395, 'Welcher Fluss bildet die natürliche Grenze zwischen den USA und Mexiko?', 20, 3, 'Colorado', 'Mississippi', 'Rio Grande', 'Missouri', 3, 1, 0),
(396, 'Welches Land ist das kleinste Land der Welt?', 20, 3, 'San Marino', 'Monaco', 'Vatikan', 'St. Kitts and Newis', 3, 0, 0),
(397, 'Welche Stadt liegt am Bosporus?', 20, 4, 'Athen', 'Rom', 'Istanbul', 'Kairo', 3, 1, 0),
(398, 'In welchem US-Bundesstaat stehen die höchsten Bäume?', 20, 4, 'Washington', 'Colorado', 'Florida', 'Kalifornien', 4, 0, 0),
(399, 'Welches Land hat die längste Küstenlinie?', 20, 4, 'Australien', 'Russland', 'USA', 'Kanada', 4, 0, 0),
(400, 'Welcher ist der tiefste Punkt auf der Erdoberfläche an Land?', 20, 4, 'Ufer des Toten Meeres', 'Death Valley', 'Kaspische Senke', 'Bentley Subglacial Trench', 1, 0, 0),
(401, 'Welches ist das erste soziale Netzwerk, das sich ausschließlich auf professionelle Kontakte konzentriert?', 21, 1, 'Facebook', 'Instagram', 'Snapchat', 'LinkedIn', 4, 0, 0),
(402, 'Welche Firma entwickelte den erste kommerziell erfolgreichen PC?', 21, 1, 'IBM', 'Apple', 'Microsoft', 'Intel', 2, 1, 0),
(403, 'Welches Unternehmen gilt als Pionier im Bereich autonomes Fahren?', 21, 1, 'Tesla', 'Apple', 'Amazon', 'Microsoft', 1, 1, 0),
(404, 'Wie bezeichnet man es, wenn elektronische Geräte über das Internet miteinander kommunizieren?', 21, 1, 'Bluetooth', 'NFC', 'Internet of Things', 'Wi-Fi Direct', 3, 0, 0),
(405, 'Welches war das erste soziale Netzwerk, das Live-Streaming von Videos populär machte?', 21, 1, 'Facebook', 'YouTube', 'Instagram', 'Snapchat', 2, 1, 0),
(406, 'Wer gilt als Erfinder des World Wide Web (WWW)?', 21, 2, 'Bill Gates', 'Tim Berners-Lee', 'Steve Jobs', 'Larry Page', 2, 0, 0),
(407, 'Wer entwickelte den ersten kommerziell erfolgreichen elektronischen Taschenrechner?', 21, 2, 'Texas Instruments', 'Sharp', 'Hewlett-Packard (HP)', 'Casio', 2, 1, 0),
(408, 'Welches war das erste kommerziell erfolgreiche Unternehmen, das einen 		personalisierten digitalen Assistenten für den Massenmarkt anbot?', 21, 2, 'Apple (Siri)', 'Amazon (Alexa)', 'Microsoft (Cortana)', 'Google (Google Assistant)', 4, 1, 0),
(409, 'Was ist der Hauptvorteil von 5G-Netzwerken im Vergleich zu früheren Generationen wie 4G?', 21, 2, '5G-Netzwerke sind langsamer, aber stabiler in der Verbindung.', '55G-Netzwerke bieten weniger Abdeckung, aber höhere Sicherheit.', '5G-Netzwerke bieten schnellere Datenübertragungsraten.', '5G-Netzwerke sind umweltfreundlicher.', 3, 1, 0),
(410, 'Was ist das Konzept hinter \"Augmented Reality\" (AR)?', 21, 2, 'Virtuelle Simulation von Weltraummissionen ', 'Erweiterung der geografischen Reichweite von Mobilfunkmasten', 'Einblendung digitaler Informationen in die reale Welt', 'Nutzung von holografischen Projektionen für militärische Trainingszwecke', 3, 0, 0),
(411, 'Welche Firma gilt als Wegbereiter für den ersten kommerziell erfolgreichen Blu-ray-Player?', 21, 3, 'Sony', 'Panasonic', 'Samsung', 'Toshiba', 2, 0, 0),
(412, 'Welches Unternehmen gilt als Pionier bei der Entwicklung von künstlicher Intelligenz (KI)-Chips, die speziell für maschinelles Lernen optimiert sind?', 21, 3, 'NVIDIA GeForce', 'IBM', 'Intel', 'Google Deep Mind', 4, 0, 0),
(413, 'Welche Technologie ermöglicht es, dass ein einzelner Computer mehrere virtuelle Betriebssysteme gleichzeitig ausführt?', 21, 3, 'Multitasking', 'Virtualisierung', 'Cloud Computing', 'Cluster-Computing', 2, 1, 0),
(414, 'Was ist ein \"DDoS-Angriff\"?', 21, 3, 'Ein Angriff, der physische Geräte lahmlegt, indem er sie überhitzt.', 'Ein Angriff, der Informationen aus einem Netzwerk stiehlt.', 'Ein Angriff durch Überfluten eines Netzwerks mit unnötigem Datenverkehr', 'Ein Angriff, der darauf abzielt, unsichere Passwörter zu erraten', 3, 1, 0),
(415, 'Was bezeichnet der Begriff \"Quantencomputer\"?', 21, 3, 'Computer, die nur Quantenphysiker verwenden können', 'Computer, die Quantenmechanik verwenden', 'Computer, die ausschließlich für die Quantenforschung eingesetzt werden', 'Computer, die nur mit Quantenverschlüsselung arbeiten können', 2, 1, 0),
(416, 'Welche Technologie wird häufig für die Blockchain-Plattformen verwendet?', 21, 4, 'SQL', 'Distributed Ledger', 'XML', 'HTTP', 2, 0, 0),
(417, 'Welches war das erste kommerziell erfolgreiche Unternehmen, das einen 3D-Drucker für den Heimgebrauch anbot?', 21, 4, 'MakerBot', 'Stratasys', 'Formlabs', 'Ultimaker', 3, 1, 0),
(418, 'Was ist ein \"Smart Grid\"?', 21, 4, 'Ein Smart Grid ist ein Netzwerk aus intelligenten Stromleitungen, die KI nutzen', 'Ein Smart Grid ist ein elektrisches Netzwerk, das auf erneuerbaren Energien basiert', 'Ein Smart Grid ist ein modernisiertes Stromnetz, das durch Kommunikationsnetze zuverlässiger funktioniert', 'Ein Smart Grid ist ein Netzwerk von Solaranlagen und Batterienspeichern', 3, 1, 0),
(419, 'Was bezeichnet der Begriff \"Hadoop\" in der IT-Welt?', 21, 4, 'Ein neuer Cloud-Speicherdienst von Google', 'Ein Open-Source-Framework für die Verarbeitung großer Datenmengen', 'Ein Protokoll für sichere Datenübertragung', 'Ein Hardware-basierter Krypto-Mining-Prozesso', 2, 0, 0),
(420, 'Was ist der Hauptvorteil von OLED-Technologie im Vergleich zu  LED-Displays?', 21, 4, 'Höhere Ernergieeffizienz', 'Bessere Bildqualität und tiefere Schwarzwerte', 'Geringere Kosten', 'Längere Lebensdauer', 2, 1, 0),
(421, 'Welche der folgenden Organisationen ist bekannt für die Förderung des internationalen Handels?', 22, 1, 'UNESCO', 'WHO', 'UNICEF', 'WTO', 4, 1, 0),
(422, 'Welche europäische Institution hat ihren Sitz in Straßburg und Brüssel?', 22, 1, 'Europäischer Rat', 'Europäische Zentralbank', 'Europäisches Parlament', 'Europäische Kommission', 3, 1, 0),
(423, 'Wer ist der aktuelle Präsident/in der Vereinigten Staaten von Amerika?', 22, 1, 'Joe Biden', 'Kamala Harris', 'Donald Trump', 'Barack Obama', 1, 1, 0),
(424, 'Welche der folgenden Organisationen ist für die Bekämpfung von Hunger und Armut weltweit bekannt?', 22, 1, 'NATO', 'OPEC', 'UNO', 'ASEAN', 3, 0, 0),
(425, 'Was versteht man unter dem Begriff \"Globalisierung\"?', 22, 1, 'Rückgang internationaler Handelsbeziehungen', 'Zunahme der weltweiten wirtschaftlichen, kulturellen und politischen Verflechtungen', 'Isolationismus in der Außenpolitik', 'Zunahme der ethnischen und religiösen Konflikte', 2, 1, 0),
(426, 'Wer wählt den Präsidenten der USA?', 22, 2, 'Das Repräsentantenhaus', 'Der Senat', 'Das Wahlkollegium', 'Das höchste Gericht', 3, 1, 0),
(427, 'Was bedeutet der Begriff \"Inflation\" in der Wirtschaft?', 22, 2, 'Sinken des allgemeinen Preisniveaus', 'Anstieg des allgemeinen Preisniveaus', 'Rückgang der Arbeitslosigkeit', 'Zunahme des Wirtschaftswahcstums', 2, 1, 0),
(428, 'Welches Land ist bekannt für sein \"Scandinavian Model\", das ein starkes Sozialstaatsprinzip betont?', 22, 2, 'Schweden', 'Deutschland', 'Schweiz', 'Spanien', 1, 1, 0),
(429, 'Welche wirtschaftliche Theorie betont die Bedeutung von individueller Freiheit, freiem Wettbewerb und Marktkräften ohne staatliche Intervention?', 22, 2, 'Sozialismus', 'Keynesianismus', 'Planwirtschaft', 'Liberalismus', 4, 0, 0),
(430, 'Welche Organisation ist dafür bekannt, internationale Standards für Arbeitsbedingungen und Arbeitsrechte zu fördern?', 22, 2, 'UNICEF', 'UNESCO', 'ILO', 'SPÖ', 3, 1, 0),
(431, 'Welche Institution in den Vereinigten Staaten ist dafür verantwortlich, Gesetze zu verabschieden?', 22, 3, 'Senat', 'Kongress', 'Präsident', 'Oberster Gerichtshof', 2, 1, 0),
(432, 'Wer ist derzeit der Generalsekretär der Vereinten Nationen (UN)? ', 22, 3, 'Ban Ki-moon', 'Kofi Annan', 'António Guterres', 'Xi Jingping', 3, 1, 0),
(433, 'Welcher Begriff beschreibt das Phänomen, bei dem Unternehmen in mehreren Ländern aktiv sind und global agieren?', 22, 3, 'Nationalismus', 'Multinationalität', 'Protektionismus', 'Isolationismus', 2, 0, 0),
(434, 'Welches Land ist bekannt für sein System der direkten Demokratie, bei dem Bürger über Gesetze abstimmen können?', 22, 3, 'Deutschland', 'Japan', 'Schweiz', 'Frankreich', 3, 1, 0),
(435, 'Welches Land ist der weltweit größte Produzent von Kaffee?', 22, 3, 'Brasilien', 'Vietnam', 'Kolumbien', 'Indonesien', 1, 1, 0),
(436, 'Welches Land hat das Westminster-System als Grundlage seiner Regierungsführung?', 22, 4, 'Kanada', 'Vereinigtes Königreich', 'Australien', 'Indien', 2, 1, 0),
(437, 'Welches internationale Abkommen hat das Ziel, den Klimawandel durch Reduktion von Treibhausgasemissionen zu bekämpfen?', 22, 4, 'Kyoto-Protokoll', 'Pariser Abkommen', 'Montreal-Gipfel', 'Rio-Konferenz', 2, 0, 0),
(438, 'Welches Land ist führend in der Produktion und Export von Palmöl, das in verschiedenen Industrien wie Lebensmittel, Kosmetik und Bioenergie verwendet wird?', 22, 4, 'Indonesien', 'Brasilien', 'Malaysia', 'Thailand', 1, 1, 0),
(439, 'Welche internationale Organisation ist für die Regulierung und Kontrolle der internationalen Telekommunikationsdienste zuständig?', 22, 4, 'AT&T', 'Internationale Postunion', 'Internationale Fernmeldeunion', 'UNESCO', 2, 1, 0),
(440, 'Welches Land ist der größte Produzent von Kobalt, einem wichtigen Rohstoff für die Batterieherstellung?', 22, 4, 'Saudi-Arabien', 'Australien', 'Kongo', 'Brasilien', 3, 1, 0),
(441, 'Welches Unternehmen produziert das Modell \"Mustang\"?', 23, 1, 'Toyota', 'Ford', 'Honda', 'BMW', 2, 0, 0),
(442, 'Was bedeutet die Abkürzung \"ABS\" bei Fahrzeugen?', 23, 1, 'Automatische Bremssteuerung', 'Anti-Blockier-System', 'Aktives Bremssystem', 'Adaptives Bremssystem', 2, 1, 0),
(443, 'Welche deutsche Marke ist bekannt für ihr \"M\" Performance Modell?', 23, 1, 'Mercedes-Benz', 'Audi', 'BMW', 'Volkswagen', 3, 0, 0),
(444, 'Welches Auto wurde bekannt als das \"Auto des Volkes\"?', 23, 1, 'Ferrari Portofino', 'Tesla Model S', 'Volkswagen Käfer', 'Rolls Royce Phantom', 3, 1, 0),
(445, 'Was ist ein \"Cabriolet\" in Bezug auf Autos?', 23, 1, 'Ein Auto mit viel PS', 'Ein besonders sparsames Auto', 'Ein Auto mit einem verdecklosen oder abnehmbaren Dach', 'Ein Auto mit Allradantrieb', 3, 0, 0),
(446, 'Welche Automarke steht für den Begriff \"Quattro\" in Bezug auf Allradantrieb?', 23, 2, 'BMW', 'Audi', 'Subaru', 'Land Rover', 2, 1, 0),
(447, 'Welches Auto wurde 1957 in Italien als \"Cinquecento\" eingeführt und ist bis heute ein Kultauto?', 23, 2, 'Fiat 500', 'Alfa Romeo Giuletta', 'Lancia Delta', 'Maserati Quattroporte', 1, 0, 0),
(448, 'Was bedeutet der Begriff \"GT\" in Bezug auf Autos?', 23, 2, 'Grand Turbo', 'General Technology', 'Gran Turismo', 'Great Tuning', 3, 0, 0),
(449, 'Welcher Begriff beschreibt ein System in modernen Autos, das dabei hilft, die Spur zu halten?', 23, 2, 'Driver Condition Monitor', 'Lane Keeping Assistant', 'Blind Sport Monitoring', 'Rear Cross Traffix Alert', 2, 1, 0),
(450, 'Welcher Automobilhersteller ist bekannt für seinen \"F-Type\", ein Sportwagen mit markantem Design und leistungsstarkem Motor?', 23, 2, 'Porsche', 'Jaguar', 'Aston Martin', 'Lexus', 2, 0, 0),
(451, 'Was ist ein \"Doppelkupplungsgetriebe\" im Bezug auf Autos?', 23, 3, 'Ein Getriebe mit zwei unterschiedlichen Übersetzungen', 'Ein Getriebe, das speziell für Geländewagen entwickelt wurde', 'Ein Getriebe mit zwei Kupplungen', 'Ein Getriebe, das für Elektroautos optimiert ist', 3, 0, 0),
(452, 'Welches Auto war das erste, das die Marke \"Bugatti\" nach ihrer Wiederbelebung 	produzierte?', 23, 3, 'Veyron', 'Chiron', 'EB110', 'Type 57', 3, 0, 0),
(453, 'Was ist ein \"Katalysator\" in einem Automobil?', 23, 3, 'Ein Teil des Motors, der für die Kraftstoffzufuhr verantwortlich ist', 'Ein Bauteil, das Abgase reinigt', 'Ein Gerät zur Messung der Geschwindigkeit des Fahrzeugs', 'Ein System, das die Bremskraft verteilt', 2, 0, 0),
(454, 'Was ist der Unterschied zwischen einem Hybrid und einem Elektroauto?', 23, 3, 'Hybridautos haben keinen Verbrennungsmotor', 'Hybridautos haben sowohl einen Verbrennungs- als auch einen Elektromotor', 'Hybridautos haben keinen Elektromotor', 'Hybridautos haben eine größere Batteriekapazität als reine Elektroautos', 2, 1, 0),
(455, 'Was ist ein \"Wankelmotor\"?', 23, 3, 'Ein Motor, der für Geländewagen optimiert ist', 'Ein Motor mit einer rotierenden Dreiecksform', 'Ein Motor mit doppelter Kurbelwelle', 'Ein Motor, der für hohe Geschwindigkeiten ausgelegt ist', 2, 1, 0),
(456, 'as ist ein \"Dynamischer Luftwiderstandskoeffizient\" (Cw-Wert) bei Autos?', 23, 4, 'Die maximale Geschwindigkeit, die das Auto erreichen kann', 'Ein Maß für den Luftwiderstand, der durch die Karosserieform verursacht wird', 'Die durchschnittliche Kraftstoffeffizienz des Fahrzeugs', 'Die Höchstgeschwindigkeit, bei der das Auto stabil bleibt', 2, 0, 0),
(457, 'Was ist ein \"Kammscher Rücken\" in Bezug auf Automobildesign?', 23, 4, 'Eine besondere aerodynamische Formgebung bei Rädern', 'Eine spezielle Art von Spoiler für den Heckbereich', 'Ein Sicherheitsfeature in der Karosserie zur Vermeidung von Kollisionen', 'Ein Designelement für eine bessere Sichtbarkeit bei Nacht', 1, 0, 0),
(458, 'Was ist ein \"KERS\" in Bezug auf Motorsport und einige Hybridautos?', 23, 4, 'Ein spezielles Überwachungssystem für den Reifendruck', 'Ein spezielles Getriebe für maximale Beschleunigung', 'Ein System zur Überwachung der Fahrzeuggeschwindigkeit', 'Ein System zur Energierückgewinnung', 4, 1, 0),
(459, 'Was ist ein \"Monocoque\" in Bezug auf Automobilkonstruktion?', 23, 4, 'Ein besonderes Sicherheitsmerkmal im Kofferraum', 'Eine Bauweise, bei der die Karosserie und der Fahrzeugrahmen eine Einheit bilden', 'Ein spezieller Spoiler für hohe Geschwindigkeiten', 'Ein elektronisches Steuersystem für die Motorleistung', 2, 1, 0),
(460, 'Welches Auto ist bekannt für seinen Geländewagen \"LM002\"?', 23, 4, 'Land Rover', 'Jeep', 'Lamborghini', 'Mercedes-Benz', 3, 0, 0);

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

--
-- Daten für Tabelle `themen`
--

INSERT INTO `themen` (`themenid`, `themenname`) VALUES
(1, 'Geschichte'),
(2, 'Wissenschaft und Natur'),
(3, 'Sport'),
(4, 'Kunst und Kultur'),
(5, 'Musik'),
(6, 'Film und Fernsehen'),
(7, 'Prominente und Persönlichkeiten'),
(8, 'Essen und Trinken'),
(9, 'Mode und Design'),
(10, 'Studio\'s choice'),
(11, 'Mythologie und Legenden'),
(12, 'Sprachen und Linguistik'),
(13, 'Religion und Spiritualität'),
(14, 'Informatik'),
(15, 'Tierwelt'),
(16, 'Astrologie und Sternzeichen'),
(17, 'Medizin und Gesundheit'),
(18, 'Bildung und Schulwissen'),
(19, 'Spiele und Spielzeug'),
(20, 'Geografie'),
(21, 'Technologie und Innovation'),
(22, 'Wirtschaft und Politik'),
(23, 'Automobilindustrie');

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
(1, 'Philipp', '$2y$10$IUs.8ICasJc5Pf2tJ8hACObfTB0Qb9.d02/okuzzpKnepjSo.a1g2', 1),
(2, 'Jop', '$2y$10$L27qhpnZ/nnDLwahgSktUuD.L.DGZbut1OsHlwwwaeAI9ZHjOSm/G', 2),
(3, 'Felizian', '$2y$10$TT35yD974EmT5yoDizyPVOvjfEJg3xUvi8QKdaWnR8AGZgNDVdenS', 2),
(4, 'Julia', '$2y$10$c6tF8T.NENiFOtyBwMJn7uaI7DMWd9iZvkwQ96GTHc4ekE8oHfHM6', 3),
(5, 'Mirha', '$2y$10$8s3mcKAuDkpYNUPIK2iLj.zufO7XgPXvnumGdypynBs7vIz1dt.gq', 1),
(6, 'Annika', '$2y$10$WqF98F.UoYyNwMenkdTIa.F/mMcQGmCLdL8t4F300oB6cAC5.4POG', 1),
(7, 'Verena', '$2y$10$Q.9Zm6dM9HQYauS5Uc7Q0.U5GL2H3OtjWl4YhweTQ0uUSJh1/L0LG', 3),
(8, 'Rauchi', '$2y$10$bReMSzmbH60SAlTr42q30uMJWdmru/sDyQXLyJrnpSUgjPTM2HtMe', 3),
(9, 'Andre', '$2y$10$.rZLSK45SCRzT1rpvoMyA./XSNx//YqUiNa0wCwoh0tQsTe63hAWi', 3),
(10, 'koeck.sophia', '$2y$10$.M9n9Xs.4ub57qyD6vNXpuLGz19hxOwO5hUAwYG6.2DICTIItU3jG', 2);

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
  MODIFY `fragenid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=461;

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
  MODIFY `themenid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `uid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
