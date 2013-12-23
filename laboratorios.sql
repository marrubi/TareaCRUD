-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 22-12-2013 a las 23:27:49
-- Versión del servidor: 5.6.12-log
-- Versión de PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `laboratorios`
--
CREATE DATABASE IF NOT EXISTS `laboratorios` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `laboratorios`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_spanish_ci NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('1f8554dc8a139f9f6d54fd3125f55a57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36', 1387384166, 'a:1:{s:9:"user_data";s:0:"";}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb-administrador`
--

CREATE TABLE IF NOT EXISTS `tb-administrador` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `rut` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_admin`),
  UNIQUE KEY `rut` (`rut`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tb-administrador`
--

INSERT INTO `tb-administrador` (`id_admin`, `rut`, `nombre`, `apellido`, `password`) VALUES
(4, 10856372, 'Gerardo', 'Martino', 'ger_martin19_/(x'),
(3, 9874623, 'José', 'Pekerman', 'jose_pek_&18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb-alumno`
--

CREATE TABLE IF NOT EXISTS `tb-alumno` (
  `id_alum` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `pase` int(11) DEFAULT NULL COMMENT 'optativo, será útil cuando se use una pistola de códigos de barra',
  `rut` int(11) NOT NULL,
  `carrera_fk` int(11) NOT NULL,
  PRIMARY KEY (`id_alum`),
  UNIQUE KEY `rut` (`rut`),
  KEY `carrera-fk` (`carrera_fk`),
  KEY `carrera_fk` (`carrera_fk`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='registro de alumnos' AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tb-alumno`
--

INSERT INTO `tb-alumno` (`id_alum`, `nombre`, `pase`, `rut`, `carrera_fk`) VALUES
(1, 'Airton Senna', NULL, 12384569, 1),
(2, 'Michael Schumacher', 238458, 19345829, 1),
(3, 'Marco Arratia', 123542, 16932631, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb-alumno-asignatura`
--

CREATE TABLE IF NOT EXISTS `tb-alumno-asignatura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alumno-fk` int(11) NOT NULL,
  `asignatura-fk` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `alumno-fk` (`alumno-fk`),
  KEY `asignatura-fk` (`asignatura-fk`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='registro de alumnos en secciones de asignaturas' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tb-alumno-asignatura`
--

INSERT INTO `tb-alumno-asignatura` (`id`, `alumno-fk`, `asignatura-fk`) VALUES
(1, 1, 2),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb-alumno-equipo`
--

CREATE TABLE IF NOT EXISTS `tb-alumno-equipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alumno-fk` int(11) NOT NULL,
  `equipo-fk` int(11) NOT NULL,
  `dia_entrada` date NOT NULL,
  `hora_entrada` time NOT NULL,
  `dia_salida` date NOT NULL,
  `hora_salida` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `alumno-fk` (`alumno-fk`),
  KEY `equipo-fk` (`equipo-fk`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='registro de ingreso/salida de alumnos' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tb-alumno-equipo`
--

INSERT INTO `tb-alumno-equipo` (`id`, `alumno-fk`, `equipo-fk`, `dia_entrada`, `hora_entrada`, `dia_salida`, `hora_salida`) VALUES
(1, 1, 1, '2013-11-19', '12:15:00', '2013-11-19', '12:30:00'),
(2, 1, 1, '2013-11-20', '10:00:00', '2013-11-20', '14:12:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb-asignatura`
--

CREATE TABLE IF NOT EXISTS `tb-asignatura` (
  `id_asig` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `codigo` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `seccion` int(11) NOT NULL,
  PRIMARY KEY (`id_asig`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='registro de asignaturas por seccion' AUTO_INCREMENT=28 ;

--
-- Volcado de datos para la tabla `tb-asignatura`
--

INSERT INTO `tb-asignatura` (`id_asig`, `nombre`, `codigo`, `seccion`) VALUES
(1, 'Análisis de Algoritmos', 'INF-648', 1),
(2, 'Arquitectura de Computadores', 'INF-605', 1),
(3, 'Auditoría de Sistemas', 'INF-658', 1),
(4, 'Bases de Datos', NULL, 1),
(5, 'Ciencias de la Computación', NULL, 1),
(6, 'Computación Paralela', NULL, 1),
(7, 'Desempeño de Sistemas Computacionales', NULL, 1),
(8, 'Estructuras de Datos', NULL, 1),
(9, 'Estructuras Discretas', NULL, 1),
(10, 'Gestión de Personal Informático', NULL, 1),
(11, 'Gestión de Proyectos Informáticos', NULL, 1),
(12, 'Gestión Informática', NULL, 1),
(13, 'Gestión Financiera de TI', NULL, 1),
(14, 'Informática Industrial', NULL, 1),
(15, 'Ingeniería de Software', NULL, 1),
(16, 'Lenguajes de Programación', NULL, 1),
(17, 'Programación', NULL, 1),
(18, 'Optimización de Sistemas', NULL, 1),
(19, 'Organización de Computadores', NULL, 1),
(20, 'Sistemas de Información', NULL, 1),
(21, 'Sistemas Distribuidos', NULL, 1),
(22, 'Sistemas Integrados de Información', NULL, 1),
(23, 'Sistemas Operativos', NULL, 1),
(24, 'Taller de SIA', NULL, 1),
(25, 'Tecnología de Equipos', NULL, 1),
(26, 'Teoría de Autómatas', NULL, 1),
(27, 'Electivo de Formación Especializada', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb-carrera`
--

CREATE TABLE IF NOT EXISTS `tb-carrera` (
  `id_carrera` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `codigo` int(11) NOT NULL COMMENT 'corresponde al codigo de carrera',
  PRIMARY KEY (`id_carrera`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='tabla almacena las carreras que tienen acceso a los labs' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tb-carrera`
--

INSERT INTO `tb-carrera` (`id_carrera`, `nombre`, `codigo`) VALUES
(1, 'Ingeniería en Informática', 21030),
(2, 'Ingeniería Civil en Computación Mención Informática', 21041);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb-equipo`
--

CREATE TABLE IF NOT EXISTS `tb-equipo` (
  `id_eq` int(11) NOT NULL AUTO_INCREMENT,
  `serie` int(11) NOT NULL,
  `laboratorio-fk` int(11) NOT NULL,
  `estado-fk` int(11) NOT NULL,
  `uso-fk` int(11) NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci,
  `referencia` int(2) NOT NULL,
  PRIMARY KEY (`id_eq`),
  KEY `estado-fk` (`estado-fk`),
  KEY `laboratorio-fk` (`laboratorio-fk`),
  KEY `uso-fk` (`uso-fk`),
  KEY `laboratorio-fk_2` (`laboratorio-fk`),
  KEY `estado-fk_2` (`estado-fk`),
  KEY `uso-fk_2` (`uso-fk`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='inventario de equipo con datos de estado y uso actual' AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `tb-equipo`
--

INSERT INTO `tb-equipo` (`id_eq`, `serie`, `laboratorio-fk`, `estado-fk`, `uso-fk`, `descripcion`, `referencia`) VALUES
(1, 495573, 6, 1, 1, 'Pantalla: Samsung\r\nCPU: Intel Core i7\r\nSistema Operativo: Windows 7 Professional Edition', 4),
(2, 543468, 6, 2, 1, 'Pantalla: Samsung\r\nCPU: Intel Core i7\r\nSistema Operativo: Windows 7 Professional', 5),
(3, 467357, 6, 1, 1, 'Pantalla: Samsung\r\nSistema Operativo: Intel Core i7\r\nDisco Duro: 500GB\r\nMemoria RAM: 8GB', 1),
(4, 685684, 6, 1, 1, NULL, 2),
(5, 636472, 6, 1, 1, NULL, 3),
(6, 333556, 6, 1, 2, NULL, 6),
(7, 348272, 6, 1, 1, NULL, 7),
(8, 764859, 6, 1, 2, NULL, 8),
(9, 348882, 6, 1, 1, NULL, 9),
(10, 768599, 6, 1, 2, NULL, 10),
(11, 348231, 6, 1, 1, NULL, 11),
(12, 768453, 6, 1, 2, NULL, 12),
(13, 348344, 6, 1, 1, NULL, 13),
(14, 768987, 6, 1, 2, NULL, 14),
(15, 787272, 6, 1, 1, NULL, 15),
(16, 548556, 6, 1, 2, NULL, 16),
(17, 677563, 1, 1, 1, NULL, 1),
(18, 678463, 1, 1, 1, NULL, 2),
(19, 678464, 1, 1, 1, NULL, 3),
(20, 678465, 1, 1, 1, NULL, 4),
(21, 678466, 1, 1, 1, NULL, 5),
(22, 678467, 1, 1, 1, NULL, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb-estado`
--

CREATE TABLE IF NOT EXISTS `tb-estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='indica estados de los equipos (habilitado, no habilitado, re' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tb-estado`
--

INSERT INTO `tb-estado` (`id_estado`, `nombre`) VALUES
(1, 'habilitado'),
(2, 'no disponible (en uso)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb-func-obs-equipo`
--

CREATE TABLE IF NOT EXISTS `tb-func-obs-equipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `funcionario-fk` int(11) NOT NULL,
  `equipo-fk` int(11) NOT NULL,
  `detalle` text COLLATE utf8_spanish_ci,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb-funcionario`
--

CREATE TABLE IF NOT EXISTS `tb-funcionario` (
  `id_funcionario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `rut` int(11) NOT NULL,
  `password` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_funcionario`),
  UNIQUE KEY `rut` (`rut`),
  KEY `id_funcionario` (`id_funcionario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tb-funcionario`
--

INSERT INTO `tb-funcionario` (`id_funcionario`, `nombre`, `apellido`, `rut`, `password`, `direccion`) VALUES
(1, 'Juan', 'López', 8975653, 'juanlop12', 'Pasaje Lo Curro #365, La Reina'),
(2, 'Lauraro', 'Rodríguez', 9867531, 'lau_rod75', 'Calle Los Naranjos #5784, Peñalolen'),
(3, 'Cristóbal', 'Martínez', 10643287, 'cris_56_martX', 'Avenida Providencia #1847, Departamento #304, Providencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb-herramienta`
--

CREATE TABLE IF NOT EXISTS `tb-herramienta` (
  `id_herramienta` int(11) NOT NULL AUTO_INCREMENT,
  `n_inventario` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'solo si existe',
  `modelo` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `marca` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `comentario` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipo-fk` int(11) NOT NULL,
  `laboratorio-fk` int(11) NOT NULL,
  `uso-fk` int(11) NOT NULL,
  `estado-fk` int(11) NOT NULL,
  PRIMARY KEY (`id_herramienta`),
  KEY `tipo-fk` (`tipo-fk`),
  KEY `laboratorio-fk` (`laboratorio-fk`),
  KEY `uso-fk` (`uso-fk`),
  KEY `estado-fk` (`estado-fk`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='detall de cada herramenta en inventario' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tb-herramienta`
--

INSERT INTO `tb-herramienta` (`id_herramienta`, `n_inventario`, `modelo`, `marca`, `comentario`, `tipo-fk`, `laboratorio-fk`, `uso-fk`, `estado-fk`) VALUES
(1, '345227', 'th-45', NULL, NULL, 2, 8, 1, 1),
(2, '344728', 'vx-tex4500', 'sony', NULL, 1, 6, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb-impresiones`
--

CREATE TABLE IF NOT EXISTS `tb-impresiones` (
  `id_imp` int(11) NOT NULL AUTO_INCREMENT,
  `alumno_fk` int(11) NOT NULL,
  `n_hojas` int(11) NOT NULL,
  `tipo_fk` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`id_imp`),
  KEY `alumno-fk` (`alumno_fk`),
  KEY `tipo-fk` (`tipo_fk`),
  KEY `alumno_fk` (`alumno_fk`),
  KEY `tipo_fk` (`tipo_fk`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='registro de impresiones de los alumnos' AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `tb-impresiones`
--

INSERT INTO `tb-impresiones` (`id_imp`, `alumno_fk`, `n_hojas`, `tipo_fk`, `fecha`, `hora`) VALUES
(1, 1, 25, 2, '2013-11-20', '00:05:18'),
(2, 1, 2, 2, '2013-11-22', '12:15:00'),
(3, 2, 5, 1, '2013-12-16', '12:30:00'),
(4, 2, 10, 1, '2013-12-15', '13:30:00'),
(5, 3, 4, 1, '2013-12-13', '12:45:00'),
(6, 3, 6, 2, '2013-12-17', '16:28:03'),
(7, 3, 10, 1, '2013-12-17', '16:34:52'),
(8, 3, 5, 2, '2013-12-17', '23:58:59'),
(9, 3, 5, 2, '2013-12-18', '13:27:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb-impresora`
--

CREATE TABLE IF NOT EXISTS `tb-impresora` (
  `id_imp` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `serie` int(11) NOT NULL,
  `caracteristicas` text COLLATE utf8_spanish_ci,
  `fecha_import` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado_imp` tinyint(4) NOT NULL,
  `fecha_baja` datetime DEFAULT NULL,
  PRIMARY KEY (`id_imp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb-laboratorio`
--

CREATE TABLE IF NOT EXISTS `tb-laboratorio` (
  `id_lab` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_lab`),
  KEY `estado` (`estado`),
  KEY `id_lab` (`id_lab`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='tabla indica los laboratorios existentes' AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `tb-laboratorio`
--

INSERT INTO `tb-laboratorio` (`id_lab`, `nombre`, `estado`) VALUES
(1, 'Laboratorio 1', 1),
(2, 'Laboratorio 2', 0),
(3, 'Laboratorio 3', 0),
(4, 'Laboratorio 4', 0),
(5, 'Laboratorio 5', 0),
(6, 'Laboratorio 6', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb-observaciones`
--

CREATE TABLE IF NOT EXISTS `tb-observaciones` (
  `id_ob` int(11) NOT NULL AUTO_INCREMENT,
  `alumno-fk` int(11) NOT NULL,
  `detalle` varchar(1500) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_ob`),
  KEY `alumno-fk` (`alumno-fk`),
  KEY `alumno-fk_2` (`alumno-fk`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='registra observaciones de alumnos (ingresadas por administra' AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `tb-observaciones`
--

INSERT INTO `tb-observaciones` (`id_ob`, `alumno-fk`, `detalle`, `fecha`) VALUES
(1, 2, 'segunda oportunidad que se encuentra a alumno comiendo en laboratorio', '2013-12-20 16:04:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb-periodo`
--

CREATE TABLE IF NOT EXISTS `tb-periodo` (
  `id_per` int(11) NOT NULL AUTO_INCREMENT,
  `inicio` time NOT NULL,
  `fin` time NOT NULL,
  `num-per` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_per`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `tb-periodo`
--

INSERT INTO `tb-periodo` (`id_per`, `inicio`, `fin`, `num-per`) VALUES
(1, '08:15:00', '09:35:00', 'I'),
(2, '09:45:00', '11:05:00', 'II'),
(3, '11:15:00', '12:35:00', 'III'),
(4, '12:45:00', '14:05:00', 'IV'),
(5, '14:15:00', '15:35:00', 'V'),
(6, '15:45:00', '17:05:00', 'VI'),
(7, '17:15:00', '18:35:00', 'VII'),
(8, '19:00:00', '20:30:00', 'VIII');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb-profesor`
--

CREATE TABLE IF NOT EXISTS `tb-profesor` (
  `id_profesor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `rut` int(11) NOT NULL,
  PRIMARY KEY (`id_profesor`),
  UNIQUE KEY `rut` (`rut`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='registro de profesores' AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `tb-profesor`
--

INSERT INTO `tb-profesor` (`id_profesor`, `nombre`, `rut`) VALUES
(1, 'Benjamin Vicuña Mackenna', 9875632),
(2, 'José Joaquín Prieto', 9826453),
(3, 'Juan Manuel Lira López', 9765471),
(4, 'José Luis Méndez Rodríguez', 9675378),
(5, 'Manuel Marcelo Jaramillo Cox', 9756342),
(6, 'Sebastian Rodríguez Mora', 10758371);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb-profesor-asignatura`
--

CREATE TABLE IF NOT EXISTS `tb-profesor-asignatura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profesor_fk` int(11) NOT NULL,
  `asignatura_fk` int(11) NOT NULL,
  `fecha_asignacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `profesor_fk` (`profesor_fk`),
  KEY `asignatura_fk` (`asignatura_fk`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tb-profesor-asignatura`
--

INSERT INTO `tb-profesor-asignatura` (`id`, `profesor_fk`, `asignatura_fk`, `fecha_asignacion`) VALUES
(1, 3, 13, '2013-12-17 22:30:09'),
(2, 2, 9, '2013-12-17 22:30:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb-reserva`
--

CREATE TABLE IF NOT EXISTS `tb-reserva` (
  `id_res` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_dest` date NOT NULL,
  `academico_fk` int(11) NOT NULL,
  `periodo_fk` int(11) NOT NULL,
  `fecha_sol` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `asignatura_fk` int(11) NOT NULL,
  `lab_fk` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_res`),
  KEY `academico-fk` (`academico_fk`,`periodo_fk`),
  KEY `academico-fk_2` (`academico_fk`,`periodo_fk`),
  KEY `periodo-fk` (`periodo_fk`),
  KEY `asignatura-fk` (`asignatura_fk`),
  KEY `laboratorio-fk` (`lab_fk`),
  KEY `laboratorio-fk_2` (`lab_fk`),
  KEY `lab-fk` (`lab_fk`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `tb-reserva`
--

INSERT INTO `tb-reserva` (`id_res`, `fecha_dest`, `academico_fk`, `periodo_fk`, `fecha_sol`, `asignatura_fk`, `lab_fk`) VALUES
(2, '2013-12-25', 1, 5, '2013-12-23 02:03:05', 7, 4),
(3, '2013-12-26', 4, 5, '2013-12-23 02:03:55', 13, 6),
(10, '2013-12-25', 4, 7, '2013-12-23 02:15:23', 6, 2),
(11, '2013-12-26', 1, 5, '2013-12-23 02:15:40', 14, 4),
(12, '2013-12-25', 4, 1, '2013-12-23 02:16:51', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb-software`
--

CREATE TABLE IF NOT EXISTS `tb-software` (
  `id_soft` int(11) NOT NULL AUTO_INCREMENT,
  `equipo-fk` int(11) NOT NULL,
  `detalle` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `licencia` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_soft`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='software instalado en equipos' AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `tb-software`
--

INSERT INTO `tb-software` (`id_soft`, `equipo-fk`, `detalle`, `licencia`) VALUES
(1, 1, 'windows 7 x64, ubuntu 12.04', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb-tipoherramienta`
--

CREATE TABLE IF NOT EXISTS `tb-tipoherramienta` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='indica categorias de herramientas' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tb-tipoherramienta`
--

INSERT INTO `tb-tipoherramienta` (`id_tipo`, `nombre`) VALUES
(1, 'datashow'),
(2, 'pinza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb-tipohoja`
--

CREATE TABLE IF NOT EXISTS `tb-tipohoja` (
  `id_tipohoja` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `ancho` varchar(10) COLLATE utf8_spanish_ci NOT NULL COMMENT 'indicar tipo de medida',
  `alto` varchar(10) COLLATE utf8_spanish_ci NOT NULL COMMENT 'indicar tipo de medida',
  PRIMARY KEY (`id_tipohoja`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='almacena datos de hojas que se usan en lab' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tb-tipohoja`
--

INSERT INTO `tb-tipohoja` (`id_tipohoja`, `nombre`, `ancho`, `alto`) VALUES
(1, 'oficio', '21.59', '34'),
(2, 'carta', '21.59', '27.94');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb-uso`
--

CREATE TABLE IF NOT EXISTS `tb-uso` (
  `id_uso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_uso`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='indica uso (disponible, no disponible (en uso))' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tb-uso`
--

INSERT INTO `tb-uso` (`id_uso`, `nombre`) VALUES
(1, 'disponible'),
(2, 'no disponible');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb-alumno`
--
ALTER TABLE `tb-alumno`
  ADD CONSTRAINT `fk_carr_alum` FOREIGN KEY (`carrera_fk`) REFERENCES `tb-carrera` (`id_carrera`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb-alumno-asignatura`
--
ALTER TABLE `tb-alumno-asignatura`
  ADD CONSTRAINT `fk_al_asig-al` FOREIGN KEY (`alumno-fk`) REFERENCES `tb-alumno` (`id_alum`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_asig_al-asig` FOREIGN KEY (`asignatura-fk`) REFERENCES `tb-asignatura` (`id_asig`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb-alumno-equipo`
--
ALTER TABLE `tb-alumno-equipo`
  ADD CONSTRAINT `fk_al_al-eq` FOREIGN KEY (`alumno-fk`) REFERENCES `tb-alumno` (`id_alum`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_eq_al-eq` FOREIGN KEY (`equipo-fk`) REFERENCES `tb-equipo` (`id_eq`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb-equipo`
--
ALTER TABLE `tb-equipo`
  ADD CONSTRAINT `fk_est_eq` FOREIGN KEY (`estado-fk`) REFERENCES `tb-estado` (`id_estado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_uso_eq` FOREIGN KEY (`uso-fk`) REFERENCES `tb-uso` (`id_uso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb-impresiones`
--
ALTER TABLE `tb-impresiones`
  ADD CONSTRAINT `fk-id-alum-imp` FOREIGN KEY (`alumno_fk`) REFERENCES `tb-alumno` (`id_alum`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-tipohoja-imp` FOREIGN KEY (`tipo_fk`) REFERENCES `tb-tipohoja` (`id_tipohoja`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb-observaciones`
--
ALTER TABLE `tb-observaciones`
  ADD CONSTRAINT `fk-alum-lab` FOREIGN KEY (`alumno-fk`) REFERENCES `tb-alumno` (`id_alum`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb-profesor-asignatura`
--
ALTER TABLE `tb-profesor-asignatura`
  ADD CONSTRAINT `fk_asig_prof-asig` FOREIGN KEY (`asignatura_fk`) REFERENCES `tb-asignatura` (`id_asig`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prof_prof-asig` FOREIGN KEY (`profesor_fk`) REFERENCES `tb-profesor` (`id_profesor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb-reserva`
--
ALTER TABLE `tb-reserva`
  ADD CONSTRAINT `fk_acad_res` FOREIGN KEY (`academico_fk`) REFERENCES `tb-profesor` (`id_profesor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_asig_res` FOREIGN KEY (`asignatura_fk`) REFERENCES `tb-asignatura` (`id_asig`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_lab_res` FOREIGN KEY (`lab_fk`) REFERENCES `tb-laboratorio` (`id_lab`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_per_res` FOREIGN KEY (`periodo_fk`) REFERENCES `tb-periodo` (`id_per`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
