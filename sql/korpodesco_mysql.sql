-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-11-2020 a las 04:59:35
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `korpodesco`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `idAsignatura` int(11) NOT NULL,
  `nombreasignatura` varchar(45) NOT NULL,
  `id_Programa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`idAsignatura`, `nombreasignatura`, `id_Programa`) VALUES
(1, 'Física', 1),
(2, 'Matemáticas I', 2),
(3, 'Matemáticas I', 2),
(4, 'Matemática Financiera', 3),
(5, 'Etica profesional', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `idestudiante` int(11) NOT NULL,
  `Documento` varchar(45) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `Apellidos` varchar(45) NOT NULL,
  `fechadenacimiento` date NOT NULL,
  `edad` int(11) NOT NULL,
  `telefono` int(11) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `nombrecontacto` varchar(45) NOT NULL,
  `telefonocontacto` bigint(20) UNSIGNED DEFAULT NULL,
  `vinculocontacto` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`idestudiante`, `Documento`, `nombres`, `Apellidos`, `fechadenacimiento`, `edad`, `telefono`, `correo`, `direccion`, `nombrecontacto`, `telefonocontacto`, `vinculocontacto`) VALUES
(1, '1017679890', 'Javier', 'Perez', '1988-01-23', 32, 2334567, 'javiperez@gmail.com', 'Calle las colonias 24', 'Pablo Perez', 3103456789, 'Padre'),
(2, '8801462736', 'Luis', 'Rodriguez', '2003-08-02', 17, 7885645, 'aswet@gmail.com', 'Avenida Centenario 89', 'Juan Rodriguez', 3235678934, 'Acudiente'),
(3, '56789006', 'Diana', 'Forero', '1990-02-15', 30, 8994532, 'dianif@hotmail.com', 'Parque los Robles', 'Tatiana Forero', 3124567813, 'Hermana'),
(4, '1015456789', 'Diego', 'Moreno', '2004-03-23', 16, 4556789, 'dmoreno90@yahoo.es', 'Cra 15 78 90', 'Ana Martinez', 3112345611, 'Acudiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE `inscripcion` (
  `idinscripcion` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_estudiante` int(11) NOT NULL,
  `id_institucion` int(11) NOT NULL,
  `id_Programa` int(11) NOT NULL,
  `id_Periodo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inscripcion`
--

