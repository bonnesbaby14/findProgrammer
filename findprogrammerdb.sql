-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-08-2019 a las 09:51:25
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `findprogrammerdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avances`
--

CREATE TABLE `avances` (
  `ID_AVANCES` int(11) NOT NULL,
  `TIEMPO_TRABAJO` int(11) NOT NULL,
  `FECHA_ENTREGA` date NOT NULL,
  `DESCRIPCION` varchar(120) NOT NULL,
  `PORCENTAJE` int(11) NOT NULL,
  `OBSERVACIONES` varchar(120) NOT NULL,
  `No_CAMBIOS` int(11) NOT NULL,
  `F_ACEPTADO` tinyint(1) NOT NULL,
  `FK_PROYECTO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `avances`
--

INSERT INTO `avances` (`ID_AVANCES`, `TIEMPO_TRABAJO`, `FECHA_ENTREGA`, `DESCRIPCION`, `PORCENTAJE`, `OBSERVACIONES`, `No_CAMBIOS`, `F_ACEPTADO`, `FK_PROYECTO`) VALUES
(1, 12, '2019-08-13', 'avance para un proyecto de prueba', 1, 'observaciones d eun nuevo proeyetco', 3, 0, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID_CLIENTE` int(11) NOT NULL,
  `NOMBRE` varchar(20) NOT NULL,
  `APELLIDO_P` varchar(20) NOT NULL,
  `APELLIDO_M` varchar(20) NOT NULL,
  `CORREO` varchar(20) NOT NULL,
  `FOTO` varchar(30) NOT NULL,
  `CALIFICACION` float NOT NULL,
  `F_ESTADO_REGISTRO` tinyint(1) NOT NULL,
  `PASSWORD` varchar(20) NOT NULL,
  `TELEFONO` varchar(12) NOT NULL,
  `F_BAJA_USUARIO` tinyint(1) NOT NULL,
  `F_ESTADO_LOGIN` tinyint(1) NOT NULL,
  `CURP` varchar(19) NOT NULL,
  `F_USUARIO_APRUEBA` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`ID_CLIENTE`, `NOMBRE`, `APELLIDO_P`, `APELLIDO_M`, `CORREO`, `FOTO`, `CALIFICACION`, `F_ESTADO_REGISTRO`, `PASSWORD`, `TELEFONO`, `F_BAJA_USUARIO`, `F_ESTADO_LOGIN`, `CURP`, `F_USUARIO_APRUEBA`) VALUES
