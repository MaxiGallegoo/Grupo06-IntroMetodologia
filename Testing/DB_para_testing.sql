-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-05-2020 a las 14:19:15
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
  `viaje_id_viaje` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `titulo` varchar(63) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `plan`
--

INSERT INTO `plan` (`id_plan`, `viaje_id_viaje`, `tipo`, `titulo`, `descripcion`) VALUES
(0, 0, 0, 'Vuelo Arg-Uru', 'Vuelo de Ida a Uruguay'),
(1, 0, 0, 'Vuelo Uru-Arg', 'Vuelo de Vuelta desde Uruguay'),
(2, 0, 1, 'Hotel PdE', '36 noches en PdE'),
(3, 0, 2, 'Museo', 'Visitar el museo'),
(4, 0, 2, 'Recital Ciro', 'Entradas reservadas para Ciro Y Los Persas 05-12'),
(5, 1, 1, 'Hotel \"Lugar Careta\"', '3 Noches en Olavarria'),
(6, 1, 2, 'Almuerzo de Negocios', 'Reserva en restaurant Gourmet 05-07'),
(7, 2, 0, 'Vuelo Arg-Par', 'Vuelo de Ida a Paraguay'),
(8, 2, 0, 'Vuelo Par-Arg', 'Vuelo de Vuelta desde Paraguay'),
(9, 2, 1, 'Hotel Gran Paraguay', '9 Noches en Asunción'),
(10, 2, 2, 'Almuerzo de Negocios', 'Reserva en restaurant \"Asuncion\" 18-07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_hotel`
--

CREATE TABLE `plan_hotel` (
  `plan_id_plan` int(11) NOT NULL,
  `nombre_hotel` varchar(63) DEFAULT NULL,
  `dir_hotel` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `plan_hotel`
--

INSERT INTO `plan_hotel` (`plan_id_plan`, `nombre_hotel`, `dir_hotel`) VALUES
(2, 'PdE International Resort', 'Central 1450'),
(5, 'Lugar Careta', 'Gral. Roca 570'),
(9, 'Gran Paraguay', 'Roque Santa Cruz 223');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_otro`
--

CREATE TABLE `plan_otro` (
  `plan_id_plan` int(11) NOT NULL,
  `titulo` varchar(63) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `plan_otro`
--

INSERT INTO `plan_otro` (`plan_id_plan`, `titulo`, `descripcion`, `direccion`, `fecha`) VALUES
(3, 'Museo', NULL, 'Calle 5 256', NULL),
(4, 'Ciro Y Los Persas', 'Entradas Reservadas para el recital', 'Playa \"Farándula\"', '2020-12-05'),
(6, 'Almuerzo de negocios', 'Reserva en restaurant \"Gourmet\"', 'Rivadavia 980', '2020-07-05'),
(10, 'Almuerzo de Negocios', 'Reserva en restaurant \"Asunción\"', 'C.A. López 780', '2020-08-17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_vuelo`
--

CREATE TABLE `plan_vuelo` (
  `plan_id_plan` int(11) NOT NULL,
  `aeropuerto_salida` varchar(255) NOT NULL,
  `aeropuerto_llegada` varchar(255) NOT NULL,
  `cant_escalas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `plan_vuelo`
--

INSERT INTO `plan_vuelo` (`plan_id_plan`, `aeropuerto_salida`, `aeropuerto_llegada`, `cant_escalas`) VALUES
(0, 'Ezeiza', 'Interncaional de Punta del Este', 0),
(1, 'Interncaional de Punta del Este', 'Ezeiza', 0),
(7, 'Ezeiza', 'Asuncion', 1),
(8, 'Asuncion', 'Ezeiza', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viaje`
--

CREATE TABLE `viaje` (
  `id_viaje` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cod_pais_origen` varchar(3) NOT NULL,
  `cod_pais_destino` varchar(3) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `viaje`
--

INSERT INTO `viaje` (`id_viaje`, `nombre`, `cod_pais_origen`, `cod_pais_destino`, `fecha_inicio`, `fecha_fin`) VALUES
(0, 'Vacaciones - Punta del Este', 'ARG', 'URU', '2020-11-27', '2021-01-02'),
(1, 'Negocios - Olavarria', 'ARG', 'ARG', '2020-06-03', '2020-06-07'),
(2, 'Negocios - Asuncion', 'ARG', 'PAR', '2020-07-15', '2020-07-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viaje_estadisticas`
--

CREATE TABLE `viaje_estadisticas` (
  `viaje_id_viaje` int(11) NOT NULL,
  `id_estadisticas` int(11) NOT NULL,
  `km_recorridos` int(11) NOT NULL,
  `cant_paises_visitados` int(11) NOT NULL,
  `huella_carbono` decimal(10,2) NOT NULL,
  `horas_viajadas` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `viaje_estadisticas`
--

INSERT INTO `viaje_estadisticas` (`viaje_id_viaje`, `id_estadisticas`, `km_recorridos`, `cant_paises_visitados`, `huella_carbono`, `horas_viajadas`) VALUES
(0, 0, 612, 1, '27.00', '1.82'),
(1, 1, 707, 0, '15.90', '6.28'),
(2, 2, 2246, 1, '98.59', '3.87');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id_plan`,`viaje_id_viaje`),
  ADD KEY `plan_viaje` (`viaje_id_viaje`);

--
-- Indices de la tabla `plan_hotel`
--
ALTER TABLE `plan_hotel`
  ADD PRIMARY KEY (`plan_id_plan`);

--
-- Indices de la tabla `plan_otro`
--
ALTER TABLE `plan_otro`
  ADD PRIMARY KEY (`plan_id_plan`);

--
-- Indices de la tabla `plan_vuelo`
--
ALTER TABLE `plan_vuelo`
  ADD PRIMARY KEY (`plan_id_plan`);

--
-- Indices de la tabla `viaje`
--
ALTER TABLE `viaje`
  ADD PRIMARY KEY (`id_viaje`);

--
-- Indices de la tabla `viaje_estadisticas`
--
ALTER TABLE `viaje_estadisticas`
  ADD PRIMARY KEY (`viaje_id_viaje`,`id_estadisticas`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `plan`
--
ALTER TABLE `plan`
  ADD CONSTRAINT `plan_viaje` FOREIGN KEY (`viaje_id_viaje`) REFERENCES `viaje` (`id_viaje`);

--
-- Filtros para la tabla `plan_hotel`
--
ALTER TABLE `plan_hotel`
  ADD CONSTRAINT `plan_hotel_plan` FOREIGN KEY (`plan_id_plan`) REFERENCES `plan` (`id_plan`);

--
-- Filtros para la tabla `plan_otro`
--
ALTER TABLE `plan_otro`
  ADD CONSTRAINT `plan_otro_plan` FOREIGN KEY (`plan_id_plan`) REFERENCES `plan` (`id_plan`);

--
-- Filtros para la tabla `plan_vuelo`
--
ALTER TABLE `plan_vuelo`
  ADD CONSTRAINT `plan_vuelo_plan` FOREIGN KEY (`plan_id_plan`) REFERENCES `plan` (`id_plan`);

--
-- Filtros para la tabla `viaje_estadisticas`
--
ALTER TABLE `viaje_estadisticas`
  ADD CONSTRAINT `viaje_estadisticas_viaje` FOREIGN KEY (`viaje_id_viaje`) REFERENCES `viaje` (`id_viaje`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