INSERT INTO `inscripcion` (`idinscripcion`, `fecha`, `id_estudiante`, `id_institucion`, `id_Programa`, `id_Periodo`) VALUES
(1, '2019-09-10', 1, 1, 2, 1),
(2, '2018-10-28', 2, 2, 1, 4),
(3, '2019-06-02', 3, 3, 3, 2),
(4, '2017-06-02', 4, 4, 4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institucion`
--

CREATE TABLE `institucion` (
  `idinstitucion` int(11) NOT NULL,
  `codDANE` varchar(45) NOT NULL,
  `nombreinst` varchar(45) NOT NULL,
  `telefono` int(11) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `institucion`
--

INSERT INTO `institucion` (`idinstitucion`, `codDANE`, `nombreinst`, `telefono`, `correo`, `direccion`) VALUES
(1, '345612', 'Miguel Antonio Caro', 2113456, 'mac.edu@miguelacaro.edu.co', 'Calle Principal 1'),
(2, '567890', 'Nydia Quintero', 5647890, 'nydqt.edu@nqt.edu.co', 'Calle Los Robles 12'),
(3, '675645', 'Francisco José de Caldas', 7886756, 'fjc1@fjc.edu.co', 'Carrera 12 Calle 24'),
(4, '786756', 'Guillermo Leon Valencia', 6789056, 'guillermoleonvalencia@glv.edu.co', 'Avenida Quito 23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

CREATE TABLE `matricula` (
  `idMatricula` int(11) NOT NULL,
  `FechaMatricula` date NOT NULL,
  `id_estudiante` int(11) NOT NULL,
  `id_Periodo` int(11) NOT NULL,
  `id_inscripcion` int(11) NOT NULL,
  `fechalimitedepago` date NOT NULL,
  `pagado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `matricula`
--

INSERT INTO `matricula` (`idMatricula`, `FechaMatricula`, `id_estudiante`, `id_Periodo`, `id_inscripcion`, `fechalimitedepago`, `pagado`) VALUES
(1, '2019-09-10', 1, 1, 2, '2019-11-10', 1),
(2, '2018-10-28', 2, 2, 1, '2018-11-30', 0),
(3, '2018-10-28', 2, 2, 1, '2018-12-03', 0),
(4, '2017-06-02', 4, 4, 4, '2017-07-10', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo`
--

CREATE TABLE `periodo` (
  `idPeriodo` int(11) NOT NULL,
  `Añoperiodo` year(4) NOT NULL,
  `semestre` int(11) NOT NULL,
  `Inicioperiodo` date NOT NULL,
  `Finperiodo` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `periodo`
--

INSERT INTO `periodo` (`idPeriodo`, `Añoperiodo`, `semestre`, `Inicioperiodo`, `Finperiodo`) VALUES
(1, 2018, 2, '2018-01-03', '2018-07-30'),
(2, 2020, 2, '2020-07-03', '2020-11-30'),
(3, 2019, 3, '2019-01-03', '2019-07-30'),
(4, 2017, 1, '2017-01-03', '2018-07-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa`
--

CREATE TABLE `programa` (
  `idPrograma` int(11) NOT NULL,
  `nombreprograma` varchar(45) NOT NULL,
  `Descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tabla de Programas';

--
-- Volcado de datos para la tabla `programa`
--

INSERT INTO `programa` (`idPrograma`, `nombreprograma`, `Descripcion`) VALUES
(1, 'Ingenieria Civil', 'Profesional'),
(2, 'Licenciatura en Matemáticas', 'Licenciatura'),
(3, 'Contaduría', 'Profesional'),
(4, 'Química', 'Profesional');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`idAsignatura`),
  ADD KEY `id_Programa` (`id_Programa`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`idestudiante`);

--
-- Indices de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD PRIMARY KEY (`idinscripcion`),
  ADD KEY `id_estudiante` (`id_estudiante`),
  ADD KEY `id_institucion` (`id_institucion`),
  ADD KEY `id_Programa` (`id_Programa`),
  ADD KEY `id_Periodo` (`id_Periodo`);

--
-- Indices de la tabla `institucion`
--
ALTER TABLE `institucion`
  ADD PRIMARY KEY (`idinstitucion`),
  ADD UNIQUE KEY `codDANE` (`codDANE`),
  ADD KEY `telefono` (`telefono`);

--
-- Indices de la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD PRIMARY KEY (`idMatricula`),
  ADD KEY `id_estudiante` (`id_estudiante`),
  ADD KEY `id_Periodo` (`id_Periodo`),
  ADD KEY `id_inscripcion` (`id_inscripcion`);

--
-- Indices de la tabla `periodo`
--
ALTER TABLE `periodo`
  ADD PRIMARY KEY (`idPeriodo`);

--
-- Indices de la tabla `programa`
--
ALTER TABLE `programa`
  ADD PRIMARY KEY (`idPrograma`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  MODIFY `idAsignatura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `idestudiante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  MODIFY `idinscripcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `institucion`
--
ALTER TABLE `institucion`
  MODIFY `idinstitucion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `matricula`
--
ALTER TABLE `matricula`
  MODIFY `idMatricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `periodo`
--
ALTER TABLE `periodo`
  MODIFY `idPeriodo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `programa`
--
ALTER TABLE `programa`
  MODIFY `idPrograma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `asignatura_ibfk_1` FOREIGN KEY (`id_Programa`) REFERENCES `programa` (`idPrograma`);

--
-- Filtros para la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `inscripcion_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`idestudiante`),
  ADD CONSTRAINT `inscripcion_ibfk_2` FOREIGN KEY (`id_institucion`) REFERENCES `institucion` (`idinstitucion`),
  ADD CONSTRAINT `inscripcion_ibfk_3` FOREIGN KEY (`id_Programa`) REFERENCES `programa` (`idPrograma`),
  ADD CONSTRAINT `inscripcion_ibfk_4` FOREIGN KEY (`id_Periodo`) REFERENCES `periodo` (`idPeriodo`);

--
-- Filtros para la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`idestudiante`),
  ADD CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`id_Periodo`) REFERENCES `periodo` (`idPeriodo`),
  ADD CONSTRAINT `matricula_ibfk_3` FOREIGN KEY (`id_inscripcion`) REFERENCES `inscripcion` (`idinscripcion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
