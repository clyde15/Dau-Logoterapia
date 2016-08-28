-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-08-2016 a las 16:11:39
-- Versión del servidor: 5.7.9
-- Versión de PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `logoterapia`
--
CREATE DATABASE IF NOT EXISTS `logoterapia` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `logoterapia`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnocursoprofesor`
--

DROP TABLE IF EXISTS `alumnocursoprofesor`;
CREATE TABLE IF NOT EXISTS `alumnocursoprofesor` (
  `idalumnocursoprofesor` int(11) NOT NULL AUTO_INCREMENT,
  `id_alumno` int(11) NOT NULL,
  `id_cursoprofesores` int(11) NOT NULL,
  PRIMARY KEY (`idalumnocursoprofesor`),
  KEY `id_cursoprofesores_idx` (`id_cursoprofesores`),
  KEY `id_alumno_idx` (`id_alumno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
CREATE TABLE IF NOT EXISTS `alumnos` (
  `idalumnos` int(11) NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Apellidos` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `DNI` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Direccion` longtext COLLATE latin1_general_ci,
  `Telefono` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `TelefonoSecundario` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `Correo` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `UsuarioSkype` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `FechaNacimiento` datetime NOT NULL,
  `Activo` bit(1) NOT NULL DEFAULT b'1',
  `Eliminado` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`idalumnos`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`idalumnos`, `Nombres`, `Apellidos`, `DNI`, `Direccion`, `Telefono`, `TelefonoSecundario`, `Correo`, `UsuarioSkype`, `FechaNacimiento`, `Activo`, `Eliminado`) VALUES
