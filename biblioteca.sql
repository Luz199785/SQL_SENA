-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-02-2023 a las 17:32:14
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `ID_AUTOR` int(11) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`ID_AUTOR`, `NOMBRE`) VALUES
(1, 'GABO'),
(2, 'PABLO COELLO'),
(3, 'RAFAEL POMBO'),
(4, 'JORGE ISAAC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor_libro`
--

CREATE TABLE `autor_libro` (
  `ID_AUTOR_LIBRO` int(11) NOT NULL,
  `ID_AUTOR` int(11) NOT NULL,
  `ID_LIBRO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `autor_libro`
--

INSERT INTO `autor_libro` (`ID_AUTOR_LIBRO`, `ID_AUTOR`, `ID_LIBRO`) VALUES
(1, 1, 1),
(2, 4, 4),
(3, 1, 3),
(4, 2, 2),
(5, 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejemplar`
--

CREATE TABLE `ejemplar` (
  `ID_EJEMPLAR` int(11) NOT NULL,
  `LOCALIZACION` varchar(50) NOT NULL,
  `ID_LIBRO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ejemplar`
--

INSERT INTO `ejemplar` (`ID_EJEMPLAR`, `LOCALIZACION`, `ID_LIBRO`) VALUES
(1, 'NORTE', 1),
(2, 'NORTE', 1),
(3, 'CENTRO', 3),
(4, 'SUR', 2),
(5, 'NORTE', 4),
(6, 'CENTRO', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `ID_LIBRO` int(11) NOT NULL,
  `TITULO` varchar(50) NOT NULL,
  `ISBN` varchar(25) NOT NULL,
  `EDITORIAL` varchar(25) NOT NULL,
  `PAGINAS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`ID_LIBRO`, `TITULO`, `ISBN`, `EDITORIAL`, `PAGINAS`) VALUES
(1, 'CIEN AÑOS DE SOLEDAD', 'BNG4566', 'NORMA', 100),
(2, 'EL NAUFRAGO', 'FG45545', 'NORMA', 60),
(3, 'CRONICAS DE UNA MUERTE ANUNCADA', 'RT66666', 'NORMA', 65),
(4, 'LA MARIA', 'TRYR677', 'SANTILLANA', 70),
(5, 'LAS VENAS ABERTAS', 'GH67778', 'SANTILLANA', 80);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `ID_PRESTAMO` int(11) NOT NULL,
  `FECHA_PRESTAMO` date NOT NULL,
  `FECHA_DEVOLUCION` date NOT NULL,
  `ID_EJEMPLAR` int(11) NOT NULL,
  `ID_USUARIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`ID_PRESTAMO`, `FECHA_PRESTAMO`, `FECHA_DEVOLUCION`, `ID_EJEMPLAR`, `ID_USUARIO`) VALUES
(1, '2023-02-01', '2023-02-03', 1, 1),
(2, '2023-02-02', '2023-02-06', 2, 1),
(3, '2023-02-07', '2023-02-09', 3, 2),
(4, '2023-02-06', '2023-02-08', 4, 3),
(5, '2023-02-01', '2023-02-03', 2, 2),
(6, '2023-01-17', '2023-01-20', 6, 3),
(7, '2023-01-10', '2023-01-13', 6, 2),
(8, '2023-01-23', '2023-01-25', 5, 2),
(9, '2023-01-30', '2023-02-01', 5, 1),
(10, '2023-01-03', '2023-01-06', 6, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--

CREATE TABLE `sede` (
  `idsede` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_USUARIO` int(11) NOT NULL,
  `DOCUMENTO` int(11) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `DIRECCION` varchar(50) NOT NULL,
  `CORREO` varchar(50) NOT NULL,
  `TELEFONO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_USUARIO`, `DOCUMENTO`, `NOMBRE`, `DIRECCION`, `CORREO`, `TELEFONO`) VALUES
(1, 809087, 'NESLON RODRIGUEZ', 'CALLE 100 No 7-24', 'NELSON@GMAIL.CO', 555555),
(2, 65788, 'PEDRO PEREZ', 'CALLE 65', 'PEDRO@GMAIL.COM', 4567890),
(3, 52345, 'JESICA CORTES', 'CARRERA 13', 'JESICA@HOTMAIL.COM', 768954);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`ID_AUTOR`);

--
-- Indices de la tabla `autor_libro`
--
ALTER TABLE `autor_libro`
  ADD PRIMARY KEY (`ID_AUTOR_LIBRO`),
  ADD KEY `FK_AUTOR_LIBRO_AUTOR` (`ID_AUTOR`),
  ADD KEY `FK_AUTOR_LIBRO_LIBRO` (`ID_LIBRO`);

--
-- Indices de la tabla `ejemplar`
--
ALTER TABLE `ejemplar`
  ADD PRIMARY KEY (`ID_EJEMPLAR`),
  ADD KEY `FK_EJEMPLAR_LIBRO` (`ID_LIBRO`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`ID_LIBRO`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`ID_PRESTAMO`),
  ADD KEY `FK_PRESTAMO_EJEMPLAR` (`ID_EJEMPLAR`),
  ADD KEY `FK_PRESTAMO_USUARIO` (`ID_USUARIO`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_USUARIO`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `autor_libro`
--
ALTER TABLE `autor_libro`
  ADD CONSTRAINT `FK_AUTOR_LIBRO_AUTOR` FOREIGN KEY (`ID_AUTOR`) REFERENCES `autor` (`ID_AUTOR`),
  ADD CONSTRAINT `FK_AUTOR_LIBRO_LIBRO` FOREIGN KEY (`ID_LIBRO`) REFERENCES `libro` (`ID_LIBRO`);

--
-- Filtros para la tabla `ejemplar`
--
ALTER TABLE `ejemplar`
  ADD CONSTRAINT `FK_EJEMPLAR_LIBRO` FOREIGN KEY (`ID_LIBRO`) REFERENCES `libro` (`ID_LIBRO`);

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `FK_PRESTAMO_EJEMPLAR` FOREIGN KEY (`ID_EJEMPLAR`) REFERENCES `ejemplar` (`ID_EJEMPLAR`),
  ADD CONSTRAINT `FK_PRESTAMO_USUARIO` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
