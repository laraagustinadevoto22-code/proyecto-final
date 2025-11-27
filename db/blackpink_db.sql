-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-11-2025 a las 22:03:27
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `blackpink_db`
--
CREATE DATABASE IF NOT EXISTS `blackpink_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `blackpink_db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cameos`
--

CREATE TABLE `cameos` (
  `id` int(11) NOT NULL,
  `grupo_id` int(11) DEFAULT NULL,
  `miembro_id` int(11) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canciones_solista`
--

CREATE TABLE `canciones_solista` (
  `id` int(11) NOT NULL,
  `disco_id` int(11) DEFAULT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `es_bonus` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `discografia_grupal`
--

CREATE TABLE `discografia_grupal` (
  `id` int(11) NOT NULL,
  `grupo_id` int(11) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `anio` int(11) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `sello` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `discografia_solista`
--

CREATE TABLE `discografia_solista` (
  `id` int(11) NOT NULL,
  `miembro_id` int(11) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `debut` date DEFAULT NULL,
  `agencia` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `id` int(11) NOT NULL,
  `miembro_id` int(11) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `estado` varchar(50) DEFAULT 'vivo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miembros`
--

CREATE TABLE `miembros` (
  `id` int(11) NOT NULL,
  `grupo_id` int(11) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `nombre_real` varchar(100) DEFAULT NULL,
  `nacimiento` date DEFAULT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL,
  `rol` varchar(150) DEFAULT NULL,
  `biografia` text DEFAULT NULL,
  `sello_solista` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moda`
--

CREATE TABLE `moda` (
  `id` int(11) NOT NULL,
  `miembro_id` int(11) DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participaciones_musicales`
--

CREATE TABLE `participaciones_musicales` (
  `id` int(11) NOT NULL,
  `miembro_id` int(11) DEFAULT NULL,
  `titulo` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas_grupales`
--

CREATE TABLE `peliculas_grupales` (
  `id` int(11) NOT NULL,
  `grupo_id` int(11) DEFAULT NULL,
  `titulo` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas_miembro`
--

CREATE TABLE `peliculas_miembro` (
  `id` int(11) NOT NULL,
  `miembro_id` int(11) DEFAULT NULL,
  `titulo` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `series_grupales`
--

CREATE TABLE `series_grupales` (
  `id` int(11) NOT NULL,
  `grupo_id` int(11) DEFAULT NULL,
  `titulo` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `series_miembro`
--

CREATE TABLE `series_miembro` (
  `id` int(11) NOT NULL,
  `miembro_id` int(11) DEFAULT NULL,
  `titulo` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cameos`
--
ALTER TABLE `cameos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grupo_id` (`grupo_id`),
  ADD KEY `miembro_id` (`miembro_id`);

--
-- Indices de la tabla `canciones_solista`
--
ALTER TABLE `canciones_solista`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disco_id` (`disco_id`);

--
-- Indices de la tabla `discografia_grupal`
--
ALTER TABLE `discografia_grupal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grupo_id` (`grupo_id`);

--
-- Indices de la tabla `discografia_solista`
--
ALTER TABLE `discografia_solista`
  ADD PRIMARY KEY (`id`),
  ADD KEY `miembro_id` (`miembro_id`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `miembro_id` (`miembro_id`);

--
-- Indices de la tabla `miembros`
--
ALTER TABLE `miembros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grupo_id` (`grupo_id`);

--
-- Indices de la tabla `moda`
--
ALTER TABLE `moda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `miembro_id` (`miembro_id`);

--
-- Indices de la tabla `participaciones_musicales`
--
ALTER TABLE `participaciones_musicales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `miembro_id` (`miembro_id`);

--
-- Indices de la tabla `peliculas_grupales`
--
ALTER TABLE `peliculas_grupales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grupo_id` (`grupo_id`);

--
-- Indices de la tabla `peliculas_miembro`
--
ALTER TABLE `peliculas_miembro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `miembro_id` (`miembro_id`);

--
-- Indices de la tabla `series_grupales`
--
ALTER TABLE `series_grupales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grupo_id` (`grupo_id`);

--
-- Indices de la tabla `series_miembro`
--
ALTER TABLE `series_miembro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `miembro_id` (`miembro_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cameos`
--
ALTER TABLE `cameos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `canciones_solista`
--
ALTER TABLE `canciones_solista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `discografia_grupal`
--
ALTER TABLE `discografia_grupal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `discografia_solista`
--
ALTER TABLE `discografia_solista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `miembros`
--
ALTER TABLE `miembros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `moda`
--
ALTER TABLE `moda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `participaciones_musicales`
--
ALTER TABLE `participaciones_musicales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `peliculas_grupales`
--
ALTER TABLE `peliculas_grupales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `peliculas_miembro`
--
ALTER TABLE `peliculas_miembro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `series_grupales`
--
ALTER TABLE `series_grupales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `series_miembro`
--
ALTER TABLE `series_miembro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cameos`
--
ALTER TABLE `cameos`
  ADD CONSTRAINT `cameos_ibfk_1` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`),
  ADD CONSTRAINT `cameos_ibfk_2` FOREIGN KEY (`miembro_id`) REFERENCES `miembros` (`id`);

--
-- Filtros para la tabla `canciones_solista`
--
ALTER TABLE `canciones_solista`
  ADD CONSTRAINT `canciones_solista_ibfk_1` FOREIGN KEY (`disco_id`) REFERENCES `discografia_solista` (`id`);

--
-- Filtros para la tabla `discografia_grupal`
--
ALTER TABLE `discografia_grupal`
  ADD CONSTRAINT `discografia_grupal_ibfk_1` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`);

--
-- Filtros para la tabla `discografia_solista`
--
ALTER TABLE `discografia_solista`
  ADD CONSTRAINT `discografia_solista_ibfk_1` FOREIGN KEY (`miembro_id`) REFERENCES `miembros` (`id`);

--
-- Filtros para la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD CONSTRAINT `mascotas_ibfk_1` FOREIGN KEY (`miembro_id`) REFERENCES `miembros` (`id`);

--
-- Filtros para la tabla `miembros`
--
ALTER TABLE `miembros`
  ADD CONSTRAINT `miembros_ibfk_1` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`);

--
-- Filtros para la tabla `moda`
--
ALTER TABLE `moda`
  ADD CONSTRAINT `moda_ibfk_1` FOREIGN KEY (`miembro_id`) REFERENCES `miembros` (`id`);

--
-- Filtros para la tabla `participaciones_musicales`
--
ALTER TABLE `participaciones_musicales`
  ADD CONSTRAINT `participaciones_musicales_ibfk_1` FOREIGN KEY (`miembro_id`) REFERENCES `miembros` (`id`);

--
-- Filtros para la tabla `peliculas_grupales`
--
ALTER TABLE `peliculas_grupales`
  ADD CONSTRAINT `peliculas_grupales_ibfk_1` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`);

--
-- Filtros para la tabla `peliculas_miembro`
--
ALTER TABLE `peliculas_miembro`
  ADD CONSTRAINT `peliculas_miembro_ibfk_1` FOREIGN KEY (`miembro_id`) REFERENCES `miembros` (`id`);

--
-- Filtros para la tabla `series_grupales`
--
ALTER TABLE `series_grupales`
  ADD CONSTRAINT `series_grupales_ibfk_1` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`);

--
-- Filtros para la tabla `series_miembro`
--
ALTER TABLE `series_miembro`
  ADD CONSTRAINT `series_miembro_ibfk_1` FOREIGN KEY (`miembro_id`) REFERENCES `miembros` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