(1, 'alumno1', 'prueba', '12345678', 'caricuao', '04241394098', NULL, 'prueba@prueba.com', 'prueba', '1992-03-08 00:00:00', b'1', b'0'),
(2, 'alumno2', 'prueba2', '1234567', 'caño amarillo', '0424694460', NULL, 'prueba2@prueba.com', 'prueba2', '1991-02-01 00:00:00', b'1', b'0'),
(3, 'alumno3', 'prueba3', '12345678', 'la guaira', '04241234567', NULL, 'prueba3@prueba3.com', 'prueba3', '1990-04-02 00:00:00', b'1', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnosdebaja`
--

DROP TABLE IF EXISTS `alumnosdebaja`;
CREATE TABLE IF NOT EXISTS `alumnosdebaja` (
  `idAlumnosDeBaja` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Alumno` int(11) NOT NULL,
  `ID_Configuracion` int(11) NOT NULL,
  `FechaDeBaja` datetime DEFAULT NULL,
  `FechaSolicitud` datetime DEFAULT NULL,
  `ID_Motivo` int(11) DEFAULT NULL,
  `Solicitado` bit(1) NOT NULL,
  `DeBaja` bit(1) NOT NULL,
  PRIMARY KEY (`idAlumnosDeBaja`),
  KEY `ID_Alumno_idx` (`ID_Alumno`),
  KEY `ID_Configuracion_FK_idx` (`ID_Configuracion`),
  KEY `ID_Motivo_Motivo_FK_idx` (`ID_Motivo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alumnosdebaja`
--

INSERT INTO `alumnosdebaja` (`idAlumnosDeBaja`, `ID_Alumno`, `ID_Configuracion`, `FechaDeBaja`, `FechaSolicitud`, `ID_Motivo`, `Solicitado`, `DeBaja`) VALUES
(1, 1, 1, NULL, '2016-07-28 00:00:00', 1, b'1', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnostraslado`
--

DROP TABLE IF EXISTS `alumnostraslado`;
CREATE TABLE IF NOT EXISTS `alumnostraslado` (
  `idAlumnosTraslado` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Alumno` int(11) NOT NULL,
  `ID_Configuracion` int(11) DEFAULT NULL,
  `FechaTraslado` datetime DEFAULT NULL,
  `FechaSolicitud` datetime DEFAULT NULL,
  `Solicitud` bit(1) DEFAULT NULL,
  `Traslado` bit(1) DEFAULT NULL,
  `UsoTraslado` bit(1) DEFAULT NULL,
  `FechaCompromisoPago` datetime DEFAULT NULL,
  `ID_Motivo` int(11) DEFAULT NULL,
  `DiasTraslado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAlumnosTraslado`),
  KEY `ID_Alumno_idx` (`ID_Alumno`),
  KEY `ID_Alumno_FK_idx` (`ID_Alumno`),
  KEY `ID_Configuraciones_FK_idx` (`ID_Configuracion`),
  KEY `ID_Motivo_Traslado_FK_idx` (`ID_Motivo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alumnostraslado`
--

INSERT INTO `alumnostraslado` (`idAlumnosTraslado`, `ID_Alumno`, `ID_Configuracion`, `FechaTraslado`, `FechaSolicitud`, `Solicitud`, `Traslado`, `UsoTraslado`, `FechaCompromisoPago`, `ID_Motivo`, `DiasTraslado`) VALUES
(1, 1, 1, '2016-08-01 23:52:11', '2016-08-01 00:00:00', b'1', b'1', b'1', '2016-08-31 00:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autorizacionesgerente`
--

DROP TABLE IF EXISTS `autorizacionesgerente`;
CREATE TABLE IF NOT EXISTS `autorizacionesgerente` (
  `idAutorizacionesGerente` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Configuracion` int(11) NOT NULL,
  `ID_Usuario` int(11) DEFAULT NULL,
  `Aprobado` bit(1) DEFAULT NULL,
  `Rechazado` bit(1) DEFAULT NULL,
  `Solicitud` bit(1) DEFAULT NULL,
  `Observacion` varchar(100) DEFAULT NULL,
  `FechaAprobacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idAutorizacionesGerente`),
  KEY `ID_Configuracion_AutorizacionAgente_FK_idx` (`ID_Configuracion`),
  KEY `ID_Usuarios_autorizacionesgerente_FK_idx` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuraciones`
--

DROP TABLE IF EXISTS `configuraciones`;
CREATE TABLE IF NOT EXISTS `configuraciones` (
  `IDConfiguracion` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Diplomado` int(11) DEFAULT NULL,
  `ID_Formacion` int(11) DEFAULT NULL,
  `FechaInicio` datetime DEFAULT NULL,
  `FechaFin` datetime DEFAULT NULL,
  `CantidadModulos` int(11) DEFAULT NULL,
  `CupoMinimo` int(11) DEFAULT NULL,
  `EnCurso` bit(1) NOT NULL,
  `AlumnosInscritos` int(11) DEFAULT NULL,
  `AlumnosTraslados` int(11) DEFAULT NULL,
  `AlumnosRetirados` int(11) DEFAULT NULL,
  `ID_ProfesorInicial` int(11) NOT NULL,
  `ID_GerenteResponsable` int(11) NOT NULL,
  `ID_Tipo` int(11) NOT NULL,
  `ID_UsuarioResponsable` int(11) NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `Activo` bit(1) DEFAULT NULL,
  `Eliminado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`IDConfiguracion`),
  KEY `ID_Tipo_idx` (`ID_Tipo`),
  KEY `ID_ProfesorInicial_idx` (`ID_ProfesorInicial`),
  KEY `ID_GerenteResponsable_idx` (`ID_GerenteResponsable`),
  KEY `ID_UsuarioResponsable_idx` (`ID_UsuarioResponsable`),
  KEY `iddiplomados_idx` (`ID_Diplomado`),
  KEY `idformacion_idx` (`ID_Formacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `configuraciones`
--

INSERT INTO `configuraciones` (`IDConfiguracion`, `ID_Diplomado`, `ID_Formacion`, `FechaInicio`, `FechaFin`, `CantidadModulos`, `CupoMinimo`, `EnCurso`, `AlumnosInscritos`, `AlumnosTraslados`, `AlumnosRetirados`, `ID_ProfesorInicial`, `ID_GerenteResponsable`, `ID_Tipo`, `ID_UsuarioResponsable`, `FechaActualizacion`, `Activo`, `Eliminado`) VALUES
(1, 2, NULL, '2016-07-22 00:00:00', '2016-07-22 00:00:00', 2, 10, b'1', 10, 10, 10, 1, 1, 1, 1, '2016-07-22 00:00:00', b'1', b'0'),
(3, NULL, 2, '2016-07-22 00:00:00', '2016-07-22 00:00:00', 2, 10, b'1', 10, 10, 10, 1, 1, 1, 1, '2016-07-23 00:00:00', b'1', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursoprofesores`
--

DROP TABLE IF EXISTS `cursoprofesores`;
CREATE TABLE IF NOT EXISTS `cursoprofesores` (
  `idcursoprofesores` int(11) NOT NULL,
  `id_cursos` int(11) NOT NULL,
  `id_profesores` int(11) NOT NULL,
  PRIMARY KEY (`idcursoprofesores`),
  KEY `id_curso_idx` (`id_cursos`),
  KEY `id_profesores_idx` (`id_profesores`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

DROP TABLE IF EXISTS `cursos`;
CREATE TABLE IF NOT EXISTS `cursos` (
  `idcursos` int(11) NOT NULL AUTO_INCREMENT,
  `id_semestre` int(11) DEFAULT NULL,
  `id_modulo` int(11) DEFAULT NULL,
  `Nombre` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `Descripcion` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `FechaInicio` datetime NOT NULL,
  `FechaFin` datetime NOT NULL,
  `Cortes` int(11) NOT NULL DEFAULT '0',
  `FechaModificacion` datetime DEFAULT NULL,
  `idusuariomodificacion` int(11) DEFAULT NULL,
  `Activo` bit(1) NOT NULL DEFAULT b'1',
  `Eliminado` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`idcursos`),
  KEY `id_semestre_idx` (`id_semestre`),
  KEY `id_modulo_idx` (`id_modulo`),
  KEY `id_usuario_idx` (`idusuariomodificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diassemana`
--

DROP TABLE IF EXISTS `diassemana`;
CREATE TABLE IF NOT EXISTS `diassemana` (
  `idDiasSemana` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Activo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idDiasSemana`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `diassemana`
--

INSERT INTO `diassemana` (`idDiasSemana`, `Nombre`, `Activo`) VALUES
(1, 'Lunes', b'1'),
(2, 'Martes', b'1'),
(3, 'Miercoles', b'1'),
(4, 'Jueves', b'1'),
(5, 'Viernes', b'1'),
(6, 'Sabado', b'1'),
(7, 'Domingo', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diplomados`
--

DROP TABLE IF EXISTS `diplomados`;
CREATE TABLE IF NOT EXISTS `diplomados` (
  `iddiplomados` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `Descripcion` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Activo` bit(1) NOT NULL,
  `Eliminado` bit(1) NOT NULL,
  PRIMARY KEY (`iddiplomados`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `diplomados`
--

INSERT INTO `diplomados` (`iddiplomados`, `Nombre`, `Descripcion`, `Activo`, `Eliminado`) VALUES
(2, 'Diplomado 2', 'Academica', b'1', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formacion`
--

DROP TABLE IF EXISTS `formacion`;
CREATE TABLE IF NOT EXISTS `formacion` (
  `idformaciones` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `Descripcion` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Activo` bit(1) NOT NULL DEFAULT b'1',
  `Eliminado` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`idformaciones`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `formacion`
--

INSERT INTO `formacion` (`idformaciones`, `Nombre`, `Descripcion`, `Activo`, `Eliminado`) VALUES
(2, 'Prueba1', 'Prueba Sistema', b'1', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frecuencia`
--

DROP TABLE IF EXISTS `frecuencia`;
CREATE TABLE IF NOT EXISTS `frecuencia` (
  `idFrecuencia` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Valor` varchar(100) DEFAULT NULL,
  `Activo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idFrecuencia`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `frecuencia`
--

INSERT INTO `frecuencia` (`idFrecuencia`, `Descripcion`, `Valor`, `Activo`) VALUES
(1, 'Quincenal', '+15 days', b'1'),
(2, 'Mensual', '+1 month', b'1'),
(3, 'Bimestral', '+2 month', b'1'),
(4, 'Trimestral', '+3 month', b'1'),
(5, 'Semestral', '+6 month', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

DROP TABLE IF EXISTS `inscripciones`;
CREATE TABLE IF NOT EXISTS `inscripciones` (
  `idInscripciones` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Configuracion` int(11) NOT NULL,
  `FechaInicio` datetime DEFAULT NULL,
  `FechaFin` datetime DEFAULT NULL,
  PRIMARY KEY (`idInscripciones`),
  KEY `idconfiguracion_idx` (`ID_Configuracion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodosdepago`
--

DROP TABLE IF EXISTS `metodosdepago`;
CREATE TABLE IF NOT EXISTS `metodosdepago` (
  `idMetodosDePago` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Activo` bit(1) NOT NULL,
  PRIMARY KEY (`idMetodosDePago`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `metodosdepago`
--

INSERT INTO `metodosdepago` (`idMetodosDePago`, `Descripcion`, `Activo`) VALUES
(1, 'Cheque', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

DROP TABLE IF EXISTS `modulos`;
CREATE TABLE IF NOT EXISTS `modulos` (
  `idmodulos` int(11) NOT NULL AUTO_INCREMENT,
  `idconfiguracion` int(11) NOT NULL,
  `FechaInicio` datetime NOT NULL,
  `FechaFin` datetime NOT NULL,
  `Porcentaje` int(11) NOT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  `IDUsuarioMoidificacion` int(11) DEFAULT NULL,
  `Activo` bit(1) NOT NULL,
  `Eliminado` bit(1) NOT NULL,
  PRIMARY KEY (`idmodulos`),
  KEY `idusuariomodificacion_idx` (`IDUsuarioMoidificacion`),
  KEY `idconfiguracion_idx` (`idconfiguracion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motivo`
--

DROP TABLE IF EXISTS `motivo`;
CREATE TABLE IF NOT EXISTS `motivo` (
  `idmotivo` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `Activo` bit(1) DEFAULT NULL,
  `Eliminado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idmotivo`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `motivo`
--

INSERT INTO `motivo` (`idmotivo`, `Descripcion`, `Activo`, `Eliminado`) VALUES
(1, 'Prueba', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

DROP TABLE IF EXISTS `notas`;
CREATE TABLE IF NOT EXISTS `notas` (
  `idnotas` int(11) NOT NULL AUTO_INCREMENT,
  `id_calumnocursoprofesor` int(11) NOT NULL,
  `DescripcionActividad` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Nota` int(11) NOT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  `IDUsuarioModificacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`idnotas`),
  KEY `id_alumnocursoprofesor_idx` (`id_calumnocursoprofesor`),
  KEY `id_usuariomodificacion_notas_FK_idx` (`IDUsuarioModificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagina`
--

DROP TABLE IF EXISTS `pagina`;
CREATE TABLE IF NOT EXISTS `pagina` (
  `idpagina` int(11) NOT NULL AUTO_INCREMENT,
  `IDPagina_FK` int(11) DEFAULT NULL,
  `Descripcion` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `URL` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Activo` bit(1) NOT NULL DEFAULT b'1',
  `Eliminado` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`idpagina`),
  KEY `idpagina_fk_idx` (`IDPagina_FK`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `pagina`
--

INSERT INTO `pagina` (`idpagina`, `IDPagina_FK`, `Descripcion`, `URL`, `Activo`, `Eliminado`) VALUES
(1, NULL, 'Administrador', '#', b'1', b'0'),
(2, 1, 'Usuarios', '../Usuarios/ListadoUsuario.php', b'1', b'0'),
(3, 2, 'Crear Usuario', '../formulario_busqueda.php', b'1', b'0'),
(4, 1, 'Perfiles', '../Perfiles/ListadoPerfil.php', b'1', b'0'),
(5, NULL, 'Diplomado', '#', b'1', b'0'),
(6, 1, 'Menu', '../Paginas/ListadoPaginas.php', b'1', b'0'),
(7, NULL, 'Academica', '#', b'1', b'0'),
(8, NULL, 'Contabilidad', '#', b'1', b'0'),
(9, NULL, 'Finanza', '#', b'1', b'0'),
(10, 9, 'Diplomados-Formaciones', '../Finanzas/Diplomados-Formaciones.php', b'1', b'0'),
(11, 9, 'Pagos Formaciones', '../Finanzas/ListadoFormacionesAlumnos.php', b'1', b'0'),
(12, 7, 'Diplomados Activos', '../Academica/Diplomados.php', b'1', b'0'),
(13, 7, 'Formaciones Activas', '../Academica/Formaciones.php', b'1', b'0'),
(14, 9, 'Solicitudes Alumnos de Baja', '../Finanzas/SolicitudesAlumnosDeBaja.php', b'1', b'0'),
(15, 9, 'Solicitudes de Traslados', '../Finanzas/SolicitudesAlumnosTraslado.php', b'1', b'0'),
(16, 9, 'Solicitudes de Academica', '../Finanzas/SolicitudesAcademica.php', b'1', b'0'),
(17, 9, 'Reporte De Pagos', '../Finanzas/FiltrosReportePagos.php', b'1', b'0'),
(18, 5, 'Lista De Diplomados', '../Marketing/ConfiguracionDiplomados.php?EnCurso=0&Activo=1', b'1', b'0'),
(19, 5, 'Administrar Diplomados', '../Marketing/Diplomado/ListadoDiplomados.php', b'1', b'0'),
(20, NULL, 'Formacion', '#', b'1', b'0'),
(21, 20, 'Lista De Formaciones', '../Marketing/ConfiguracionFormacion.php?EnCurso=0&Activo=1', b'1', b'0'),
(22, 20, 'Administrar Formacion', '../Marketing/Principal.php', b'1', b'0'),
(23, NULL, 'Registro', '#', b'1', b'0'),
(24, 23, 'Registro Interesados', '../Marketing/RegistroInteresados.php', b'1', b'0'),
(25, 23, 'Inscripcion Diplomado', '../Marketing/InscripcionDiplomado.php', b'1', b'0'),
(26, 23, 'Inscripcion Formacion', '../Marketing/InscripcionFormacion.php', b'1', b'0'),
(27, 7, 'Listado Alumnos', '../Academica/ListadoAlumnos.php', b'1', b'0'),
(28, 7, 'Retirar Alumnos', '../Academica/RetirarAlumnos.php', b'1', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

DROP TABLE IF EXISTS `pagos`;
CREATE TABLE IF NOT EXISTS `pagos` (
  `idPagos` int(11) NOT NULL AUTO_INCREMENT,
  `ID_TipoPago` int(11) NOT NULL,
  `ID_Configuracion` int(11) NOT NULL,
  `ID_Alumno` int(11) NOT NULL,
  `ID_MetododePagos` int(11) NOT NULL,
  `ID_Frecuencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPagos`),
  KEY `ID_TipoPago_idx` (`ID_TipoPago`),
  KEY `ID_MetodosdePago_idx` (`ID_MetododePagos`),
  KEY `ID_Configuracion_idx` (`ID_Configuracion`),
  KEY `ID_Alumno_idx` (`ID_Alumno`),
  KEY `ID_Frecuencia_pagos_FK_idx` (`ID_Frecuencia`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`idPagos`, `ID_TipoPago`, `ID_Configuracion`, `ID_Alumno`, `ID_MetododePagos`, `ID_Frecuencia`) VALUES
(2, 1, 1, 1, 1, 1),
(9, 2, 3, 1, 1, 2),
(10, 2, 1, 2, 1, 3),
(11, 1, 3, 2, 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagoscuotas`
--

DROP TABLE IF EXISTS `pagoscuotas`;
CREATE TABLE IF NOT EXISTS `pagoscuotas` (
  `idPagosCuotas` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Pagos` int(11) NOT NULL,
  `CantidadCuotas` int(11) DEFAULT NULL,
  `FechaVencimiento` datetime DEFAULT NULL,
  `FechaInicio` datetime DEFAULT NULL,
  `Pago` bit(1) DEFAULT NULL,
  `Traslado` bit(1) DEFAULT NULL,
  `Decripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPagosCuotas`),
  KEY `ID_Pagos_idx` (`ID_Pagos`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pagoscuotas`
--

INSERT INTO `pagoscuotas` (`idPagosCuotas`, `ID_Pagos`, `CantidadCuotas`, `FechaVencimiento`, `FechaInicio`, `Pago`, `Traslado`, `Decripcion`) VALUES
(3, 9, 4, '2016-08-17 00:00:00', '2016-08-17 00:00:00', b'0', b'0', 'Cuota 1'),
(4, 9, 4, '2016-08-17 00:00:00', '2016-08-17 00:00:00', b'0', b'0', 'Cuota 2'),
(5, 9, 4, '2016-08-17 00:00:00', '2016-08-17 00:00:00', b'0', b'0', 'Cuota 3'),
(6, 9, 4, '2016-08-17 00:00:00', '2016-08-17 00:00:00', b'0', b'0', 'Cuota 4'),
(7, 9, 4, '2016-08-17 00:00:00', '2016-08-17 00:00:00', b'0', b'1', 'Traslado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participacion`
--

DROP TABLE IF EXISTS `participacion`;
CREATE TABLE IF NOT EXISTS `participacion` (
  `idParticipacion` int(11) NOT NULL AUTO_INCREMENT,
  `ID_DiasSemana` int(11) NOT NULL,
  `ID_Configuracion` int(11) NOT NULL,
  PRIMARY KEY (`idParticipacion`),
  KEY `ID_DiasSemana_idx` (`ID_DiasSemana`),
  KEY `ID_Configuracion_idx` (`ID_Configuracion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `participacion`
--

INSERT INTO `participacion` (`idParticipacion`, `ID_DiasSemana`, `ID_Configuracion`) VALUES
(1, 1, 1),
(2, 3, 1),
(3, 5, 1),
(4, 1, 3),
(5, 7, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

DROP TABLE IF EXISTS `perfiles`;
CREATE TABLE IF NOT EXISTS `perfiles` (
  `idperfiles` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `fechamodificacion` datetime DEFAULT NULL,
  `idusuariomodificacion` int(11) DEFAULT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `eliminado` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`idperfiles`),
  KEY `id_usuarios_idx` (`idusuariomodificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`idperfiles`, `descripcion`, `fechamodificacion`, `idusuariomodificacion`, `activo`, `eliminado`) VALUES
(12, 'Marketing', NULL, NULL, b'1', b'0'),
(13, 'Finanza', NULL, NULL, b'1', b'0'),
(14, 'Administrador', NULL, NULL, b'1', b'0'),
(15, 'Alumno', NULL, NULL, b'1', b'0'),
(16, 'Academica', NULL, NULL, b'1', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

DROP TABLE IF EXISTS `permisos`;
CREATE TABLE IF NOT EXISTS `permisos` (
  `idpermisos` int(11) NOT NULL AUTO_INCREMENT,
  `IDperfil` int(11) NOT NULL,
  `IDPagina` int(11) NOT NULL,
  `Acceso` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`idpermisos`),
  KEY `id_perfil_idx` (`IDperfil`),
  KEY `id_pagina_idx` (`IDPagina`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`idpermisos`, `IDperfil`, `IDPagina`, `Acceso`) VALUES
(16, 13, 9, b'1'),
(17, 13, 10, b'1'),
(18, 13, 11, b'1'),
(19, 13, 14, b'1'),
(20, 13, 15, b'1'),
(21, 13, 16, b'1'),
(22, 16, 9, b'1'),
(23, 16, 16, b'1'),
(25, 14, 1, b'1'),
(26, 14, 2, b'1'),
(27, 14, 4, b'1'),
(28, 14, 6, b'1'),
(29, 14, 5, b'1'),
(30, 14, 18, b'1'),
(31, 14, 19, b'1'),
(32, 14, 7, b'1'),
(33, 14, 12, b'1'),
(34, 14, 13, b'1'),
(35, 14, 8, b'1'),
(36, 14, 9, b'1'),
(37, 14, 10, b'1'),
(38, 14, 11, b'1'),
(39, 14, 14, b'1'),
(40, 14, 15, b'1'),
(41, 14, 16, b'1'),
(42, 14, 17, b'1'),
(43, 14, 20, b'1'),
(44, 14, 21, b'1'),
(45, 14, 22, b'1'),
(46, 14, 23, b'1'),
(47, 14, 24, b'1'),
(48, 14, 25, b'1'),
(49, 14, 26, b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntarespuesta`
--

DROP TABLE IF EXISTS `preguntarespuesta`;
CREATE TABLE IF NOT EXISTS `preguntarespuesta` (
  `idpreguntarespuesta` int(11) NOT NULL AUTO_INCREMENT,
  `idpregunta` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `respuesta` varchar(500) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`idpreguntarespuesta`),
  KEY `idpregunta_idx` (`idpregunta`),
  KEY `idusuario_idx` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `preguntarespuesta`
--

INSERT INTO `preguntarespuesta` (`idpreguntarespuesta`, `idpregunta`, `idusuario`, `respuesta`) VALUES
(1, 1, 4, 'prueba'),
(2, 1, 5, 'prueba'),
(3, 1, 6, 'prueba');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
CREATE TABLE IF NOT EXISTS `preguntas` (
  `idPreguntas` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Fecha` datetime NOT NULL,
  `Activo` bit(1) NOT NULL,
  `Eliminado` bit(1) NOT NULL,
  PRIMARY KEY (`idPreguntas`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`idPreguntas`, `Descripcion`, `Fecha`, `Activo`, `Eliminado`) VALUES
(1, 'prueba', '2016-08-06 00:00:00', b'1', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

DROP TABLE IF EXISTS `profesores`;
CREATE TABLE IF NOT EXISTS `profesores` (
  `idprofesores` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `Apellido` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `DNI` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `FechaNacimiento` datetime NOT NULL,
  `Correo` varchar(250) COLLATE latin1_general_ci DEFAULT NULL,
  `Telefono` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `TelefonoSecundario` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `UsuarioSkype` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  `IDUsuarioModificacion` int(11) DEFAULT NULL,
  `Activo` bit(1) NOT NULL DEFAULT b'1',
  `Eliminado` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`idprofesores`),
  KEY `id_usuarios_idx` (`IDUsuarioModificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`idprofesores`, `Nombre`, `Apellido`, `DNI`, `FechaNacimiento`, `Correo`, `Telefono`, `TelefonoSecundario`, `UsuarioSkype`, `FechaModificacion`, `IDUsuarioModificacion`, `Activo`, `Eliminado`) VALUES
(1, 'profesor1', 'prueba', '123456789', '1992-03-08 00:00:00', 'prueba@prueba.com', '04241694460', NULL, 'gtorres', '2016-07-22 00:00:00', 1, b'1', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registropagos`
--

DROP TABLE IF EXISTS `registropagos`;
CREATE TABLE IF NOT EXISTS `registropagos` (
  `idRegistroPagos` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Pagos` int(11) NOT NULL,
  `Monto` decimal(8,2) DEFAULT NULL,
  `FechaPago` datetime DEFAULT NULL,
  `ID_Responsable` int(11) NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `NumeroRecibo` int(11) DEFAULT NULL,
  `NombreBanco` varchar(45) DEFAULT NULL,
  `Traslado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idRegistroPagos`),
  KEY `ID_Pago_idx` (`ID_Pagos`),
  KEY `ID_Responsable_idx` (`ID_Responsable`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registropagos`
--

INSERT INTO `registropagos` (`idRegistroPagos`, `ID_Pagos`, `Monto`, `FechaPago`, `ID_Responsable`, `FechaActualizacion`, `NumeroRecibo`, `NombreBanco`, `Traslado`) VALUES
(1, 9, '2000.00', '2016-08-08 00:00:00', 4, '2016-08-07 20:05:40', 1, 'venezuela', b'0'),
(2, 10, '2000.00', '2016-08-15 00:00:00', 1, '2016-08-15 00:57:47', 1, 'mercantil', b'0'),
(3, 10, '2000.00', '2016-08-14 00:00:00', 1, '2016-08-15 00:58:11', 2, 'venezuela', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_evidencias`
--

DROP TABLE IF EXISTS `registro_evidencias`;
CREATE TABLE IF NOT EXISTS `registro_evidencias` (
  `idRegistro_Evidencias` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) DEFAULT NULL,
  `id_Solicitud` int(11) DEFAULT NULL,
  `Archivo` longblob,
  PRIMARY KEY (`idRegistro_Evidencias`),
  KEY `id_solicitud_registro_evidencias_FK_idx` (`id_Solicitud`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registro_evidencias`
--

INSERT INTO `registro_evidencias` (`idRegistro_Evidencias`, `Descripcion`, `id_Solicitud`, `Archivo`) VALUES
(7, 'recibo Factura Impresiones', 1, 0x255044462d312e370a25e2e3cfd30a372030206f626a0a3c3c202f54797065202f50616765202f506172656e74203120302052202f4c6173744d6f6469666965642028443a32303136303630323230303035312d30342733302729202f5265736f7572636573203220302052202f4d65646961426f78205b302e30303030303020302e303030303030203539352e323736303030203834312e3839303030305d202f43726f70426f78205b302e30303030303020302e303030303030203539352e323736303030203834312e3839303030305d202f426c656564426f78205b302e30303030303020302e303030303030203539352e323736303030203834312e3839303030305d202f5472696d426f78205b302e30303030303020302e303030303030203539352e323736303030203834312e3839303030305d202f417274426f78205b302e30303030303020302e303030303030203539352e323736303030203834312e3839303030305d202f436f6e74656e7473203820302052202f526f746174652030202f47726f7570203c3c202f54797065202f47726f7570202f53202f5472616e73706172656e6379202f4353202f446576696365524742203e3e202f505a2031203e3e0a656e646f626a0a382030206f626a0a3c3c2f46696c746572202f466c6174654465636f6465202f4c656e67746820323030393e3e2073747265616d0a789ced5ccb72dbc612ddeb2b7a69572930de0f7b4553502e5d12299394ebde1b65310646cca8400c05804a397f773fe0aef2055966e145cabbacd233104180126592b22c4082248ac463004ce3f4e9d33d43a88ae5a8f803bf820aeff075013ffd8c6f21be7ec4d764efed185e1d6aa0a98a2a7f607c0efe784fddb8a15e6d78b96ec33d8ea82d56a8373edcdce4ea8ee268b6e3e8104cf75efd7b6cc201df7b8fbf9b5fc10d63b8ea7543bdd470b15378cb75151f86f991ef79883dcd5434c7d075b7dc3fcbb6154ff72cd3801f1ccb565c4bb50d15120a23b8e719f79e6ba7efda7cf7d6b5e0f9e68ddaab6c62a38d0eb9cb65d4b4bf97e02ed7e3af652aaa67e9860b9aa7b8a6f46bc7d6144dd72cc344b286573d0db91aded7a5dbcddcba36c87d95af77329288cff2fe8a869e629aaeed19cb3d3006dfa73b18b6bf7e8235d7bd795b1d347b6b34dd6c543da1ae2ab66318aebdd9f976bf6d9777ed934c004f89a74996eb7ec5338ab59ae52a8ea9da9a098e63a24f9a22c08e43f8e94577d01f8d3bfd6eaf03073e0cfd51efc0174b2f7f86f13bd1fcfd8e68b953863d38423d47b12cd9e1cd01bab863dbf6b3745ad3533cc35907851b077e04289886ad5886252ed1552d45f7ec020abaaad9aaade29b63eaae6a9720b08d0d90fe115f0db181e3e98a53b2c1214fa6f388248cc3a03fec36d10b1ebdd1f699e60332df5281e04d374ca940e49d06d818dfdf5d71ecc44475f230c3504c3537bbee2ac82885d987fefbd3dea8371e8c5edfd7b99eb0673d001eebe4952578a80e3ae8121e27242110114879c40296cd4308a958eef238cd481c3022560c69ca422a97680afc63c42624e382b467094d699c9104489cc996fb10fc1922a58b76a251c64212c2d90bdc7dc26212c1a74d70f8a846b23dab425de73ce3019f3172f6127b152d8c257abc0f195a00bb67e0367a41a7330c66b822b762c5aaeb4d3a65c24829cc7802e2f02ccde894bc6982a55cbd022712f0e98cfc459288481bac76605b8e7d9c18a661a7dca27f4e894d4ffb0321db8f06233818744f8ffd3e12eb63f2eace9dd42d55d1b45b6f225cce29a4e2ef2f12911808041cdd389e93807d895f6f11c69f69bca8a9afda7a85d57e804141c950509c24b8219d2007255cb8702f3e478d2e6f3d1cb234c0ddcf5e0c7b87672f91e9e7240eb9e0ac904f91e9228c08e7f93e0167486ea1c48ea0c2a4e0bbfa939ae955fc21a401923a098952817e0bee3add33dd5b01779724d96aa44de7699060e096911641f96e1ee7fb606c16088e19df97719a5e707c9fce857384f423e2784a85be4972c720087a0e9d94e341a56384b4fea8d6ec0aaa3fd080c53c6d315d5b4c5b9ebd1961232c03f651b2f58c4c38526e82743b434c33895a02f318a3797285148d00cff526c7d5319f7e4ce8aaa6457ecf48842216c51caf3dae2dd7a8e09a4634c81226624fb80f24a5d8633299937d989014e53a6e3fe7f16702d32f572c0211b02e48befe8aa5c2990539e44c3113ce8dc25ec430a9f3a798ed48617bc52639a5c8ece99c06bf90269080e56815489573943718c463ec5a20f2145a8dd9d0c6c006f0054a7ab71a03e724ba9c339a00976a8e077311c7306dff1b73f84078c63cfb13b57d20e2d92c615722b209f94f8284862c8741c8905faec3dcad98b84e5ceb8f7ec3ada0bfc479cf04d60da8552d2bc8966ab515e4efef25a6e7542ac827c341d73fe81df744b1a32d22dfd5b5ddb736c0314b0871aaa9c4014b3e5fa0d2cac5d0aafafc2415059bc42298a4e57ae92c22318bf252e132c73a67c914830a6ab5453531947ba0566b4e09d9b4cddb4bc8d795e1db6ae48bee09d5fa598aefc6965075d7524cafb044994ee6b1ec56c453d412284e52967121ac5152f018e5472a471212c6130907e5fe84f350d669e9a826be665633c0d398c015fd0dae4824fc4a92122b55313f21f030d55b485d249602880baa12db525aa2b2a28eb9460cd79f908c6ae65788f77d6180f379ee7e62488f9796f2727044e11792fc01e88f099d48d6127e7af642bf6dd06bdd38d77efd6da4b92b85df65542a4a879f101818b38aac67512c47c8609a555e4253b02b1629ed80c9332223c3abe6987d9e91d7e0a347e48595dc31321a87e850b3880aae123c857c351363f1d78937496e1460aa353af92f28f2fb2fc984c4455e0ff52fdb19a810cabe56293ea0fc8978ceca3421ad0335dd551fa051793e30b6b46c39c5b6d863e3c9cb96a358aa776bdb26a7f3ba55389af8864f497faf4e40eefa27dddeef7d39ada103a3c151afdb1b9f1e3cacec7edaf334ef6599cdb0f9355cebaaa968e6a66d1f1ba25ab5d037e2c8fe321aa618da441120a299080ef9b0ed36f3a45b943531043d004c6b70f1f568f4dd2dff0d0842b75666a8d57824a045f6d6f668b2d03254c5b373909a6aa5d079783d29008634a0b3d5a993ede049eb54ad537ddda9501a56bece22663ab15c0ab6ee7457d776dfdabad3937527cdabc6a8115d14f565793f9fc8f6dcfdaad117fff41ad52925594e4ed274e789a424e5aa916d28aab65b2555d714cfbbbd69a3b9b318b1d0f0e6970ba9471d58f7300718f9b8e2ad0f7e7f3cf47fec0cf1039cf6e1a873321a407f00c79dff0c86d001030efedf19c1bffef7b677e47f832f92dd799fdb6ad8061ea02ab6bae350822e9eaff6f48612961ee07915f1d03b3e190c11fe63ff35e0e761efb803fe68ec2fbf1a899897430a1df8e0ffb745f713961d4ff3e2ef7e7ae13a56d8dbe290eb1ef2e856d7dfe3198bff0080b5946b0a656e6473747265616d0a656e646f626a0a392030206f626a0a3c3c202f54797065202f50616765202f506172656e74203120302052202f4c6173744d6f6469666965642028443a32303136303630323230303035312d30342733302729202f5265736f7572636573203220302052202f4d65646961426f78205b302e30303030303020302e303030303030203539352e323736303030203834312e3839303030305d202f43726f70426f78205b302e30303030303020302e303030303030203539352e323736303030203834312e3839303030305d202f426c656564426f78205b302e30303030303020302e303030303030203539352e323736303030203834312e3839303030305d202f5472696d426f78205b302e30303030303020302e303030303030203539352e323736303030203834312e3839303030305d202f417274426f78205b302e30303030303020302e303030303030203539352e323736303030203834312e3839303030305d202f436f6e74656e747320313020302052202f526f746174652030202f47726f7570203c3c202f54797065202f47726f7570202f53202f5472616e73706172656e6379202f4353202f446576696365524742203e3e202f505a2031203e3e0a656e646f626a0a31302030206f626a0a3c3c2f46696c746572202f466c6174654465636f6465202f4c656e67746820323837383e3e2073747265616d0a789ced5dcb72da4a1adefb297a7952853bea565f24af4606d9518a8b2d6357929353a714a1389a02c91690d4c9a3cd6bcc6e76b33c8b596597d5740b032d038a912f48805d4e00a991befffffabff5451aa45c133fe01bd0c05bf1f74ff0fb1fe2bf9ef83b157fd707c75df0fa0401a4412dfd01ddcfc0ee1e680f6e88b30d6f571f40d30fb485178b870ccc21478c730cfcc1c1eb775d021af1c1b9f87df8ad2d6032b4bb865869383da9b7e4be662fdcc9373ff22b0e108188eb181b2a3eca1834b149890e0e0d44213329d60d9004e0023cf28a077bd01b02ad9b0c0a44123526a22b6044750210259090f4a4436376fed680265c879cdc07cd39c4786b312f57f47663c614122d854c7404d90432c5647acea16142b665988939c5ac33d189ef306bb3730e318664cb30cff5ac6056d4bc859015351b0c1abba6e639e65d5133d14c61aa774bcd0ae69d51b3e2a87646cd73ccdbad6605b288b6d0623c82b72f0653a8ad6056a9bd7d9897eaf959d59c7738ffe8ca22c49337dadf65151b3de82b8bdc4649f1de8279222c7fa9e8b6939a0f32a131291a7086a6bdda1f80d70e028d189c970576358fae2c96fed25a171292acf3a6fa950d858b220633f5f919fee051700ece1f708115f7fdf0b61820b6369b161b652f287c13e3ba48b01e76bde26abbcd3b27b906e292e232c9fcb36fe28af253440dc889c6902c5f11d127892cd4767be0f7dfea9df645d76ad71d0b346ce0da174ec396ef5efd01ba6f65f3f3826cc92de73f3b434d0e294d013f9ca0538dad8b53b9ac08dd4c9dafa2c2c2176f800a446790ea54dea2a151884d36a302d610d39826fee3041b1a5328b08e0cd242785564c04d0cb922839338198cfb5e12c6a0d376eb55ec051b6fb4fec0e3335abe79042294ae93340249350dc083f95db288a35491ecbaf6b24c76609e744a7208bb3723876b9ffde7b8e9d42d70dc693a5796eb58edd4415ed96dfbc3a5dd7cb47fdc62b3b03bacc13ae40a6bea9d9673e1fcbb3d89a44e9d8baedb0175e7ca6982f7c06edaf56ec7b59a7be6e4402b4482428d36cb1c8432f6c6163178a373041a92334e57b0c63a73ba7baee4422ba4f6428d36ca15661a192bd3ba6c3b75e7cc1174693ac7b62b99e3ee899203ad90ce0b35da2c518c6c102378d2b01a4b9cd199e5ba9df34b676f5f72a1156240a1469ba50dcf463133761c092fe43af54babb3e334a9f4cdbf54a37266fd6cdbb3fe52c95d312a19b96b506748d774d0fd2674f03eae09a7f4fec201f58edb697544b8dbeab42face6955d039e3f1a7b512f0641040621f0bde4bffe2848402f006e701d0e4789d78b13500fbf867df961df03375e92c4b7e3d09bd9ab1a188ca3d00f6fc25851f7c1e4bebf95596c22a33466624310718d197822b679b05703c17024c4b0902ed4c030b8fe1909490de3fed80f7f44a0fd2f8151e7b59bf1a77ee87b3d4f0af6d4f38391278fe984e143a376274937b8f9999e5631a9896c4a57a4c6a83e23db71dc0fbf7a49e8459e04791544c1f77120b07ef1ae63e0c7919064026ec701f812ff25c4076e92601844a31fc08b46412a6810f4811f8e7b4278510ceefbc2758380cd54bcb106096188b15458f328312bacb7d69563bbc06adaefac867871da697f106f3ee4d2a174010dcd244c58bc3667085b56fd8de8429b0c680a23e41c0a2b3a453837135984695f8e3c3f8c23af1f0ad25693b18811396100e93c579f693db6d3b4da1b2dc81627adae430dcd50aed6e9281cc961a93b3bedffdd13efe49bb0276c55aa6561cc2ba96801196a06a54ccb57f42132b8663053aba4a2093321653394ab140dc1f938140eba929aa4e93d12e964f234796cbded80135b848015732b99f28a70a2069d3bce4bd76ad96d118935ec7ad372ab698d1011e10017b0500a560da954b069b4d40b86c2fc5492a7c8e4909b84102d57a727f6b16bbb1d6965e57aaf4a6a141ba21f62aa119aafd12fdea770943a94cf713210295520fe8d8234028ea4c71986d7d23089f7bd30097c995a1c013bcd4236c9814ad88d4c7d0d4153c470c69de0cb34de53bc3fc9c9d926a308a558d5fc55c55a03ad69525e51bbc10924c28f7196abd3720cca14272e111f9119cad5da3c9b955d2aa94d6c5248a9c908cad566194ae08531ea7229893ec3b85a9797c9272f0abf7b69c9a892ea24c884266558cbef9cae7562d94d706ab972c6ab50ae756c359bd5d42ee518328a39ff8576ab55cca32c53cce31051b999c45d16182441afa20687737155860c9c4254a2ce2c445a492e1a3a44fa0cdc4afdd540dd1b56547f48185384b166a27c05b62f5b326dc095d423166654a39384215f91ed9f83208965cad00dfa7f7f8ea3f8a89a7ad50d39699f194ccfd7ab4610664830009b95542da14886e9539c797d344e922006413ff047c90f11b3c747a549f24a9ae391ec1cadf78e6b77dffc69b51baeedb4ad7fbce9745b96d384f54eab92dc119d021a6806d55046d4e11a03eafb89140f6854a6b06c3e918266c658cb3d91a24c12546cc43d09da911c5d0ec0201c0e6239ef21069fc7c2a546e9a874781d79bd7808fae2af17fbe341108dc4cb591d6e789491ffaef5ac32a978de4988519dd94685dc7839bd2fb937f1b5f3a91f5e7ba33809178ad3a59fb9a82ea4d40599b227fc720d6b7629a6a9436ca46b7dd56f2853dfd1350d1224f7f258e83c1f7f1bc6fd58ceeef2c0304840bf1f4893086ee244cec85166837d7ca5963876d11cbeb8f578711157c7e32bdbf7702deb0e4ee251ecc737a1b77a1ec7deab3fcbf6be4fe1dc759e497c76c7b96f4efaea8e673c93612b3e1e8ca3b40ed55f191f1794f0a3713f3602400c417eef8ce70d0136a76a3512b8d7d31e13096c4687dbd8a89cbda520d0cdf15c090f30ca3a14353c98d13a356d4e94cecb4987674fc2a1eff5c1c7df5ce7e4e32bf035bc96f62ee38bb69df47b2aaa37fb0454d44db9679642c5ba974ce683b9c150c6a6be2065300865882acdeed19e6ecad13dddd6a51be7505b991825811f7e4acdde8d5ca3d30bf66c538feed9b62edb28814c655b477ad5c6b4a8be5becda99745dd738c41549d70b5db08ce2579e3790113f82c8a498f1bb19b2de74956500eae90acc34be1889c43d005fe5aab5e0fb24dbf3fc24e8857285a60888fbe3ebc90aa8641e93f4326b332755b4cf729d6b5c4bd3c37411e728be1b495b3113aed482c426815ce1f18fe45a401dd6405ae50002b41060381acb057fe2fddd3a5f79e02609bf0ab90cd719a1df76f3b7c75ffc6875bc80d27b9899e93d7604feccfda9012f2d24debd05bdff89be24adcc20182e6f2a2dd2f4f5beab3d4fa312726c1e69601d5726d228a12095ce5a214196bcc36cbf79518749e8ec997cb3335e62b76f9d43662c5cb684c368ba064d96763124a249a60ca3e53bc3cccf93ec85bd43ac5cce8e672725d5a161d0fb972d37290d0c9142ca55dbd08027dabd65d798b89c12eb900a61139a2b4c5db9a2098555f742ffa53b886c0d15ca58152ec10c8a43b694b8eb709f1b90a1856f2823f58dd591f43acff2785e63642c9eb0b50a3167c6a8c40ad1978ab3b41e54eddcc5a8b437f865c190ab28a5c31748efee3d974983942c0f8a4b6b3210cd9a8c37e3a0df97c548cf1f857d2f0986fb38a69c185eaa5109f93baf8a22941db7da17f37683e0ea831139851a5a987cfc808b3eae0482a80884f9f249cfe5aa81cc6bdf86b9afcbbd54b578293b9e9f9572df4fb35aac1491975a985bb16bfb9e816b327039139e9d815817f658ab16035976bc62e119007beeade9939773602d1a11f984d72aac2952365fc8e6521722958ac1979f8320b37fe94e90617732906d49407e1d52afb8a57b75d3d5dd76ab968aa2accb685ac07e7766379cfadda339c50767ae7d61b7bb36501e7f6e5f8877adb3a6dd4db7f2b6c1a96b752f9dee13ece59dabdc6db139955eacbe9d370f726f7195d13858e32b71b6ededf48091fd3c773383fcbbfc3f7e7839060a656e6473747265616d0a656e646f626a0a31312030206f626a0a3c3c202f54797065202f50616765202f506172656e74203120302052202f4c6173744d6f6469666965642028443a32303136303630323230303035312d30342733302729202f5265736f7572636573203220302052202f4d65646961426f78205b302e30303030303020302e303030303030203539352e323736303030203834312e3839303030305d202f43726f70426f78205b302e30303030303020302e303030303030203539352e323736303030203834312e3839303030305d202f426c656564426f78205b302e30303030303020302e303030303030203539352e323736303030203834312e3839303030305d202f5472696d426f78205b302e30303030303020302e303030303030203539352e323736303030203834312e3839303030305d202f417274426f78205b302e30303030303020302e303030303030203539352e323736303030203834312e3839303030305d202f436f6e74656e747320313220302052202f526f746174652030202f47726f7570203c3c202f54797065202f47726f7570202f53202f5472616e73706172656e6379202f4353202f446576696365524742203e3e202f505a2031203e3e0a656e646f626a0a31322030206f626a0a3c3c2f46696c746572202f466c6174654465636f6465202f4c656e67746820323837383e3e2073747265616d0a789ced5dcb72da4a1adefb297a7952853bea565f24af4606d9518a8b2d6357929353a714a1389a02c91690d4c9a3cd6bcc6e76b33c8b596597d5740b032d038a912f48805d4e00a991befffffabff5451aa45c133fe01bd0c05bf1f74ff0fb1fe2bf9ef83b157fd707c75df0fa0401a4412dfd01ddcfc0ee1e680f6e88b30d6f571f40d30fb485178b870ccc21478c730cfcc1c1eb775d021af1c1b9f87df8ad2d6032b4bb865869383da9b7e4be662fdcc9373ff22b0e108188eb181b2a3eca1834b149890e0e0d44213329d60d9004e0023cf28a077bd01b02ad9b0c0a44123526a22b6044750210259090f4a4436376fed680265c879cdc07cd39c4786b312f57f47663c614122d854c7404d90432c5647acea16142b665988939c5ac33d189ef306bb3730e318664cb30cff5ac6056d4bc859015351b0c1abba6e639e65d5133d14c61aa774bcd0ae69d51b3e2a87646cd73ccdbad6605b288b6d0623c82b72f0653a8ad6056a9bd7d9897eaf959d59c7738ffe8ca22c49337dadf65151b3de82b8bdc4649f1de8279222c7fa9e8b6939a0f32a131291a7086a6bdda1f80d70e028d189c970576358fae2c96fed25a171292acf3a6fa950d858b220633f5f919fee051700ece1f708115f7fdf0b61820b6369b161b652f287c13e3ba48b01e76bde26abbcd3b27b906e292e232c9fcb36fe28af253440dc889c6902c5f11d127892cd4767be0f7dfea9df645d76ad71d0b346ce0da174ec396ef5efd01ba6f65f3f3826cc92de73f3b434d0e294d013f9ca0538dad8b53b9ac08dd4c9dafa2c2c2176f800a446790ea54dea2a151884d36a302d610d39826fee3041b1a5328b08e0cd242785564c04d0cb922839338198cfb5e12c6a0d376eb55ec051b6fb4fec0e3335abe79042294ae93340249350dc083f95db288a35491ecbaf6b24c76609e744a7208bb3723876b9ffde7b8e9d42d70dc693a5796eb58edd4415ed96dfbc3a5dd7cb47fdc62b3b03bacc13ae40a6bea9d9673e1fcbb3d89a44e9d8baedb0175e7ca6982f7c06edaf56ec7b59a7be6e4402b4482428d36cb1c8432f6c6163178a373041a92334e57b0c63a73ba7baee4422ba4f6428d36ca15661a192bd3ba6c3b75e7cc1174693ac7b62b99e3ee899203ad90ce0b35da2c518c6c102378d2b01a4b9cd199e5ba9df34b676f5f72a1156240a1469ba50dcf463133761c092fe43af54babb3e334a9f4cdbf54a37266fd6cdbb3fe52c95d312a19b96b506748d774d0fd2674f03eae09a7f4fec201f58edb697544b8dbeab42face6955d039e3f1a7b512f0641040621f0bde4bffe2848402f006e701d0e4789d78b13500fbf867df961df03375e92c4b7e3d09bd9ab1a188ca3d00f6fc25851f7c1e4bebf95596c22a33466624310718d197822b679b05703c17024c4b0902ed4c030b8fe1909490de3fed80f7f44a0fd2f8151e7b59bf1a77ee87b3d4f0af6d4f38391278fe984e143a376274937b8f9999e5631a9896c4a57a4c6a83e23db71dc0fbf7a49e8459e04791544c1f77120b07ef1ae63e0c7919064026ec701f812ff25c4076e92601844a31fc08b46412a6810f4811f8e7b4278510ceefbc2758380cd54bcb106096188b15458f328312bacb7d69563bbc06adaefac867871da697f106f3ee4d2a174010dcd244c58bc3667085b56fd8de8429b0c680a23e41c0a2b3a453837135984695f8e3c3f8c23af1f0ad25693b18811396100e93c579f693db6d3b4da1b2dc81627adae430dcd50aed6e9281cc961a93b3bedffdd13efe49bb0276c55aa6561cc2ba96801196a06a54ccb57f42132b8663053aba4a2093321653394ab140dc1f938140eba929aa4e93d12e964f234796cbded80135b848015732b99f28a70a2069d3bce4bd76ad96d118935ec7ad372ab698d1011e10017b0500a560da954b069b4d40b86c2fc5492a7c8e4909b84102d57a727f6b16bbb1d6965e57aaf4a6a141ba21f62aa119aafd12fdea770943a94cf713210295520fe8d8234028ea4c71986d7d23089f7bd30097c995a1c013bcd4236c9814ad88d4c7d0d4153c470c69de0cb34de53bc3fc9c9d926a308a558d5fc55c55a03ad69525e51bbc10924c28f7196abd3720cca14272e111f9119cad5da3c9b955d2aa94d6c5248a9c908cad566194ae08531ea7229893ec3b85a9797c9272f0abf7b69c9a892ea24c884266558cbef9cae7562d94d706ab972c6ab50ae756c359bd5d42ee518328a39ff8576ab55cca32c53cce31051b999c45d16182441afa20687737155860c9c4254a2ce2c445a492e1a3a44fa0cdc4afdd540dd1b56547f48185384b166a27c05b62f5b326dc095d423166654a39384215f91ed9f83208965cad00dfa7f7f8ea3f8a89a7ad50d39699f194ccfd7ab4610664830009b95542da14886e9539c797d344e922006413ff047c90f11b3c747a549f24a9ae391ec1cadf78e6b77dffc69b51baeedb4ad7fbce9745b96d384f54eab92dc119d021a6806d55046d4e11a03eafb89140f6854a6b06c3e918266c658cb3d91a24c12546cc43d09da911c5d0ec0201c0e6239ef21069fc7c2a546e9a874781d79bd7808fae2af17fbe341108dc4cb591d6e789491ffaef5ac32a978de4988519dd94685dc7839bd2fb937f1b5f3a91f5e7ba33809178ad3a59fb9a82ea4d40599b227fc720d6b7629a6a9436ca46b7dd56f2853dfd1350d1224f7f258e83c1f7f1bc6fd58ceeef2c0304840bf1f4893086ee244cec85166837d7ca5963876d11cbeb8f578711157c7e32bdbf7702deb0e4ee251ecc737a1b77a1ec7deab3fcbf6be4fe1dc759e497c76c7b96f4efaea8e673c93612b3e1e8ca3b40ed55f191f1794f0a3713f3602400c417eef8ce70d0136a76a3512b8d7d31e13096c4687dbd8a89cbda520d0cdf15c090f30ca3a14353c98d13a356d4e94cecb4987674fc2a1eff5c1c7df5ce7e4e32bf035bc96f62ee38bb69df47b2aaa37fb0454d44db9679642c5ba974ce683b9c150c6a6be2065300865882acdeed19e6ecad13dddd6a51be7505b991825811f7e4acdde8d5ca3d30bf66c538feed9b62edb28814c655b477ad5c6b4a8be5becda99745dd738c41549d70b5db08ce2579e3790113f82c8a498f1bb19b2de74956500eae90acc34be1889c43d005fe5aab5e0fb24dbf3fc24e8857285a60888fbe3ebc90aa8641e93f4326b332755b4cf729d6b5c4bd3c37411e728be1b495b3113aed482c426815ce1f18fe45a401dd6405ae50002b41060381acb057fe2fddd3a5f79e02609bf0ab90cd719a1df76f3b7c75ffc6875bc80d27b9899e93d7604feccfda9012f2d24debd05bdff89be24adcc20182e6f2a2dd2f4f5beab3d4fa312726c1e69601d5726d228a12095ce5a214196bcc36cbf79518749e8ec997cb3335e62b76f9d43662c5cb684c368ba064d96763124a249a60ca3e53bc3cccf93ec85bd43ac5cce8e672725d5a161d0fb972d37290d0c9142ca55dbd08027dabd65d798b89c12eb900a61139a2b4c5db9a2098555f742ffa53b886c0d15ca58152ec10c8a43b694b8eb709f1b90a1856f2823f58dd591f43acff2785e63642c9eb0b50a3167c6a8c40ad1978ab3b41e54eddcc5a8b437f865c190ab28a5c31748efee3d974983942c0f8a4b6b3210cd9a8c37e3a0df97c548cf1f857d2f0986fb38a69c185eaa5109f93baf8a22941db7da17f37683e0ea831139851a5a987cfc808b3eae0482a80884f9f249cfe5aa81cc6bdf86b9afcbbd54b578293b9e9f9572df4fb35aac1491975a985bb16bfb9e816b327039139e9d815817f658ab16035976bc62e119007beeade9939773602d1a11f984d72aac2952365fc8e6521722958ac1979f8320b37fe94e90617732906d49407e1d52afb8a57b75d3d5dd76ab968aa2accb685ac07e7766379cfadda339c50767ae7d61b7bb36501e7f6e5f8877adb3a6dd4db7f2b6c1a96b752f9dee13ece59dabdc6db139955eacbe9d370f726f7195d13858e32b71b6ededf48091fd3c773383fcbbfc3f7e7839060a656e6473747265616d0a656e646f626a0a31332030206f626a0a3c3c202f54797065202f50616765202f506172656e74203120302052202f4c6173744d6f6469666965642028443a32303136303630323230303035312d30342733302729202f5265736f7572636573203220302052202f4d65646961426f78205b302e30303030303020302e303030303030203539352e323736303030203834312e3839303030305d202f43726f70426f78205b302e30303030303020302e303030303030203539352e323736303030203834312e3839303030305d202f426c656564426f78205b302e30303030303020302e303030303030203539352e323736303030203834312e3839303030305d202f5472696d426f78205b302e30303030303020302e303030303030203539352e323736303030203834312e3839303030305d202f417274426f78205b302e30303030303020302e303030303030203539352e323736303030203834312e3839303030305d202f436f6e74656e747320313420302052202f526f746174652030202f47726f7570203c3c202f54797065202f47726f7570202f53202f5472616e73706172656e6379202f4353202f446576696365524742203e3e202f416e6e6f7473205b203620302052205d202f505a2031203e3e0a656e646f626a0a31342030206f626a0a3c3c2f46696c746572202f466c6174654465636f6465202f4c656e67746820323932383e3e2073747265616d0a789ced5dcb72da4a1adefb297a9954e18ebad517c9ab91414e94c260cbd8959c9353a764213b9a02c91610d7c9a3cd6bcc6e76b33c8b596597d5740b032d038a912f48002e1284d448dfff7ffddfd4ddd220e59a78813ba0818fe2fd4ff0fb1fe2bfae78bf17efebbdc30e78778400d2a096be40e70ad89d3dedd10d71b6e1edf21d68f28536f7617e978139e488718e81dfdf7bf7a9434023de3b157f8fbfb4394c8676df102b0d270775175cd7f4833bfee527fec41e2210711d6343c5471983263629d1c1be81286426c5ba0192009c81279e716f077a4da07593418148a2c64474058ca84e00a20412921eb46f4c8fdf18d084eb909387a03987186f2ce6c58ade6ccc9842a2a590898e201b43a6984c8ed9374cc8360c3331279875263af13d666d7acc3ec6906c18e6999e15cc8a9a3710b2a266834163dbd43cc3bc2d6a269a294cf576a959c1bc356a561cd5d6a8798679b3d5ac4016d1169a8f47f0e6c5600ab515cc2ab5370ff3423dbfa89af376e7ef5d5a8478f646bbabac62a347fd6491cb2829de5b304b84e51f15dd765cf3412634c64503ced0a457fb7df0ce41a01183d3b2c0aee6dea5c5d25f5aeb42429275de54bfb2a17051c460a63e3bc2ef3f09cedee9234eb0e4ba1fdf1603c45666d37ca3ec09856f625c1709d6e3ce575c6db779c724d7409c529c26997d7727ce28bf45d4809c680cc9f215117d92c8426da70b7e7f536fb7ce3a56abee58a06103d73e731ab6dc7afb07e87c94cd4f0bb225b79cffe20c3539a43405fc78824e34b62a4ee5b422743375be8c0a733fbc062a109d41aa53798986462136d9940a58434c639af88f136c684ca1c02a32480be15591013731e48a0c8ee2a43fea7949188376cbad57b117acbdd1ea371e5fd0f2cd2210a1749da41148aa69001ecdef92451ca58a6457b59765b203b3a4539243d8bd29395cfbe43f874da76e81c376d3b9b05cc76aa50ef2c26ed9bf9ddbcd27fbc70d360bdbc31aac43aeb0a6de3e76ce9c7fb7c691d47be7ace3b641ddb9709ae033b09b76bdd376ade68e3939d00a91a050a3f53207a18cbdb1450cde681f8086e48cd311acb14e9cce8e2bb9d00aa9bd50a3b572859946c6ca1c9fb79cba73e208ba349d43db95cc717744c9815648e7851aad9728463688113c69588d05cee8c472ddf6e9b9b3b32fb9d00a31a050a3f5d28667a398293b0e8417729dfab9d5de729a54fae25fab5139b37eb6e9597fa9e4ae18958cdc35a833a46b3ae8dc091d7c8e6bc2297d3e7340bdedb68fdb22dc3d6eb7ceace6855d039e3f1c795137064104fa21f0bde4bffe30484037006e701d0e8689d78d13500fbf853df965cf03375e92c4b7a3d09bdaab1ae88fa2d00f6fc25851f7def8baefca2c3691511a53b12188b8c60c3c16db2cd8ab8160301462984b176a60105cff8c84a406716fe4873f22d0fa97c0a8f3dacde8b217fa5ed793827deff9c1d093fb74c2f0be51bb97a41bdcfc4c0fab98d44436a52b5263549f92ed30ee85dfbc24f4224f82bc08a2e0fb281058bf7ad731f0e348483201b7a3007c8dff12e20337493008a2e10fe045c3201534087ac00f475d21bc28060f7de1aa41c07a2ade58838430c4582aac59949815d647ebc2b15d6035ed4f56437c78df6efd26367ecba543e9021a9a4998b0f86c4e111e5bf50fa20bad33a0298c907328ace804e1cc4c6411a67d39f2fc308ebc5e28485b4dc62246e48001a4f35c7da6f5d876d36aadb5205b9cb4ba0e353445b95ca7c370286f4bdddb69ffefaed8921b6157d8aa54cbc2985752d10232d40c4a9996afe87d6470cd60a6564945136642caa62897291a82d351281c74253549d36b24d2c9e469f2d0fad80647b608012be65632e515e1440d3a739ce7ae756cb74424d6b0eb4dcbada635424484035cc042295835a452c1a6d152371808f353499e2293436e1242b45c9d1ed987aeedb6a59595f3bd2aa9516c887e88a94668be46bf7a97e13075285771d217295520fe8d8234028ea4c71984d7d23089ed6e9804be4c2d0e809d6621ebe44025ec46a6be86a0296238e35ef065badf53bc3fc9c1d926a308a558d5fc55c55a03c793a4bca276831348841fe32c57a7e5b829539cb8447c45a628976bf3645a76a9a436b14921a5262328579b65288117c6a8cba924fa14e3725d9e27975e147ef7d2925125d54990094dcab096df395debc8b29be0bde5ca11af42b9d6a1d56c5653bb9463c828e6fc17daad56318fb24c318f4344e56212f759609004dd8a1a1ccec5591932700a51893ab3106925b968e810e953704bf55703756f5051fd21614c11c69a89f215d83a3f966903aea41eb130a31a1d270cf98a6cfdec07492c53864ed0fbfb2a8ee2836aea5537e4a07d66303d5faf1a419821c1006c5652b5842219a64f70e6f5d13849821804bdc01f263f44cc1e1f9426c92b698e47b263b43e3baeddf9f0a7d56ab8b6d3b2fef1a1dd39b69c26acb78f2bc91dd129a081a6500de58e3a5ce186fa6e20c5231a95292c9b0da4a0997bace51e485126092a36e28104ed48de5d0e403f1cf46339ee21065723e152a3f4ae74781d79dd78007ae2dd8dfd513f8886e2e3b40e3738c8c87fdb7a5699543ceb24c4a8ce68a3426ebc9cde973c18f8dabeec85d7de304ec2b9e274e9472eaa13297541a6ec01bf9cc39a9d8a69ea101be95c5ff517cad477744d8304c9b53ce63acf973783b817cbd15d1e180409e8f5026912c14d9cc81139ca68b02f6fd512c7369ac357b71eaf2ee2ea787c65f91eae65ddc1513c8cfdf826f4968fe3d879f51759def7399cbbce3389cff638f7f5495f5df18c67326cc5c7835194d6a17a4be3e382127e32eea746008821c81f1cf1b221c0fa54ad46020f7ada532281f5e870131b95b3b71404ba3e9e2be101465987a28607535aa7a6cd89d27139e9edd9a370e07b3df0e58deb1c7d790bbe85d7d2de657cd1a6937e4745f5629f818aba29d7cc52a858f792f178303718c8d8d417a40cfaa10c51a5d93dd8d14dd9bba3dbaa74e31c6a4b13a324f0c3cbd4ecddc8393add60c73675ef8e6dabb28d12c854b6b5a5576d4c8aeadbc5aead49d7758d435c9174bdd009cb287ee5790319f123884c8a19bf1f21eb4d665906a09ecec04ce38ba148dc03f04dce5a0bbe8fb33dcf4f826e2867688a80b837ba1ecf804a663149373337735c45bb92f35ce35a9a1ea6933887f1fd9db42523e14a2d486c12c8151eff48ae05d4410da4550e20400b0186c3919cf027b6efe7f9ca1d3749f84dc865b0ca1dfa4d377f3bfcc5f756c70b28bd879999de6347e0cfdc570d786921f17e1374ff27fa92b432fd60b0b8a9b44893cfbbaef6328d4ac8b159a481755c9948a38482543a6b850459f20eb3f9e645bd4d42a7cfe49b1ef11aab7deb1c3263eeb425bc8da66bd064691743229a64ca6db47c6798793dcb5ad85bc4cac5ec787152521d1a067d78da7293d2c01029a45cb60c0d78a6d55bb68d898b29b10aa91036a1b9c4d4952b9a5058f520f45fb882c8c650a18c55e1128ca0d8670b89bb0af7b901199afb853252df581e49aff22c8f973546c6fc011bab10736a8c4aac107da1384beb41d5ce5d8c4a3b835f160cb98a523a7c81f4eec173993448c9e2a0b8b42603d1acc9f8300a7a3d598cf4fc61d8f39260b08b63ca89e1b51a9590bfb3aa2842d9fb56bb62de76105c7d3022a7504373838f1f71d2a79540101581305f3ce8b95c359059eddb307775b9d7aa162f64c7cbb352aefb69568b9522f2520b734b566ddf317045062e66c28b3310ebc21e6bd56220cbdeaf987b06c08e7b2bfae4c51c588946443ee1b50a738a94c517b2b9d49948a562f0f5673fc8ac5fba1564d89e0c645312905f87d44b2ee941dd7479b7dda8a9a228eb329a16b03f9dd80da77eff684ef1c5896b9fd9ad8e0d94c79fdb6762ebf8a46977d2a5bc6df0deb53ae74ee719d6f2ce55eea6d89c4a4f56dfcc8b07b997783bdd51e007f5c59d101a7a5a664510e3f4c3f89172f19d5cb8135cfe053af593c611f8f2e6eeee0e0efd9bee158c93ebd9b4ddfcd53bf2f188d7e3dbe225b230b2df3fe172fe0f938764580a656e6473747265616d0a656e646f626a0a312030206f626a0a3c3c202f54797065202f5061676573202f4b696473205b2037203020522039203020522031312030205220313320302052205d202f436f756e742034203e3e0a656e646f626a0a332030206f626a0a3c3c2f54797065202f466f6e74202f53756274797065202f5479706531202f42617365466f6e74202f48656c766574696361202f4e616d65202f4631202f456e636f64696e67202f57696e416e7369456e636f64696e67203e3e0a656e646f626a0a352030206f626a0a3c3c2f54797065202f466f6e74202f53756274797065202f5479706531202f42617365466f6e74202f48656c7665746963612d426f6c64202f4e616d65202f4632202f456e636f64696e67202f57696e416e7369456e636f64696e67203e3e0a656e646f626a0a31352030206f626a0a3c3c2f54797065202f584f626a656374202f53756274797065202f496d616765202f576964746820323130202f48656967687420313432202f436f6c6f725370616365202f446576696365524742202f42697473506572436f6d706f6e656e742038202f46696c746572202f466c6174654465636f6465202f4465636f64655061726d73203c3c202f507265646963746f72203135202f436f6c6f72732033202f42697473506572436f6d706f6e656e742038202f436f6c756d6e7320323130203e3e202f4c656e677468203136313439203e3e2073747265616d0a789ced5d777c5455f63fe7be37339949cf2440482040e88234410569ba02eaa2eeda75d7aeac02ae052962a1a9288a05eceeba3f450529aebda02e824aef9d50d22be9c9d4f7eef9fdf1cabc994c92219910c19ccf8790ccbc77df79f77eef69f7dc7391730e67271100b6360f671c9d8e4e4344d6d2cf68256a66f791e1e71f8a4ed3443d5b61d7cceec37034d246f592d8da0cb4062182eca4f2b5bc72132fff089120728c60ff0bc68d025302508b0839a5d1002023e20fbf14acdb5cb86c5f4ea1cb3daa7dfc9ffa74b8ea4f9d7ba5c750cbb0119c10c1edf41edceaddbd911888a95d2dc3c6812da6e5261e9ebdb65d5042402067063fb180d77c0d280030444e04c06bd0768190fa24c68f6a21e40590c7cdef7f61cbf2fd790e49028600000420737b74c4824bfb4ebab92762cb338288009e1f96e5cd7ead6c4b81001650f9c0ae8baf89be7b1a46877f1e22a2f0d4534f85b7d1df31212050f546f9e883e4dc00680620ad4f198019bc99e0d883423246f60ce353eb9a9908505ae1bdfd99df566714b82419107dd290a1d323fd74fca433db7de1c024b3490823278184880095af3c9df3f01bd5472a05301b1884b2eff68a653bad8306b1187bd81ffbc7811d0202957f2f9f98499efd806620323854840c9099c853408e1d087118dd3f7c0f36fc8e808827726bffb660c3f7b9a5122740d4bed02e6728c9b421afacfc98e3fc7e89913653b83809e00b512e9bf368c1a235ce931ea69a5bca1c2100446015dbb358ee0eeba03e823d39bc0ffe83c00e01814a3e91b39e24ef51641100800c8843a02b8f22f2725ebb15c98cd143c26bdc200200ee3e5cfef785bffd565a41480a63ea60236a10542ea76d05e57919b5e7f54c888bb584910d9519afe3e4c3530adef8c953e965a0cb543f5f8a8158b93f9f8eeeb09ddb4568df256c8f3ef361174aa004018117bccbf31692940b1861fc261809400e706c02c98bd183818547d828985bb7b5f0f6c59bf656560132c3e383f281c0706f6179c6919a415de29212ad6161439d8115c5c5932715bebf5d724808ac1e8707008081587db448deb7d3764e9298da2b3c1c9ce1b00b1973b92ff0c2252415015aeabb43517f4a838802c91eaadd84de1a8c1a0482ad998c2a98fbef4f3993ded87adce10021c4b8158128641457ec3b52794e726c4a726433d900044494b38f15de7b6ff19ac3e495d15fbcd587bcdaec52cfb6dd913d23c46ee7369787331f76216840247efc71b9e43fc0cb809943b80301180047260011393681a794d9068029a6e95c2200e07b9f1d7bf8fd9d796e57c89853ef0451c82aabde71a4a2475c64d7ced14d66031011d07b6047c15df79d5c9b0304860e344abb20939981e82cac706edc6bebe435f519d6741e3446ce68d83546542b1f7b942a5601d500361aa144ddb24124e2848c0109e4d80aee7cb4f54773480e5dc0a029987be9c3834facde57e275878439c5da43d4ec7b025128a8acdd9251dec962eddd3d361436eab48908e0feedc7fc7b1f2add54cc822f1304483e9f7b01000c0477596dedfa03b6a432d3c0914de1c1c0cb590a3b44908ae48c07a8e61b92dd804cb7d71bbe0d080048bb9290314013397681331323faa0a543084df87101804fbeb9ebf9b547ca250f08189284061525eaa02bb788ec648d73e3d132bb240ee89b105223fead39bf5b9d37e5f18a3d15759c56304c39ffdb98df244260528dbbea7f876cb66cf39051203471ade1ac841d0222b88ec947a7f2da0d401c10d5b86b28a6200344200e9ac9cf010098855c87c89981966e18d129e87d416d729271ca8b5bdeda78a25af282806a942414e0a9eacec0310208acd2e9fe35b3dc5a05e70f4c0aa115e5464480da15ffce7b706165468de05b97d22559fd0c51e05708c8dd52c58f1916386419321c2d4d7174ce3ed8212050cd76f9e83fc9b955898e28304244648d0d38a1dad1c800380081eee53133b88f91e3009a52d1961eecc181a3575323ddf9cc6f1fefcb73c83230a60adb5002fe3e1984819f08acd6edfd25b34c2e922e1c942436aab21111a0eaadc5f98fbd5e93e33460ae31c0353447113855fc7cccecd8133178288b3a65a57f96c10e01812ad7c9c7a7917b2f80a98e7fd698a8f17daf020ed1001366026f0e397623b36354df86da402c2871fdfde95fbf3a51ecf10584437c8b7ac61b35f031f4c8f286ec93d559ee0bce4d8cb0d4afe91011a0e2b927f29ffec851e46281986bf071750477c0870858be39532cd91531a8bf10d72eb457f3f175d6c00e0181ca3e97331f23ef91060225215330b98426904ac8b10d2812a30706f91e01100f1dafbae5e95fd71596716842bc39241dcc0136e596151d730ceb638f8e3207bf083ca5b31e2a78e56b5799dbdf9ef3b33f43e6aaae7b2b54eecec1cc9db6413d84c4d4d0da01388b608780c08b3ee0390b48caf40b0887a575d5bc47444430915449b55b9003460f0114022edbb8bbe4b6451bb7975786e2c234830818eeca2fcdcca81d9c1e6f8faff3ca8e8a92a9f715feeb576f75c02244381339198855870af9819db6fe1d858e416c8fa07476c00e0181e7bfc6f3179394078215918566439dfa8394ff9808dc49b59bd0ebc4e8c1205840c3dc37bfe4ddbd64cbe19a9a5308ce359117040010d8c1a28a4347aacfed14dba19d4dfb0679496ed1a47b8b57ece52e19fd62253ae6c2063e0662cd8962cfae5d91bd63c5b47a6d0f7fdecf02d821f2ac0572d15bc84b5088502220e17e06d31e05084444c804e032d56e044f058b1a846214002eff3673eabb3bb25db520b0161175183ca477fc64d5ee2395bd13a33aa74621a237635fe1ddff28fee238c841b115109c6b1a0584f444475e996bf39ec86eccd46370e3ef71a6c1ae4e980251ce5c4465ef232f256ca14c0d50fb97d47fca27c8180052ed16e629c6b8416f7e5a39f3e3ed051ea78ab996cb930b16d2cb2dafd99651d93d2126ddb13ff7b6c9a5eb0b342fc6189c8370493835a46708af3010dd25d5b5bfecb325d79afb5dd8e81b9cb9699e08e4e5f96fc845af825401cc0c402dbafb41498a23d2e3ce6abf9945574ee9f849df8ffbe6703c58bc80e4bfee14763e00a04e488f0088f58c723d5ab0f1a2efbe70814d9d28e136e61a2602d99c1895f6f4d591f73c05f527a99e71d24e234490ab79ce22b9782990035000d006bb850c7925a4a7ae7518427a04328909318786b7abcda94e3d581803a202c71653b2c1437a0448a55ecbcec876ed3b45f6387a84839ee112764eeac53102931d9eca9f8e58c50cf3908bd0143c5febcc841d22788ae5eca7f9c9b7fdba20e495a7263dd4d8b821a4870004323725c61c1b915c5ee5e9b4333706c49610baf5e6260180361fa88acc9b2392137ac6f53c948121de7bca5437a4e717cf232faff8e1a845da6f197201b3460563f68c831d223833e5ecb9bcec0360e14f7e0c8dfc504508482073537c54f6b00ef90c3aff9695a0c9bc26b7af29475d6061fdb30a358d0a00402e10368ac9b6feed7a641c35cb5e6d7218ef0dafda0dde54f9af274c95bb230607c9893fd3608748b50779d693bc7235b066279f8589505bba2432c54615768b292ca938775f99a9e97b41d1609019156b432c18fc5c4009d8afd44e1cd0b15766a6cded9041714202176d5a941058c5b66c96b7d33aa88f90e097137f46c10e91aab6c9d94f52f577280411ddad420a42d414518e483c42347ba0fd7f0f7704a169028f54c1868640c929e004d5c00ae236b99dfbdcd49e85797135153cf8ca58cb1203a1727f1e6504e6c49f39550110a9fc679e3d8b6a7e0216491c7e271bcb8980945c154e0024813932b26060ca17c09bbc01597300c9e0893622edc8074d2405734000207de4e9b9ae5b3f4f543403596b4315892d4664f8092244147d73b060d60bd2e15fd0e0edfd2e06af0ef9770b229dfc9ae7cce6b55b00a3001832d0e317ad4d0c810301220203e2cde74b4f1d209f61d73019725b0c213d0242f07a77f7ea939f946402a9d1c5ff305160969e00d6b2af7694fe679d8fd5df2becfc02c254b45cce7d823bf703b3021200a7df09e4000038010023255c27305996a30baa7a033699450422d56024459c36269b0c7e2af972b7d4f85e09c438c022f866439d1cba701371bf2720300924d7d1e3e0ccd53ffc3d17a34000e2f96fcb858b512e016631064a4fc78ef9d048515a1c100044c19b579ef4fdc1512048cd68115545a90b266a340262b820402f33444443926b0b272834d0be41c9fe5e618708b293e72d914b5e07ee2030297102c58ef9fd600e74900009cce3f6247f7f7cd42b7b3b80e86d8a01c579c768eb555d3a382559194222c21002e05a0819018038577e310becbda3257152a58ddc6418f39654b20d85f48c63f63b815d9dae200ee06109e358c2b8c6ef560c68ae5ad388a8c4d20888b88bcad6f3b26520e5019a49f53a81132030228fd0ee01217e1c88914072d3b927424464bcbac63a38cabeae3f1ec9aa3c9e57f5bfe3c5db4f567b24d957e224e85b7302996e1ed279de8dfdd3bb87ade80e22bc0298f7d6e2ea9f4a5d5aee530baf9705699880441023ba7703ab2f27eff4afc96aae56632f1eb6ae41940b57f182e7c07304052ba8c612e71061eefa0a265c064244f38467fd8b45889bb696bcf0f9c1af330a9db2ac9620d015a8067f70cbf3af1b30f3da73c4080c86b9d07a42b9314034222240c103b30b97bc0f603584eec20e3ca319e0d7b804b5edfe3ca4e38bd3c59e2394b73beda900c1bac6c823221e3a7468f5aa9588c85068cc2d4444e0c4f57ded0404ea3e1920e00c59b7f4ee975d3e312acaeccdb89d9ffc04857822004600228b3c4fecb5028588ffbcf75e7656a6c5626e02f60cf96b84c81018e7326318979070fef9e7f7ebd75f144500fae2fb9c273eddbfbba0142c26bf74100ee0e5afdd7edea4cbd305333b78e0c01bafbf9699956d369b50cdf0f095e5099123042400221204f6d2cbafa4a4a47836acce9df672f9966c01946c50de92aea4713c490277fbcb7a7578ee7153ff51fa8c426c7cf7685829c804235fcd19c4f53ffffcd8638fedd8b5cb66b512e7c81aea1d7d3c546bc6806665401160e445232e1a392a2aaa03801988aba902c44130a3a5bf227e3efce8a3f5ebd747473771e733718e0c9121c9440428206af36be879e7dd79c71d132ebf7ce2b8ce09719647ff6fe7c6bc12b098f5008740f0f10317fd7564aa6052df7de7ae5d369b95cb9c31e60bdb6942a281ae803ae8ecd9bdbb2ccb00402e2778dc0ad408004f17e664f0a4dc706ed2d3f3c4f4410152fc3407508cbad5cf3b43c42f3ffffc91871fdeb16b972d2282386742233bbdf4fb9131222222040022e29c13898230ecbc21afbdfe7a727207b9721378b2b524d03a1e095173cc29648cb8b29d1b9980c089cbaa90deba6ddbdf6ebd75ce53730af2f3460c6bffcadd438627b7078facbc6fbc59fc7ec698bf8e4a114cdabbefdc69b55a8980098c73ae047d89736c18730844c4895075b6481484a14386ac5cb9b273e7ce0052c1dbbf94edca52ea88050568f8c8c72407b9d3bdc3dabdf8525dcc41abc6ed7c3d80881f7df8e1638f3d76e0d0c1489b15109131a2c67bc797fec318aae51101102c66f32563c77ebc7c7972c714aad9c3736650f526c048d582e788c0fc547bf3d2a5d4944f0220408646211d1d1dfdeaabaf3cf9e45339d9594307254dfa4b4f9001384f8bb1fe3073cce8414982c83e5ab6ecb1d9b30f1c3a64b3d9946903a4cc2500002630d0045e5022024064884020cbdc6c368f1d3366f98ae51d533b0140c573739d3f6f601005e0a7de5b920800ba4c1f657f768990d23d28e7ade5c9fa3c2a447c6de992254b97e6e7e7db6c362255fc34ac61d55648d1b00c19102704e09c5badd62b274e5cfada52268854be51caba1f3c9920f85207100991eb83d0cc0c3d45c5abc10b2dcc6334006262633efaf0a3ae5dbb3e367bf69873dadd32306d4b49f97733c7a675b23186af2d59b2e4b5d7727373232c16a52926303234a2a0aa711e1124af648d88b8eaca2b97beb684092604cfc9998f14bdf5a3a7422d5f87c67e6fd64b07e9068509022ed82c694f5c12fdcfa7d11a55df6c6905d819137a10f199050bdefdf7bf4b4b4bcd660be79aa7134a3f2b0133c60080cb1c103d6e7797b4b4a953a7defb8f7f00f7f2d26fa5aca92057025a146b4a5d3bf2d7349c1300353916888c11e7a4c46503962455410884f0e99a3503079c7bf99f27cebd630007ea9a1609004fcf9fffaff7de2b2d2db558947d408a99a0be1d97b90ec146c9e3f6444545dd71fbed0b9e790600a8b6bc78da03451f6c976abd0886ed6d869f612565d629d9c55745de33a7e1e06a2bc04e479cc7e3993d6bd6f2152b6a6a6bcd2693f2a97e9962de35d0e9fa5708008c399ccede3d7bce9e3dfb9a6baf25d94927ff2b653f02202b7b0a11c0685592217eaad4170b6574831a4688808c513d224411601111117bf7eedbbe7de7e57f9ed8ad4ba4feee2b3e59515d5b6b3299d0b018a10b395dcfea2f5c9f12f078bd71b1b10f3c3075daa3d301402aca2e993ab5e4b323dc23b7800311f0a2ea9f1cbcb6b484cecfdd6cbbe1616a6c4deff4c38e800899505e5e3e7ddab4cf3eff9c13170521d0ec508be034d81057dd3dceb9cbe51ad0bfffbcf9f32f1d378ea46a5ebc4cce790c9845c59b3ea80d6a17a3c3a8ee9c08643d0871d9e747d7bd0019430446e8f67af2f2f394f6f57797395736fc10d7d49f01588a2fef5b2a4304ae7da874110100b85cae1ee9e9b367cfbef6faeb01c07b6c7fd17d534bd6e6b5cc5298216464109d327862fab6eff4c23d1197dd158a7f769a614700804c282e2a7af6996756ad5e2d9a4450b363810064598e8b8d49ef966eb727f0c6fc4bfdedbd5e4f4a4acaa47ffc63c08081dc53ce0b5ee305cf82a006440cc25eafd8da387199236303079c1b1b1b1774e3ad1eda6006c089a2505c5cb26dfb768bd9eccb6022400081b18a8a8a93274b6262623f59b17ce5ea5526d1c4181221e71c1912e756ab6de87943468f1eed7439111011953ed0767070e5434e1c55f18cb1b1b1e70d3baf7fff73ad562b00b8b7ff5230797af9e6122d961976d8d50d08930ceef8619d535f78d03cf29a106302a719762aafd535353b76ee6402534657f906015c2e57527afa430f3d78c5c42b430f6a9026d3c895c7f39e958bdf4531cef72d192f6c90393514c1913145e84d9e3cf9b2cbaf888888089119445cb76eddd8b163cd763bc95c7d414460a8c86f86cce1701c3e7488380182126a41440494245934992eb870f8830f3f52efe3fcf5ac4fe02082bbb4f4d5b772a7bf238389a921ba96dace1410106e77717af2a259a6c197863e642d0dbb800987001e0033002ac13281a9314c2eab415725180100c0abc179bca1a68994dc0a65019657ede425ef936bbb8e394420528f9d40442020a2fae63f221027dd4751b8620c4511f38bdd790535322754d7e641914300c0393186446432099d532293122cfa7b02634a044eb173c8978b4944a47cae1bafa4bf92f2b72cc959fb784d65d0a9428ae3a5685a9359cac970aefff5e4ca5d3519650cccba5bd36251125fc3327892afead37ee11cb1f705a714fb6c69d819de1d914ad792f3a8907a13a0c8108973626a2d3050069b40534a00d5dbbc193787a42954258d00804cafc9a0aebd120100234e8884ac5e4b97ea6c6f4500201445d3e73f1e9df7d58102a723f8d66b04f04abd62625ebc6de015633be91c292e9122edea7ae6e4eff1aa8a5a57d96e57e5ebcfe7bebe9bbb247d1547314d1b70101044a3e5d5c2443278536f1d649fb7404c3be754e3eda72b5c8c48e5ebe5ec19e4f81f401410e74665a1f1ac2e3660686ebeae451419824418e4e5111990babfb0e1fc50c690314dcf2a02973818567b55331eb57081425c06dd5f313e97312502a270c995950c0d5f00a0845dd436b8ba9ecc353ca22ff6a73c8b1002cb99684de9a62b618b034e7d2c01a53d303c71d1ab4dc01c9c26db0e914e7e2de72fe08e9d42d400000064750500ea113b6ad48b556f50b70d18e30efa74572b7272e25c1572d4884ba125532263c8b9aa4c41b5bdfc8c44ff4df90290d7e7301b1934444098804c404ec4b4640535a4a7479b95e7298d30c194deb5d314063227a47a7d52cdaad5fed0bb0100002d62fedb7b3ca5b5618da12000a149487b6c4cec23cf60747cd3d6155b1e764a567ac173e43e81cc6408d70689fff8dd175af3c6b7f6bb458925812fd000c16461036d6ad8d771ad89d600650ce0cb68aaaf41f0997701e41787d36c3b8cb045ddb7c0bf813a0f6d9410e39eaaaa78e199c257be749638d9a98d75d0c141026e8ab5a6cdbb3ceabe796032373961ac45952c0200cf7f5bca9b439e6c60612e3b7756527d0e4f533c0422b0c4c4cf5e1877e3950c3ca4abe510eeac6322220072902292a3bbbe7263d4030b4134352749b1c5a41d22c80e9eb7542e7913794d4b96633a4b48144597cbbd6ad5ea9dbb76499284009cb8b249aee1e15502db8a3b4fa4a4fda96eb8926f67bf6eb073d3faf2ad3902448406dfa0c1396f748fa44ecfdf6ebdfafee6e73fb70cec10c15bca7317f3d2f7806422062d55eaf0ec21c698244b99599927b23241375539670c011b5abbd3ad43e325083068e040d54a76bbc1eb3568b650c2c88101e1b881a9a92f4eb65c7c735872eec3023bffd74004571ecf5dc8cb3f2232010ac838fd9ef618fe9e89b4d08f6a4c3135f1ae81d0af9619a5998688026343860c7ef7dd7753525381ca0b96fe58b62b5304bda47ae8020f00400277e2882e1d5f9866be6062b8f679840576fec1394706cf59c02bfe0bccaa5877c45b3076793691ba4a221353d26a945c57c61a1e6adde151a2ee569b75cca8d16fbefd66744c1c00543cbfd8f9db6606514d1a0392c0dd7e42cf0ecf3f6eea3f3a8c077a8755c92252f51e9e3397577f874294726ca68239e30c6ea3fa880810101872ce1963c81a37ec1452e242b2cc6d91b6891327beb674291344204fe9ac470adffac95de16e921b4b327852aeef9ff4f47cb17b900ce1e650f83c5944aadc2867cde055df018b220240a6af63eba1b5366a9894b165822ae1b8ccd1771855bdc4893c1e4f6464e4edb7def6e69b6f09a2091c1525ffb82b7fa992e379aa47702bc127b9d3a4f3db2d7e39ec9883b0493b442afb41ce9d4fce1de02bc7a4da73e1e6f92c2734f498aa61b5a581faf2ed24498a8b8b9d3a55cdb7938bb28ba64e39f9594663f976757d0bdf275d668c8e9df1ac10df3eec9883f0c00e918ad7c8050bc975f8f75376ee4c24253bb229f9763dba3f366bd675d7df0000de8c7d4593ff59b236b7b17c3b63704ebf2cd4acf46652b36187c80bfe4f2e7c11a55c14ac6d82adc924cbb2cd661b768af976f1f1f1bd7af51c3878507c7c0228f97653a6976d2a618d4798eb620e08247362742859e9cda4e6c00e813c3cef4d5ebc14e47222f3e9cb7e381b49966553f8f2ed4209cd0504e738786d69f610b3d29b49a1c3ae4e704eaae6b92ff1d2774976039a902981a316e0f18f43a79e6f07a2c88b0aa4fd5b8b976d2cdb92278039b4ec1d08b84a06ef2965a5379342879d3fe63cc572cef3bcf47d4025b1a72d38170e52b6bb3631df8e4430513d265b834432b8e387764a7df141f3c86b4f8fe43875258b08ce4c39e7195ebe0205ab2f38a705d2db045ed389a8fe7c3b083873830cabb1fe3163d4be6d18786a035a56fa4cd3e071a74d5b9d22ec945ae9d9f378d51786e01cd7bba40d73cda226e6dbd5f9800050abdd13ec29e495735fdf4d922c833bf9eabeed9f9d23f63eff745a48a7023b44aadace73e6f2ea1ff57d594d0ece2100710e8c291101e26ae9695f9bd183c5dedf34b94c8496a5aca72b1bfc3524e4484214a00800a8a4d78756c0f094c867ae6b89d38d331dc67cbb06c9bec85134f97e31c211f3cf27c5eefd4fb3551e32ec94acf4dc79e4d864c0dc29923a9bd5ac4765e551d9c6827ae141d46a45b3188c0a725470a88faaf34bc05786cf4929a1d2e467d5474a1137a532102230868dda5bf5e7db8599c8646bf7f67fd4df4fbb920a0d768874f22b39ef5972ef4521aae94c92168702758956b14ab4d246240a425565d5d75f7d79f8d0418fc7db1c24101043a6efef4204ed34042222b3d9dcf79c732e1d375e14452020cefd0a05848918634a5097884c82a96f9f7312ecf6e2a2a2a0173739dfae61427f51c98988786262e292a5af592c96d60a3d84003b442afa9817be40eee30056e2fa716fa74a5a117120810931d1518a92056d633d636889b0949c3cf9c9aad56aea406325ee1aa5a0152d38716b8475e215575c7cc99f44515492855a6253a9beae5553533361fc8489132736707193f3ed1a26f4472de7dc6c365f78be6ec985ecef8695020695fc994400e0796fc9f9f3b92b1320029972ea405392e7880898085219b84f44c7c60f1a3cd817ed640c10b5bd5500445ce608d044cc295bbf94d7634c694a91390820cb72842562fca597beb2e455b5f04acb6858bd4587c3316ce8d069d31e19387850e3bceb0101a511c6946e69220f089cb8b6b7176459b65a2c978d1ffff1f28f3551d73a41af80713598de88c09d3c67915cf81c4927819900899a91af89884402f794832b27263672f8f0119cfb75a7b27b8a08009131d6f4eab6886ae6a3665a71ce0101197a2529d266bbf1faebfefdde7b66b34577bf9bb455a1115286d4ebf5764a4999bf60c1a8d18de7ab29313b75caa969c38aa66eb25fa5ec834320f07a259bcd76fd0dd7bff77fef59226c06365b81ea112788e02de3d90be4a2c548b5a0ee1a06002d3c7cea44442846807bafb7f4731383f3860e1b35722463cc3818aaae23e22154f36cf059405afa86a2a710d1edf6444546fe63d2a4c52fbf2273c82f741a835d2dd1fd922c77ebd2e5bdf7fe3d76ec58efa16dce6fff0345c7c1646e806d04446dca859e6fd728793c9ea8c8c8fb264d7ae9e55700f40d06bf17690700a064a5cb594fca25af83220b9091bae71ea0a9c139a53404712fd4eea0ca5fec49892fbcf842bbc424d4ce9b06d076f5292529c29416ca182340a7d3d5252d6de1c2671f7ff2c9aa6aef7f561f7beaeddd5e8937f97542a108b365f1cb2f0dbf6824549ec899f26cfe735f42622359be4dcbb76b985c6e775c5cdcac59331f7ff249f0f35b5b6d59a90eec10c97154ce9ccd4ffe1fa07e60abb639be790bc48c011323a976a794f33893ca7af6ecbd6af5ca9e3d7a50b0ea4ea7f49c002de98b9e201080c3e1183460c0d2a54bfff6f75bcbcbdc2f2c3f70f7f2ad6621f0dd03fc0afd5c91fa3969c8cc8d8f8d5bbee2e38b468f05b93cff9117cb7efc494c8806adf262c348f2cfb76bba3f01005e8fa75d52d233cf3c3d79ca5400f89d6c6af1ef7a252b3d7306af588562f833e738212706cc46aea3d2890711bdbdfbf4fde8e38feebce3f698a8288fc7837a4845e7c8f0b301f2d392445caf26217397cb3562f8f057972c19357a74499173ce07fbe6ff77b735c2b7cd5309170311715f7d08b558a212bc0df234fdd340ec2ab7744debb26af5ca1123479918e6fc6d66f1bfbe2030a3c054c8699ea9eefab410793c9ef4f4f437de78fd96bffd5de3ed77b1706e08a020822b9f172ee1955f82181ff6a57d6d158013302489aad64947ee17531f4c4bebfdc28b8ba74d9bb66eddba9fd7adcbcf2f3099cd0166877f1420a0efd493188ca45f2fcb727a7ab7a90ffc332d2d2d3fa776c6b23dcb7ec9009b89732a76b8956b465e34c21a61114593eecf2280cc396338f4fc6100aca8d6552bc9eaaa93b2e041da32a9f203f1449523bbc60500f1f17177dd71fb8c1933baf7ec85e03df9d88355dffe426002f090db0d55953171e97fbdf6dac4c424c610000938aac2ba99e139bd67d49f5c96d3ba769d30e1327b62a25199b4c47acca992e13814445efc09cf594052cbede0d7aa89e8e734991258e29dacdd8d604ef185b9c248c4957a2b070e54fcf3fd1d3feccf059b050880738b45fc66eaa88b8624994cac3e1f13112bcbbce39fff79f38102b09a01c057fd445f7f070404a8755f7361b7d7ef18d2aea3556dcd5151f2f03f8b3edceaad9518300e92b59d25f9893be2a63c4aad9faed39a624f3f858794dfa5ac593c6f21881d0010190fafadadb4c698120706647ae20a47b461cc65183b8645740631128003e98b170159170adb20c9aca02ca6a022ca58b30ed5dda208404a6aaec05096e8874df9ef6ccdccae7180a0163704e0082cde2c3c7051cf31e7b68fb4893227633683a28faaaabc33d7ecde995fa195cbd17b4e5f67279fa021f1faaeeca58b4d1d526cce8c63c58b3ea9da964b12074d18134811ed6c49b70f8fbbe11a622230a61efed4fc9ef5b74941349bceb9a8d9edb614f91dfee4839da93d40cbcf0755153040ae8839a5ba1280a20618d663ad23104376acb4fba44f27adaf30a9eceb38f02d061170006680ae41cff81a4383003396d80948e030b610b0dea48eba69a0b574dae11fcfdbf49b03acc62400f4fdaadea3fde6c34bb397faf5776eb856ba1a2968fa73c2417e873f11000a7128c629c31e76cc1934120220200702423534aa65001002012243e0ca11adfe120f918b4cd89633e0becfefdc5ead1674524f7a4283ca232dde4f9ab9430624e8629434cc1101905a31833830a6958a43bfebf596c1884b04124744163db4f3dbfebb77d482cd8873f4fd6f049cca31a89c35dfd44200e2e0693c2bddefb8bd56233fe063d428b05d40bcb625e49c5ac14d1958e20040a005844991615c9733445c4f563262ce24b01f8f8cb875cd3ddbab0c63aabc857e70b4a68ad5f1568528a90a512fc7c9b5732a940721d382660c0840af4eebb3e4fc35805ec290c4f191f9337efdef39bb7739c086863ed5ae4032004ef990f9fe0cb9fe5943443278a2fbb6eff2c6fd2ae68293c67d6bbb147ea900187721ab1d2f3b3603a9c7390030001ede3d44a8eb31fd6473df710081010b0286a01c36c24d225bb36bc2233f5c9de9f2d4296ce9afca8c1f6a2111bf6fc1803fa34f0afa8768f869689a74f9a7fc64d74665ddf3c3e79d72335d60a96b9a040d0035fc678354d7d845006842adf4d625ff833d11813815bd2b653d0e0c107db91bea18a986540b3042cc2014fcbf01604826517877e35f1e5fffa722af07847a33675b8a7c26989fcebfc37afcb6af3e4d2c2df1825e49ad858c623f73d2f808095ca73f2bbd3914ec3c594420994a574b271e029000044ddab180a06c0b7003a0591d7a8441f13b4da2f9c59f6e7a76cb05a5921704aa33fca781c8270b11804004badf7ce8c6ff7e16555b2d69d51e4e0b437e9a5e067787d6c84a6f0ed5859d628a3020992a7f928ffd03a8d66fa55e8bbab51c4b0a1b3af210c82458677f7be7d2bdfdaa24afefe8145d459e4ed2b88b46ef83b4fbaa355f8ab2640c81e82e6a8b21300073ded4db06d9e72e10d3fa9e29980300c4405f1a35b74ec0d88bc5de2b406c0fa464a2ab7bd45bce0752f29e405bfc55ba5734c71cf0bef455c9d02a871b98e628608b8addfaf853fe63ed44e713aecdd7ad5c23c8b2d1923444575a4eea19214e690f0c4f7cfe95330b730a3570683b02c8e03e2e65dc49ce0c3db0d682a4af3ca9e13304b19dd8fd5d8c3aefe081ea7bdedbfcebe1c2c0a582d3468a9425a18bb9ead1924d63bfffde0dc62a087af0064e8bf6e768123bcf1a1d3bed598c8e3fe3b6ebd595764622000696ee62ef952c7a9861b912ebcdd26b2e3bea0286a264c1d25decb512220713619fbe31cbeebbf08a419da1d61dbce0798b92124ff4c8fd3ac53f13e7befc979f5c600e4857402d0668f43ec24a9a1e00598cb5765b7465dce3af9e899853a80169e7bb0678a57c7c2a2fff069101d6bb821926e200c8a2860ae9ef80a9838f09c49a4aefb32b0f3cf3e57e30353de1b689e4918674b42fba75c8d80becd59fadcabae909c9d980586b2981c741b226c7765e789dedd6596728e020b8275bcf85203b79d60cf9e447004c5b5d0963488f69c58d380261dc6542d75741880b901988287be8ed6f8eddffde5630f9a2cf75b80d8bac3140c7238deedc7ed19d03870e4c2400e41ee76fff3b71f50c4f99b3654cccfa82739e30d64a6f450a1976cac211f7f0dca7e5c2a5800c51f00be95168339cb46588403ed4357c002e24dec8d29e03c11614ce88287bf8ea0db97f7b63a3573f4630cc43401a4f0000e095ae484f5974efc03e3de3485fb495bdd2a1ed27ae7ac471fc643da1c6264bbb3a4b6b000020833b6e40c7d417275b2eb9e58cc61c9c0aecd4cb81245eb054ce7d1a00014543482fd4468206e7b48f48687f3f4b790c84868e77414459e2eb76965cfbf22f955e2f05e4a9346b440c8053965c39bfa957eab3f70d4a4b0d2830884032cf3f9cf997876bb61df31d9ee8972cd01c3debf74a12b8132feadaf18569e6f3ff7ca6630e4e1976a005934b96c95933016522ddb7604aec23b43e5106891b82731c8058c7d92c790a30b151b58d08b2447b8e54fe65f186ac4a2730c3da76580645f55be1be73d3e6dd3f3031a19ef36411a1222bebfa69956b7770103098946a120562aefd65bd3a3cf7b8a9ffa8b30073d014d829da9664aaf8463e3699b80b99a02cdbfbc6bdc19e09760d0710c4b46731e96f808d634e6d07801364663bfebaf8e7dd05556a8253b348137540406035890f0d4d9f3da9bfcd2a3634d888e02cccbbeb89d28fd7723085f55039000019dc1dafefd712b5d25b919a003bf54600196a364a47ef216fc5a9a5501080b1763b124084d06d29c65f0e289caa7b82082545eeeb5ffe65dde1121059786217328fb7591e1bddeb91bbfa86e43021a25c5ef8e0d3454b577230870f79c4414ebd7788fdc9678494ee670de6a019b0031579ce83d2d1bbc193e5df272174900a3e04214e4c7f1ba28703084dc30b2256954b77bdbe69d5d66ccdbd6d86e493e59498c839e37adf7d53af53186944a4ea92b92fe5cffd170733fa4cbd2610e9a661e7e9c363672c14125aa4567a2b527360a710813757ceb88b3bf6280b682177100130b47412d3ff05b6be4dc69c4288e8aee5fffcd7f6b77ec8004b33427a5eb97b42f43357f7bb6e62d7531e69440447f9d27773a62e9655e43591d45ae94ffe29fa8105688d3a73e373f551f361070008d249f9d83f78d57a400060a09ef5a756f9d4cf49372a562260b67385eeef82b9535822ab8828b9f8531fed7be6bf7bc122f821afaee6456d79cd98b9ee91ceed90f0fc0de78e1f9bd244e98288e0aafa7845d66df3652f6becbdea06e7001acf4a3f1b282cb023400672b59cf9082f5d03c894a5b3c0f8888f3810b0985142fa9b2026867111091165177ff9b323d33eda016666482aae1355466d9d490fbeb8a50b539316dd3a60c4b0e6693444e06ec70fdf665ef798b74a0280608ead61fdd6ff5b0e5e5b5a42e78537d96eacbf58fb994f61819dda127017cf7e4a2e7e1790010886fef445f594400926fc55e8f20208d1619fca88287b69d90f9977beb3999b34cc05c6563420ea9f78bc7fea9afcc2dd83069c931086c14604eef1ecd878e2ea69aefcca06d351fd0225327862fa76e8f4c2bd1197dd7916630ec2093b50ba5be2f98be4fc170150cb8907002d739824002eb4bf8b759a0fccd242ea4341deb79b0bae5ff2ab03b462898a6c03f00d336a892312bfa667eac27b0776ef1a13b6c146042ec927f69ef8cbc38e7d79c12b0bd4c9d63cb3b2d29b4361859d1ed22b7a47ca7eca605d31444e240391d0f111d6f1d15002c2cd21651963f3beb2ab5fda50e272abb138df030de34d74c7399d9fbe6f60727b5bb307db1fd64aeb278f675dfb48d5fafd5c5d3f0e2ef9ceb8acf466527861a7b609c0a97a9b9cfb32d57c07684204929d681b23a43e8471239b109c6b0a1308b24c19276aae7e71fde1d25a2d958fd4dd3a08c04914d8d4415d9fba6f406c8cb9a5061b116bf2b26f9b55bee6170e62b0650c92c1dde1aa3eed17ce117b5ff047c01cb40cec7422e0d5e03c01208329094ced012da73f2738bfc075ed8b1b366595a97b2395e19629da629a3ea2c7f47bce319b84961d6c44f496e6dff754c9bfbee4bec08a1a9c93c19b7aeb40fbbc0562da397f10cc410bc32e446aa9d4348510b1badafbd97759f3bf3b74e4641588cc2a0a235312ee1cd5ed862b4f3d38d76426a48ab21796163efba1abcaab9fee4ac03bfdf3fcf8c79e15da75fae3600e7e1fb03b4d848845275d65e59e0e4996f8b856a8508e88526e867bc3e7526e2ed5d68add7b98fb0c14fb8f4473c459199c6b80fe40b06ba3df0f35bc97a28ddaa8a5a80d766dd40ad406bbd34614cc91ff6359753a35fbd0f6360a95823aeca779ebe5ef85daa45d1bb502b5c1ae8d5a81da60d746ad406db06ba356a036d8b5512b501becdaa815a80d766dd40ad406bb366a056a835d1bb502b5c1ae8d5a81fec8b06b683df4b4ad953690f9776a3cd477ec4ef35a6d216a0eec422f00700a2dd67375e38dd47f6f7d84a06daf08fe5d03cf0a4362a6da42c0199b7e47d88372ea7028c53df4ba41c6bf833e346cabc0cde9821053010891fdf4e38f1b37fe86888880c0403b0bd5e9725ef1e72b060e1c6c369b01e0f8f1e35f7cf6b9c3516d48e6430272b95cfdfaf6bd74fc04abcdb661c3fadf7ef9d56c36e95ba5955f105192649bcd366cd8b01123472a279f1616e4676565391c0e864a2145402044169f10dff79c7e8220ecdbb367c3860d274b4b4451d4fb5e3d38144096796454d4c4abaeecd6ad5b5db82020224a1ecfa1c3870b0bf3cd66330023ce0100116c5151fdfaf58b88b0161715fdf8c3da3dbb770f1c34e8861b6f44c63805df018b885eaf272b2b2b2f27c7b0339c64598e898ded969e9e9060578e6f44c4631947befbeebbb2b232857300906529322a7ae879e7499277ebb6ed5e8f87a152640150adf5418228a6a4a4f6efdfff7f3ffd545b5ba39c4a0fca966022413477ebd6ed9a6baf292a2a5cb36a555959b9280a0a674040c411957394293ec13e61c2f8ce695d14e86fd9b4f18b2fbeb045da0c675e3159f64646468f1a337af0e0c1bb76ee58f9c927894949978e1bd7a74f5f4168c63614de30c932e79c88fef5ce3b7dfbf4b1d96cf68484447b42427cbcdd6eb7dbed09f1f1898976c670dedcb944b4f1b7df2e1a3edc66b326c4c7ebd724da551245f1ef7fbb65f5ca4fc65f7a6974747462a25dbfc6483131315dbb765df4dc739cf3e3c78e8e1d3d3a2e2e2e3e2ece9e90909868b7dbedb1b1b1e9e9e92b962ff77abd44b4ea934f060e1860b35913137d8de8bf2726da636262baa4755eb572251105bc9f72e6c1fcb9733ba5a4c4c4c4e8b7c7c7c52526da5f7de595aaaa2a225af7d34fa3478e0480f1e3c79d38762ca01d599638573bcaed767ffae99ae4f61d9447eb1c994ca609e3c7efdcb18388887359f21e3cb07fc485c3edf1f10909096a67262424daedc3ce1b3a73faf4c4449507c33bd9ed767b5c6c6c5ae7ce8fcd9ad5bb672f7b4282dd9e10d87d0909498989978d1ffff3fffe3778f0609bcd66b7abfd96a88d85323af1f1f1d151519f7dfa5f22fae8c30fd3bb768d8e8e5646c4d893d1d1d13dd2d39f7d7ac10b8b9e0780b4b4b49717bfe4f1b8eb76668844448d493b44447c71d1a2b7de7ebbb0b030222242a90d86da2175c8181158adb61f7ffc21b943fb2ddbb66ddcbc3936260619d3c4894f1a5badd6dd7bf6223265b273993381d52d6f6e3299cacacade78ebad4bc75d7ae79d779d38718231c6d4a358c0e572a5a7a72f7aeef97113c6ebb30db543add56dd75a2d002e7360cc6432656665ffb076edd8b16313ec76fd2e45703efce0432b56aca8a9ad35994d00449c08283a267ac1fc05d7df7083c56251ae54eff2edf4367692527f03dd6ed7b20f963dfae87464a89e15ce3922565655fde52f7f993f6f5eafdebd014092a56ddbb6dd7de7dd0585054a0f0380328a232ebae8f2cb2f9bf6e8746b4484fab9e1411e8fa7736aea95575ef9f1471f5756553281297b1218533b47e18673be79cb965f7ed9505b53238a2210702244ed585bce95d16100352ed7fa0deb376ddab8e6d34f8b4b4a2c1116305889c439229acde6bcfcfc6fbffb2e2525c56c3613e74472339575a34a960070cda79f661c3d7ae59513e7ce9d3b70a05f7d3f449c3279f2279f7c223061d9b20ff7eedbd7b163f2e4fbef9f317316198ea647c4b7df7a6bfefcf91e8f5bd105b22cc7c6c61c3a78c8161969444fc691c373e6cc59b57a8dd7ebf9faebaf8a4b4aca2b2b5f7de9a5e1c387d7d4d4c8b21c1915d92dbd5b52527b237a00c0e170cc9c39f389279e08602fe3f0e17beebdf7e7f5ebd59a3ffa5b0130c4f7fef5eed75f7f9d5f5878f34d37dd72cb2d7171b11e8f47144d5dbaa4a5a47602508f384720df44f29d01abd4b8e0a09d06999d95fdbffffd54eba849e998f2ef7fff5b604844922425b64bead62d3d2a2a5a69cde1707efbf537a5e5a565e5e5dbb76d1f3c647080b69af48ffbf4675d7bed35ab57aff9d32597cc9d3b77f88811454545cf3ef374695929277e60d7fe4e9dd3947b898831e67038567cfcf1e429536c919100c004565555356be6cc193367c6c6c606f4ccc081034b4b4bb3b3b2e6cc9dfbccc285be6fb5f21d889897933379ca94cf3effbcb6d671f264a920088cf9fc01e554d2c62014841a859d6fc269a5d103499143c0587565654d6d6d744c8c3e15b4d22386bb084839461d80cb3c485130644c3df314d4835689fa0f183064e8d08003ef0df790cfa06b8088f4a7e9c5850940c153bba4a40b2fbc303ea1be3228a89ef5ed7b88de96bf5b462049b268328d1e330611ebe35995c4d0b8d4502e3316714145c948dcf8687d3220fa0eee205935523178fd7183140ff8427d9c6fc089739f46f29d52d24499774ad9c5c19d45f55322640c15f516505d3af006e28a206441fc6822e2c4d1705f6464e4fc79f3de7ce30d599294c771ce232222c68e1d7bfb1d77984c26d44ed7608200003b776c7f69f14b4ea753d15f5e8fe7c4891326414ceddc29c19e68608bf4feb3582c3ffffcf3dd77dfcd98dfa91b9d525367cd9eddae5d3b23b701be67e091c04866b3a9babafaba6bafd524251080c7e3e9989c7cc30d378cbde412e526456c346a931b7a49035390ab34c940ea99f58a5704ca2308a2a2a377efdefdf2e217cb2b2a44d104008cb192e212444cefde3dad4b97ecececb7df7a6be7ce9d566b840672f27abd175f7289cbe5628c0163c609d418d78d5048b0c3c6aa126bee9ae6c61b8621c065d7cad068fd12ac29bd0e984266b379f79e3da0e83b00ceb9c56c993061fcdffffe775154f827c5bab258cc3bb76fbbf9e65b0a0a0b4d2693c20be7e4757b162e7c76f29429e037b97d7c9944313b27273b37d7f72e00f6f884295326c7c7c72b8fd04dbbc0988bdfcb12112030afd7bbeee79fd539c8b9d72bc527c48f1f77a98239433f343e8406c5a1dec41089737ff01bc4b852fec030a5e3e2e23e5db3e6d5254bb66edb66b3d9f4cf6b6b6b67cd9c396bd6ac92e2e2e93366ac59b3262e2e4effd6ebf54e18376ee0c0019b366f0ed8d5dafc0d87a1493bcd58154593cce56fbefa7afbd6ade60833008a827060ff7eafd7cbfcd1e663d1c0ac7a541e2043c68486583736e4f178ce1f36b45d523b499264225992060d1cf8d4534f81d6b3bab4399a71b45d5252d7ae5ddbb76fbf67ef5e411024494eefd675faf4e913afbcca1211a4e0ba22992559eadea97bb7ae5d992010e7809094943469d2a47efdcf5590add9fd8d948755824bb22c994ca611c387039012f570b95c77dc71fb35d75daf5fc9006449d79e0d92ff9427004e848c718f1444f011a87e15f7359e939deda8a949b4db870d1dba7de74eb3c9240a42ff7efd265e79e59d77dd65369be6cc99b372e5ca1e3d7a9cd3a78f683229d33b3535f5a9b973bd1eb7d3e130be3862a08553cf4b3414230c0976aa836936d5d6542f7d75c9ecd9b32d1116c698eeefb8dcee6eddba656565495e2ffa74b11e900300402286a818829c48b56c8233ea5784bbb6b6f689279f1a33664c7d5122d58305484949b9f5b6db6fbdedf682fcfcfbefbb6fc3afbfca9c774aed3478f010abd51af476860c015c2ef7d831639e78f2c9bab69da2283927ae58ee9c37209e88888038514c4cf4ca55ab82da76aa870b5c104352b2f51d4da0be7a9dbe504b4532a67763744ccc438f3c121b179779e2c482f9f33f5ebe3c322a4a96e59b6ebe393a3aba303fdfed7601409fdebd97bef65a4a6aaad1c3cbcbcd55d9d00735d097af0f5b0d4da853b0ed1213935e7ffd8d2fbefcd26cb1a821030000f0ca72fffefda73ffae807cb3ef87eed5a4e909f97b76dcbe61a870355ad8b5151519999995cf30a010119430044f4783dbb77ecacaeae1644c162b19c3871a2a2b252100ce5f110f7eede1d1d69aba9a95142d5c4356b972831a99dc3e1526d5b6d34923b767c75c9926bfefad7ccecacafbef9a65bf71ed3a63d929c9c1c44da697e466151d1c68dbfc5c5c67abd5e051b5affa2d96c2e292ab6982d0050535bbb6ddbb6dcdc5c5996fd51452693b9acac34c21201006e977bfdba75c898ceabd61a992d165114190a44208ae2ce1d3bb82c391d4ee575b47a7c084451519143860e63c12d60104471f3a68db9d9591e8f57f13b054170381c478f1dd77a2ff065bb74ed3a6bf6ec8ca347f7eddbb76bcf9e59b3663df7dcf311d608e2040055d5555b366f6e77e284579204863227932814959454545622aa8758232297e59c9cdc0d3fff2c8abea313d4c3ed65d9668becd7bfbfe247374021da76000005f97973e7cdfbcffbef07151b88d8bd7b8f1eddbb1714142cfbf0a30f3f5e6e0cc529545d5d3562c488512347ffdf07ef03002772391dd31f9dfef5b7df381c4e25ea8d00c8d06289d01f1d17133377de3c3486a6340b8c73deaf6fdf2baeb8c26ab3826e2c718e8c2577ecf8f6bbefdc79c79d5eaff4d69b6fa4744c9e3c658ac51258fd4429c7111d15b576eddaefd7aef57daec95eb7db9d9e9e7ef7dd7775ecd8d1248a878f1cb9effefbf5d0a0f22ce5b2e40e1dc68f1f17151d2508424d6ded35d75de70b227255cec9b21c191535fc820bce3df75c0088898999396b968f73fdf1448078c58409ff79ff7d024a888fbffdf65b878fb8080044518c8d8e21ce4da278dffdf7070c050270a248ab75c890c1fd070cb0ac5aadb5a75e979e9efece3beffce9923f395dce651f7c70e105175c3c768cc96c1604b66fdfbe7b264daa3b6a44648db044474527da1301c0e174beffc107ef2ffb409d219c2ba10922926479e89021cb3f59d128ec42b20d7dd674832a61ecd831c3470c77389dba8fa66b5944a8acacb8eaaaab17bff4d2c831a3100119f3783c37df74f3d7df7eeb74ba44514025ec89e0767b1213edf7de7d37007202640c1015ff183577841331c6060d18b062c58a5e3d7b3a1c4e5f67211291288a03060c9c33674e72720799cb4b96bcfae5175fd4e5d9d7be32368a1fc8390110e7922ca7a7777bfdf5d7264f993a6ad4a88e29291e8fc7a06b00194304b7d763b7dbe7ce9b3b63d6ccf2b232c69038d77d26528685a15792ac36db75d75cb362e5ca7b274dead5a3a720085c96d5a34af5500571b3c572d38d37bcf6e69bc8983d3e61c9abafdef2b75b956fed76fb6d77dc3e64f060d124cab28c86790844922499cde68b2fbe78f98a159d535334b50e5ab09d034097ae5ddf79f71d93d96c8d8c7cf0c1870a0a0a2fbb6c424ac78e6e975b9fccaa0fa9bd82c7eb4d4c4cfcf39fff7cf984091e8f5b7f7d459d23a24ce4f57a2f193bf6830f97d90de182faa8f1d23b88b86dcbe6b2f28a0e1dda774b57639ef55d595d5d7dfcd8b1d29325a228920e3a22cec96c31f7e8d9b35dbbf64ea7f3c489e345f9054c10902190a27bd51122e2a22076484e4eefd17dcfeedd3ffef083cbed628c2120e79aa70c1c01131212afb9f6aff6c4a4e2e2e213c78f959795f7ecd5ab5b7a7a405074eb96cdd555d5b22cf7eaddbb735a5a603039e3c8daefd69697978aa2607c2d45d4992d11d75e7b4de7ce690adef37273f7efdb67b1589021710e8808c889bc1e6f97ae5d7af4ec59565afae38f6b0f1e3c643699018080a37a32950a80fefdfb5ff1e72b181388a8b6a67aef9ebd6e970bd42518c53942ce65b3d97ce1888b1a181159967ffbe51745d11bbf22e2b6485bbffefdadd648a7a376efdebd951595ddbb774febd245d074a272fb81fdfbcacbcadc6e4fcfdebdd3d2d272b2b20e1e3c68b12867336be3a10c1ea0e4f576486edfa7ef396eb767ffbe3db5b50ec58fe3a4c67225498e8e89ee969e6eb72736ba507b5a2a3e0584b542bca9a1f077432ed2e9a153e1a0a5b9257f157d06f44c5ba1b1366a056a2b34d646ad43a11fd7d4466d14366a93766dd40ad406bb366a056a835d1bb502fd3fa9aef5ac0a656e6473747265616d0a656e646f626a0a342030206f626a0a3c3c202f54797065202f584f626a656374202f53756274797065202f466f726d202f466f726d547970652031202f46696c746572202f466c6174654465636f6465202f42426f78205b302e30303030303020302e303030303030203539352e3237363030302031342e3137333232385d202f4d6174726978205b31203020302031203020305d202f5265736f7572636573203c3c202f50726f63536574205b2f504446202f54657874202f496d61676542202f496d61676543202f496d616765495d202f466f6e74203c3c202f4632203520302052202f4631203320302052203e3e203e3e202f4c656e67746820313636203e3e2073747265616d0a789ca58f310bc2301085f7fc8a37ea60bcbb34a673410bddd46ca55bb12075b04bffbe9742a9a0086ae091cbe3be779722627b1088a5e9205eb08f86ac0fd37304a1525d51377ab5aa52d519532490bf07efa019792d860e9aab61c3e28d9a9b5ca66003efbcf3d838b28e24f301b145bdc2ba41ac52df5137c8fd9b0de6b4f6d3f85389675e7ee0d31767ce70663938917c69b9c1e76c99240459dc1ee77f273f0026975b9e0a656e6473747265616d0a656e646f626a0a322030206f626a0a3c3c202f50726f63536574205b2f504446202f54657874202f496d61676542202f496d61676543202f496d616765495d202f466f6e74203c3c202f4631203320302052202f4632203520302052203e3e202f584f626a656374203c3c202f585434203420302052202f493120313520302052203e3e203e3e0a656e646f626a0a362030206f626a0a3c3c2f54797065202f416e6e6f74202f53756274797065202f4c696e6b202f52656374205b322e38333530303020312e3030303030302031392e30303530303020322e3135363030305d202f436f6e74656e74732028feff0068007400740070003a002f002f007700770077002e00740063007000640066002e006f0072006729202f5020313320302052202f4e4d2028303030342d3030303029202f4d2028443a32303136303630323230303035312d30342733302729202f462034202f426f72646572205b30203020305d202f41203c3c2f53202f555249202f5552492028687474703a2f2f7777772e74637064662e6f7267293e3e202f48202f493e3e0a656e646f626a0a31362030206f626a0a3c3c202f5469746c652028feff0043006f006e007300740061006e0063006900610020006400650020005200650073006900640065006e00630069006129202f417574686f722028feff0043006f006e007300740061006e0063006900610020006400650020005200650073006900640065006e00630069006129202f5375626a6563742028feff0043006f006e007300740061006e0063006900610020006400650020005200650073006900640065006e00630069006129202f4b6579776f7264732028feff0043006f006e007300740061006e0063006900610020006400650020005200650073006900640065006e00630069006100200054004300500044004629202f43726561746f722028feff0054004300500044004629202f50726f64756365722028feff0054004300500044004600200035002e0039002e0031003900370020005c280068007400740070003a002f002f007700770077002e00740063007000640066002e006f00720067005c2929202f4372656174696f6e446174652028443a32303136303630323230303035312d30342733302729202f4d6f64446174652028443a32303136303630323230303035312d30342733302729202f54726170706564202f46616c7365203e3e0a656e646f626a0a31372030206f626a0a3c3c202f54797065202f4d65746164617461202f53756274797065202f584d4c202f4c656e6774682034333536203e3e2073747265616d0a3c3f787061636b657420626567696e3d22efbbbf222069643d2257354d304d7043656869487a7265537a4e54637a6b633964223f3e0a3c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f2220783a786d70746b3d2241646f626520584d5020436f726520342e322e312d633034332035322e3337323732382c20323030392f30312f31382d31353a30383a3034223e0a093c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e0a09093c7264663a4465736372697074696f6e207264663a61626f75743d222220786d6c6e733a64633d22687474703a2f2f7075726c2e6f72672f64632f656c656d656e74732f312e312f223e0a0909093c64633a666f726d61743e6170706c69636174696f6e2f7064663c2f64633a666f726d61743e0a0909093c64633a7469746c653e0a090909093c7264663a416c743e0a09090909093c7264663a6c6920786d6c3a6c616e673d22782d64656661756c74223e436f6e7374616e636961206465205265736964656e6369613c2f7264663a6c693e0a090909093c2f7264663a416c743e0a0909093c2f64633a7469746c653e0a0909093c64633a63726561746f723e0a090909093c7264663a5365713e0a09090909093c7264663a6c693e436f6e7374616e636961206465205265736964656e6369613c2f7264663a6c693e0a090909093c2f7264663a5365713e0a0909093c2f64633a63726561746f723e0a0909093c64633a6465736372697074696f6e3e0a090909093c7264663a416c743e0a09090909093c7264663a6c6920786d6c3a6c616e673d22782d64656661756c74223e436f6e7374616e636961206465205265736964656e6369613c2f7264663a6c693e0a090909093c2f7264663a416c743e0a0909093c2f64633a6465736372697074696f6e3e0a0909093c64633a7375626a6563743e0a090909093c7264663a4261673e0a09090909093c7264663a6c693e436f6e7374616e636961206465205265736964656e6369613c2f7264663a6c693e0a090909093c2f7264663a4261673e0a0909093c2f64633a7375626a6563743e0a09093c2f7264663a4465736372697074696f6e3e0a09093c7264663a4465736372697074696f6e207264663a61626f75743d222220786d6c6e733a786d703d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f223e0a0909093c786d703a437265617465446174653e323031362d30362d30325432303a30303a35312b30343a33303c2f786d703a437265617465446174653e0a0909093c786d703a43726561746f72546f6f6c3e54435044463c2f786d703a43726561746f72546f6f6c3e0a0909093c786d703a4d6f64696679446174653e323031362d30362d30325432303a30303a35312b30343a33303c2f786d703a4d6f64696679446174653e0a0909093c786d703a4d65746164617461446174653e323031362d30362d30325432303a30303a35312b30343a33303c2f786d703a4d65746164617461446174653e0a09093c2f7264663a4465736372697074696f6e3e0a09093c7264663a4465736372697074696f6e207264663a61626f75743d222220786d6c6e733a7064663d22687474703a2f2f6e732e61646f62652e636f6d2f7064662f312e332f223e0a0909093c7064663a4b6579776f7264733e436f6e7374616e636961206465205265736964656e6369612054435044463c2f7064663a4b6579776f7264733e0a0909093c7064663a50726f64756365723e544350444620352e392e3139372028687474703a2f2f7777772e74637064662e6f7267293c2f7064663a50726f64756365723e0a09093c2f7264663a4465736372697074696f6e3e0a09093c7264663a4465736372697074696f6e207264663a61626f75743d222220786d6c6e733a786d704d4d3d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f6d6d2f223e0a0909093c786d704d4d3a446f63756d656e7449443e757569643a65666263656337612d363266352d643661352d626165342d6263656666653530613063353c2f786d704d4d3a446f63756d656e7449443e0a0909093c786d704d4d3a496e7374616e636549443e757569643a65666263656337612d363266352d643661352d626165342d6263656666653530613063353c2f786d704d4d3a496e7374616e636549443e0a09093c2f7264663a4465736372697074696f6e3e0a09093c7264663a4465736372697074696f6e207264663a61626f75743d222220786d6c6e733a70646661457874656e73696f6e3d22687474703a2f2f7777772e6169696d2e6f72672f706466612f6e732f657874656e73696f6e2f2220786d6c6e733a70646661536368656d613d22687474703a2f2f7777772e6169696d2e6f72672f706466612f6e732f736368656d61232220786d6c6e733a7064666150726f70657274793d22687474703a2f2f7777772e6169696d2e6f72672f706466612f6e732f70726f706572747923223e0a0909093c70646661457874656e73696f6e3a736368656d61733e0a090909093c7264663a4261673e0a09090909093c7264663a6c69207264663a7061727365547970653d225265736f75726365223e0a0909090909093c70646661536368656d613a6e616d6573706163655552493e687474703a2f2f6e732e61646f62652e636f6d2f7064662f312e332f3c2f70646661536368656d613a6e616d6573706163655552493e0a0909090909093c70646661536368656d613a7072656669783e7064663c2f70646661536368656d613a7072656669783e0a0909090909093c70646661536368656d613a736368656d613e41646f62652050444620536368656d613c2f70646661536368656d613a736368656d613e0a09090909093c2f7264663a6c693e0a09090909093c7264663a6c69207264663a7061727365547970653d225265736f75726365223e0a0909090909093c70646661536368656d613a6e616d6573706163655552493e687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f6d6d2f3c2f70646661536368656d613a6e616d6573706163655552493e0a0909090909093c70646661536368656d613a7072656669783e786d704d4d3c2f70646661536368656d613a7072656669783e0a0909090909093c70646661536368656d613a736368656d613e584d50204d65646961204d616e6167656d656e7420536368656d613c2f70646661536368656d613a736368656d613e0a0909090909093c70646661536368656d613a70726f70657274793e0a090909090909093c7264663a5365713e0a09090909090909093c7264663a6c69207264663a7061727365547970653d225265736f75726365223e0a0909090909090909093c7064666150726f70657274793a63617465676f72793e696e7465726e616c3c2f7064666150726f70657274793a63617465676f72793e0a0909090909090909093c7064666150726f70657274793a6465736372697074696f6e3e55554944206261736564206964656e74696669657220666f7220737065636966696320696e6361726e6174696f6e206f66206120646f63756d656e743c2f7064666150726f70657274793a6465736372697074696f6e3e0a0909090909090909093c7064666150726f70657274793a6e616d653e496e7374616e636549443c2f7064666150726f70657274793a6e616d653e0a0909090909090909093c7064666150726f70657274793a76616c7565547970653e5552493c2f7064666150726f70657274793a76616c7565547970653e0a09090909090909093c2f7264663a6c693e0a090909090909093c2f7264663a5365713e0a0909090909093c2f70646661536368656d613a70726f70657274793e0a09090909093c2f7264663a6c693e0a09090909093c7264663a6c69207264663a7061727365547970653d225265736f75726365223e0a0909090909093c70646661536368656d613a6e616d6573706163655552493e687474703a2f2f7777772e6169696d2e6f72672f706466612f6e732f69642f3c2f70646661536368656d613a6e616d6573706163655552493e0a0909090909093c70646661536368656d613a7072656669783e7064666169643c2f70646661536368656d613a7072656669783e0a0909090909093c70646661536368656d613a736368656d613e5044462f4120494420536368656d613c2f70646661536368656d613a736368656d613e0a0909090909093c70646661536368656d613a70726f70657274793e0a090909090909093c7264663a5365713e0a09090909090909093c7264663a6c69207264663a7061727365547970653d225265736f75726365223e0a0909090909090909093c7064666150726f70657274793a63617465676f72793e696e7465726e616c3c2f7064666150726f70657274793a63617465676f72793e0a0909090909090909093c7064666150726f70657274793a6465736372697074696f6e3e50617274206f66205044462f41207374616e646172643c2f7064666150726f70657274793a6465736372697074696f6e3e0a0909090909090909093c7064666150726f70657274793a6e616d653e706172743c2f7064666150726f70657274793a6e616d653e0a0909090909090909093c7064666150726f70657274793a76616c7565547970653e496e74656765723c2f7064666150726f70657274793a76616c7565547970653e0a09090909090909093c2f7264663a6c693e0a09090909090909093c7264663a6c69207264663a7061727365547970653d225265736f75726365223e0a0909090909090909093c7064666150726f70657274793a63617465676f72793e696e7465726e616c3c2f7064666150726f70657274793a63617465676f72793e0a0909090909090909093c7064666150726f70657274793a6465736372697074696f6e3e416d656e646d656e74206f66205044462f41207374616e646172643c2f7064666150726f70657274793a6465736372697074696f6e3e0a0909090909090909093c7064666150726f70657274793a6e616d653e616d643c2f7064666150726f70657274793a6e616d653e0a0909090909090909093c7064666150726f70657274793a76616c7565547970653e546578743c2f7064666150726f70657274793a76616c7565547970653e0a09090909090909093c2f7264663a6c693e0a09090909090909093c7264663a6c69207264663a7061727365547970653d225265736f75726365223e0a0909090909090909093c7064666150726f70657274793a63617465676f72793e696e7465726e616c3c2f7064666150726f70657274793a63617465676f72793e0a0909090909090909093c7064666150726f70657274793a6465736372697074696f6e3e436f6e666f726d616e6365206c6576656c206f66205044462f41207374616e646172643c2f7064666150726f70657274793a6465736372697074696f6e3e0a0909090909090909093c7064666150726f70657274793a6e616d653e636f6e666f726d616e63653c2f7064666150726f70657274793a6e616d653e0a0909090909090909093c7064666150726f70657274793a76616c7565547970653e546578743c2f7064666150726f70657274793a76616c7565547970653e0a09090909090909093c2f7264663a6c693e0a090909090909093c2f7264663a5365713e0a0909090909093c2f70646661536368656d613a70726f70657274793e0a09090909093c2f7264663a6c693e0a090909093c2f7264663a4261673e0a0909093c2f70646661457874656e73696f6e3a736368656d61733e0a09093c2f7264663a4465736372697074696f6e3e0a093c2f7264663a5244463e0a3c2f783a786d706d6574613e0a3c3f787061636b657420656e643d2277223f3e0a656e6473747265616d0a656e646f626a0a31382030206f626a0a3c3c202f54797065202f436174616c6f67202f56657273696f6e202f312e37202f5061676573203120302052202f4e616d6573203c3c203e3e202f566965776572507265666572656e636573203c3c202f446972656374696f6e202f4c3252203e3e202f506167654c61796f7574202f53696e676c6550616765202f506167654d6f6465202f5573654e6f6e65202f4f70656e416374696f6e205b3720302052202f46697448206e756c6c5d202f4d6574616461746120313720302052202f4c616e672028feff0065007329203e3e0a656e646f626a0a787265660a302031390a303030303030303030302036353533352066200a30303030303132383138203030303030206e200a30303030303239393534203030303030206e200a30303030303132383937203030303030206e200a30303030303239353130203030303030206e200a30303030303133303033203030303030206e200a30303030303330303930203030303030206e200a30303030303030303135203030303030206e200a30303030303030343635203030303030206e200a30303030303032353435203030303030206e200a30303030303032393936203030303030206e200a30303030303035393436203030303030206e200a30303030303036333938203030303030206e200a30303030303039333438203030303030206e200a30303030303039383138203030303030206e200a30303030303133313134203030303030206e200a30303030303330333632203030303030206e200a30303030303330383436203030303030206e200a30303030303335323835203030303030206e200a747261696c65720a3c3c202f53697a65203139202f526f6f7420313820302052202f496e666f20313620302052202f4944205b203c65666263656337613632663564366135626165346263656666653530613063353e203c65666263656337613632663564366135626165346263656666653530613063353e205d203e3e0a7374617274787265660a33353530390a2525454f460a);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semestre`
--

DROP TABLE IF EXISTS `semestre`;
CREATE TABLE IF NOT EXISTS `semestre` (
  `idsemestre` int(11) NOT NULL AUTO_INCREMENT,
  `id_configuracion` int(11) NOT NULL,
  `FechaInicio` datetime NOT NULL,
  `FechaFin` datetime NOT NULL,
  `Porcentaje` int(11) NOT NULL DEFAULT '0',
  `FechaModificacion` datetime DEFAULT NULL,
  `IDUsuarioModificacion` int(11) DEFAULT NULL,
  `Activo` bit(1) NOT NULL DEFAULT b'1',
  `Eliminado` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`idsemestre`),
  KEY `ID_UsuarioModificacion_idx` (`IDUsuarioModificacion`),
  KEY `ID_Configuracion_semestre_FK_idx` (`id_configuracion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

DROP TABLE IF EXISTS `solicitudes`;
CREATE TABLE IF NOT EXISTS `solicitudes` (
  `idSolicitudes` int(11) NOT NULL AUTO_INCREMENT,
  `FechaSolicitud` datetime DEFAULT NULL,
  `FechaResolucion` datetime DEFAULT NULL,
  `Procesado` bit(1) DEFAULT NULL,
  `Descripcion` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `EntregaDinero` bit(1) DEFAULT NULL,
  `RecepcionDinero` bit(1) DEFAULT NULL,
  `NombreEntregoDinero` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `NombreRecibioDinero` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `FechaEntrega` datetime DEFAULT NULL,
  `FechaRecepcion` datetime DEFAULT NULL,
  `EvidenciaRegistrada` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idSolicitudes`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `solicitudes`
--

INSERT INTO `solicitudes` (`idSolicitudes`, `FechaSolicitud`, `FechaResolucion`, `Procesado`, `Descripcion`, `EntregaDinero`, `RecepcionDinero`, `NombreEntregoDinero`, `NombreRecibioDinero`, `FechaEntrega`, `FechaRecepcion`, `EvidenciaRegistrada`) VALUES
(1, '2016-08-02 00:00:00', '2016-08-02 17:49:23', b'1', 'impresiones de diplomas', b'1', b'1', 'giulliano torres', 'Gabriel Aparcero', '2016-08-02 19:22:33', '2016-08-02 19:22:33', b'1'),
(2, '2016-08-02 00:00:00', '2016-08-02 00:00:00', b'1', 'impresiones de diplomas', b'1', b'1', 'giulliano torres', 'Gabriel Aparcero', '2016-08-02 19:22:33', '2016-08-02 19:22:33', b'1'),
(3, '2016-08-02 00:00:00', '2016-08-02 00:00:00', b'1', 'impresiones de diplomas', b'1', b'1', 'giulliano torres', 'Gabriel Aparcero', '2016-08-02 19:22:33', '2016-08-02 19:22:33', b'1'),
(4, '2016-08-02 00:00:00', '2016-08-02 00:00:00', b'1', 'impresiones de diplomas', b'1', b'1', 'giulliano torres', 'Gabriel Aparcero', '2016-08-02 19:22:33', '2016-08-02 19:22:33', b'1'),
(5, '2016-08-02 00:00:00', '2016-08-02 00:00:00', b'1', 'impresiones de diplomas', b'1', b'1', 'giulliano torres', 'Gabriel Aparcero', '2016-08-02 19:22:33', '2016-08-02 19:22:33', b'0'),
(6, '2016-08-02 00:00:00', '2016-08-02 00:00:00', b'1', 'impresiones de diplomas', b'1', b'1', 'giulliano torres', 'Gabriel Aparcero', '2016-08-02 19:22:33', '2016-08-02 19:22:33', b'1'),
(7, '2016-08-02 00:00:00', '2016-08-02 00:00:00', b'1', 'impresiones de diplomas', b'1', b'1', 'giulliano torres', 'Gabriel Aparcero', '2016-08-02 19:22:33', '2016-08-02 19:22:33', b'1'),
(8, '2016-08-02 00:00:00', '2016-08-02 00:00:00', b'1', 'impresiones de diplomas', b'1', b'1', 'giulliano torres', 'Gabriel Aparcero', '2016-08-02 19:22:33', '2016-08-02 19:22:33', b'1'),
(9, '2016-08-02 00:00:00', '2016-08-02 00:00:00', b'1', 'impresiones de diplomas', b'1', b'1', 'giulliano torres', 'Gabriel Aparcero', '2016-08-02 19:22:33', '2016-08-02 19:22:33', b'1'),
(10, '2016-08-02 00:00:00', '2016-08-02 00:00:00', b'1', 'impresiones de diplomas', b'1', b'1', 'giulliano torres', 'Gabriel Aparcero', '2016-08-02 19:22:33', '2016-08-02 19:22:33', b'1'),
(11, '2016-08-02 00:00:00', '2016-08-02 00:00:00', b'1', 'impresiones de diplomas', b'1', b'1', 'giulliano torres', 'Gabriel Aparcero', '2016-08-02 19:22:33', '2016-08-02 19:22:33', b'1'),
(12, '2016-08-02 00:00:00', '2016-08-02 00:00:00', b'1', 'impresiones de diplomas', b'1', b'1', 'giulliano torres', 'Gabriel Aparcero', '2016-08-02 19:22:33', '2016-08-02 19:22:33', b'1'),
(13, '2016-08-02 00:00:00', '2016-08-02 00:00:00', b'1', 'impresiones de diplomas', b'1', b'1', 'giulliano torres', 'Gabriel Aparcero', '2016-08-02 19:22:33', '2016-08-02 19:22:33', b'1'),
(14, '2016-08-02 00:00:00', '2016-08-02 00:00:00', b'1', 'impresiones de diplomas', b'1', b'1', 'giulliano torres', 'Gabriel Aparcero', '2016-08-02 19:22:33', '2016-08-02 19:22:33', b'1'),
(15, '2016-08-02 00:00:00', '2016-08-02 00:00:00', b'1', 'impresiones de diplomas', b'1', b'1', 'giulliano torres', 'Gabriel Aparcero', '2016-08-02 19:22:33', '2016-08-02 19:22:33', b'1'),
(16, '2016-08-02 00:00:00', '2016-08-02 00:00:00', b'1', 'impresiones de diplomas', b'1', b'1', 'giulliano torres', 'Gabriel Aparcero', '2016-08-02 19:22:33', '2016-08-02 19:22:33', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temp_interesados`
--

DROP TABLE IF EXISTS `temp_interesados`;
CREATE TABLE IF NOT EXISTS `temp_interesados` (
  `idTemp_Interesados` int(11) NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(45) DEFAULT NULL,
  `Apellidos` varchar(45) DEFAULT NULL,
  `Profesion` varchar(45) DEFAULT NULL,
  `TelefonoCasa` varchar(50) DEFAULT NULL,
  `TelefonoCelular` varchar(45) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Observacion` varchar(200) DEFAULT NULL,
  `UsuarioSkype` varchar(45) DEFAULT NULL,
  `FechaNacimiento` datetime DEFAULT NULL,
  `Distrito` varchar(45) DEFAULT NULL,
  `DNI` varchar(45) DEFAULT NULL,
  `ID_Responsable` int(11) NOT NULL,
  `FechaCreacion` datetime NOT NULL,
  `Activo` bit(1) NOT NULL,
  `Eliminado` bit(1) NOT NULL,
  PRIMARY KEY (`idTemp_Interesados`),
  KEY `ID_Responsable_idx` (`ID_Responsable`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temp_interesadosdf`
--

DROP TABLE IF EXISTS `temp_interesadosdf`;
CREATE TABLE IF NOT EXISTS `temp_interesadosdf` (
  `idtemp_interesadosDF` int(11) NOT NULL AUTO_INCREMENT,
  `idTemp_Interesados` int(11) DEFAULT NULL,
  `iddiplomados` int(11) DEFAULT NULL,
  `idformaciones` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtemp_interesadosDF`),
  KEY `ID_Diplomado_TempDF_FK_idx` (`iddiplomados`),
  KEY `ID_Formacion_TempDF_FK_idx` (`idformaciones`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

DROP TABLE IF EXISTS `tipo`;
CREATE TABLE IF NOT EXISTS `tipo` (
  `idTipo` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Activo` bit(1) NOT NULL,
  `Eliminado` bit(1) NOT NULL,
  PRIMARY KEY (`idTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`idTipo`, `Nombre`, `Activo`, `Eliminado`) VALUES
(1, 'Presencial', b'1', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopagos`
--

DROP TABLE IF EXISTS `tipopagos`;
CREATE TABLE IF NOT EXISTS `tipopagos` (
  `idTipoPagos` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Activo` bit(1) NOT NULL,
  `Eliminado` bit(1) NOT NULL,
  PRIMARY KEY (`idTipoPagos`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipopagos`
--

INSERT INTO `tipopagos` (`idTipoPagos`, `Nombre`, `Activo`, `Eliminado`) VALUES
(1, 'Pago Completo', b'1', b'0'),
(2, 'Pago En Cuotas', b'1', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `idusuarios` int(11) NOT NULL AUTO_INCREMENT,
  `id_perfil` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `apellido` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `usuario` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `contrasenia` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `fechamodificacion` datetime DEFAULT NULL,
  `idusuariomodificacion` int(11) DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `eliminado` bit(1) DEFAULT b'0',
  PRIMARY KEY (`idusuarios`),
  KEY `id_perfil_idx` (`id_perfil`),
  KEY `id_usuario_idx` (`idusuariomodificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuarios`, `id_perfil`, `nombre`, `apellido`, `usuario`, `contrasenia`, `fechamodificacion`, `idusuariomodificacion`, `activo`, `eliminado`) VALUES
(1, 14, 'Giulliano', 'Torres', 'gtorres', 'gtorres', NULL, NULL, b'1', b'0'),
(2, 14, 'gabriel', 'aparcero', 'gabo', 'vocem.2016', NULL, NULL, b'1', b'0'),
(3, 14, 'Helena', 'Lynch', 'Hlynch', 'hilshils', NULL, NULL, b'1', b'0'),
(4, 13, 'Prueba Finanza', 'sistemas', 'pfinanza', 'finanza', '2016-08-06 11:38:27', 1, b'1', b'0'),
(5, 16, 'Prueba Academica', 'sistemas', 'pacademica', 'academica', '2016-08-06 11:46:43', 1, b'1', b'0'),
(6, 14, 'Jorge', 'Lynch', 'jlynch', 'dau.2016', '2016-08-27 12:39:16', 2, b'1', b'0');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnocursoprofesor`
--
ALTER TABLE `alumnocursoprofesor`
  ADD CONSTRAINT `id_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`idalumnos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_cursoprofesores` FOREIGN KEY (`id_cursoprofesores`) REFERENCES `cursoprofesores` (`idcursoprofesores`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `alumnosdebaja`
--
ALTER TABLE `alumnosdebaja`
  ADD CONSTRAINT `ID_Alumnos_AlumnosDeBaja_FK` FOREIGN KEY (`ID_Alumno`) REFERENCES `alumnos` (`idalumnos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ID_Configuracion_AlumnosDeBaja_FK` FOREIGN KEY (`ID_Configuracion`) REFERENCES `configuraciones` (`IDConfiguracion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `alumnostraslado`
--
ALTER TABLE `alumnostraslado`
  ADD CONSTRAINT `ID_Alumno_FK` FOREIGN KEY (`ID_Alumno`) REFERENCES `alumnos` (`idalumnos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ID_Configuraciones_FK` FOREIGN KEY (`ID_Configuracion`) REFERENCES `configuraciones` (`IDConfiguracion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `autorizacionesgerente`
--
ALTER TABLE `autorizacionesgerente`
  ADD CONSTRAINT `ID_Configuracion_autorizaciongerente_FK` FOREIGN KEY (`ID_Configuracion`) REFERENCES `configuraciones` (`IDConfiguracion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ID_Usuarios_autorizacionesgerente_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `configuraciones`
--
ALTER TABLE `configuraciones`
  ADD CONSTRAINT `ID_GerenteResponsable` FOREIGN KEY (`ID_GerenteResponsable`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ID_ProfesorInicial` FOREIGN KEY (`ID_ProfesorInicial`) REFERENCES `profesores` (`idprofesores`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ID_Tipo` FOREIGN KEY (`ID_Tipo`) REFERENCES `tipo` (`idTipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ID_UsuarioResponsable` FOREIGN KEY (`ID_UsuarioResponsable`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `iddiplomados` FOREIGN KEY (`ID_Diplomado`) REFERENCES `diplomados` (`iddiplomados`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idformacion` FOREIGN KEY (`ID_Formacion`) REFERENCES `formacion` (`idformaciones`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cursoprofesores`
--
ALTER TABLE `cursoprofesores`
  ADD CONSTRAINT `id_curso` FOREIGN KEY (`id_cursos`) REFERENCES `cursos` (`idcursos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_profesores` FOREIGN KEY (`id_profesores`) REFERENCES `profesores` (`idprofesores`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `id_modulo` FOREIGN KEY (`id_modulo`) REFERENCES `modulos` (`idmodulos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_semestre` FOREIGN KEY (`id_semestre`) REFERENCES `semestre` (`idsemestre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_usuario_cursos_FK` FOREIGN KEY (`idusuariomodificacion`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `idconfiguracion` FOREIGN KEY (`ID_Configuracion`) REFERENCES `configuraciones` (`IDConfiguracion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD CONSTRAINT `ID_Configuracion_Modulos_FK` FOREIGN KEY (`idconfiguracion`) REFERENCES `configuraciones` (`IDConfiguracion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idusuariomodificacion` FOREIGN KEY (`IDUsuarioMoidificacion`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `id_alumnocursoprofesor` FOREIGN KEY (`id_calumnocursoprofesor`) REFERENCES `alumnocursoprofesor` (`idalumnocursoprofesor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_usuariomodificacion_notas_FK` FOREIGN KEY (`IDUsuarioModificacion`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pagina`
--
ALTER TABLE `pagina`
  ADD CONSTRAINT `idpagina_fk` FOREIGN KEY (`IDPagina_FK`) REFERENCES `pagina` (`idpagina`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `ID_Alumno_pagos_FK` FOREIGN KEY (`ID_Alumno`) REFERENCES `alumnos` (`idalumnos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ID_Configuracion_pagos_FK` FOREIGN KEY (`ID_Configuracion`) REFERENCES `configuraciones` (`IDConfiguracion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ID_Frecuencia_pagos_FK` FOREIGN KEY (`ID_Frecuencia`) REFERENCES `frecuencia` (`idFrecuencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ID_MetodosdePago` FOREIGN KEY (`ID_MetododePagos`) REFERENCES `metodosdepago` (`idMetodosDePago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ID_TipoPago` FOREIGN KEY (`ID_TipoPago`) REFERENCES `tipopagos` (`idTipoPagos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pagoscuotas`
--
ALTER TABLE `pagoscuotas`
  ADD CONSTRAINT `ID_Pagos` FOREIGN KEY (`ID_Pagos`) REFERENCES `pagos` (`idPagos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `participacion`
--
ALTER TABLE `participacion`
  ADD CONSTRAINT `ID_Configuracion` FOREIGN KEY (`ID_Configuracion`) REFERENCES `configuraciones` (`IDConfiguracion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ID_DiasSemana` FOREIGN KEY (`ID_DiasSemana`) REFERENCES `diassemana` (`idDiasSemana`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD CONSTRAINT `id_usuarios` FOREIGN KEY (`idusuariomodificacion`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `idpagina` FOREIGN KEY (`IDPagina`) REFERENCES `pagina` (`idpagina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idperfiles` FOREIGN KEY (`IDperfil`) REFERENCES `perfiles` (`idperfiles`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `preguntarespuesta`
--
ALTER TABLE `preguntarespuesta`
  ADD CONSTRAINT `idpregunta` FOREIGN KEY (`idpregunta`) REFERENCES `preguntas` (`idPreguntas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idusuario` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD CONSTRAINT `ID_UsuarioModificacion_profesores_FK` FOREIGN KEY (`IDUsuarioModificacion`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `registropagos`
--
ALTER TABLE `registropagos`
  ADD CONSTRAINT `ID_Pago` FOREIGN KEY (`ID_Pagos`) REFERENCES `pagos` (`idPagos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ID_Responsable_registrospagos_FK` FOREIGN KEY (`ID_Responsable`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `registro_evidencias`
--
ALTER TABLE `registro_evidencias`
  ADD CONSTRAINT `id_solicitud_registro_evidencias_FK` FOREIGN KEY (`id_Solicitud`) REFERENCES `solicitudes` (`idSolicitudes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `semestre`
--
ALTER TABLE `semestre`
  ADD CONSTRAINT `ID_Configuracion_semestre_FK` FOREIGN KEY (`id_configuracion`) REFERENCES `configuraciones` (`IDConfiguracion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ID_UsuarioModificacion` FOREIGN KEY (`IDUsuarioModificacion`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `temp_interesados`
--
ALTER TABLE `temp_interesados`
  ADD CONSTRAINT `ID_Responsable` FOREIGN KEY (`ID_Responsable`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `id_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `perfiles` (`idperfiles`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_usuario` FOREIGN KEY (`idusuariomodificacion`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