(1, 'LILIA', 'XX', 'ANGELES', 'C', '', 0, 0, '1', '3311602498', 0, 0, 'AAAAAAAAAAAAAAAAAAA', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario_cliente`
--

CREATE TABLE `comentario_cliente` (
  `ID_COMENTARIO` int(11) NOT NULL,
  `FK_DESTINATARIO` int(11) NOT NULL,
  `FK_AUTOR` int(11) NOT NULL,
  `COMENTARIO` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario_desarrollador`
--

CREATE TABLE `comentario_desarrollador` (
  `ID_COMENTARIO` int(11) NOT NULL,
  `FK_DESTINATARIO` int(11) NOT NULL,
  `FK_AUTOR` int(11) NOT NULL,
  `COMENTARIO` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desarrollador`
--

CREATE TABLE `desarrollador` (
  `ID_DESARROLLADOR` int(11) NOT NULL,
  `NOMBRE` varchar(30) NOT NULL,
  `APELLIDO_P` varchar(30) NOT NULL,
  `APELLIDO_M` varchar(30) NOT NULL,
  `CORREO` varchar(30) NOT NULL,
  `FOTO` varchar(50) NOT NULL,
  `CALIFICACION` float NOT NULL,
  `F_ESTADO_REGISTRO` tinyint(1) NOT NULL,
  `PASSWORD` varchar(30) NOT NULL,
  `TELEFONO` varchar(12) NOT NULL,
  `F_BAJA_USUARIO` tinyint(1) NOT NULL,
  `F_ESTADO_LOGIN` tinyint(1) NOT NULL,
  `CURP` varchar(19) NOT NULL,
  `F_USUARIO_APRUEBA` tinyint(1) NOT NULL,
  `F_D_WEB` tinyint(1) NOT NULL,
  `F_D_M_ANDROID` tinyint(1) NOT NULL,
  `F_D_M_IOS` tinyint(1) NOT NULL,
  `F_D_E_WINDOWS` tinyint(1) NOT NULL,
  `F_D_E_MAC` tinyint(1) NOT NULL,
  `F_D_REDES` tinyint(1) NOT NULL,
  `PROYECTOS_TRABAJADOS` varchar(120) NOT NULL,
  `PREPARACION` varchar(120) NOT NULL,
  `F_SISTEMA_BLOQUEADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `desarrollador`
--

INSERT INTO `desarrollador` (`ID_DESARROLLADOR`, `NOMBRE`, `APELLIDO_P`, `APELLIDO_M`, `CORREO`, `FOTO`, `CALIFICACION`, `F_ESTADO_REGISTRO`, `PASSWORD`, `TELEFONO`, `F_BAJA_USUARIO`, `F_ESTADO_LOGIN`, `CURP`, `F_USUARIO_APRUEBA`, `F_D_WEB`, `F_D_M_ANDROID`, `F_D_M_IOS`, `F_D_E_WINDOWS`, `F_D_E_MAC`, `F_D_REDES`, `PROYECTOS_TRABAJADOS`, `PREPARACION`, `F_SISTEMA_BLOQUEADO`) VALUES
(1, 'GABRIEL ', 'RODRIGUEZ ', 'ANGELES', 'b', '', 10, 0, '1', '3317473102', 0, 0, ' ROAG991023HJCDNB08', 0, 1, 1, 0, 1, 1, 1, '', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje`
--

CREATE TABLE `mensaje` (
  `ID_MENSAJE` int(11) NOT NULL,
  `MENSAJE` varchar(120) NOT NULL,
  `FECHA` date NOT NULL,
  `HORA` varchar(10) NOT NULL,
  `FK_SALA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE `proyecto` (
  `ID_PROYECTO` int(11) NOT NULL,
  `TITULO` varchar(20) NOT NULL,
  `DESCRIPCION` varchar(120) NOT NULL,
  `FECHA_DE_INICIO` date NOT NULL,
  `PRESUPUESTO` float NOT NULL,
  `F_TIPO_DE_PROYECTO` tinyint(1) NOT NULL,
  `F_REQ_F` tinyint(1) NOT NULL,
  `No_VISITAS` int(11) NOT NULL,
  `FECHA _ULTIMA_VISITA` date NOT NULL,
  `F_A_CORRECION_REQ_D` tinyint(1) NOT NULL,
  `F_TERMINADO` tinyint(1) NOT NULL,
  `F_A_CORRECION_REQ_C` tinyint(1) NOT NULL,
  `F_S_CORRECION_REQ` tinyint(1) NOT NULL,
  `F_VISIBILIDAD` tinyint(1) NOT NULL,
  `F_EN_DESARROLLO` tinyint(1) NOT NULL,
  `INTERVALO_DE_AVANCES` int(11) NOT NULL,
  `F_S_ENTREGABLES` tinyint(1) NOT NULL,
  `FK_CLIENTE` int(11) DEFAULT NULL,
  `FK_DESARROLLADOR` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`ID_PROYECTO`, `TITULO`, `DESCRIPCION`, `FECHA_DE_INICIO`, `PRESUPUESTO`, `F_TIPO_DE_PROYECTO`, `F_REQ_F`, `No_VISITAS`, `FECHA _ULTIMA_VISITA`, `F_A_CORRECION_REQ_D`, `F_TERMINADO`, `F_A_CORRECION_REQ_C`, `F_S_CORRECION_REQ`, `F_VISIBILIDAD`, `F_EN_DESARROLLO`, `INTERVALO_DE_AVANCES`, `F_S_ENTREGABLES`, `FK_CLIENTE`, `FK_DESARROLLADOR`) VALUES
(3, 'PROYECTO DE PRUEBA 1', 'ESTE ES UN PROYECTO DE PRUEBA NUMERO UNO PARA REVISAR EL FUNCIONAMIENTO DE LA BASE DE DATOS', '2019-08-12', 0, 1, 0, 0, '2019-08-01', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(4, 'PROYECTO DE PRUEBA 2', 'ESTE ES UN PROYECTO DE PRUEBA NUMERO DOS PARA REVISAR EL FUNCIONAMIENTO DE LA BASE DE DATOS', '2019-08-21', 0, 2, 0, 0, '2019-08-15', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(5, 'PROYECTO DE PRUEBA 3', 'ESTE ES UN PROYECTO DE PRUEBA NUMERO UNO PARA REVISAR EL FUNCIONAMIENTO DE LA BASE DE DATOS', '2019-08-28', 0, 3, 0, 0, '2019-08-10', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(6, 'PROYECTO DE PRUEBA 4', 'ESTE ES UN PROYECTO DE PRUEBA NUMERO DOS PARA REVISAR EL FUNCIONAMIENTO DE LA BASE DE DATOS', '2019-08-15', 0, 4, 0, 0, '2019-08-21', 0, 0, 0, 0, 0, 0, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `req_formales`
--

CREATE TABLE `req_formales` (
  `ID_REQ_F` int(11) NOT NULL,
  `REQUERIMIENTO` varchar(120) NOT NULL,
  `FECHA` date NOT NULL,
  `F_REQ_CUMPLIDO` tinyint(1) NOT NULL,
  `FK_PROYECTO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `req_formales`
--

INSERT INTO `req_formales` (`ID_REQ_F`, `REQUERIMIENTO`, `FECHA`, `F_REQ_CUMPLIDO`, `FK_PROYECTO`) VALUES
(1, 'requerimiento de prueba', '2019-08-21', 0, 6),
(2, 'rwquermiento de dos prelekss', '2019-08-07', 0, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `req_no_formales`
--

CREATE TABLE `req_no_formales` (
  `ID_REQ_NF` int(11) NOT NULL,
  `REQUERIMIENTO` varchar(120) NOT NULL,
  `FECHA` date NOT NULL,
  `FK_PROYECTO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `req_no_formales`
--

INSERT INTO `req_no_formales` (`ID_REQ_NF`, `REQUERIMIENTO`, `FECHA`, `FK_PROYECTO`) VALUES
(1, 'requermiento no funconak ajaja', '2019-08-07', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala_mensajes`
--

CREATE TABLE `sala_mensajes` (
  `ID_SALA` int(11) NOT NULL,
  `FK_CLIENTE` int(11) NOT NULL,
  `FK_DESAROLLADOR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud`
--

CREATE TABLE `solicitud` (
  `ID_SOLICITUD` int(11) NOT NULL,
  `FECHA_DE_SOLICITUD` date NOT NULL,
  `FK_PROYECTO` int(11) NOT NULL,
  `FK_DESAROLLADOR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita`
--

CREATE TABLE `visita` (
  `ID_VISITA` int(11) NOT NULL,
  `FECHA` date NOT NULL,
  `FK_PROYECTO` int(11) NOT NULL,
  `FK_DESAROLLADOR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `avances`
--
ALTER TABLE `avances`
  ADD PRIMARY KEY (`ID_AVANCES`),
  ADD KEY `FK_PROYECTO` (`FK_PROYECTO`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_CLIENTE`);

--
-- Indices de la tabla `comentario_cliente`
--
ALTER TABLE `comentario_cliente`
  ADD PRIMARY KEY (`ID_COMENTARIO`),
  ADD KEY `FK_AUTOR` (`FK_AUTOR`),
  ADD KEY `FK_DESTINATARIO` (`FK_DESTINATARIO`);

--
-- Indices de la tabla `comentario_desarrollador`
--
ALTER TABLE `comentario_desarrollador`
  ADD PRIMARY KEY (`ID_COMENTARIO`),
  ADD KEY `comentario_desarrollador_ibfk_1` (`FK_AUTOR`),
  ADD KEY `FK_DESTINATARIO` (`FK_DESTINATARIO`);

--
-- Indices de la tabla `desarrollador`
--
ALTER TABLE `desarrollador`
  ADD PRIMARY KEY (`ID_DESARROLLADOR`);

--
-- Indices de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD PRIMARY KEY (`ID_MENSAJE`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`ID_PROYECTO`),
  ADD KEY `FK_CLIENTE` (`FK_CLIENTE`),
  ADD KEY `FK_DESARROLLADOR` (`FK_DESARROLLADOR`);

--
-- Indices de la tabla `req_formales`
--
ALTER TABLE `req_formales`
  ADD PRIMARY KEY (`ID_REQ_F`),
  ADD KEY `FK_PROYECTO` (`FK_PROYECTO`);

--
-- Indices de la tabla `req_no_formales`
--
ALTER TABLE `req_no_formales`
  ADD PRIMARY KEY (`ID_REQ_NF`),
  ADD KEY `FK_PROYECTO` (`FK_PROYECTO`);

--
-- Indices de la tabla `sala_mensajes`
--
ALTER TABLE `sala_mensajes`
  ADD PRIMARY KEY (`ID_SALA`);

--
-- Indices de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD PRIMARY KEY (`ID_SOLICITUD`),
  ADD KEY `FK_PROYECTO` (`FK_PROYECTO`),
  ADD KEY `FK_DESAROLLADOR` (`FK_DESAROLLADOR`);

--
-- Indices de la tabla `visita`
--
ALTER TABLE `visita`
  ADD PRIMARY KEY (`ID_VISITA`),
  ADD KEY `FK_DESAROLLADOR` (`FK_DESAROLLADOR`),
  ADD KEY `FK_PROYECTO` (`FK_PROYECTO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `avances`
--
ALTER TABLE `avances`
  MODIFY `ID_AVANCES` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `ID_CLIENTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `comentario_cliente`
--
ALTER TABLE `comentario_cliente`
  MODIFY `ID_COMENTARIO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comentario_desarrollador`
--
ALTER TABLE `comentario_desarrollador`
  MODIFY `ID_COMENTARIO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `desarrollador`
--
ALTER TABLE `desarrollador`
  MODIFY `ID_DESARROLLADOR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  MODIFY `ID_MENSAJE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  MODIFY `ID_PROYECTO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `req_formales`
--
ALTER TABLE `req_formales`
  MODIFY `ID_REQ_F` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `req_no_formales`
--
ALTER TABLE `req_no_formales`
  MODIFY `ID_REQ_NF` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `sala_mensajes`
--
ALTER TABLE `sala_mensajes`
  MODIFY `ID_SALA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  MODIFY `ID_SOLICITUD` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `visita`
--
ALTER TABLE `visita`
  MODIFY `ID_VISITA` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `avances`
--
ALTER TABLE `avances`
  ADD CONSTRAINT `avances_ibfk_1` FOREIGN KEY (`FK_PROYECTO`) REFERENCES `proyecto` (`ID_PROYECTO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `comentario_cliente`
--
ALTER TABLE `comentario_cliente`
  ADD CONSTRAINT `comentario_cliente_ibfk_1` FOREIGN KEY (`FK_AUTOR`) REFERENCES `desarrollador` (`ID_DESARROLLADOR`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comentario_cliente_ibfk_2` FOREIGN KEY (`FK_DESTINATARIO`) REFERENCES `cliente` (`ID_CLIENTE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `comentario_desarrollador`
--
ALTER TABLE `comentario_desarrollador`
  ADD CONSTRAINT `comentario_desarrollador_ibfk_1` FOREIGN KEY (`FK_AUTOR`) REFERENCES `cliente` (`ID_CLIENTE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comentario_desarrollador_ibfk_2` FOREIGN KEY (`FK_DESTINATARIO`) REFERENCES `desarrollador` (`ID_DESARROLLADOR`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `proyecto_ibfk_1` FOREIGN KEY (`FK_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proyecto_ibfk_2` FOREIGN KEY (`FK_DESARROLLADOR`) REFERENCES `desarrollador` (`ID_DESARROLLADOR`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `req_formales`
--
ALTER TABLE `req_formales`
  ADD CONSTRAINT `req_formales_ibfk_1` FOREIGN KEY (`FK_PROYECTO`) REFERENCES `proyecto` (`ID_PROYECTO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `req_no_formales`
--
ALTER TABLE `req_no_formales`
  ADD CONSTRAINT `req_no_formales_ibfk_1` FOREIGN KEY (`FK_PROYECTO`) REFERENCES `proyecto` (`ID_PROYECTO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD CONSTRAINT `solicitud_ibfk_1` FOREIGN KEY (`FK_PROYECTO`) REFERENCES `proyecto` (`ID_PROYECTO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `solicitud_ibfk_2` FOREIGN KEY (`FK_DESAROLLADOR`) REFERENCES `desarrollador` (`ID_DESARROLLADOR`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `visita`
--
ALTER TABLE `visita`
  ADD CONSTRAINT `visita_ibfk_1` FOREIGN KEY (`FK_DESAROLLADOR`) REFERENCES `desarrollador` (`ID_DESARROLLADOR`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `visita_ibfk_2` FOREIGN KEY (`FK_PROYECTO`) REFERENCES `proyecto` (`ID_PROYECTO`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
