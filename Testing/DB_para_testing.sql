-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-06-2020 a las 20:39:30
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_g6_metod`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan`
--

CREATE TABLE `plan` (
  `id_plan` int(11) NOT NULL,
  `id_viaje` int(11) NOT NULL,
  `titulo` varchar(63) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `tipo` int(4) NOT NULL,
  `latitud` int(11) DEFAULT NULL,
  `longitud` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `plan`
--

INSERT INTO `plan` (`id_plan`, `id_viaje`, `titulo`, `descripcion`, `tipo`, `latitud`, `longitud`) VALUES
(5, 0, 'Vuelo Arg-Uru', 'Vuelo de Ida a Uruguay', 0, NULL, NULL),
(6, 0, 'Vuelo Uru-Arg', 'Vuelo de Vuelta desde Uruguay', 0, NULL, NULL),
(7, 0, 'Hotel PdE', '36 noches en PdE', 1, NULL, NULL),
(8, 0, 'Museo', 'Visitar el museo', 2, NULL, NULL),
(9, 0, 'Recital Ciro', 'Entradas reservadas para Ciro Y Los Persas 05-12', 2, NULL, NULL),
(10, 1, 'Hotel \"Lugar Careta\"', '3 Noches en Olavarria', 1, NULL, NULL),
(11, 1, 'Almuerzo de Negocios', 'Reserva en restaurant Gourmet 05-07', 2, NULL, NULL),
(12, 2, 'Vuelo Arg-Par', 'Vuelo de Ida a Paraguay', 0, NULL, NULL),
(13, 2, 'Vuelo Par-Arg', 'Vuelo de Vuelta desde Paraguay', 0, NULL, NULL),
(14, 2, 'Hotel Gran Paraguay', '9 Noches en Asunción', 1, NULL, NULL),
(15, 2, 'Almuerzo de Negocios', 'Reserva en restaurant \"Asuncion\" 18-07', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_hotel`
--

CREATE TABLE `plan_hotel` (
  `id_plan` int(11) NOT NULL,
  `nombre_hotel` varchar(255) NOT NULL,
  `dir_hotel` varchar(255) NOT NULL,
  `cant_personas` int(10) NOT NULL,
  `cant_habitaciones` int(10) NOT NULL,
  `tipo_habitaciones` varchar(255) DEFAULT NULL,
  `servicios` varchar(8091) DEFAULT NULL,
  `fecha_in` date NOT NULL,
  `fecha_out` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `plan_hotel`
--

INSERT INTO `plan_hotel` (`id_plan`, `nombre_hotel`, `dir_hotel`, `cant_personas`, `cant_habitaciones`, `tipo_habitaciones`, `servicios`, `fecha_in`, `fecha_out`) VALUES
(7, 'PdE International Resort', 'Central 1450', 0, 0, '', '', '0000-00-00', '0000-00-00'),
(10, 'Lugar Careta', 'Gral. Roca 570', 0, 0, '', '', '0000-00-00', '0000-00-00'),
(14, 'Gran Paraguay', 'Roque Santa Cruz 223', 0, 0, '', '', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_otro`
--

CREATE TABLE `plan_otro` (
  `id_plan` int(11) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `plan_otro`
--

INSERT INTO `plan_otro` (`id_plan`, `direccion`, `fecha`) VALUES
(8, 'Calle 5 256', NULL),
(9, 'Playa \"Farándula\"', '2020-12-05'),
(11, 'Rivadavia 980', '2020-07-05'),
(15, 'C.A. López 780', '2020-08-17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_vuelo`
--

CREATE TABLE `plan_vuelo` (
  `id_plan` int(11) NOT NULL,
  `aeropuerto_salida` varchar(255) NOT NULL,
  `aeropuerto_llegada` varchar(255) NOT NULL,
  `cant_escalas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `plan_vuelo`
--

INSERT INTO `plan_vuelo` (`id_plan`, `aeropuerto_salida`, `aeropuerto_llegada`, `cant_escalas`) VALUES
(5, 'Ezeiza', 'Interncaional de Punta del Este', 0),
(6, 'Interncaional de Punta del Este', 'Ezeiza', 0),
(12, 'Ezeiza', 'Asuncion', 1),
(13, 'Asuncion', 'Ezeiza', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viaje`
--

CREATE TABLE `viaje` (
  `id_viaje` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cod_pais_origen` varchar(4) NOT NULL,
  `cod_pais_destino` varchar(4) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `viaje`
--

INSERT INTO `viaje` (`id_viaje`, `nombre`, `cod_pais_origen`, `cod_pais_destino`, `fecha_inicio`, `fecha_fin`) VALUES
(7, 'Vacaciones - Punta del Este', 'ARG', 'URU', '2020-11-27', '2021-01-02'),
(8, 'Negocios - Olavarria', 'ARG', 'ARG', '2020-06-03', '2020-06-07'),
(9, 'Negocios - Asuncion', 'ARG', 'PAR', '2020-07-15', '2020-07-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viaje_estadisticas`
--

CREATE TABLE `viaje_estadisticas` (
  `id_viaje` int(11) NOT NULL,
  `id_estadisticas` int(11) NOT NULL,
  `km_recorridos` int(11) NOT NULL,
  `cant_paises_visitados` int(11) NOT NULL,
  `huella_carbono` decimal(10,2) NOT NULL,
  `horas_viajadas` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `viaje_estadisticas`
--

INSERT INTO `viaje_estadisticas` (`id_viaje`, `id_estadisticas`, `km_recorridos`, `cant_paises_visitados`, `huella_carbono`, `horas_viajadas`) VALUES
(7, 7, 612, 1, '27.00', '1.82'),
(8, 8, 707, 0, '15.90', '6.28'),
(9, 9, 2246, 1, '98.59', '3.87');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id_plan`);

--
-- Indices de la tabla `plan_hotel`
--
ALTER TABLE `plan_hotel`
  ADD KEY `id_plan` (`id_plan`);

--
-- Indices de la tabla `viaje`
--
ALTER TABLE `viaje`
  ADD PRIMARY KEY (`id_viaje`);

--
-- Indices de la tabla `viaje_estadisticas`
--
ALTER TABLE `viaje_estadisticas`
  ADD PRIMARY KEY (`id_estadisticas`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `plan`
--
ALTER TABLE `plan`
  MODIFY `id_plan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `viaje`
--
ALTER TABLE `viaje`
  MODIFY `id_viaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `viaje_estadisticas`
--
ALTER TABLE `viaje_estadisticas`
  MODIFY `id_estadisticas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
