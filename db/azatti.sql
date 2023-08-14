-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-08-2023 a las 21:21:57
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `azatti`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id` int(11) NOT NULL,
  `nombre_empresa` varchar(100) NOT NULL,
  `cif` varchar(100) NOT NULL,
  `direccion_fiscal` varchar(100) NOT NULL,
  `cp_2` varchar(100) NOT NULL,
  `localidad_2` varchar(100) NOT NULL,
  `provincia_2` varchar(100) NOT NULL,
  `nombre_administrador` varchar(100) NOT NULL,
  `dni_administrador` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `nombre_empresa`, `cif`, `direccion_fiscal`, `cp_2`, `localidad_2`, `provincia_2`, `nombre_administrador`, `dni_administrador`) VALUES
(0, 'Farmatodo C.A.', '1', 'Calle 1, Valencia, Carabobo', '2', 'Valencia', 'San Diego', 'Julio Gonzalez', '28195303'),
(1, 'Farmatodo C.A.', '1', 'Calle 1, Valencia, Carabobo', '2', 'Valencia', 'San Diego', 'Julio Gonzalez', '28195303');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `establecimiento`
--

CREATE TABLE `establecimiento` (
  `id` int(11) NOT NULL,
  `nombre_establecimiento` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `direccion` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cp` varchar(100) NOT NULL,
  `localidad` varchar(100) NOT NULL,
  `provincia` varchar(100) NOT NULL,
  `persona_contacto` varchar(100) NOT NULL,
  `telefono_contacto` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `sector_actividad` varchar(100) NOT NULL,
  `check_cajero` tinyint(1) NOT NULL,
  `check_datafono` tinyint(1) NOT NULL,
  `comision` int(11) NOT NULL,
  `retorno_grupo` enum('Sí','No') NOT NULL,
  `porcentaje_retorno` int(11) NOT NULL,
  `fondo_inicial` int(11) NOT NULL,
  `aportacion_fondo_grupo` enum('Cliente','Nosotros') NOT NULL,
  `metodo_reposicion_grupo` enum('Loomis','Transferencia','Tarjeta') NOT NULL,
  `empresa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `establecimiento`
--

INSERT INTO `establecimiento` (`id`, `nombre_establecimiento`, `direccion`, `cp`, `localidad`, `provincia`, `persona_contacto`, `telefono_contacto`, `email`, `sector_actividad`, `check_cajero`, `check_datafono`, `comision`, `retorno_grupo`, `porcentaje_retorno`, `fondo_inicial`, `aportacion_fondo_grupo`, `metodo_reposicion_grupo`, `empresa_id`) VALUES
(1, 'Farmatodo Sede Av. Bolivar', 'Av Bolivar, Valencia, Carabobo', '1', 'Valencia', 'San Diego', 'Luis Perez', '04240000000', 'luisperez1@gmail.com', 'Farmacia', 1, 0, 20, 'Sí', 20, 100, 'Cliente', 'Loomis', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `establecimiento`
--
ALTER TABLE `establecimiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `establecimiento_empresa_PK` (`empresa_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `establecimiento`
--
ALTER TABLE `establecimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `establecimiento`
--
ALTER TABLE `establecimiento`
  ADD CONSTRAINT `establecimiento_empresa_PK` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
