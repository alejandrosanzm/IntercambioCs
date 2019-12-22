-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 22-12-2019 a las 20:41:59
-- Versión del servidor: 10.4.10-MariaDB
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `json_baloncesto`
--
CREATE DATABASE IF NOT EXISTS `json_baloncesto` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `json_baloncesto`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player`
--

DROP TABLE IF EXISTS `player`;
CREATE TABLE `player` (
  `playerId` int(11) NOT NULL,
  `playerName` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `playerNumber` int(11) DEFAULT NULL,
  `idTeamFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `player`
--

INSERT INTO `player` (`playerId`, `playerName`, `playerNumber`, `idTeamFK`) VALUES
(1, 'Paco', 5, 1),
(2, 'Juan', 6, 1),
(3, 'Ana', 7, 1),
(4, 'Luis', 8, 1),
(5, 'Lola', 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playerposition`
--

DROP TABLE IF EXISTS `playerposition`;
CREATE TABLE `playerposition` (
  `ID` int(11) NOT NULL,
  `player` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `NUM` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `playerposition`
--

INSERT INTO `playerposition` (`ID`, `player`, `position`, `NUM`) VALUES
(1, 1, 1, 2),
(2, 1, 2, 3),
(3, 2, 2, 1),
(4, 4, 4, 4),
(5, 5, 5, 4),
(6, 3, 3, 2),
(7, 3, 4, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `position`
--

DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `ID` int(11) NOT NULL,
  `text` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `DESCRIPTION` varchar(60) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `position`
--

INSERT INTO `position` (`ID`, `text`, `DESCRIPTION`) VALUES
(1, 'Pivot', 'Taponar'),
(2, 'Ala-Pivot', 'Rebotes y puntos'),
(3, 'Alero', 'De todo un poco'),
(4, 'Escolta', 'Tirador'),
(5, 'Base', 'Dirigir');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `team`
--

DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `idTeam` int(11) NOT NULL,
  `Name` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `team`
--

INSERT INTO `team` (`idTeam`, `Name`) VALUES
(1, 'ORANGE TEAM'),
(2, 'DREAM TEAM');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`playerId`),
  ADD KEY `idTeamFK` (`idTeamFK`);

--
-- Indices de la tabla `playerposition`
--
ALTER TABLE `playerposition`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `player` (`player`),
  ADD KEY `position` (`position`);

--
-- Indices de la tabla `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`idTeam`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `player`
--
ALTER TABLE `player`
  MODIFY `playerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `playerposition`
--
ALTER TABLE `playerposition`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `position`
--
ALTER TABLE `position`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `team`
--
ALTER TABLE `team`
  MODIFY `idTeam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
