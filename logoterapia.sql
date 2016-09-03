-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: logoterapia
-- ------------------------------------------------------
-- Server version	5.7.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alumnocursoprofesor`
--

DROP TABLE IF EXISTS `alumnocursoprofesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumnocursoprofesor` (
  `idalumnocursoprofesor` int(11) NOT NULL AUTO_INCREMENT,
  `id_alumno` int(11) NOT NULL,
  `id_cursoprofesores` int(11) NOT NULL,
  PRIMARY KEY (`idalumnocursoprofesor`),
  KEY `id_cursoprofesores_idx` (`id_cursoprofesores`),
  KEY `id_alumno_idx` (`id_alumno`),
  CONSTRAINT `id_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`idalumnos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_cursoprofesores` FOREIGN KEY (`id_cursoprofesores`) REFERENCES `cursoprofesores` (`idcursoprofesores`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnocursoprofesor`
--

LOCK TABLES `alumnocursoprofesor` WRITE;
/*!40000 ALTER TABLE `alumnocursoprofesor` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumnocursoprofesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumnos` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES (1,'alumno1','prueba','12345678','caricuao','04241394098',NULL,'prueba@prueba.com','prueba','1992-03-08 00:00:00','','\0'),(2,'alumno2','prueba2','1234567','ca√±o amarillo','0424694460',NULL,'prueba2@prueba.com','prueba2','1991-02-01 00:00:00','','\0'),(3,'alumno3','prueba3','12345678','la guaira','04241234567',NULL,'prueba3@prueba3.com','prueba3','1990-04-02 00:00:00','','\0');
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnosdebaja`
--

DROP TABLE IF EXISTS `alumnosdebaja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumnosdebaja` (
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
  KEY `ID_Motivo_Motivo_FK_idx` (`ID_Motivo`),
  CONSTRAINT `ID_Alumnos_AlumnosDeBaja_FK` FOREIGN KEY (`ID_Alumno`) REFERENCES `alumnos` (`idalumnos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ID_Configuracion_AlumnosDeBaja_FK` FOREIGN KEY (`ID_Configuracion`) REFERENCES `configuraciones` (`IDConfiguracion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnosdebaja`
--

LOCK TABLES `alumnosdebaja` WRITE;
/*!40000 ALTER TABLE `alumnosdebaja` DISABLE KEYS */;
INSERT INTO `alumnosdebaja` VALUES (1,1,1,NULL,'2016-07-28 00:00:00',1,'','\0');
/*!40000 ALTER TABLE `alumnosdebaja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnostraslado`
--

DROP TABLE IF EXISTS `alumnostraslado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumnostraslado` (
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
  KEY `ID_Motivo_Traslado_FK_idx` (`ID_Motivo`),
  CONSTRAINT `ID_Alumno_FK` FOREIGN KEY (`ID_Alumno`) REFERENCES `alumnos` (`idalumnos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ID_Configuraciones_FK` FOREIGN KEY (`ID_Configuracion`) REFERENCES `configuraciones` (`IDConfiguracion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnostraslado`
--

LOCK TABLES `alumnostraslado` WRITE;
/*!40000 ALTER TABLE `alumnostraslado` DISABLE KEYS */;
INSERT INTO `alumnostraslado` VALUES (1,1,1,'2016-08-01 23:52:11','2016-08-01 00:00:00','','','','2016-08-31 00:00:00',1,1);
/*!40000 ALTER TABLE `alumnostraslado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asistenciaalumno`
--

DROP TABLE IF EXISTS `asistenciaalumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asistenciaalumno` (
  `idAsistenciaAlumno` int(11) NOT NULL AUTO_INCREMENT,
  `idalumnocursoprofesor` int(11) DEFAULT NULL,
  `Asistio` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idAsistenciaAlumno`),
  KEY `FK_AsistenciaAlumno_AsistenciaProfesor_idx` (`idalumnocursoprofesor`),
  KEY `FK_AsistenciaAlumno_Alumnos_idx` (`Asistio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistenciaalumno`
--

LOCK TABLES `asistenciaalumno` WRITE;
/*!40000 ALTER TABLE `asistenciaalumno` DISABLE KEYS */;
/*!40000 ALTER TABLE `asistenciaalumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asistenciaprofesor`
--

DROP TABLE IF EXISTS `asistenciaprofesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asistenciaprofesor` (
  `idAsistenciaProfesor` int(11) NOT NULL AUTO_INCREMENT,
  `idcursoprofesores` int(11) DEFAULT NULL,
  `HoraInicioEx` time DEFAULT NULL,
  `HoraFinEx` time DEFAULT NULL,
  `FechaAsitencia` datetime DEFAULT NULL,
  `FechaCarga` datetime DEFAULT NULL,
  `AlDia` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idAsistenciaProfesor`),
  KEY `FK_AsistenciaProfesor_CursoProfesores_idx` (`idcursoprofesores`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistenciaprofesor`
--

LOCK TABLES `asistenciaprofesor` WRITE;
/*!40000 ALTER TABLE `asistenciaprofesor` DISABLE KEYS */;
/*!40000 ALTER TABLE `asistenciaprofesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autorizacionesgerente`
--

DROP TABLE IF EXISTS `autorizacionesgerente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autorizacionesgerente` (
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
  KEY `ID_Usuarios_autorizacionesgerente_FK_idx` (`ID_Usuario`),
  CONSTRAINT `ID_Configuracion_autorizaciongerente_FK` FOREIGN KEY (`ID_Configuracion`) REFERENCES `configuraciones` (`IDConfiguracion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ID_Usuarios_autorizacionesgerente_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autorizacionesgerente`
--

LOCK TABLES `autorizacionesgerente` WRITE;
/*!40000 ALTER TABLE `autorizacionesgerente` DISABLE KEYS */;
/*!40000 ALTER TABLE `autorizacionesgerente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuraciones`
--

DROP TABLE IF EXISTS `configuraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuraciones` (
  `IDConfiguracion` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Diplomado` int(11) DEFAULT NULL,
  `ID_Formacion` int(11) DEFAULT NULL,
  `FechaInicio` datetime DEFAULT NULL,
  `FechaFin` datetime DEFAULT NULL,
  `CantidadModulos` int(11) DEFAULT NULL,
  `CupoMinimo` int(11) DEFAULT NULL,
  `EnCurso` bit(1) NOT NULL,
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
  KEY `idformacion_idx` (`ID_Formacion`),
  CONSTRAINT `ID_GerenteResponsable` FOREIGN KEY (`ID_GerenteResponsable`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ID_ProfesorInicial` FOREIGN KEY (`ID_ProfesorInicial`) REFERENCES `profesores` (`idprofesores`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ID_Tipo` FOREIGN KEY (`ID_Tipo`) REFERENCES `tipo` (`idTipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ID_UsuarioResponsable` FOREIGN KEY (`ID_UsuarioResponsable`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `iddiplomados` FOREIGN KEY (`ID_Diplomado`) REFERENCES `diplomados` (`iddiplomados`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idformacion` FOREIGN KEY (`ID_Formacion`) REFERENCES `formacion` (`idformaciones`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuraciones`
--

LOCK TABLES `configuraciones` WRITE;
/*!40000 ALTER TABLE `configuraciones` DISABLE KEYS */;
INSERT INTO `configuraciones` VALUES (1,2,NULL,'2016-07-22 00:00:00','2016-07-22 00:00:00',2,10,'',1,1,1,1,'2016-07-22 00:00:00','','\0'),(3,NULL,2,'2016-07-22 00:00:00','2016-07-22 00:00:00',2,10,'',1,1,1,1,'2016-07-23 00:00:00','','\0');
/*!40000 ALTER TABLE `configuraciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursoprofesores`
--

DROP TABLE IF EXISTS `cursoprofesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cursoprofesores` (
  `idcursoprofesores` int(11) NOT NULL,
  `id_cursos` int(11) NOT NULL,
  `id_profesores` int(11) NOT NULL,
  PRIMARY KEY (`idcursoprofesores`),
  KEY `id_curso_idx` (`id_cursos`),
  KEY `id_profesores_idx` (`id_profesores`),
  CONSTRAINT `id_curso` FOREIGN KEY (`id_cursos`) REFERENCES `cursos` (`idcursos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_profesores` FOREIGN KEY (`id_profesores`) REFERENCES `profesores` (`idprofesores`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursoprofesores`
--

LOCK TABLES `cursoprofesores` WRITE;
/*!40000 ALTER TABLE `cursoprofesores` DISABLE KEYS */;
/*!40000 ALTER TABLE `cursoprofesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cursos` (
  `idcursos` int(11) NOT NULL AUTO_INCREMENT,
  `id_semestre` int(11) DEFAULT NULL,
  `id_modulo` int(11) DEFAULT NULL,
  `idhorario` int(11) DEFAULT NULL,
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
  KEY `id_usuario_idx` (`idusuariomodificacion`),
  KEY `id_horario_cursos_FK_idx` (`idhorario`),
  CONSTRAINT `id_modulo` FOREIGN KEY (`id_modulo`) REFERENCES `modulos` (`idmodulos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_semestre` FOREIGN KEY (`id_semestre`) REFERENCES `semestre` (`idsemestre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_usuario_cursos_FK` FOREIGN KEY (`idusuariomodificacion`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diassemana`
--

DROP TABLE IF EXISTS `diassemana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diassemana` (
  `idDiasSemana` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Activo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idDiasSemana`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diassemana`
--

LOCK TABLES `diassemana` WRITE;
/*!40000 ALTER TABLE `diassemana` DISABLE KEYS */;
INSERT INTO `diassemana` VALUES (1,'Lunes',''),(2,'Martes',''),(3,'Miercoles',''),(4,'Jueves',''),(5,'Viernes',''),(6,'Sabado',''),(7,'Domingo','');
/*!40000 ALTER TABLE `diassemana` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diplomados`
--

DROP TABLE IF EXISTS `diplomados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diplomados` (
  `iddiplomados` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `Descripcion` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Activo` bit(1) NOT NULL,
  `Eliminado` bit(1) NOT NULL,
  PRIMARY KEY (`iddiplomados`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diplomados`
--

LOCK TABLES `diplomados` WRITE;
/*!40000 ALTER TABLE `diplomados` DISABLE KEYS */;
INSERT INTO `diplomados` VALUES (2,'Diplomado 2','Academica','','\0');
/*!40000 ALTER TABLE `diplomados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formacion`
--

DROP TABLE IF EXISTS `formacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formacion` (
  `idformaciones` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `Descripcion` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Activo` bit(1) NOT NULL DEFAULT b'1',
  `Eliminado` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`idformaciones`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formacion`
--

LOCK TABLES `formacion` WRITE;
/*!40000 ALTER TABLE `formacion` DISABLE KEYS */;
INSERT INTO `formacion` VALUES (2,'Prueba1','Prueba Sistema','','\0');
/*!40000 ALTER TABLE `formacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frecuencia`
--

DROP TABLE IF EXISTS `frecuencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frecuencia` (
  `idFrecuencia` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Valor` varchar(100) DEFAULT NULL,
  `Activo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idFrecuencia`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frecuencia`
--

LOCK TABLES `frecuencia` WRITE;
/*!40000 ALTER TABLE `frecuencia` DISABLE KEYS */;
INSERT INTO `frecuencia` VALUES (1,'Quincenal','+15 days',''),(2,'Mensual','+1 month',''),(3,'Bimestral','+2 month',''),(4,'Trimestral','+3 month',''),(5,'Semestral','+6 month','');
/*!40000 ALTER TABLE `frecuencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios`
--

DROP TABLE IF EXISTS `horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horarios` (
  `idhorario` int(11) NOT NULL AUTO_INCREMENT,
  `Inicio` time NOT NULL,
  `Fin` time NOT NULL,
  `Activo` bit(1) DEFAULT NULL,
  `Eliminado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idhorario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripciones`
--

DROP TABLE IF EXISTS `inscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscripciones` (
  `idInscripciones` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Configuracion` int(11) NOT NULL,
  `FechaInicio` datetime DEFAULT NULL,
  `FechaFin` datetime DEFAULT NULL,
  PRIMARY KEY (`idInscripciones`),
  KEY `idconfiguracion_idx` (`ID_Configuracion`),
  CONSTRAINT `idconfiguracion` FOREIGN KEY (`ID_Configuracion`) REFERENCES `configuraciones` (`IDConfiguracion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripciones`
--

LOCK TABLES `inscripciones` WRITE;
/*!40000 ALTER TABLE `inscripciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodosdepago`
--

DROP TABLE IF EXISTS `metodosdepago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metodosdepago` (
  `idMetodosDePago` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Activo` bit(1) NOT NULL,
  PRIMARY KEY (`idMetodosDePago`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodosdepago`
--

LOCK TABLES `metodosdepago` WRITE;
/*!40000 ALTER TABLE `metodosdepago` DISABLE KEYS */;
INSERT INTO `metodosdepago` VALUES (1,'Cheque','');
/*!40000 ALTER TABLE `metodosdepago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulos`
--

DROP TABLE IF EXISTS `modulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulos` (
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
  KEY `idconfiguracion_idx` (`idconfiguracion`),
  CONSTRAINT `ID_Configuracion_Modulos_FK` FOREIGN KEY (`idconfiguracion`) REFERENCES `configuraciones` (`IDConfiguracion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idusuariomodificacion` FOREIGN KEY (`IDUsuarioMoidificacion`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulos`
--

LOCK TABLES `modulos` WRITE;
/*!40000 ALTER TABLE `modulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `modulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motivo`
--

DROP TABLE IF EXISTS `motivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motivo` (
  `idmotivo` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `Activo` bit(1) DEFAULT NULL,
  `Eliminado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idmotivo`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motivo`
--

LOCK TABLES `motivo` WRITE;
/*!40000 ALTER TABLE `motivo` DISABLE KEYS */;
INSERT INTO `motivo` VALUES (1,'Prueba',NULL,NULL);
/*!40000 ALTER TABLE `motivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notas` (
  `idnotas` int(11) NOT NULL AUTO_INCREMENT,
  `id_calumnocursoprofesor` int(11) NOT NULL,
  `DescripcionActividad` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Nota` int(11) NOT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  `IDUsuarioModificacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`idnotas`),
  KEY `id_alumnocursoprofesor_idx` (`id_calumnocursoprofesor`),
  KEY `id_usuariomodificacion_notas_FK_idx` (`IDUsuarioModificacion`),
  CONSTRAINT `id_alumnocursoprofesor` FOREIGN KEY (`id_calumnocursoprofesor`) REFERENCES `alumnocursoprofesor` (`idalumnocursoprofesor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_usuariomodificacion_notas_FK` FOREIGN KEY (`IDUsuarioModificacion`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagina`
--

DROP TABLE IF EXISTS `pagina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagina` (
  `idpagina` int(11) NOT NULL AUTO_INCREMENT,
  `IDPagina_FK` int(11) DEFAULT NULL,
  `Descripcion` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `URL` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Activo` bit(1) NOT NULL DEFAULT b'1',
  `Eliminado` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`idpagina`),
  KEY `idpagina_fk_idx` (`IDPagina_FK`),
  CONSTRAINT `idpagina_fk` FOREIGN KEY (`IDPagina_FK`) REFERENCES `pagina` (`idpagina`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagina`
--

LOCK TABLES `pagina` WRITE;
/*!40000 ALTER TABLE `pagina` DISABLE KEYS */;
INSERT INTO `pagina` VALUES (1,NULL,'Administrador','#','','\0'),(2,1,'Usuarios','../Usuarios/ListadoUsuario.php','','\0'),(3,2,'Crear Usuario','../formulario_busqueda.php','','\0'),(4,1,'Perfiles','../Perfiles/ListadoPerfil.php','','\0'),(5,NULL,'Diplomado','#','','\0'),(6,1,'Menu','../Paginas/ListadoPaginas.php','','\0'),(7,NULL,'Academica','#','','\0'),(8,NULL,'Contabilidad','#','','\0'),(9,NULL,'Finanza','#','','\0'),(10,9,'Diplomados-Formaciones','../Finanzas/Diplomados-Formaciones.php','','\0'),(11,9,'Pagos Formaciones','../Finanzas/ListadoFormacionesAlumnos.php','','\0'),(12,7,'Diplomados Activos','../Academica/Diplomados.php','','\0'),(13,7,'Formaciones Activas','../Academica/Formaciones.php','','\0'),(14,9,'Solicitudes Alumnos de Baja','../Finanzas/SolicitudesAlumnosDeBaja.php','','\0'),(15,9,'Solicitudes de Traslados','../Finanzas/SolicitudesAlumnosTraslado.php','','\0'),(16,9,'Solicitudes de Academica','../Finanzas/SolicitudesAcademica.php','','\0'),(17,9,'Reporte De Pagos','../Finanzas/FiltrosReportePagos.php','','\0'),(18,5,'Lista De Diplomados','../Marketing/ConfiguracionDiplomados.php?EnCurso=0&Activo=1','','\0'),(19,5,'Administrar Diplomados','../Marketing/Diplomado/ListadoDiplomados.php','','\0'),(20,NULL,'Formacion','#','','\0'),(21,20,'Lista De Formaciones','../Marketing/ConfiguracionFormacion.php?EnCurso=0&Activo=1','','\0'),(22,20,'Administrar Formacion','../Marketing/Principal.php','','\0'),(23,NULL,'Registro','#','','\0'),(24,23,'Registro Interesados','../Marketing/RegistroInteresados.php','','\0'),(25,23,'Inscripcion Diplomado','../Marketing/InscripcionDiplomado.php','','\0'),(26,23,'Inscripcion Formacion','../Marketing/InscripcionFormacion.php','','\0'),(27,7,'Listado Alumnos','../Academica/ListadoAlumnos.php','','\0'),(28,7,'Retirar Alumnos','../Academica/RetirarAlumnos.php','','\0');
/*!40000 ALTER TABLE `pagina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagos` (
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
  KEY `ID_Frecuencia_pagos_FK_idx` (`ID_Frecuencia`),
  CONSTRAINT `ID_Alumno_pagos_FK` FOREIGN KEY (`ID_Alumno`) REFERENCES `alumnos` (`idalumnos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ID_Configuracion_pagos_FK` FOREIGN KEY (`ID_Configuracion`) REFERENCES `configuraciones` (`IDConfiguracion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ID_Frecuencia_pagos_FK` FOREIGN KEY (`ID_Frecuencia`) REFERENCES `frecuencia` (`idFrecuencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ID_MetodosdePago` FOREIGN KEY (`ID_MetododePagos`) REFERENCES `metodosdepago` (`idMetodosDePago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ID_TipoPago` FOREIGN KEY (`ID_TipoPago`) REFERENCES `tipopagos` (`idTipoPagos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (2,1,1,1,1,1),(9,2,3,1,1,2),(10,2,1,2,1,3),(11,1,3,2,1,4);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagoscuotas`
--

DROP TABLE IF EXISTS `pagoscuotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagoscuotas` (
  `idPagosCuotas` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Pagos` int(11) NOT NULL,
  `CantidadCuotas` int(11) DEFAULT NULL,
  `FechaVencimiento` datetime DEFAULT NULL,
  `FechaInicio` datetime DEFAULT NULL,
  `Pago` bit(1) DEFAULT NULL,
  `Traslado` bit(1) DEFAULT NULL,
  `Decripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPagosCuotas`),
  KEY `ID_Pagos_idx` (`ID_Pagos`),
  CONSTRAINT `ID_Pagos` FOREIGN KEY (`ID_Pagos`) REFERENCES `pagos` (`idPagos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagoscuotas`
--

LOCK TABLES `pagoscuotas` WRITE;
/*!40000 ALTER TABLE `pagoscuotas` DISABLE KEYS */;
INSERT INTO `pagoscuotas` VALUES (3,9,4,'2016-08-17 00:00:00','2016-08-17 00:00:00','\0','\0','Cuota 1'),(4,9,4,'2016-08-17 00:00:00','2016-08-17 00:00:00','\0','\0','Cuota 2'),(5,9,4,'2016-08-17 00:00:00','2016-08-17 00:00:00','\0','\0','Cuota 3'),(6,9,4,'2016-08-17 00:00:00','2016-08-17 00:00:00','\0','\0','Cuota 4'),(7,9,4,'2016-08-17 00:00:00','2016-08-17 00:00:00','\0','','Traslado');
/*!40000 ALTER TABLE `pagoscuotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participacion`
--

DROP TABLE IF EXISTS `participacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participacion` (
  `idParticipacion` int(11) NOT NULL AUTO_INCREMENT,
  `ID_DiasSemana` int(11) NOT NULL,
  `ID_Configuracion` int(11) NOT NULL,
  PRIMARY KEY (`idParticipacion`),
  KEY `ID_DiasSemana_idx` (`ID_DiasSemana`),
  KEY `ID_Configuracion_idx` (`ID_Configuracion`),
  CONSTRAINT `ID_Configuracion` FOREIGN KEY (`ID_Configuracion`) REFERENCES `configuraciones` (`IDConfiguracion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ID_DiasSemana` FOREIGN KEY (`ID_DiasSemana`) REFERENCES `diassemana` (`idDiasSemana`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participacion`
--

LOCK TABLES `participacion` WRITE;
/*!40000 ALTER TABLE `participacion` DISABLE KEYS */;
INSERT INTO `participacion` VALUES (1,1,1),(2,3,1),(3,5,1),(4,1,3),(5,7,3);
/*!40000 ALTER TABLE `participacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfiles`
--

DROP TABLE IF EXISTS `perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfiles` (
  `idperfiles` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `fechamodificacion` datetime DEFAULT NULL,
  `idusuariomodificacion` int(11) DEFAULT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `eliminado` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`idperfiles`),
  KEY `id_usuarios_idx` (`idusuariomodificacion`),
  CONSTRAINT `id_usuarios` FOREIGN KEY (`idusuariomodificacion`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfiles`
--

LOCK TABLES `perfiles` WRITE;
/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
INSERT INTO `perfiles` VALUES (12,'Marketing',NULL,NULL,'','\0'),(13,'Finanza',NULL,NULL,'','\0'),(14,'Administrador',NULL,NULL,'','\0'),(15,'Alumno',NULL,NULL,'','\0'),(16,'Academica',NULL,NULL,'','\0');
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permisos` (
  `idpermisos` int(11) NOT NULL AUTO_INCREMENT,
  `IDperfil` int(11) NOT NULL,
  `IDPagina` int(11) NOT NULL,
  `Acceso` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`idpermisos`),
  KEY `id_perfil_idx` (`IDperfil`),
  KEY `id_pagina_idx` (`IDPagina`),
  CONSTRAINT `idpagina` FOREIGN KEY (`IDPagina`) REFERENCES `pagina` (`idpagina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idperfiles` FOREIGN KEY (`IDperfil`) REFERENCES `perfiles` (`idperfiles`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES (16,13,9,''),(17,13,10,''),(18,13,11,''),(19,13,14,''),(20,13,15,''),(21,13,16,''),(22,16,9,''),(23,16,16,''),(25,14,1,''),(26,14,2,''),(27,14,4,''),(28,14,6,''),(29,14,5,''),(30,14,18,''),(31,14,19,''),(32,14,7,''),(33,14,12,''),(34,14,13,''),(35,14,8,''),(36,14,9,''),(37,14,10,''),(38,14,11,''),(39,14,14,''),(40,14,15,''),(41,14,16,''),(42,14,17,''),(43,14,20,''),(44,14,21,''),(45,14,22,''),(46,14,23,''),(47,14,24,''),(48,14,25,''),(49,14,26,'');
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntarespuesta`
--

DROP TABLE IF EXISTS `preguntarespuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preguntarespuesta` (
  `idpreguntarespuesta` int(11) NOT NULL AUTO_INCREMENT,
  `idpregunta` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `respuesta` varchar(500) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`idpreguntarespuesta`),
  KEY `idpregunta_idx` (`idpregunta`),
  KEY `idusuario_idx` (`idusuario`),
  CONSTRAINT `idpregunta` FOREIGN KEY (`idpregunta`) REFERENCES `preguntas` (`idPreguntas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idusuario` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntarespuesta`
--

LOCK TABLES `preguntarespuesta` WRITE;
/*!40000 ALTER TABLE `preguntarespuesta` DISABLE KEYS */;
INSERT INTO `preguntarespuesta` VALUES (1,1,4,'prueba'),(2,1,5,'prueba');
/*!40000 ALTER TABLE `preguntarespuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preguntas` (
  `idPreguntas` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Fecha` datetime NOT NULL,
  `Activo` bit(1) NOT NULL,
  `Eliminado` bit(1) NOT NULL,
  PRIMARY KEY (`idPreguntas`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
INSERT INTO `preguntas` VALUES (1,'prueba','2016-08-06 00:00:00','','\0');
/*!40000 ALTER TABLE `preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesores` (
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
  KEY `id_usuarios_idx` (`IDUsuarioModificacion`),
  CONSTRAINT `ID_UsuarioModificacion_profesores_FK` FOREIGN KEY (`IDUsuarioModificacion`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` VALUES (1,'profesor1','prueba','123456789','1992-03-08 00:00:00','prueba@prueba.com','04241694460',NULL,'gtorres','2016-07-22 00:00:00',1,'','\0');
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_evidencias`
--

DROP TABLE IF EXISTS `registro_evidencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_evidencias` (
  `idRegistro_Evidencias` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) DEFAULT NULL,
  `id_Solicitud` int(11) DEFAULT NULL,
  `Archivo` longblob,
  PRIMARY KEY (`idRegistro_Evidencias`),
  KEY `id_solicitud_registro_evidencias_FK_idx` (`id_Solicitud`),
  CONSTRAINT `id_solicitud_registro_evidencias_FK` FOREIGN KEY (`id_Solicitud`) REFERENCES `solicitudes` (`idSolicitudes`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_evidencias`
--

LOCK TABLES `registro_evidencias` WRITE;
/*!40000 ALTER TABLE `registro_evidencias` DISABLE KEYS */;
INSERT INTO `registro_evidencias` VALUES (7,'recibo Factura Impresiones',1,'%PDF-1.7\n%\‚\„\œ\”\n7 0 obj\n<< /Type /Page /Parent 1 0 R /LastModified (D:20160602200051-04\'30\') /Resources 2 0 R /MediaBox [0.000000 0.000000 595.276000 841.890000] /CropBox [0.000000 0.000000 595.276000 841.890000] /BleedBox [0.000000 0.000000 595.276000 841.890000] /TrimBox [0.000000 0.000000 595.276000 841.890000] /ArtBox [0.000000 0.000000 595.276000 841.890000] /Contents 8 0 R /Rotate 0 /Group << /Type /Group /S /Transparency /CS /DeviceRGB >> /PZ 1 >>\nendobj\n8 0 obj\n<</Filter /FlateDecode /Length 2009>> stream\nxú\Ì\\\Àr\€\∆\›\Î+ziW)0\ﬁ{ESP.])ìî\Î\ﬁe1FÃ®@ÄJ9w?\‡ÆÚYf\·E ª¨\“3AÄeí≤,@Ç$ä\ƒc\0L\„Ù\È\”=C®ä\Â®¯øÇ\n\Ôu?˝åo!æ~\ƒ\◊d\Ô\Ì^j†©ä*`|˛xO›∏°^mxπn\√=é®-V®7>\‹\‹\‰\Íé\‚h∂\„\ËL˜^˝{l\¬\ﬂ{èøõ_¡\rc∏\ÍuCΩ\‘p±Sx\ÀuÜ˘ë\Ôyà=\ÕT4\«\–u∑\‹?À∂O˜,”Ä\ÀV\\Kµ\r\n#∏\Á˜ûkß\Ô\⁄|˜÷µ\‡˘\Êç⁄´lb£çπ\Àe‘¥øó\‡.\◊\„Øe*™g\ÈÜöß∏¶Ùk\«\÷M\◊,\√D≤ÜW=\rπ\Z\ﬁ◊•\€\Õ‹∫6\»}ïØw2íà\œÚ˛äÜûböÆ\Ì\À=0ﬂß;∂ø~Ç5◊Ωy[4{k4\›lT=°Æ*∂cÆΩ\Ÿ˘vømów\ÌìL\0OâßIñ\Î~\≈3äµö\Â*é©⁄ö	éc¢Oö\"¿éC¯\ÈEw\–ç;˝nØ>˝Q\Ô¿K/ÜÒ;\—¸˝éhπSÜ=8B=G±,\Ÿ\·\Õ∫∏c\€ˆ≥tZ\”S<\√YÖ~(òÜ≠XÜ%.\—U-E˜\Ï\n∫™Ÿ™≠\‚õc\ÍÆjó ∞ç\rê˛_\r±Å\„\ÈäS≤¡!O¶Ûà$å√†?\Ï6\—Ω\—ˆô\Ê2\ﬂRÅ\‡M7L©@\‰ù\ÿ\ﬂ\ﬂ]q\Ï\ƒDuÚ0\√PL57ª\Ó*\»(ÖŸá˛˚\”ﬁ®7å^\ﬂ◊πû∞g=\0\Î\‰ï%x®:\Ë\'$!Hy\ƒñ\ÕC©X\ÓÚ8\ÕH0\"Vi\ B*óh\n¸c\ƒ&$„Ç¥g	MiúëHú…ñ˚¸\"•ãv¢Q\∆B\¬\Ÿ\‹}\¬b¡ßMp¯®F≤=´B]\Á<\„ü1rˆ{-å%zºZ\0ªg\‡6zAß3f∏\"∑b≈™\ÎM:e\¬H)\Ãx\‚,\ÕËîºiÇ•\\Ω\'\Èå¸EíàH¨v`[é}ú¶aß‹¢NâMO˚!€è#8tOè˝>\ÎcÚ\ÍŒù\‘-U—¥[o\"\\\Œ)§\‚\Ô/ë\›8ûìÄ}â_o∆üiº®©Ø\⁄zÖ\’~ÄAA\…PPú$∏!ù %\\∏p/>Gç.o=≤4¿\›\œ^{ág/ë\È\Á$π‡¨êOë\È\"å\Á˘>gHn°ƒé†¬§\‡ª˙ìö\ÈU¸!§í:	âRÅ~\Ó:\›3\›[wó$\Ÿj§M\Áiê`\‡ñëA˘n\Á˚`léﬂóqö^p|üŒÖsÑÙ#\‚xJÖæIr\« zùî\„A•cÑ¥˛®\÷\Ï\n™?–Ä\≈<m1][L[ûΩa#,ˆQ≤ıåL8RnÇt;CL3âZÛ£yrÖç\0\œı&\«\’1ü~LË™¶E~\œHÑ\"\≈Ø=Æ-◊®\‡öF4\»&bO∏$•\ÿc2ôì}òê\Â:n?\ÁÒg\”/W,∞.Hæ˛ä•¬ô9\‰L1Œç\¬^\ƒ0©Ûßò\ÌHa{\≈&9•\»\Ï\Èúøê&êÄ\ÂhHïsî7\ƒc\ÏZ ÚZç\Ÿ\–\∆¿Jz∑\Z\Á$∫ú3ö\0ójés\«0mˇs¯@x\∆<˚µ} \‚\Ÿ,aW\"≤	˘OÇÑÜ,áA»ê_Æ\√‹≠ò∏N\\\Îè~√≠†ø\ƒy\œ\÷\r®U-+»ñjµ\‰\Ô\Ô%¶\ÁT*\»\'\√A\◊?\Ë˜D±£-\"\ﬂ’µ›∑6¿1Kq™©\ƒK>_†\“\ \≈–™˙¸$õ\ƒ\"ò§\Âz\È,\"1ãÚR\·2\«:g\…É\njµE51î{†VkN	Ÿ¥\Õ\€K\»◊ï\·\€j\‰ã\Ó	\’˙Yä\Ô∆ñPu\◊RLØ∞DôN\Ê±\ÏV\ƒS\‘(NRñq!¨QR\ÂG*G\∆	\Â˛ÑÛP\÷i\È®&æfV3¿”ò¿˝\rÆH$¸Jí+U1?!0\’[H]$ñà™\€RZ¢≤¢éπF◊üêåj\ÊWà˜}aÄÛy\Ó~bHèóñÚrpD\·í¸\Ëè	ùH\÷~zˆBøm\–k\›8\◊~˝m§π+Ö\ﬂeT*Jáü≥ä¨gQ,G\»`öU^BS∞+)\ÌÄ\…3\"#√´\Êò}ûë\◊\‡£G‰Öï\‹12\Zá\ËP≥à\nÆ<Ö|5cÒ◊â7In`™5:˘/(Ú˚/…Ñ\ƒE^ı/\€® æV)>†¸âx\Œ\ 4!≠5\›U†Qy>0∂¥l9≈∂\ÿc\„\…Àñ£X™wk\€&ßÛ∫U8ö¯ÜOIØN@\Ó˙\'\›\ﬁ\Ô}9≠°£¡QØ\€ü<¨\Ï~\⁄Û4\ÔeôÕ∞˘5\\Î™©h\Ê¶m¢Zµ\–7\‚\»˛2\Z¶\⁄D ¢ô˘∞\Ì6Û§[î51=\0LkpÒıhÙ\›-ˇ\rB∑Vf®\’x$†Eˆ\÷ˆh≤\–2T≈≥sêöj•\–yx=)\0Ü4†≥’©ì\Ì\‡I\ÎT≠S}›©P\ZVæ\Œ\"f:±\\\n∂\ÓtW\◊v\ﬂ⁄∫”ìu\'Õ´∆®]ıey?ü\»ˆ\‹˝™\—ˇÙ\Z\’)%YNN\“tÁâ§$Â™ëm(™∂[%U\◊œªΩi£π≥±\–\Êó©GX˜0˘∏\‚≠~<Ù\ÏÒúˆ\·®s2\Z@\0«ùˇÜ\–˛\ﬂ¡ø˛˜∂w\‰É/í\›yü\€j\ÿ†*∂∫\„PÇ.ûØˆÙÜñ\‡yÒ\–;>˛cˇ5\‡\Áa\Ô∏˛h\Ï/ø\ZâòóC\n¯\‡ˇ∑E˜ñOÛ\‚\Ô~z\·:V\ÿ\€\‚ê\ÎÚ\ËV\◊\ﬂ\„ãˇ\0Äµîk\nendstream\nendobj\n9 0 obj\n<< /Type /Page /Parent 1 0 R /LastModified (D:20160602200051-04\'30\') /Resources 2 0 R /MediaBox [0.000000 0.000000 595.276000 841.890000] /CropBox [0.000000 0.000000 595.276000 841.890000] /BleedBox [0.000000 0.000000 595.276000 841.890000] /TrimBox [0.000000 0.000000 595.276000 841.890000] /ArtBox [0.000000 0.000000 595.276000 841.890000] /Contents 10 0 R /Rotate 0 /Group << /Type /Group /S /Transparency /CS /DeviceRGB >> /PZ 1 >>\nendobj\n10 0 obj\n<</Filter /FlateDecode /Length 2878>> stream\nxú\Ì]\Àr\⁄J\Z\ﬁ˚)zyRÖ;\ÍV_$ØF\ŸQäã-cWíìSß°8ö\…ê\‘…£\Õk\Ãnv≥<ãYeó\’t-äë/HÄ]N\0©ëæˇˇ˙øıE\Z§\\?\‡\–¿[Ò˜O˚‚øû¯;\◊\«]˙§A-˝\›\œ¿\Óhnà≥\roW@\”¥Öãá\Ã!Gås¸¡¡\Îw]\ZÒ¡π¯}¯≠-`2¥ªÜXi8=©∑\‰æf/\‹\…7?Ú+Åà\Î*>\ 4±Iâ\rD!3)\÷\rê\‡<Úä{\–≠õ\nD5&¢+`Du%êêÙ§Ccv˛÷Ä&\\áú\‹\Õ9\ƒxk1/WÙvc\∆-ÖLt\Ÿ2\≈dzŒ°aB∂eòâ9≈¨3—â\Ô0k≥s1Üd\À0\œı¨`V‘ºÖê5\Zª¶\Ê9\Ê]Q3\—La™wK\Õ\n\ÊùQ≥\‚®vF\Õs\Ã€≠f≤à∂\–b<Ç∑/S®≠`V©Ω}òó\Í˘Y’úw8ˇ\Ë\ \"ƒì7\⁄\ﬂe=\Ë+ã\‹FIÒﬁÇy\",©Ë∂ìö2°1)\ZpÜ¶Ω\⁄Ä\◊çúóv5èÆ,ñ˛\“Zí¨Û¶˙ï\rÖã\"3ı˘˛\‡Qp\ŒpÅ˜˝∂ ∂6õe/(|\„∫H∞vΩ\‚jª\Õ;\'π\‚í\‚2\…¸≥o\‚äÚSD\r»â∆ê,_\—\'â,\‘v{\‡˜\ﬂ\ÍùˆE\◊j\◊4l\‡\⁄N√ñ\Ô^˝∫oeÛÛÇl\…-\Á?;CM)M?ú†Sç≠ãSπ¨\›LùØ¢\¬\¬oÄ\nDgê\ÍTﬁ¢°QàM6£\÷”ò&˛\„\ZS(∞é\“BxUd¿Mπ\"Éì8å˚^∆†\”v\ÎU\Ïo¥˛¿\„3Zæy\"îÆì4I5\r¿É˘]≤à£Të\Ï∫ˆ≤Lv`ûtJrª7#ákü˝\Á∏\È\‘-p\‹i:Wñ\ÎX\Ì\‘A^\Ÿm˚√•\›|¥\‹b≥∞;¨¡:\‰\nkÍùñs\·¸ª=â§NùãÆ\€u\Á\ iÇ˜¿n\⁄ın«µö{\Ê\‰@+DÇBç6\ÀÑ2ˆ\∆1x£s\Zí3NW∞\∆:s∫{Æ\‰B+§ˆBç6\ f\Z+”∫l;u\Á\Ãti:«∂+ô\„Óâí≠ê\Œ5\⁄,Qål#x“∞\ZKú—ôÂ∫ùÛKgo_r°b@°Fõ•\r\œF13v	/\‰:ıK´≥\„4©ÙÕøT£rf˝l€≥˛R\…]1*πkPgH\◊t\–˝&t>Æ	ßÙ˛\¬ıé\€iuD∏\€\Í¥/¨\Êï]û?\Z{Q/A!Ω\‰ø˛(H@/\0npGâ◊ãPøÜ}˘a\ﬂ7^íƒ∑\„–õŸ´\Zå£\–o\¬XQ˜¡‰æøïYl\"£4fbCqçx\"∂y∞W¡p$ƒ∞ê.\‘¿0∏˛	I\r\„˛\ÿD†˝/ÅQÁµõÒß~\Ë{=O\nˆ\‘ÛÉë\'è\ÈÑ\·C£v\'I7∏˘ôûV1©âlJW§∆®>#\€q\‹øzI\ËEûyD¡˜q ∞~ÒÆc\‡«ëêdn\«¯ˇ%\ƒní`D£¿ãFA*hÙÅé{BxQ\Ó˚\¬uÉÄ\ÕTº±	aà±TXÛ(1+¨∑÷ïcª¿j\⁄Ô¨Üxq\⁄io>\‰“°t\r\Õ$LXº6g[V˝ç\ËBõh\n#\‰\n+:E87YÑi_é<?å#Ø\n\“Vì±à9a\0\È<Wüi=∂”¥\⁄-\»\'≠ÆC\r\ÕPÆ\÷\È(\…a©;;\Ìˇ\›\Ô‰õ∞\'lU™ea\Ã+©hj•L\ÀWÙ!2∏f0S´§¢	3!e3î´\r¡˘8∫íö§\È=\ÈdÚ4ylΩ\ÌÄ[ÑÄs+ôÚäp¢ù;\ŒK\◊j\Ÿmâ5\Ïz\”r´iç\·\0∞P\nV\r©T∞i¥\‘Ü\¬¸Tíß\»‰êõÑ-Wß\'ˆ±kªie\ÂzØJj¢b™öØ\—/ﬁßpî:î\œq2)U ˛çÇ4é§\«Ü\◊\“0â˜Ω0	|ôZ;\ÕB6…ÅJÿçL}\rAS\ƒp∆ù\‡\À4\ﬁSº?\…\…\Ÿ&£•X\’¸U\≈Z≠iR^Qª¡	$¬èqñ´\”r\ \'.ë\ \’\⁄<õï]*©MlRH©\…\ \’fJ\‡Ö1\Ír)â>√∏Zóó\…\'/\nø{i…®í\Í$»Ñ&eX\ÀÔúÆub\ŸMpjπr∆´PÆul5õ\’\‘.\Â2ä9ˇÖv´UÃ£,S\Ã\„Qπô\ƒ]$AØ¢ásqUÜúBT¢\Œ,DZI.\Z:D˙\‹J˝\’@\›VTHSÑ±f¢|∂/[2m¿ï\‘#fT£ìÑ!_ëÌüÉ âe\ \–\r˙é£¯®öz\’\r9iüL\œ◊´FfH0\0õïT-°HÜ\ÈSúy}4Ní A?G\…≥\«G•IÚJö\„ë\Ï≠˜ékw\ﬂ¸iµÆÌ¥≠º\Èt[ñ”ÑıN´í\‹ù\Zh\’PF\‘\·\Z\Í˚âhT¶∞l>ëÇf\∆X\À=ë¢LTl\ƒ=	⁄ë]¿ b9\Ô!ü\«¬•F\È®txyΩx˙\‚Ø˚\„Aç\ƒ\ÀYnxîëˇÆı¨2©x\ﬁIàQù\ŸFÖ\‹x9Ω/π7ÒµÛ©^{£8	ä”•üπ®.§\‘ô≤\'¸r\rkv)¶©Cl§k}\’o(S\ﬂ\—5\r$˜ÚX\Ë<\∆˝X\Œ\ÓÚ¿0H@øHìn\‚D\Œ\»QfÉ}|•ñ8v\—æ∏ıxqW\«\„+\€˜p-\ÎN\‚Q\Ï\«7°∑z\«ﬁ´?\ÀˆæO\·\‹uûI|v«πoN˙\Íég<ìa+>å£¥\’_î£q?6@A~\Ôå\Á\r6ßj5∏\◊\”	lFá\€ÿ®úΩ• \–\ÕÒ\\	0\ :5<ò\—:5mNî\Œ\ÀIágO¬°\Ôı¡\«\ﬂ\\\Á\‰\„+5ºñˆ.„ã∂ùÙ{*™7˚T\‘MπgñB≈∫óLÊÉπ¡P∆¶æ e0eà*\Õ\Ó—ûn\ \—=\›÷•\ÁP[ô%Å~J\Õﬁç\\£\”ˆlSè\ÓŸ∂.\€(ÅLe[Gz\’∆¥®æ[\Ï⁄ôt]\◊8\ƒI\◊]∞å\‚Wû7ê?Ç»§òÒª≤\ﬁtïe\0\Í\È\n\Ã4æâ\ƒ=\0_Â™µ\‡˚$\€Û¸$\ËÖrÖ¶à˚\„\Î\…\n®dìÙ2k3\'U¥\œrùk\\K\”\√t\Á(æI[1Æ‘Ç\ƒ&Å\\\·Òè\‰Z@\÷@Z\Â\0¥`8\Z\À\‚˝\›:_y\‡&	ø\nπ\◊°\ﬂvÛ∑\«_¸huºÄ\“{òô\È=v˛\Ã˝©/-$ﬁΩΩˇâæ$≠\Ã .o*-\“Ùıæ´=O£rli`W&\“(° ï\ŒZ!Añº\√løyQáI\Ë\Ïô|≥3^b∑oùCf,\\∂Ñ\√h∫Mñv1$¢I¶£\Â;\√\ÃœìÏÖΩC¨\\Œég\'%’°a\–˚ó-7)\rëB\ U\€–Ä\'⁄Ωe◊ò∏ú\Îê\naö+L]π¢	ÖU˜Bˇ•;àl\r\ X.¡äC∂î∏\Îpüê°Öo(#ıç’ëÙ:\œÚx^cd,û∞µ\n1g∆®\ƒ\n—óä≥¥T\Ì\‹≈®¥7¯e¡ê´(•\√H\Ô\Ó=óIÉî,äKk2Õöå7\„†ﬂó\≈H\œÖ}/	Ü˚8¶ú^™Q	˘;Øä\"î∑\⁄ÛvÉ\‡\ÍÉ9Ö\ZZò|¸Äã>ÆÇ®Ñ˘ÚI\œÂ™Å\ÃkﬂÜπØÀΩTµx);ûüïr\ﬂO≥Z¨ëóZò[±k˚ûÅk2p9ûùÅXˆX´Yvºb\·\0{\Ó≠Èìós`-\Z˘Ñ\◊*¨)R6_\»\ÊR\"ïä¡óüÉ ≥\ÈNêaw2êmI@~RØ∏•{u\”\’\›v´ñä¢¨\ÀhZ¿~wf7ú˙›£9\≈gÆ}a∑ª6Pn_àw≠≥¶\›M∑Ú∂¡©ku/ù\Ó\ÏÂù´\‹m±9ï^¨æù7roqï\—8X\„+q∂\Ì\ÌÙÄë˝<w3É¸ª¸?~x9\nendstream\nendobj\n11 0 obj\n<< /Type /Page /Parent 1 0 R /LastModified (D:20160602200051-04\'30\') /Resources 2 0 R /MediaBox [0.000000 0.000000 595.276000 841.890000] /CropBox [0.000000 0.000000 595.276000 841.890000] /BleedBox [0.000000 0.000000 595.276000 841.890000] /TrimBox [0.000000 0.000000 595.276000 841.890000] /ArtBox [0.000000 0.000000 595.276000 841.890000] /Contents 12 0 R /Rotate 0 /Group << /Type /Group /S /Transparency /CS /DeviceRGB >> /PZ 1 >>\nendobj\n12 0 obj\n<</Filter /FlateDecode /Length 2878>> stream\nxú\Ì]\Àr\⁄J\Z\ﬁ˚)zyRÖ;\ÍV_$ØF\ŸQäã-cWíìSß°8ö\…ê\‘…£\Õk\Ãnv≥<ãYeó\’t-äë/HÄ]N\0©ëæˇˇ˙øıE\Z§\\?\‡\–¿[Ò˜O˚‚øû¯;\◊\«]˙§A-˝\›\œ¿\Óhnà≥\roW@\”¥Öãá\Ã!Gås¸¡¡\Îw]\ZÒ¡π¯}¯≠-`2¥ªÜXi8=©∑\‰æf/\‹\…7?Ú+Åà\Î*>\ 4±Iâ\rD!3)\÷\rê\‡<Úä{\–≠õ\nD5&¢+`Du%êêÙ§Ccv˛÷Ä&\\áú\‹\Õ9\ƒxk1/WÙvc\∆-ÖLt\Ÿ2\≈dzŒ°aB∂eòâ9≈¨3—â\Ô0k≥s1Üd\À0\œı¨`V‘ºÖê5\Zª¶\Ê9\Ê]Q3\—La™wK\Õ\n\ÊùQ≥\‚®vF\Õs\Ã€≠f≤à∂\–b<Ç∑/S®≠`V©Ω}òó\Í˘Y’úw8ˇ\Ë\ \"ƒì7\⁄\ﬂe=\Ë+ã\‹FIÒﬁÇy\",©Ë∂ìö2°1)\ZpÜ¶Ω\⁄Ä\◊çúóv5èÆ,ñ˛\“Zí¨Û¶˙ï\rÖã\"3ı˘˛\‡Qp\ŒpÅ˜˝∂ ∂6õe/(|\„∫H∞vΩ\‚jª\Õ;\'π\‚í\‚2\…¸≥o\‚äÚSD\r»â∆ê,_\—\'â,\‘v{\‡˜\ﬂ\ÍùˆE\◊j\◊4l\‡\⁄N√ñ\Ô^˝∫oeÛÛÇl\…-\Á?;CM)M?ú†Sç≠ãSπ¨\›LùØ¢\¬\¬oÄ\nDgê\ÍTﬁ¢°QàM6£\÷”ò&˛\„\ZS(∞é\“BxUd¿Mπ\"Éì8å˚^∆†\”v\ÎU\Ïo¥˛¿\„3Zæy\"îÆì4I5\r¿É˘]≤à£Të\Ï∫ˆ≤Lv`ûtJrª7#ákü˝\Á∏\È\‘-p\‹i:Wñ\ÎX\Ì\‘A^\Ÿm˚√•\›|¥\‹b≥∞;¨¡:\‰\nkÍùñs\·¸ª=â§NùãÆ\€u\Á\ iÇ˜¿n\⁄ın«µö{\Ê\‰@+DÇBç6\ÀÑ2ˆ\∆1x£s\Zí3NW∞\∆:s∫{Æ\‰B+§ˆBç6\ f\Z+”∫l;u\Á\Ãti:«∂+ô\„Óâí≠ê\Œ5\⁄,Qål#x“∞\ZKú—ôÂ∫ùÛKgo_r°b@°Fõ•\r\œF13v	/\‰:ıK´≥\„4©ÙÕøT£rf˝l€≥˛R\…]1*πkPgH\◊t\–˝&t>Æ	ßÙ˛\¬ıé\€iuD∏\€\Í¥/¨\Êï]û?\Z{Q/A!Ω\‰ø˛(H@/\0npGâ◊ãPøÜ}˘a\ﬂ7^íƒ∑\„–õŸ´\Zå£\–o\¬XQ˜¡‰æøïYl\"£4fbCqçx\"∂y∞W¡p$ƒ∞ê.\‘¿0∏˛	I\r\„˛\ÿD†˝/ÅQÁµõÒß~\Ë{=O\nˆ\‘ÛÉë\'è\ÈÑ\·C£v\'I7∏˘ôûV1©âlJW§∆®>#\€q\‹øzI\ËEûyD¡˜q ∞~ÒÆc\‡«ëêdn\«¯ˇ%\ƒní`D£¿ãFA*hÙÅé{BxQ\Ó˚\¬uÉÄ\ÕTº±	aà±TXÛ(1+¨∑÷ïcª¿j\⁄Ô¨Üxq\⁄io>\‰“°t\r\Õ$LXº6g[V˝ç\ËBõh\n#\‰\n+:E87YÑi_é<?å#Ø\n\“Vì±à9a\0\È<Wüi=∂”¥\⁄-\»\'≠ÆC\r\ÕPÆ\÷\È(\…a©;;\Ìˇ\›\Ô‰õ∞\'lU™ea\Ã+©hj•L\ÀWÙ!2∏f0S´§¢	3!e3î´\r¡˘8∫íö§\È=\ÈdÚ4ylΩ\ÌÄ[ÑÄs+ôÚäp¢ù;\ŒK\◊j\Ÿmâ5\Ïz\”r´iç\·\0∞P\nV\r©T∞i¥\‘Ü\¬¸Tíß\»‰êõÑ-Wß\'ˆ±kªie\ÂzØJj¢b™öØ\—/ﬁßpî:î\œq2)U ˛çÇ4é§\«Ü\◊\“0â˜Ω0	|ôZ;\ÕB6…ÅJÿçL}\rAS\ƒp∆ù\‡\À4\ﬁSº?\…\…\Ÿ&£•X\’¸U\≈Z≠iR^Qª¡	$¬èqñ´\”r\ \'.ë\ \’\⁄<õï]*©MlRH©\…\ \’fJ\‡Ö1\Ír)â>√∏Zóó\…\'/\nø{i…®í\Í$»Ñ&eX\ÀÔúÆub\ŸMpjπr∆´PÆul5õ\’\‘.\Â2ä9ˇÖv´UÃ£,S\Ã\„Qπô\ƒ]$AØ¢ásqUÜúBT¢\Œ,DZI.\Z:D˙\‹J˝\’@\›VTHSÑ±f¢|∂/[2m¿ï\‘#fT£ìÑ!_ëÌüÉ âe\ \–\r˙é£¯®öz\’\r9iüL\œ◊´FfH0\0õïT-°HÜ\ÈSúy}4Ní A?G\…≥\«G•IÚJö\„ë\Ï≠˜ékw\ﬂ¸iµÆÌ¥≠º\Èt[ñ”ÑıN´í\‹ù\Zh\’PF\‘\·\Z\Í˚âhT¶∞l>ëÇf\∆X\À=ë¢LTl\ƒ=	⁄ë]¿ b9\Ô!ü\«¬•F\È®txyΩx˙\‚Ø˚\„Aç\ƒ\ÀYnxîëˇÆı¨2©x\ﬁIàQù\ŸFÖ\‹x9Ω/π7ÒµÛ©^{£8	ä”•üπ®.§\‘ô≤\'¸r\rkv)¶©Cl§k}\’o(S\ﬂ\—5\r$˜ÚX\Ë<\∆˝X\Œ\ÓÚ¿0H@øHìn\‚D\Œ\»QfÉ}|•ñ8v\—æ∏ıxqW\«\„+\€˜p-\ÎN\‚Q\Ï\«7°∑z\«ﬁ´?\ÀˆæO\·\‹uûI|v«πoN˙\Íég<ìa+>å£¥\’_î£q?6@A~\Ôå\Á\r6ßj5∏\◊\”	lFá\€ÿ®úΩ• \–\ÕÒ\\	0\ :5<ò\—:5mNî\Œ\ÀIágO¬°\Ôı¡\«\ﬂ\\\Á\‰\„+5ºñˆ.„ã∂ùÙ{*™7˚T\‘MπgñB≈∫óLÊÉπ¡P∆¶æ e0eà*\Õ\Ó—ûn\ \—=\›÷•\ÁP[ô%Å~J\Õﬁç\\£\”ˆlSè\ÓŸ∂.\€(ÅLe[Gz\’∆¥®æ[\Ï⁄ôt]\◊8\ƒI\◊]∞å\‚Wû7ê?Ç»§òÒª≤\ﬁtïe\0\Í\È\n\Ã4æâ\ƒ=\0_Â™µ\‡˚$\€Û¸$\ËÖrÖ¶à˚\„\Î\…\n®dìÙ2k3\'U¥\œrùk\\K\”\√t\Á(æI[1Æ‘Ç\ƒ&Å\\\·Òè\‰Z@\÷@Z\Â\0¥`8\Z\À\‚˝\›:_y\‡&	ø\nπ\◊°\ﬂvÛ∑\«_¸huºÄ\“{òô\È=v˛\Ã˝©/-$ﬁΩΩˇâæ$≠\Ã .o*-\“Ùıæ´=O£rli`W&\“(° ï\ŒZ!Añº\√løyQáI\Ë\Ïô|≥3^b∑oùCf,\\∂Ñ\√h∫Mñv1$¢I¶£\Â;\√\ÃœìÏÖΩC¨\\Œég\'%’°a\–˚ó-7)\rëB\ U\€–Ä\'⁄Ωe◊ò∏ú\Îê\naö+L]π¢	ÖU˜Bˇ•;àl\r\ X.¡äC∂î∏\Îpüê°Öo(#ıç’ëÙ:\œÚx^cd,û∞µ\n1g∆®\ƒ\n—óä≥¥T\Ì\‹≈®¥7¯e¡ê´(•\√H\Ô\Ó=óIÉî,äKk2Õöå7\„†ﬂó\≈H\œÖ}/	Ü˚8¶ú^™Q	˘;Øä\"î∑\⁄ÛvÉ\‡\ÍÉ9Ö\ZZò|¸Äã>ÆÇ®Ñ˘ÚI\œÂ™Å\ÃkﬂÜπØÀΩTµx);ûüïr\ﬂO≥Z¨ëóZò[±k˚ûÅk2p9ûùÅXˆX´Yvºb\·\0{\Ó≠Èìós`-\Z˘Ñ\◊*¨)R6_\»\ÊR\"ïä¡óüÉ ≥\ÈNêaw2êmI@~RØ∏•{u\”\’\›v´ñä¢¨\ÀhZ¿~wf7ú˙›£9\≈gÆ}a∑ª6Pn_àw≠≥¶\›M∑Ú∂¡©ku/ù\Ó\ÏÂù´\‹m±9ï^¨æù7roqï\—8X\„+q∂\Ì\ÌÙÄë˝<w3É¸ª¸?~x9\nendstream\nendobj\n13 0 obj\n<< /Type /Page /Parent 1 0 R /LastModified (D:20160602200051-04\'30\') /Resources 2 0 R /MediaBox [0.000000 0.000000 595.276000 841.890000] /CropBox [0.000000 0.000000 595.276000 841.890000] /BleedBox [0.000000 0.000000 595.276000 841.890000] /TrimBox [0.000000 0.000000 595.276000 841.890000] /ArtBox [0.000000 0.000000 595.276000 841.890000] /Contents 14 0 R /Rotate 0 /Group << /Type /Group /S /Transparency /CS /DeviceRGB >> /Annots [ 6 0 R ] /PZ 1 >>\nendobj\n14 0 obj\n<</Filter /FlateDecode /Length 2928>> stream\nxú\Ì]\Àr\⁄J\Z\ﬁ˚)zôT·é∫\’…´ëANî\¬`\ÀÿïúìSßd!;ö\…\◊…£\Õk\Ãnv≥<ãYeó\’t-äë/H\0.Ñ\‘H\ﬂˇ˝\ﬂ\‘\›\“ \ÂöxÅ;†Åè\‚˝O˚‚øÆxø\Ô\ÎΩ\√xwÑ\0“†ñæ@\Á\nÿù=\Ì\—\rq∂\·\ÌÚhÚÖ6˜a~óÅ9\‰àqéÅ\ﬂ\ﬂ{˜©C@#\ﬁ;èø¥9LÜv\ﬂ+\r\'u\\\◊ÙÉ;˛\Â\'˛\ƒ\"qcC\≈GÉ&6)\—¡æÅ(d&≈∫í\0úÅ\'ûqozM†uìAÅH¢\∆Dtå®N\0¢í¥oLè\ﬂ–ÑÎêìá†9áo,\Ê≈ä\ﬁlÃòB¢•êâé C¶òLé\Ÿ7L\»631\'òu&:Ò=fmz\Ã>∆êlÊôûÃäö7≤¢fÉAc\€\‘<√º-j&ö)Lıv©Y¡º5jV\’÷®yÜy≥’¨@\—öèG\Ê\≈`\nµ\Ã*µ7ÛB=ø®öÛv\Á\Ô]ZÑxˆFª´¨b£G˝dë\À()\ﬁ[0KÑ\Â\›v\\ÛA&4\∆E\Œ–§W˚}\ŒA†É”≤¿Æ\Êﬁ•\≈\“_Z\ÎBBíu\ﬁTø≤°pQ\ƒ`¶>;\¬\Ô?	\Œ\ﬁ\È#N∞\‰∫\ﬂ\ƒVf\”|£\Ï	Öob\\	\÷\„\ŒW\\m∑y\«$\◊@úRú&ô}w\'\Œ(øE‘Äúh\…Ú}í\»Bmß~So∑\Œ:V´\ÓX†a\◊>s\Z∂\‹z˚\Ë|î\ÕO≤%∑úˇ\‚59§4¸xÇN4∂*N\Â¥\"t3uæå\ns?º*ùA™SyâÜF!6Ÿî\nXCLcö¯èlhL°¿*2H\·Uë71\‰äé\‚§?\ÍyIÉvÀ≠W±¨Ω\—\Í7_\–Ú\Õ\"°tù§H™i\0\Õ\ÔíE•ädWµóe≤≥§SíCÿΩ)9\\˚\‰?áMßnÅ\√v”π∞\\\«j•Ú\¬nŸøù\€\Õ\'˚\«\r6\€\√\Z¨CÆ∞¶\ﬁ>vŒú∑∆ë\‘{\Á¨\„∂A›πpö\‡3∞õvΩ\”v≠\Êé99\–\në†P£ı2°åΩ±E\ﬁhÄÜ\‰å\”¨±NúŒé+π\–\n©ΩP£µrÖôF\∆\ ü∑ú∫s\‚∫4ùC€ï\ÃqwD…ÅVH\ÁÖ\Z≠ó(F6à<iXç\Œ\Ë\ƒr\›ˆÈπ≥≥/π\–\n1†P£ı“Üg£ò);Ñrù˙π\’\ﬁröT˙\‚_´Q9≥~∂\ÈY©\‰Æïå\‹5®3§k:\Ë\‹	|ék\¬)}>s@ΩÌ∂è\€\"\‹=n∑Œ¨\ÊÖ]û?yQ7A˙!Ω\‰ø˛0H@7\0npÜâ◊çPøÖ=˘e\œ7^íƒ∑£–õ⁄´\ZËè¢\–o\¬XQ˜\ﬁ¯∫\Ô\ ,6ëQ\ZS±!à∏\∆<\€,ÿ´Å`0bòKj`\\ˇåÑ§qo\‰á?\"\–˙ó¿®Û\⁄\Õ\Ë≤˙^◊ìÇ}\Ô˘¡–ì˚t\¬æQªó§\‹¸L´ò\‘D6•+RcTüí\Ì0\ÓÖﬂº$Ù\"OÇº¢\‡˚(Xøz\◊1\„HH2∑£\0|çˇ\‚7I0¢\·\‡E\√ 4z¿G]!º(}\·™A¿z*\ﬁXÉÑ0\ƒX*¨Yîò\÷G\Î¬±]`5\ÌOVC|x\ﬂn˝&6~À•C\È\ZöIò∞¯lN[ı¢≠3†)åês(¨\Ë\·\ÃLd¶}9Ú¸0éº^(H[M\∆\"F\‰Ä§Û\\}¶ı\ÿv\”j≠µ [ú¥∫54Eπ\\ß\√p(oK\›\€iˇ\ÔÆÿíaWÿ™T\À¬òWR\—2\‘JôñØ\Ë}dp\Õ`¶VIEfB ¶(ó)\ZÇ\”Q(t%5I\”k$\“\…\‰iÚ\–˙\ÿG∂+\ÊV2\Â\·D\r:sú\ÁÆul∑D$÷∞\ÎMÀ≠¶5BDÑ\\¿B)X5§R¡¶\—R7ÛSIû\"ìCnB¥\\ùŸáÆÌ∂•ïïÛΩ*©Qlà~à©FhæFøzó\·0u(Wq\“)U ˛çÇ4é§\«Ñ\◊\“0â\ÌnòæL-Äùf!\Î\‰@%\ÏF¶æÜ†)b8\„^e∫\ﬂSº?\…¡\Ÿ&£•X\’¸U\≈Z«ì§º¢vÉHÑ\„,Wß\Â∏)Sú∏D|E¶(ókÛdZv©§6±I!•&#(Wõe(Å∆®À©$˙\„r]û\'ó^~˜“íQ%\’Iê	M ∞ñ\ﬂ9]\Î»≤õ\‡Ω\Â\ ØBπ÷°\’lVSªîc\»(\Ê¸⁄≠V1è≤L1èCD\Âb˜Y`ê›ä\Z\Œ\≈Y2p\nQâ:≥i%πh\Ë\ÈSpKıWuoPQ˝!aL∆öâÚ\ÿ:?ñiÆ§±0£\Z\'˘äl˝\ÏI,SÜN\–˚˚*é\‚Éj\ÍU7\‰†}f0=_Ø\ZAò!¡\0lVRµÑ\"¶Op\Êı\—8IÇΩ¿&?D\Ãî&\…+iéG≤c¥>;Æ\›˘ß\’j∏∂”≤˛Ò°\›9∂ú&¨∑è+\…\—)†Å¶P\r\Âé:\\\·Ü˙n \≈#\Zï),õ\r§†ô{¨\ÂHQ&	*6\‚Å\ÌH\ﬁ]@?Ùc9\Ó!W#\·R£ÙÆtxy\›x\0z\‚›ç˝Q?àÜ\‚\„¥78\»\»\€zVôT<\Î$ƒ®\Œh£Bnºúﬁó<¯⁄æ\ÏÖ\◊\ﬁ0N¬π\‚t\ÈG.™)uA¶\Ïøú√öùäi\Í\È\\_ı\ \‘wtMÉ…µ<\Ê:œó7É∏\À\—]	\Ëıi¡Mú\»9\ h∞/o\’\«6ö\√W∑Ø.\‚\Íx|e˘Æe\›¡Q<å˝¯&Ùñè\„\ÿyıY\ﬁ˜9úª\Œ3â\œˆ8˜ıI_]Òåg2l\≈«ÉQî÷°zK\„\„Ç~2\ÓßF\0à!\»Ò≤!¿˙T≠Fz\⁄S\"Åı\Ëpï≥∑∫>û+\·FYá¢ÜSZß¶Õâ\“q9\È\ÌŸ£p\‡{=\Âç\Î}yæÖ\◊\“\ﬁe|—¶ì~GEıbüÅä∫)\◊\ÃR®X˜íÒx07\»\ÿ\‘§˙°Q•\Ÿ=\ÿ\—MŸª£€™t\„jK£$\√\À\‘\Ï\›\»9:\›`\«6u\Ôém´≤ç\»T∂µ•WmLä\Í\€≈Æ≠I\◊uçC\\ëtΩ\–	\À(~\ÂyÒ#àLäø!\ÎMfY†û\Œ¿L„ã°H\‹M\ŒZæè≥=\œOÇn(ghäÄ∏7∫œÄJf1I737s\\EªíÛ\\\„Zö¶ì8áÒ˝ù¥%#\·J-Hl\»ˇHÆ\‘A\r§U @Ü√ëú\'∂\Ô\Á˘\ 7I¯M\»e∞\ ˙M7;¸\≈˜V\«(Ωáôô\ﬁcG\‡\œ\‹W\rxi!Ò~tˇ\'˙í¥2˝`∞∏©¥HìœªÆˆ2çJ»±Y§Åu\\ôH£ÑÇT:kÖYÚ≥˘\ÊEΩMBß\œ\‰õÒ\Z´}\Î2c\Ó¥%ºç¶k\–diC\"öd\ m¥|gòy=\ÀZ\ÿ[\ƒ\ \≈\ÏxqRR\Z}x\⁄rì\“¿)§\\∂\rx¶\’[∂çâã)±\n©6°π\ƒ‘ï+öPXı Ù_∏Ç\»\∆P°åU\·å†\ÿgâª\n˜πö˚Ö2R\ﬂXIØÚ,èó5F\∆¸´sjåJ¨}°8K\ÎA\’\Œ]åJ;É_πäR:|ÅÙ\Ó¡sô4H\…‚†∏¥&—¨\…¯0\nz=YåÙ¸a\ÿÛí`∞ãc â\·µ\Zïêø≥™(B\Ÿ˚Vªb\ﬁv\\}0\"ßPCsÉèq“ßï@Å0_<\Ëπ\\5êY\Ì\€0wuπ◊™/d\«À≥RÆ˚iVãï\"ÚRsKVm\ﬂ1pE.f¬ã3\Î\¬k\’b \ÀﬁØò{¿é{+˙\‰\≈XâFD>\·µ\nsäî\≈≤π‘ôH•bıg?»¨_∫dÿûdSê_á\‘K.\ÈA\›ty∑›®©¢(\Î2ö∞?ù\ÿ\rß~ˇhNÒ≈âküŸ≠é\rî«ü\€gb\Î¯§iw“•ºmﬁµ:\ÁN\Á\÷Ú\ŒU\Ó¶ÿúJOV\ﬂÃãπóx;\›Q\‡ı≈ù\ZzZfE\„Ù\√¯ërÒù\\∏\\˛:ıì\∆¯Ú\Ê\Ó\Ó˝õ\Óåì\ÎŸ¥\›¸\’;ÚÒà\◊\„\€\‚%≤0≤\ﬂ?\·r˛ìádX\nendstream\nendobj\n1 0 obj\n<< /Type /Pages /Kids [ 7 0 R 9 0 R 11 0 R 13 0 R ] /Count 4 >>\nendobj\n3 0 obj\n<</Type /Font /Subtype /Type1 /BaseFont /Helvetica /Name /F1 /Encoding /WinAnsiEncoding >>\nendobj\n5 0 obj\n<</Type /Font /Subtype /Type1 /BaseFont /Helvetica-Bold /Name /F2 /Encoding /WinAnsiEncoding >>\nendobj\n15 0 obj\n<</Type /XObject /Subtype /Image /Width 210 /Height 142 /ColorSpace /DeviceRGB /BitsPerComponent 8 /Filter /FlateDecode /DecodeParms << /Predictor 15 /Colors 3 /BitsPerComponent 8 /Columns 210 >> /Length 16149 >> stream\nxú\Ì]w|TUˆ?\Áæ73ôI\œ$@H @\ËÇ4Ai∫\Í¢\Ó\⁄u◊Æ¨Æ)b°©(ä\Ï\Ó∫?E)ÆΩ†.ÇJ\ÔùP\“+\È\…\‘˜\Ó˘˝Ò ºôLí!ô¡úœáêÃºw\ﬂy˜~\Ôi˜\‹sësg\'\0∂6gùéNCD\÷\“\œh%jf˜ë\·\ÁäN\”D=[a\◊\Ã\Ó\√p4\“Fıí\ÿ\⁄¥!Ç\Ï§Úµºr/ˇë rå`ˇ∆çSPã9•\—\0 #\‚ø¨\€\\∏l_N°\À=™}¸ü˙t∏\ÍOù{•\«PÀ∞ú¡\ÌÙ\‹\Í›Ωëà©]-\√∆Å-¶\Â&ûΩ∂]PB@ g?±Ä\◊|\r(\00DN¿k\–vÅê˙$∆èj!\‰ê\«\Õ\Ôa\ÀÚ˝yIÜ\0\0 s{tƒÇK˚N∫π\'b\À3Çà\0ûñ\Â\Õ~≠lKÅ\0P˘¿ÆãØâæ{\ZFá\"¢\‘SOÖ∑\—\ﬂ1! PıF˘\ËÉ\‰\‹\0h ≠OÄºô\‡ÿÉB2Fˆ\„SÎöôPZ\·Ω˝ô\ﬂVg∏$}“ê°\”#˝t¸§3\€}\·¿$≥I#\'ÅÑà\0ïØ<ùÛ\’G*0Ñ≤\Ôˆäe;≠É±{\ÿ˚«Åï/üòIû˝Äf 28TÑêô\»S@éq\›?|6¸éÄà\'rkˇ∂`\√˜π•\'@‘æ\–.g(…¥!Ø¨¸ò\„¸~âë6S∏8	\‡Q.õÛh¡¢5Œì¶ö[\ !\0D`€≥X\Ó\Î†>Ç=9º˛É¿ÅJ>ë≥û$\ÔQd\0ÄàC†+è\"Úr^ª…å\—C\¬k\‹ \0\Ó>\\˛˜Öø˝VZAH\nc\Í`#jT.ßm\Âyµ\ÁıLàãµÑë\rïØ\„\‰\√S\n\ﬁ¯\…S\Èe†\ÀT?_äÅXπ?üéÓ∞ù\€Eh\ﬂ%lè>ÛaJ†Åº\ÀÛíîa¸&	@pl…ã—ÉÅÖG\ÿ(ò[∑µˆ≈õˆVV2\√\„ÉÚÅ¿poay∆ëöA]\‚í≠aaCùÅ\≈≈ì\'æø]rH¨á\0ÄÅX}¥Hﬁ∑\”vNíò\⁄+<ú\·∞sπ/\¬%$Z\ÍªCQJÉà\…™›Ñ\ﬁ\Zå\ZÇ≠ôå*ò˚\ÔO9ì\ﬁ\ÿz\‹\·\0!ƒ∏Å(dW\Ï;RyNrlJrd3\Ÿ\0Dî≥è\ﬁ{oÒö\√\‰ï\—_º’áº\⁄\ÏRœ∂›ë=#\ƒn\Á6óá3v!h@$~¸qπ\‰?¿ÀÄôC∏\0G&\096Åßî\ŸÄ)¶\È\\\"\0\‡{ü{¯˝ùynW»òS\ÔQ\»*´\ﬁq§¢G\\d\◊\Œ\—Mf\–{`G¡]˜ù\\õÜ4Jª ìôÅ\Ë,¨pn\‹k\Î\‰5ı\÷t4F\Œh\ÿ5FT+{î*V\’\06\Z°D›≤A$‚Ñå	\‰\ÿ\n\Ó|¥ıGsH]¿†)ò{\È√ÉO¨\ﬁW\‚uáÑ9\≈\⁄C\‘\Ï{Q(®¨›íQ\ﬁ\…b\Ì\›=66Í¥â\‡˛\Ì\«¸{*\›TÃÇ/H>ü{\0wYm\Ì˙∂§2\”¿ëM\·¡¿\ÀY\n;Dêä\‰å®\Êí›ÄL∑\◊æ\r\0Hªíê1@9vÅ3#˙†•CM¯qÄOæπ\Î˘µG\ %íÑ%\Í†+∑à\Ïdçs\„\—2ª$\ËõR#˛≠9ø[ù7\ÂÒä=uúV0L9ˇ€ò\ﬂ$B`Rçª\Íál∂lÛêQ 4q≠·¨Ñ\"∏é\…GßÚ\⁄\r@’∏k(¶ D ö\…\œ\0òÖ\\á»ôÅñn\—)\Ë}Amríq ã[\ﬁ\⁄x¢ZÚÇÄjî$\‡©\Í\Œ¿1¨\“\È˛5≥\‹Z\ÁL\n°\ÂFDÄ\⁄ˇ\Œ{paeFç\‡[ó\“%Y˝Q\‡W\»\›R≈è8d2-Mqt\Œ>\ÿ! P\Õv˘\Ë?…πUâé(0BDdç\r8°\⁄\—\»\08\0Å\Ó\Â13∏èë\„\0öR—ñ\Ï¡Å£WS#\›˘\Ão\Ô\Às\»20¶\n\€P˛>ÑÅü¨\÷\Ì˝%≥L.í.î$6™≤†\Í≠\≈˘èΩ^ì\„4`Æ1¿54G8U¸|\Ã\Ï\ÿ1x(ã:e•ñ¡Å*\◊\…«ßë{/Ä©é÷ò®Ò}Ø\—\0fo9v#≥cTﬂÜ\⁄@,(q˝˝\È_ø:Q\ÏÒÑC|ãz\∆51Ù\»ÚÜ\Ïì\’Y\Ó\ŒMå∞‘Ø\È†\‚π\'Úü˛\»Q\‰bÅòkquw¿áXæ9S,\Ÿ1®ø\◊.¥WÛÒu\÷¿Å\ >ó3#\Ôë%!S0πÑ&êJ»±\r(£˘Ø∫\Â\È_\◊ñqhBº9$\Ã6\Âñs\Îcèé2ø<•≥*x\ÂkWô\€ﬂûÛ≥?CÊ™Æ{+T\Ó\Œ¡Ãù∂A=Ñ\ƒ\‘\–\⁄8ã`áÄ¿ã>\‡9H\ Ùá•u’ºGDD0ëTIµ[êF.€∏ª\‰∂E∑óWÜ\‚\¬4É\Ó\ /\ÕÃ®úoèØÛ éäí©˜˛\ÎWou¿\"D89àUá\n˘Åù∂˛ÖéAlè†tv¿Å\Áø\∆ÛìîÇëÖfCù˙Éîˇò\‹Iµõ\–\Î\ƒ\Ë¡ X@\√\‹7ø\‰›Ωd\À·ööS\Œ5ë\0\ÿ¡¢äCG™\œ\Ì€°ùM˚yIn—§{ãW\Ï\Â.˝b%:\Ê\¬>bÕâbœÆ]ëΩc≈¥zm\ﬁ\œ\ÿ!Ú¨r\—[\»KPàP\" \·~\”DD\»\‡2\’nOã\ZÑb\0.ˇ6s\Íª;≤]µ ∞u<§w¸d\’\Ó#ïΩ£:ßF!¢7c_\·\›ˇ(˛\‚8\»A±úk\ZÑÙDG^ôkÛû\»n\Ã\‘cp\„\Ôq¶¡ÆNòQ\Œ\\De\Ô#/%l°L\rP˚ó\‘\ \'\»\0R\Ì\Ê)∆∏Ao~Z9Û\„\ÌßäπñÀì\“\À-ØŸñQ\Ÿ=!&›±?˜∂…•\Î4/\∆úÉpI85§gØ0\›%’µø\Ï≥%◊ö˚]\ÿ\Ëúπiû\‰\Â˘o\»EØÇT\Ã@-∫˚AIä#\“\„\ŒjøôEWN\È¯Iﬂè˚\Êp<XºÄ\‰ø\Óv>\0†NHè\0àıår=Z∞Ò¢\ÔæpÅMù(\·6\Ê\Z&ŸúïˆÙ’ë˜<ı\'©ûq\“N#Dê´y\Œ\"πx)êP\0\–ªÖy%§ßÆuBz2â	1áÜ∑´Õ©N=X¢\«S≤¡CzH•^\À\Œ\»v\Ì;Eˆ8zÑÉû\·vN\Í\≈1ìû üéX\≈Ûêã\–<_\ÎÃÑ\"xä\Â\Ïß˘…∑˝∫ ‰ïß&=\‘ÿ∏!§á\027%\∆ë\\^\Â\È¥37ƒñ∫ı\Ê&Ä6®äÃõ#íz\∆ı<îÅ!\ﬁ{\ T7§\Á\œ#/Ø¯\·®E\⁄or≥FcˆåÉ\"83\ÂÏπº\Ï`\·O~ç¸PEH sS|Tˆ∞˘:ˇñï†…º&∑Ø)G]`a˝≥\n5ç\n\0@.6ä…∂˛\Ìzd5\À^mr\Ô\rØ\⁄\r\ﬁT˘Ø\'Lïª#…â?\”`áHµy÷ìºr5∞f\'üÖâP[∫$2\≈Fvã),©8w_ô©\È{A\—`êkC,¸\\@	ÿØ\‘N–±Wf¶\Õ\ÌêAqBmZîX≈∂lñ∑\”:®èê\‡óF¡ë™∂\…\ŸORıw(›≠B\nB\‘QéH<B4{†˝w°ièT¡ÜÜ@\…)\‡\’¿\n\‚6πù˚\‹‘ûÖyq5<¯\ X\À°re\Êƒü9U©¸gû=ãj~I~\'ÀâÄî\\N\0$Å92≤``\ ¿õºYs\0\…\‡â6\"\Ì\»M$s@\0 }\‰ÈπÆ[?OT4YkCâ-Fd¯	\"D}s∞`\÷\“\·_\–\‡\Ì˝.Ø˘w\"ù¸ö\Á\Ã\Êµ[\0£\02\–\„≠MÅ\"\‚\Õ\ÁKO üa\◊0r[!=Bzw˜Íìüîd©\—\≈ˇ0Q`ñû\0÷≤Øvî˛gùè\’\ﬂ+\Ï¸\¬T¥\\\Œ}Ç;˜≥\0ß\ﬂ	\‰\0\08\0#%\\\'0Yñ£™z6ôE\"\’`$Eú6&õ~*˘r∑\‘¯^	\ƒ8¿\"¯fCù∫pqø\' 0	$\◊\—\„\‡\Ã\’?¸=£@\0\‚˘oÀÖãQ.f1JO«é˘\–HQZ\0D¡õWûÙ˝¡Q H\ÕhUE©&j4b∏ @/3DDCík\'(4–æA\…˛^aá≤ì\Á-ëK^\Ó 0)q≈é˘˝`tê\0	\Ã\„ˆ$|\‘+{;Ä\Ëmä\≈y\«h\ÎU]:8%YB\"\¬\‡ZÄ8W~1ÏΩ£%qR•ç\‹dÛñT≤\rÖÙåcˆ;Å]ùÆ \‡a	\„X¬∏\∆\ÔVhÆZ”à®\ƒ\“à∏ã\ \÷Û≤e \ÂöIı:Å 0\"è\–\Ó!~àë@r”π\'BDdº∫\∆:8 æÆ?…™<ûWıø\„\≈\€OV{$\ŸW\‚$\Ë[sôn\“yﬁç˝”ªá≠\Ë\"ºò˜\÷\‚\ÍüJ]Z\ÓSØóiòÄD#∫w´/\'\ÔÙØ\…jÆVc/∂ÆAîWÒÇ\Á¿s+®\∆\Áa\Ó˙\n&\\BDÛÑg˝ãEàõ∂ñº˘¡Ø3\nù≤¨ñ \–®p\ÀÛØ0Û\⁄s\ƒÜπ\–zBπ1@4\"\"@¡≥óº`5Ñ\Ó\¬<£\‡◊∏µ\Ì˛<§\„ã\”≈û#î∑;\Ì©\0¡∫\∆\»#\":thı™ïà\»Ph\Ã-DD\‡\ƒı}\Ì\Í> \‡Y∑Ù\Óó]>1*\ \ÏÕ∏ùü¸Öx\"\0F\0\"ã<O\ÏµÖàˇº˜^vV¶\≈bnˆ˘kÑ\»\Á2cóêp˛˘\Á˜\Î\◊_E\0˙\‚˚ú\'>›øª†,&øt\‡\ÂØ\›~ﬁ§\À\”3;x\‡¿Øøñôïm6õP\Õï\Â	ë#$\0\"ˆ\“ÀØ§§§x6¨Œùˆr˘ñlîlPﬁíÆ§q<Iw˚\Àzux\ÓqSˇQ˙åBl|˜hX)\»#_\Õ\ƒı?ˇ¸\ÿcè\Ìÿµ\Àfµ\Á\»\Z\Í}<Tk∆Äfe@`\‰E#.\Z9**™Äà´©\ƒA0£•ø\"~>¸\Ë£ı\Î\◊GG7q\Á3qéë!\…D( jÛk\Ëy\Á\›y\«.ø|\‚∏\Œ	qñGˇo\Á∆º∞òı\0á@Ò˝ud™`R\ﬂ}\ÁÆ]6õïÀú1\Ê\€iB¢ÅÆÄ:\Ë\ÏŸΩª,\À\0@.\'x\‹\n\‘\0O\Êd§\‹pn\“\”Û\ƒÙAR¸4På∫\’\œ;C\ƒ/?ˇ¸ëáﬁ±kó-\"Ç8gB#;ΩÙ˚ë1\"\"\"\0\"\‚úâÇ0\Ïº!ØΩ˛zrrπrx≤µ$\–:	Qs\Ã)då∏≤ùôÄ¿âÀ™êﬁ∫m\€\ﬂnΩu\ŒSs\nÚÛFkˇ\ \›CÜ\'∑è¨ºoºY¸~∆òøéJL⁄ª\Ô\‹iµZâÄ	åsÆ}âslsDƒâPu∂HÑ°CÜ¨\\π≤s\Á\Œ\0R¡€øî\Ì\ R\Íàh¯\»\«$π”Ω\√⁄Ω¯R]\ÃA´\∆\Ì|=Äà}¯\·cè=v\‡\–¡Hõë1¢\∆{«ó˛\√™\Â,fÛ%c\«~º|yr\«™\Ÿ\√sfPı&¿H’Ç\Áà¿¸T{Û“•‘îO @ÜF!˝Í´Ø<˘\‰S9\ŸYC%M˙KOê8Oã±˛0s\Ã\ËAIÇ\»>Z∂\Ï±Ÿ≥:d≥Ÿîi§\Ã%\0\0&0\–^P\"@dà@ \À\‹l6è3f˘ä\ÂS;@\≈ssù?o`\‡ß\ﬁ[í\0∫Levâê\“=(\Á≠\Â\…˙<*D|m\Èí%Kó\Ê\Á\Á\€l6\"U¸4¨a\’VH—∞\'\‡ú[≠\÷+\'N\\˙\⁄R&àTæQ ∫<ô ¯R	ë\ÎÉ\–\Ã=E≈´¡-\Ãc4\0bbc>˙£Æ]ª>6{ˆòs\⁄\›20mKI˘w3«¶u≤1ÜØ-Y≤\‰µ\◊rss#,•)&024¢†™q$Ødçà∏\Í\ +óæ∂Ñ	&\œ…ôèΩı£ßB-_á\∆~o\÷K\ÈÖ	.\ÿ,iO\\˝œß\—\ZU\ﬂli\ÿzÒô\ﬁ˝˜øKKK\ÕfÁößJ?+3\∆\0Ä\À=nwó¥¥©Sß\ﬁ˚è\0˜Ú\“o•¨© WZkJ];Ú\◊4ú\059àå\Á§\ƒeñ$UAÑ\Èö5ú{˘ü\'ŒΩc\0\Íö	\0OœüˇØ˜\ﬁ+--µXî}@äô†æóπ¡F\…\„ˆDEE\›q˚\Ìûy\0®∂ºx\⁄ElójΩÜ\ÌmÜüa%e\÷)\Ÿ\≈WE\ﬁ3ß\·\‡j+¿NGú\«\„ô=k\÷Ú+jjk\Õ&ìÚ©~ôb\ﬁ5\–\È˙W\0å9ú\Œ\ﬁ={Œû=˚ökØ%\ŸI\'ˇ+e? +{\n¿hUí!~™\‘etÉ\ZFàÄåQ=\"D`{˜\Ó€æ}\Á\Âûÿ≠K§˛\Ó+>YQ][k2ô–∞°9]\œ\Í/\\üxΩq±±<0u⁄£\”@*\ .ô:µ\‰≥#\‹#∑Ä¢\Íüº∂¥Ñ\Œ\œ\›lª\·ajlM\ÔÙ√éÄôP^^>}⁄¥\œ>ˇú!\–\ÏPã\‡4\ÿW\›=Œπ\À\Â\Z–øˇº˘Û/7é§j^ºL\ŒyòE≈õ>®\rj£√®\Óúd=q\Ÿ\ÁG◊Ω\0CF\ËˆzÚÚÛîˆıwó9W6¸\◊‘üXä/\Ô[*CÆ}®t\0∏\\Æ\È\È≥gœæˆ˙\Î¿{l\—}SK\÷\Êµ\ÃRò!ddù2xb˙∂\ÔÙ\¬=ó\›ävöaG\0ÄL(.*zˆôgV≠^-öDP≥cÅ\0dYéãçI\Ôñn∑\'\∆¸K˝\ÌΩ^OJJ §¸c¿ÄÅ\‹S\Œ^\„œÇ†D\¬^Ø\ÿ\⁄8qô#cút\„≠\⁄`¿â¢P\\\\≤m˚vã\Ÿ\Ï\À`\"@\0Å±äääì\'Kbbb?Y±|\Â\ÍU&\—\ƒ!\Á\ÁV´m\ËyCFè\Ìt9ï>\–vpp\ÂCNUÒå±±±\Á\r;Øˇs≠V+\0∏∑ˇR0yz˘\Ê-ñv\ÿ\’\rì\Ó¯aùS_x\–<Úöcßv*Ø\’55;v\ÓdSFW˘\\.WRz˙C=x\≈\ƒ+Cjê&\”»ï\«Ûûïã\ﬂE1\Œ˜-/lê95¡ë1E\ËMû<˘≤ÀØàààëD\\∑n\›ÿ±c\Õv;\…\\}AD`®\»oÜ\Ã\·p>tà8ÇjADî$Y4ô.∏p¯É?R\Ô\„¸ı¨O\‡ Çª¥Ù’∑rßø#Éâ©!∫ñ\⁄\ŒnwqzÚ¢Y¶¡óÜ>d-\rªÄ	á\0\03\0*¡2Å©1L.´AW%\0¿´¡yº°¶âî\‹\neñW\Ì\‰%\Ôìkªé9D Rèù@D  ¢˙\Ê?\"\'\›GQ∏bEÛã\›y52\'T\◊\ÊAëC\0¿91ÜDd2	ùS\"ì,˙{cJN±s»óãID§|ÆØ§øíÚ∑,\…Y˚xMe–©Bä\„•hZìY\ \…pÆˇı\‰\ ]5eÃ∫[\”bQ_\√2xíØ\Í\”~\·±˜ß˚li\ÿ\ﬁëJ◊íÛ®êz†\»âsbj-0Põ@SJ\0\’€º7á§)T%ç\0ÄLØ…†ÆΩ\0#NàÑ¨^Kó\ÍloE\0 E\”\Á?ù˜’Åß#¯\÷kJΩbb^ºm\‡c;\È).ë\"\Ì\Íz\Ê\‰\ÔÒ™äZW\ŸnW\Â\Î\œÁææõª$}G1MpD£\Â\’\¬D2xSodü∑@L;\ÁT\„\Ìß+\\åH\Â\Î\Â\Ï\‰¯@\ÁFe°Ò¨.6`hnæÆEÇD\‰\Âê∫ø∞\·¸P∆ê1M\œ*ó8V{U3µpÅB\\\›_1>ó1%¢p…ïï\r_\0†Ñ]\‘6∏∫û\Ã5<¢/ˆß<ãÀôhM\È¶+aãN},•=0<q—´M¿ú&\€ëN~-\Á/\‡éùB\‘\0\0\0du\0\Í;j‘ãUoP∑\r\„˙tW+rr\‚\\r‘àK°%S\"c»π™LAµΩ¸åDˇM˘ê\◊\Á04D@òÄL@Nƒ¥d5§ßGõï\Á)ç0¡îﬁµ\”2\'§z}RÕ™\’˛–ª\0\0-b˛\€{<•µaç° \0°IH{lL\Ï#\œ`t|\”\÷[vJVz¡s\‰>Å\Ãd\◊âˇ¯\›ZÛ∆∑ˆªEâ%Å/\–\0¡damj\ÿ\◊q≠â\÷\0e\‡\Àh™ØAôw\‰á\”l;å∞E›∑¿øÅ:mî„û™™x\·ô\¬Wætñ8Ÿ©çu\–¡Anäµ¶Õª<\Íæy`279a¨Eï,\0\œ[ õCûl`a.;wVR}OS<\"∞\ƒ\ƒ\œ^w\„ï<§´\Â\Ó¨c\"\"\0rê\"í£ªærc\‘A45\'I±≈§\"\»û∑T.yyMKñc:KHEóÀΩj\’ÍùªvIíÑ\0ú∏≤IÆ\·\·U€ä;O§§˝©n∏íogøn∞s\”˙Ú≠9DÑﬂ†¡9otè§N\œ\ﬂnΩ˙˛\Ê\Á?∑\Ï¡[\ sÛ\“˜Äd\"-U\Í\Ï!∆ò$KôYô\'≤2A7U9gZª”≠C\„%0h\‡@\’Jvª¡\Î5h∂P\¬»Å·∏Å©©/N∂\\|sXr\Ó\√;ˇ\◊@W\œ]\»\À?\"2\n\»8˝ûˆ˛ûâ¥–èjL15ÒÆÅ–Øñ•ôÜàcCÜ~˜\›wSRSÅ\ ñ˛X∂+SΩ§z\Ë\0@w\‚à._òfæ`b∏ˆyÑv˛¡9G\œY¿+˛Ã™Xw\ƒ[0vy6ë∫J\"S\“jî\\W\∆\Zj\›\·Q¢\ÓVõuÃ®\—oæ˝ftL\0T<ø\ÿ˘\€fQM\Zí¿\›~B\œ\œ?n\Í?:åzáU\…\"Rıû3óWáBîrl¶Ç9\„n£˙àr\Œc\»\Z7\ÏR\‚B≤\Ãmë∂â\'æ∂t)D O\È¨G\n\ﬂ˙\…]\·níK2xRÆ\ÔüÙÙ|±{ê\·\ÊP¯<YD™\‹(g\Õ\‡U\ﬂã\"@¶ØcÎ°µ6jòî±eÇ*\·∏\Ã\—wUΩƒâ<Odd\‰\Ì∑\ﬁˆ\Êõo	¢	%ˇ∏+©í\„y™Gp+¡\'π”§Û\€-~9ÏòÉ∞I;D*˚AŒùO\Œ\‡+«§\⁄s\·\Ê˘,\'4Ùò™aµ•Å˙Ú\Ì$Iäããù:UÕ∑ìã≤ã¶N9˘YFc˘vu}\ﬂ\']fåéùÒ¨\ﬂ>ÏòÉ¿ëä\◊\»\…u¯˜Sv\ÓL$%;≤)˘v=∫?6k\÷u\◊\ﬂ\0\0ﬁå}EìˇY≤6∑±|;cpNø,‘¨ÙfR≥aá\»˛O.|•\\¨mÇ≠\…$À≤\Õfvä˘vÒÒÒΩzı8xP||(˘vS¶óm*açGò\Îb$sbt(Y\ÈÕ§\Ê¿Å<<\ÔM^º\‰r\"Û\È\À~8IñeS¯Ú\ÌB	\Õ\Á8xmiˆ≥“õI°√ÆNpN™\Êπ/Ò\“wIvöê)Å£\‡ÒèCßûo¢»ã\n§˝[ãóm,€í\'Ä9¥\Ï∏J\Ô)e•7ìBáù?\Ê<\≈r\ŒÛºÙ}@%±ß-8R∂ª61ﬂéD0Q=&[ÉD2∏\„ávJ}ÒAÛ\»kOè\‰8u%ã\ŒL9\Á^æ´/8ß\“\€^”â®˛|;8sÉ´±˛1c‘æmxjZV˙L\”\‡qßM[ù\"\ÏîZ\È\ŸÛx\’Ü\‡◊ª§\rsÕ¢&\Ê\€\’˘Ä\0P´\›\Ï)\‰ïs_\ﬂMí,É;˘\ÍæÌüù#ˆ>ˇtZHß;D™\⁄\Œs\ÊÚ\Íı}YM\Œ!\0qå)\‚j\Èi_õ—É\≈\ﬁ\ﬂ4πLÑñ•¨ß+¸5$\‰HB†\0®§◊áV¿î\»gÆkâ”ç3\∆|ª…æ\»Q4˘~1\¬Û\œ\'\≈\Ó˝O≥U2Ïî¨Ù\‹y\‰\ÿd¿\‹)í:õ’¨Ge\ÂQ\Ÿ∆Çz\·A\‘jE≥å\nrTp®è™ÛK¿WÜ\œI)°\“\‰g\’GJ7•2\"0Üç\⁄[ı\Á€Öô\»dk˜ˆ\‘\ﬂOªí\n\rvàtÚ+9\ÔYr\ÔE!™\ÈLíáuâV±J¥\“F$\nBUe\’\◊_}y¯\–Aè\«\€$C¶\Ô\ÔB\Ì4\"\"≥\Ÿ\‹˜ús.7^E  \Œ˝\nÑâcJPóàLÇ©oüs\Ïˆ‚¢¢†79ﬂÆaBQ…âàxbb‚í•ØY,ñ\÷\n=Ñ\0;D*˙òæ@\Ó\„\0V\‚˙qoßJZq Å	1\—Qäímc=châ∞îú<˘…™\’j\Í@c%\Ó\Z•†-8qkÑu\‚W\\|…üDQTíÖZbS©æÆUSS3a¸Ñâ\'6pqìÛ\Ì\Z&ÙG-\Á\‹l6_xæn…Ö\ÏÔÜïï¸ôD\0\‡yo\…˘Ûπ+ ôr\Í@Sí\ÁàòR∏OD\«\∆\Z<\ÿ\ÌdµΩU\0D\\\Ê\–D\Ã)[øî\◊cLiJë9 \ÀrÑ%b¸•óæ≤\‰UµJ\ÀhXΩEá\√1l\Ë\–i\”8xP\„º\Î•∆îni\"ú∏∂∑dY∂Z,óçˇÒÚè5Q\◊:AØÄq5òﬁà¿ù<gë\\¯I\'Åô\0âöëØâàD˜îÉ+\'&6r¯ú˚uß≤{ä\0ë1\÷ÙÍ∂àj\Ê£fZq\Œz%)\“fªÒ˙\Î˛˝\ﬁ{f≥Ewøõ¥U°RÜ\‘\ÎıvJIôø`¡®—ç\Á´)1;u ©i√ä¶n≤_•\ÏÉC z%õ\Õv˝\r◊ø˜\ÔY\"l6[Å\Í\'à\‡-\„\Ÿ\‰¢\≈Hµ†\Ó\Z\0-<|\ÍDD(FÄ{Ø∑ÙsÉÛÜ5r$c\Ã8™Æ#\‚!TÛlY@Z˙Ü¢ß\—\ÌˆDEF˛c“§\≈/ø\"s\»/t\ZÉ]-\—˝í,w\Î\“\ÂΩ˜˛=v\ÏX\Ô°m\ŒoˇE\«¡dnÄmDm Öûo\◊(y<û®\»\»˚&Mz\È\ÂW\0Ù\røi\0†d•\ÀYO\ %ØÉ\"êë∫\Á†©¡9•4q/\‘\Ó†\ _\ÏIâ/º¯Bª\ƒ$\‘Œõ\–vı)%)¬î\ #@ß\”\’%-m\·\¬gÚ…™j\ÔV{\Í\Ì\›^â7˘uB°≥eÒ\À/\røh$Tû»ôÚl˛s_Bb#YæMÀ∑kò\\nw\\\\‹¨Y3ÚIÛ[[mY©\Ï\…qTŒú\ÕO˛†~`´∂9æyƒå#©vßîÛ8ì\ zˆ\ÏΩjı û=zP∞\ÍNßÙú\0-Èãû Ä\√\·4`¿“•Kˇˆ˜[\À\À\‹/,?p˜Ú≠f!\›¸\n˝\\ë˙9i\»Ãçèç[æ\‚\„ãFèπ<ˇë\À~¸ILà≠Úb\√HÚœ∑k∫?\0^èß]R\“3\œ<=y\ T\0¯ùljÒ\Ôz%+=sØXÖb¯3\Á8!\'\ÃFÆ£“âΩΩ˚Ù˝\Ë\„è\Óº\„ˆò®(è«ÉzHE\Á\»≥Ú”íD\\Ø&!só\À5b¯Wó,5ztIës\Œ˚\Êˇw∑5¬∑\ÕS	q_}µX¢º\rÚ4˝\”@\Ï*∑tM\Î≤jı\ #Gô\Ê¸mfÒøæ 0£¿T\»iû©\Ó˙¥y<ûÙÙÙ7\ﬁx˝ñø˝]\„\Ìw±pn† Ç+ü.\·ï_Çˆ•}mÄ0$â™\÷IG\ÓSLK\Î˝¬ããßMõ∂n›∫ü◊≠\À\œ/0ô\Õfá †\Ô‘ìå§_/\Àrzz∑©¸3---?ßv∆≤=\À~\…\0õâs*v∏ïkF^4\¬\ZaEì\Ó\œ\"Ä\Ã9c8Ù¸a\0¨®\÷U+\…Í™ì≤\‡A\⁄2©ÚÒDï#ª\∆\0ÒÒqw\›q˚å3∫˜\ÏÖ\‡=˘ÿÉU\ﬂ˛B`ê\€\rUï1q\ÈΩˆ\⁄\ƒ\ƒ$\∆\0	8™¬∫ô\·9Ωg‘ü\\ñ”∫vù0\·2{b¢Qô¥\ƒzÃ©í\·8D^¸	\œY@R\À\Ì\‡◊™â\Ë\Á4ôX‚ù¨›ç`NÒÖπ\¬Hƒïz+T¸Û˝?\Ï\œõÄsãE¸fÍ®ãÜ$ôL¨>+Àº\„üˇyÛÅ∞ö¿W˝D_®u_sa∑\◊\Ô“Æ£Um\ÕQQÚ?ã>\‹Í≠ï0íµù%˘â;\‚¶<J≠üÆ”öbO?Öáîﬂ•¨Y<o!à\0Ø≠≠¥∆òdz\‚\nG¥a\Ãe;ÜEt1Ä\ÈãY\n\€ …¨†,¶†\"\ X≥\’›¢@JjÆ¿Pñ\ËáM˘\Ôl\ÕÃÆqÄ†7\‡,\ﬁ,<pQ\œ1Á∂è¥â2\'c6É¢è™™º3\◊\Ïﬁô_°ï\À\—{N_g\'ü†!Ò˙ÆÏ•ãMRlŒåc≈ã>©⁄ñKMH\ÌlI∑èª\·\Zb\"0¶˛\‘¸ûı∑IA4õŒπ®\Ÿ\Ì∂˘˛‰Éù©=@\À\œU0@Æà9•∫Ä¢\÷c≠#Cv¨¥˚§O\'≠Ø0©\Ï\Î8-p\0fÄÆA\œ¯\ZCÉ\03ñ\ÿ	H\‡0∂∞ﬁ§é∫i†µt\⁄\·\œ\€Ùõ¨\∆$\0Ù˝™ﬁ£˝\Ê\√K≥ó˙ıwn∏V∫\Z)h˙s\¬A~á?\0\nq(\∆)\√v\Ã4  B54™e\0\"C\‡\ ≠˛ëãLÿñ3\‡æ\œ\Ô\‹^≠tROzBÉ\ #-\ﬁOöπC$\Ëbî4\ÃêZ1É80¶ïäCø\Îıñ¡àKGD=¥Û\€˛ªw‘ÇÕàsÙ˝oú\ 1®ú5\ﬂ\‘B\0\‚\‡i<+\›Ô∏ΩV#?\‡c\‘(∞]@º∂%\‰úZ¡MX\‚\0@†ÑIëa\\ó3D\\OV2b\Œ$∞èå∏u\Õ=€´c™ºÖ~p¥¶ä\’ÒVÖ(©\nQ/\«…µs*î!”Çf@ØN\Î≥\‰¸5Ä^¬ê\ƒÒë˘3~˝\Ô9ªw9¿ÜÜ>’Æ@2\0N˘ê˘˛π˛YCD2x¢˚∂\ÔÚ\∆˝*ÊÇì\∆}kª~©\0w!´/;6©\«9\00\0\ﬁ=D®\Î1˝ds\ﬂq\0ÅÜ†6\¬M\"[≥k\¬#?\\ù\ÈÚ\‘)l\ÈØ åj!øo¡Ä?£O\n˙áh¯ihöt˘ß¸d\◊Fe\›Û\√\Áùr3]`©kö\r\05¸gÉT\◊\ÿE\0hB≠Ù\÷%ˇÉ=Å8Ω+e=}π\Í©ÜT0B\Ã ¸ø`H&Qxw\„__ˇß\"ØÑz3g[ä|&òüŒø\√z¸∂Ø>M,-ÒÇ^I≠Öåb?s\“¯	\\ß?+Ω9\Ï<YD ôJWK\'ê\0M⁄±Ä†lp†YzÑAÒ;M¢˘≈ünzv\À•í™3¸ßÅ\»\'Ä@∫\ﬂ|\Ë\∆ˇ~U[-i\’NC~ö^wá\÷\»Jo’Öùbä0 ô*íè˝®\÷o•^ã∫µK\n:Ú\»$Xg{\Á“Ω˝™$Ø\Ô\Ë]EûN“∏ãFÔÉ¥˚™5_ä≤dÅ\Ë.jã!0\0s\ﬁ\‘\€\Ÿ\Á.\”˙û)ò\0\ƒ@_\Z5∑N¿ÿã\≈\ﬁ+@l§d¢´{\‘[\ŒRÚû@[¸U∫W4\«æÙU\…\–*áò\Ê(`ãä\›˙¯S˛c\ÌD\ÁÆ\Õ◊≠\\#»≤—í4DWZN\Í!NiO|˛ï3s\n5ph;\»\‡>.e\‹I\Œ=∞÷Ç§Ø<©\·3±ù\ÿ˝]å:\Ô\‡Å\Í{\ﬁ\€¸\Î\·\¬¿•Ç\”Fäî%°ãπ\Í—íMcøˇ\ﬁ\r\∆*zNãˆ\Áh;\œ\Z;\ÌYåé?\„∂\Î’ïvF\"\0ñ\Ób\Ôï,zòaπ\Î\Õ\“k.;\ÍÜ¢d¡\“]\Ïµ\"aüæ1\À\ÓªäAù°\÷º\‡yãíOÙ\»˝:\≈?\Áæ¸óü\\`HW@-hÙ>\¬Jö\0Yåµv[te\‹„ØûâòS®i\Áªx•||*/ˇë÷ªÇ&\‚\0»¢Ü\n\ÈÔÄ©Éè	ƒöJ\Ô≥+<Û\Â~05=·∂â‰ëÜt¥/∫u\»\ÿ\Ï’ü≠ ∫\È	\…ŸÄXk)Å\«A≤&\«v^xù\Ì\÷Yg(\‡ ∏\'[œÖ ;y\÷˘\‰G\0L[]	cHèi≈ç8a\‹eB\◊WAàêà({\Ë\Ìoé\›ˇ\ﬁV0˘¢\œu∏\rã¨1@\«#ç\Ó\‹~—ùáL$\0\‰\Áoˇ;qıOô≥eL\Ã˙Çsû0\÷JoE\nv\ \¬˜‹ß\Â¬•ÄQ\ÈQh3ú¥eà@>\‘5|\0.$\ﬁ\»“û¡Œà({¯\Í\rπ{c£W?F0\ÃC@\ZO\0\0\‡ïÆHOYt\Ô¿>=\„H_¥ïΩ“°\Ì\'Æz\ƒq¸d=°\∆&Kª:Kk\0\0 É;n@\«\‘\'[.π\Âå\∆ú\n\Ï\‘ÀÅ$^∞T\Œ}\Z\0ECH/\‘FÇÁ¥èHh?KyÑÜéwADY\‚\Îvñ\\˚Ú/ï^/\‰©4kDÄSñ\\9ø©W\Í≥˜\rJK\r(0à@2\œ?ú˘óák∂Ûû\Ëó,\–=\Î˜J∏/\Í\⁄ÒÖi\ÊÛˇ|¶cNv†ìKñ\…Y3e\"›∑`J\Ï#¥>QâÇsÄX\«\Ÿ,y\n0±Qµç≤D{éT˛eÒÜ¨J\'0\√\⁄vXEı[\·æs\”\Ê\›?01°ûÛd°\"+\Î˙iïkwp0òîjbÆ˝eΩ:<˜∏©ˇ®≥\0s\–\ÿ)⁄ñd™¯F>6ô∏ô†,\€˚∆Ω¡û	v\rƒ¥g1\ÈoÄçcNmÄdf;˛∫¯\Á\›UjÇS≥Hu@@`5â\rMü=©ø\Õ*64ÿà\‡,Ãª\Îâ“è\◊r0ÖıP9\0\0\‹Ø\Ô\◊µ\“[ëö\0;ıF\0j6JG\Ô!o≈©•PÄ±v;@Ñ\–m)\∆_(ú™{Ç%E\Ó\Î_˛e\›\·Yxb2è∑Y\›Îëª˙Ü\‰0!¢\\^¯\‡\”EKWr0áy\ƒANΩwà˝\…gÑî\Óg\r\Ê†∞yŒÉ\“—ª¡ì\Â\ﬂ\'!tê\n>!NL¢áM\√\"VïKwΩæi\’\÷lÕΩmÜ\‰ìÂîò\»9\„z\ﬂ}SØSiD§Ííπ/\Â\œ˝3˙LΩ&\È¶a\Á\È\√cg,Z§Vz+Rs`ßÅ7WŒ∏ã;ˆ(h!w0¥t\”ˇ∂æM∆úBà\ËÆ\Âˇ¸\◊ˆ∑~\»\0K3Bz^π{BÙ3W˜ªnb\◊SiDG˘\“ws¶.ñU\‰5ë\‘Z\ÈO˛)˙Åhç:s\„sıQÛa\0\“I˘\ÿ?x\’z@\0`†ûıßV˘\‘\œI7*V\"`∂sÖ\ÓÔÇπSX\"´à(π¯S\Ì{\Êø{¡\"¯!ØÆ\ÊEmyÕòπ\Óë\Œ\Ìê¸\r\Áéõ\“DÈÇà\‡™˙xE\÷mÛe/k\ÏΩ\Í\Á\0\Z\œJ?(,∞#@rµú˘/]»î•≥¿¯àè8∞òQB˙õ &Üq	e˘≥#\”>\⁄ffH*ÆUFmùIæ∏•Sì\›:`ƒ∞\Êi4D\‡n\«\ﬂf^˜ò∑JÄ`é≠a˝\÷ˇ[^[ZB\ÁÖ7\Ÿn¨øX˚ôOaÅù\⁄p\œ~J.~êÜ˛ÙEıî@	&¸U\ËÚ\—aü à({i\Ÿôwæ≥ôõ4\Ã\∆V4 \Íüxº\Íö¸\¬›ÉúìÜ¡F\ÓÒ\Ï\ÿx\‚\ÍiÆ¸\ \”Q˝%2xb˙v\ËÙ¬Ωó\›yc\¬	;P∫[\‚˘ã\‰¸PÀâ\0-sò$\0.¥øãuö\Ã\“B\ÍCAﬁ∑õÆ_Ú´¥bâäl\r3jâ#ø¶g\Í\¬{v\Ô\Z∂¡F.\…\'ˆû¯\À√é}y¡+\‘\…\÷<≥≤“õCaÖù\“+zG\ ~\ `]1DN$ë\–Ò\÷Ò\—P\¬\Õ!ecÛæ≤´_\⁄P\‚r´±8\ﬂ\r\„Mt\«9ùüæo`r{[≥\€\÷J\Î\'èg]˚H\’˙˝\\]?.˘Œ∏¨ÙfRxaß∂	¿©zõú˚2\’|hBíùh#§>Ñq#õúk\n≤L\'jÆ~q˝\·\“Z-ïè\‘\›:¿I\ÿ\‘A]ü∫o@låπ•kÚ≤oõUæ\Êb∞eí¡\›\·™>\Ì\Œ{_G¿¥\Ït\"\‡\’\‡< É)	L\Ì-ß?\'8ø¿u\Ìã6eï©{#ï\·ñ)\⁄bö>¢\«Ù{\Œ1õÑñlDÙñ\Ê\ﬂ˜T…øæ\‰æ¿ä\Zúì¡õz\Î@˚ºb\⁄9\ÃA\√.Dj©\‘4Ö±∫\⁄˚\ŸwYÛø;t\‰dà\Ã*\n#S\Ó\’\ÌÜ+O=8\◊d&§ä≤ñ>˚°´ ´ü\ÓJ¿;˝Û¸¯«û\⁄u˙\„`~∞;MÑàE\']e\ÂûIñ¯∏V®PéàRnÜ{\√\ÁRn.\’÷ä\›{ò˚˚èDs\ƒYúkÄ˛@∞k£\ﬂ5ºó¢ç⁄®•®\rvm\‘\n\‘ª\”FÃëˇcYu:5˚\–ˆ6\nïÇ:\Ïßy\Î\Â\ÔÖ⁄§]µµ¡ÆçZÅ\⁄`\◊F≠@m∞k£V†6ÿµQ+P\Ï⁄®®\rvm\‘\n\‘ª6jjÉ]µµ¡ÆçZÅ˛»∞kh=Ù¥≠ï6ê˘wj<\‘w\ÏNÛZm!j\ÏB/\0p\n-\÷su\„ç\‘o}Ñ†mØ˛]\œ\nCb¶\⁄B¿õ~GÿÉr\Íp(\≈=Ù∫A∆øÉ>4l´¿\Õ\ÈÇSë˝Ù\„è7˛ÜààÄ¿@;\’\Èr^Ò\Á+l6õ\‡¯Ò\„_|ˆπ\√QmH\ÊCrπ\\˝˙ˆΩt¸´Õ∂a\√˙\ﬂ~˘\’l6\È[•ï_Qídõ\Õ6lÿ∞#G*\'ü\‰gee9ÜJ!E@ Dü\ﬂ˜ú~Ç \Ï€≥g√Ü\r\'KKDQ\‘˚^=8@ñydT\‘ƒ´Æ\Ï÷≠[]∏  \"Jœ°√áÛ\Õf3\0#\Œ\0lQQ˝˙ıãà∞˝¯\√\⁄=ªw4\ËÜoD\∆8\ﬂãà^Ø\'+++/\'«∞3údYéâçÌñûûê`WéoD\ƒcGæ˚Óª≤≤2Ös\0êe)2*z\Ëy\ÁIíw\Î∂\Ì^èá°RdP≠ıAÇ(¶§§ˆ\Ô\ﬂˇ?˝T[[£úJ ñ`\"A4w\Î\÷\ÌökØ)**\\≥jUYYπ(\n\ng@@\ƒïsî)>¡>a\¬¯\Œi]\ËoŸ¥Òã/æ∞E\⁄g^1YˆFFFè\Z3z\‡¡ªv\ÓX˘\…\'âIIóé◊ßO_Ah\∆6\ﬁ0\…2Áúà˛ı\Œ;}˚Ù±\ŸlˆÑÑD{BB|º\›n∑\€\Ì	ÒÒââv\∆p\ﬁ‹πD¥Ò∑\ﬂ.\Z>\‹f≥&\ƒ\«\Î\◊$\⁄UEÒ\Ôªeı\ O\∆_zitttb¢]ø\∆H111]ªv]Ù\‹súÛ\„«éé=:...>.Œûêêòh∑\€Ì±±±\È\È\È+ñ/˜zΩD¥\ÍìO`≥Y}ç\Ëø\'&\⁄cbb∫§u^µr%ºür\Ê¡¸πs;•§\ƒ\ƒ\ƒ\Ë∑\«\«\≈%&\⁄_}Âï™™*\"Z˜\”O£GéÄÒ\„«ù8v,†Yñ8W;\ \Ìv˙\Èö\‰ˆîG\ÎôL¶	\„\«\Ô‹±ÉààsYÚ<∞ƒÖ\√\ÌÒÒ			jg&$$\⁄\Ì\√\Œ:s˙Ù\ƒDï\√;\Ÿ\Ìv{\\llZ\ÁŒèÕö’ªg/{BÇ›û\ÿ}		IââóçˇÛˇ˛7x`õ\Õf∑´˝ñ®çÖ2:ÒÒÒ\—QQü}˙_\"˙\Ë\√”ªvçééVF\ƒÿì\—\—\—=\“”ü}z¡ãûÄ¥¥¥óø\‰Ò∏\ÎvfàDDçI;DD|q—¢∑\ﬁ~ª∞∞0\"\"B©\rÜ\⁄!u\»X≠∂¸!πC˚-€∂m‹º96&\”ƒâO\Z[≠\÷\›{ˆ\"2e≤sô3Å\’-on2ô\ \ \ \ﬁx\Î≠K\«]z\Áùwù8qÇ1\∆‘£X¿\Âr•ßß/z\Ó˘q\∆\Î≥\rµC≠\’m\◊Z-\0.s`\Ãd2efeˇ∞v\Ìÿ±c\Ïv˝.Ep>¸\‡C+V¨®©≠5ôM\0Dú(:&z¡¸\◊\ﬂpÉ\≈bQÆT\ÔÚ\ÌÙ6víR\›n◊≤ñ=˙\Ëtd®û\Œ9\"VVU˝\Â/ô?o^ØﬁΩ@í•m€∂\›}\Á\›ÖJÄ2ä#.∫\ËÚ\À/õˆ\ËtkDÑ˙π\·Aèßsj\ÍïW^˘ÒGWVU2Å){S;G\·ÜsæyÀñ_~\ŸP[S#ä\"p\"D\ÌX[Œï\—a\05.\◊˙\r\Î7m⁄∏\Ê\”OãKJ,0Xâ\ƒ9\"ö\Õ\Êº¸¸oø˚.%%\≈l6\ÁDr3ïu£Jñ\0pÕßüf=z\Âï\ÁŒù;p†_}?Dú2yÚ\'ü|\"0aŸ≤˜\Ó\€◊±cÚ\‰˚\Ôü1sé¶Gƒ∑\ﬂzk˛¸˘è[\—≤,\«\∆\∆:x\»iDO∆ë\√s\Ê\ÃYµzç\◊\Î˘˙ÎØäKJ\ ++_}\È•\·√á\◊\‘\‘»≤\Ÿ-Ω[RR{#z\0¿\·pÃú9Ûâ\'û`/\„\·{\ÓΩ˜\Áı\Î’ö?˙[0\ƒ˜˛ı\Ó\◊_ù_XxÛM7\›r\À-qq±èGM]∫§•§vPè8G \ﬂDÚù´‘∏‡†ùôùï˝øˇ˝T\Î®I\ÈòÚ\Ôˇ[`HDí$%∂K\Í\÷-=**Zi\Õ\·p~˚ı7•\Â•e\Â\Â€∑m<dpÄ∂öÙè˚Ùg]{\Ì5´WØ˘\”%óÃù;w¯àEEE\œ>ÛtiY)\'~`\◊˛Nù”î{âà1\Êp8V|¸Ò\‰)Slëë\0¿VUU5k\Ê\Ã3g\∆\∆\∆Ù\Ã¿ÅKKK≥≥≤\ÊÃù˚\Ã¬ÖæoµÚàòóì3y î\œ>ˇº∂\÷qÚd© å˘¸\ÂT\“\∆ Ñ\ZÖùo\¬i•\—IëC¿XueeMmmtLå>¥\“#ÜªH9FÄ\À<HQ0dL=Û‘ÉVâ˙0d\Ë–Ä\Ô\r˜êœ†kÄàÙß\È≈Ö	@¡Sª§§/º0>°æ2(®ûı\Ì{àﬁñø[F I≤h2ç3\Î\„Yï\ƒ–∏\‘P.3qAE\…H\‹¯h}2 ˙\Ó Y5R1x˝qÉ¯B}úo¿âsüFÚùR\“DôwJ\Ÿ\≈¡ùEıS\"dıP]:\‚ä dA¸h\"\‚\ƒ\—p_dd\‰¸yÛ\ﬁ|\„\rYíî\«q\Œ#\"\"∆é{˚wòL&\‘N\◊`Ç\0\0;wliÒKNßS\—_^è\Áƒâ&AL\Ì\‹)¡ûh`ãÙ˛≥X,?ˇ¸Û\›w\ﬂÕòﬂ©ùRSgÕû›Æ];#∑æg\‡ë¿Hf≥©∫∫˙∫kØ\’$%Ä\«\„Èòú|\√\r7åΩ\‰\Â&El4jìzISê´4\…@\ÍôıäW\ #¢¢£w\Ô\ﬁ˝Ú\‚\À+*D\—\0å±í\‚DL\Ô\ﬁ=≠Kó\Ï\Ï\Ï∑\ﬂzk\ÁŒùVkÑrÚzΩ_râ\À\Âbåc\∆	\‘◊çPH∞\√∆™k\Óö\Ê\∆Ü!¿e\◊\ \–h˝¨)ΩòBf≥y˜û=†\Ë;\0Œπ\≈lô0a¸\ﬂˇ˛wQT¯\'≈∫≤X\Ã;∑oª˘\Ê[\n\nM&ì\¬\Á\‰u{.|vÚî)\‡7π}|ôD1;\'\';7\◊˜.\0ˆ¯Ñ)S&\«\«\«+è\–Mª¿òã\ﬂ\À 0Ø◊ª\Ó\Áü\’9»π\◊+\≈\'ƒèw©Ç9C?4>Ñ≈°\ﬁ\ƒâsƒ∏R˛¿0•\„\‚\‚>]≥\Ê\’%K∂n\€f≥\ŸÙ\œkkkgÕú9k÷¨í\‚\‚\È3f¨Y≥&..Nˇ\÷\ÎıN7n\‡¿õ6o\ÿ\’\⁄¸\rá°I;\ÕXEì\Ã\Âoæ˙z˚÷≠\Ê3\0äÇp`ˇ~Ø\◊\À¸\—\Êc\—¿¨zT C∆ÑÜX76\‰Òx\Œ6¥]R;Iíd\"Yí\r¯\‘SOÅ÷≥∫¥9öq¥]RR◊Æ]€∑oøg\Ô^A$IN\Ô\÷u˙Ù\ÈØº\ §\‡∫\"ô%Y\Íﬁ©{∑Æ]ô ÁÄêîî4i“§~˝\œUê≠\Ÿ˝çîáUÇK≤,ôL¶√áêıpπ\\w\‹q˚5\◊]Ø_\…\0dI◊û\ríˇî\'\0NÑåqèD®~˜5ûìùÌ®©I¥€á\r∫}\ÁN≥\…$\nBˇ~˝&^y\Âùw\›e6õ\ÊÃô≥r\Â\ =zú”ßèh2)\”;55ı©πsΩ∑\”\·0æ8b†ÖS\œK4#	v™Éi6\’\÷T/}u\…\ÏŸ≥-∆ò\Ó\Ô∏\‹\Ón›∫eeeI^/˙t±ê\0@\"Ü®ÇúHµlÇ3\ÍWÑª∂∂ˆâ\'ü\Z3fL}Q\"’ÉHIIπı∂\€oΩ\ÌˆÇ¸¸˚\Ôªo√Øø úwJ\Ì4x´\’\ZÙvÜ\\.˜\ÿ1cûxÚ…∫∂ù¢(9\'ÆX\Óú7 ûààÄ8QLLÙ\ U´Ç\⁄v™á\\CR≤ıM†æzùæPKE2¶wctL\ÃCè<óy\‚ƒÇ˘Û?^æ<2*Jñ\Âõnæ9::∫0?\ﬂ\Ìv@üﬁΩóæˆZJj™\—\√\À\À\ÕU\Ÿ\–5–óØ[\rM®S∞\Ìì^˝ç/æ¸\“l±®!\0\0\ rˇ˛˝ß?˙\Ë\À>¯~\ÌZNêüó∑m\À\Ê\ZáU≠ãQQQôôô\\Û\nC\0DÙx=ªwÏ¨ÆÆD¡b±ú8q¢¢≤R\ÂÒ˜\Ó\ﬁi´©©QB\’\ƒ5kó(1©ù\√\·Rm[m4í;v|u…ík˛˙\◊\ÃÏ¨Øæ˘¶[˜”¶=íúúD\⁄i~FaQ\—∆çø\≈\≈\∆zΩ^Zˇ¢\Ÿl.)*∂ò-\0PS[ªm€∂\‹\‹\\Yñ˝QE&ìπ¨¨4\¬\0nó{˝∫u»òŒ´\÷\Zô-Q\nD ä\‚\Œ;∏,9N\Âu¥z|DQQëCÜc¡-`DqÛ¶çπ\ŸYèWÒ;Ap8Gè\◊z/eªt\Ì:kˆÏå£G˜\Ì€∑kœûY≥f=˜\‹Û\÷\‚\0U\’U[6onw\‚ÑWíÜ2\'ì(ïîTTV\"™áX#\"óÂúú\‹\r?ˇ,äæ£\‘\√\Ìe\Ÿfã\Ï◊øø\‚G7@!\⁄v\0\0˘ys\Á\Õ˚\œ˚\ÔàÿΩ{è›ª,˚£?^n\≈)T]]5bƒàQ#Gˇ\ﬂ\Ô\0\'r9\”ù˛ı∑\ﬂ8N%\Íç\0\»\–bâ\–3w\ﬁ<4Ü¶4åsﬁØo\ﬂ+Æ∏\¬j≥Çn,qéå%w\Ï¯ˆª\Ô\‹y«ù^ØÙ÷õo§tLû<eä\≈X˝D)\«µv\Ì\⁄\Ô◊Æı}Æ\…^∑€ùûû~˜\›wu\Ï\ÿ\—$äáèπ\Ô˛˚ı–†Ú,\Â≤\‰∆è%BMm\Ì5\◊]\Á\"rU\Œ…≤5¸Ç\Œ=˜\\\0àââô9kñès˝ÒDÄx≈Ñ	ˇyˇ}Jàèø˝ˆ[áè∏\0DQåçé!\ŒM¢x\ﬂ˝˜p¢H´u»ê¡˝∞¨Z≠µß^óûû˛\Œ;\Ô¸\Èí?9]\Œe|p\·\\<vå\…l∂oﬂæ{&M™;jDdç∞DGE\'\⁄¿\·tæˇ¡\Ô/˚@ù!ú+°	\"ídy\Ëê!\À?Y\—(\ÏB≤\r}\÷tÉ*a\Ï\ÿ1\√Gw8ù∫è¶kYD®¨¨∏Í™´øÙ\“\»1£Ûx<7\ﬂtÛ\◊\ﬂ~\Ît∫DQ@%\Ïâ\‡v{\Ì˜\ﬁ}7\0rdˇ5wÑ1\∆\r∞b≈ä^={:N_g!ë(äú3gNrrô\ÀKñº˙\Â_\‘\Â\Ÿ◊æ26ä\»9\Áí,ßßw{˝ı\◊&Oô:j‘®é))è«†k\0C∑\◊c∑\€\ÁŒõ;c\÷\ÃÚ≤2∆ê8\◊}&RÜÖ°Wí¨6\€u\◊\\≥b\Â\ {\'M\Í’£ß \\ñ’£JıPq≥\≈r”ç7ºˆ\Êõ»ò=>a…´Ø\ﬁÚ∑[ïo\Ìv˚mw\‹>d`\—$ ≤åÜyDí$ô\Õ\Êã/æx˘äùSS4µZ∞ù@óÆ]\ﬂy˜ì\Ÿlçå|¡á\n\n\n/ªlBJ«énó[üÃ™©ΩÇ\«\ÎMLL¸Ûüˇ|˘Ñ	è[}Eù#¢L\‰ız/;ˆÉó\Ÿ\r\·Ç˙®Ò\“;à∏m\À\Ê≤Úä\⁄wKWcûı]Y]]}¸ÿ±“ì%¢(í:\"\Œ\…l1˜\ËŸ≥]ªˆNßÛƒâ\„E˘Lê!ê¢{\’\"\‚¢ vHNN\Ô\—}\œ\Ó\›?˛É\À\Ìbå! ÁößØπˆØˆƒ§\‚\‚\‚«èïóï˜\Ï’´[zz@Pt\Îñ\Õ\’U’≤,˜\Í›ªsZZ`09\„\»\⁄\Ô÷ñóóä¢`|-E‘ô-\◊^{M\Á\Œi\n\ﬁÛrs˜\Ô\€g±Xê!qà»âºoóÆ]zÙ\ÏYVZ˙\„èk<d6ôÄÄ£z2ï\nÄ˛˝˚_Ò\Á+à®∂¶zÔûΩnó\‘%\≈9B\Œe≥\Ÿ|·àã\ZYñ˚\ÂE\—ø\"\‚∂H[ø˛˝≠\÷Hß£v\ÔﬁΩïï›ªwO\Î\“E\–t¢r˚Å˝˚\ \À\ \‹nO\œﬁΩ\”\“\“r≤≤<h±(g3k\„°†\‰ıvHnﬂß\Ô9n∑gˇæ=µµ≈è\„§\∆r%IééâÓñûn∑\'6∫P{Z*>ÑµBº©°wC.\“\È°S·†•π%}ÙL[°±6jj+4\÷F≠C°\◊\‘Fm6jìvm\‘\n\‘ª6jjÉ]µ˝?©Æı¨\nendstream\nendobj\n4 0 obj\n<< /Type /XObject /Subtype /Form /FormType 1 /Filter /FlateDecode /BBox [0.000000 0.000000 595.276000 14.173228] /Matrix [1 0 0 1 0 0] /Resources << /ProcSet [/PDF /Text /ImageB /ImageC /ImageI] /Font << /F2 5 0 R /F1 3 0 R >> >> /Length 166 >> stream\nxú•è1\¬0Ö˜¸ä7\Í`ºª4¶sA\›\‘l•[± u∞KˇæóB©†j\‡ë\À\„æwó\"b{à•\È ^∞èÜ¨\”s°R]Q7zµ™R\’S$êø\Ô†y-Üö´a\√‚çöõ\\¶`\ÔºÛ\ÿ8≤é$Û±EΩ¬∫A¨R\ﬂQ7\»˝õ\r\Ê¥ˆ\”¯Sâg^~\‡\”g\Œpf98ë|iπ¡\Álô$Y\‹\Á\'?\0&ó[û\nendstream\nendobj\n2 0 obj\n<< /ProcSet [/PDF /Text /ImageB /ImageC /ImageI] /Font << /F1 3 0 R /F2 5 0 R >> /XObject << /XT4 4 0 R /I1 15 0 R >> >>\nendobj\n6 0 obj\n<</Type /Annot /Subtype /Link /Rect [2.835000 1.000000 19.005000 2.156000] /Contents (˛ˇ\0h\0t\0t\0p\0:\0/\0/\0w\0w\0w\0.\0t\0c\0p\0d\0f\0.\0o\0r\0g) /P 13 0 R /NM (0004-0000) /M (D:20160602200051-04\'30\') /F 4 /Border [0 0 0] /A <</S /URI /URI (http://www.tcpdf.org)>> /H /I>>\nendobj\n16 0 obj\n<< /Title (˛ˇ\0C\0o\0n\0s\0t\0a\0n\0c\0i\0a\0 \0d\0e\0 \0R\0e\0s\0i\0d\0e\0n\0c\0i\0a) /Author (˛ˇ\0C\0o\0n\0s\0t\0a\0n\0c\0i\0a\0 \0d\0e\0 \0R\0e\0s\0i\0d\0e\0n\0c\0i\0a) /Subject (˛ˇ\0C\0o\0n\0s\0t\0a\0n\0c\0i\0a\0 \0d\0e\0 \0R\0e\0s\0i\0d\0e\0n\0c\0i\0a) /Keywords (˛ˇ\0C\0o\0n\0s\0t\0a\0n\0c\0i\0a\0 \0d\0e\0 \0R\0e\0s\0i\0d\0e\0n\0c\0i\0a\0 \0T\0C\0P\0D\0F) /Creator (˛ˇ\0T\0C\0P\0D\0F) /Producer (˛ˇ\0T\0C\0P\0D\0F\0 \05\0.\09\0.\01\09\07\0 \0\\(\0h\0t\0t\0p\0:\0/\0/\0w\0w\0w\0.\0t\0c\0p\0d\0f\0.\0o\0r\0g\0\\)) /CreationDate (D:20160602200051-04\'30\') /ModDate (D:20160602200051-04\'30\') /Trapped /False >>\nendobj\n17 0 obj\n<< /Type /Metadata /Subtype /XML /Length 4356 >> stream\n<?xpacket begin=\"Ôªø\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?>\n<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 4.2.1-c043 52.372728, 2009/01/18-15:08:04\">\n	<rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">\n		<rdf:Description rdf:about=\"\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\">\n			<dc:format>application/pdf</dc:format>\n			<dc:title>\n				<rdf:Alt>\n					<rdf:li xml:lang=\"x-default\">Constancia de Residencia</rdf:li>\n				</rdf:Alt>\n			</dc:title>\n			<dc:creator>\n				<rdf:Seq>\n					<rdf:li>Constancia de Residencia</rdf:li>\n				</rdf:Seq>\n			</dc:creator>\n			<dc:description>\n				<rdf:Alt>\n					<rdf:li xml:lang=\"x-default\">Constancia de Residencia</rdf:li>\n				</rdf:Alt>\n			</dc:description>\n			<dc:subject>\n				<rdf:Bag>\n					<rdf:li>Constancia de Residencia</rdf:li>\n				</rdf:Bag>\n			</dc:subject>\n		</rdf:Description>\n		<rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\">\n			<xmp:CreateDate>2016-06-02T20:00:51+04:30</xmp:CreateDate>\n			<xmp:CreatorTool>TCPDF</xmp:CreatorTool>\n			<xmp:ModifyDate>2016-06-02T20:00:51+04:30</xmp:ModifyDate>\n			<xmp:MetadataDate>2016-06-02T20:00:51+04:30</xmp:MetadataDate>\n		</rdf:Description>\n		<rdf:Description rdf:about=\"\" xmlns:pdf=\"http://ns.adobe.com/pdf/1.3/\">\n			<pdf:Keywords>Constancia de Residencia TCPDF</pdf:Keywords>\n			<pdf:Producer>TCPDF 5.9.197 (http://www.tcpdf.org)</pdf:Producer>\n		</rdf:Description>\n		<rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\">\n			<xmpMM:DocumentID>uuid:efbcec7a-62f5-d6a5-bae4-bceffe50a0c5</xmpMM:DocumentID>\n			<xmpMM:InstanceID>uuid:efbcec7a-62f5-d6a5-bae4-bceffe50a0c5</xmpMM:InstanceID>\n		</rdf:Description>\n		<rdf:Description rdf:about=\"\" xmlns:pdfaExtension=\"http://www.aiim.org/pdfa/ns/extension/\" xmlns:pdfaSchema=\"http://www.aiim.org/pdfa/ns/schema#\" xmlns:pdfaProperty=\"http://www.aiim.org/pdfa/ns/property#\">\n			<pdfaExtension:schemas>\n				<rdf:Bag>\n					<rdf:li rdf:parseType=\"Resource\">\n						<pdfaSchema:namespaceURI>http://ns.adobe.com/pdf/1.3/</pdfaSchema:namespaceURI>\n						<pdfaSchema:prefix>pdf</pdfaSchema:prefix>\n						<pdfaSchema:schema>Adobe PDF Schema</pdfaSchema:schema>\n					</rdf:li>\n					<rdf:li rdf:parseType=\"Resource\">\n						<pdfaSchema:namespaceURI>http://ns.adobe.com/xap/1.0/mm/</pdfaSchema:namespaceURI>\n						<pdfaSchema:prefix>xmpMM</pdfaSchema:prefix>\n						<pdfaSchema:schema>XMP Media Management Schema</pdfaSchema:schema>\n						<pdfaSchema:property>\n							<rdf:Seq>\n								<rdf:li rdf:parseType=\"Resource\">\n									<pdfaProperty:category>internal</pdfaProperty:category>\n									<pdfaProperty:description>UUID based identifier for specific incarnation of a document</pdfaProperty:description>\n									<pdfaProperty:name>InstanceID</pdfaProperty:name>\n									<pdfaProperty:valueType>URI</pdfaProperty:valueType>\n								</rdf:li>\n							</rdf:Seq>\n						</pdfaSchema:property>\n					</rdf:li>\n					<rdf:li rdf:parseType=\"Resource\">\n						<pdfaSchema:namespaceURI>http://www.aiim.org/pdfa/ns/id/</pdfaSchema:namespaceURI>\n						<pdfaSchema:prefix>pdfaid</pdfaSchema:prefix>\n						<pdfaSchema:schema>PDF/A ID Schema</pdfaSchema:schema>\n						<pdfaSchema:property>\n							<rdf:Seq>\n								<rdf:li rdf:parseType=\"Resource\">\n									<pdfaProperty:category>internal</pdfaProperty:category>\n									<pdfaProperty:description>Part of PDF/A standard</pdfaProperty:description>\n									<pdfaProperty:name>part</pdfaProperty:name>\n									<pdfaProperty:valueType>Integer</pdfaProperty:valueType>\n								</rdf:li>\n								<rdf:li rdf:parseType=\"Resource\">\n									<pdfaProperty:category>internal</pdfaProperty:category>\n									<pdfaProperty:description>Amendment of PDF/A standard</pdfaProperty:description>\n									<pdfaProperty:name>amd</pdfaProperty:name>\n									<pdfaProperty:valueType>Text</pdfaProperty:valueType>\n								</rdf:li>\n								<rdf:li rdf:parseType=\"Resource\">\n									<pdfaProperty:category>internal</pdfaProperty:category>\n									<pdfaProperty:description>Conformance level of PDF/A standard</pdfaProperty:description>\n									<pdfaProperty:name>conformance</pdfaProperty:name>\n									<pdfaProperty:valueType>Text</pdfaProperty:valueType>\n								</rdf:li>\n							</rdf:Seq>\n						</pdfaSchema:property>\n					</rdf:li>\n				</rdf:Bag>\n			</pdfaExtension:schemas>\n		</rdf:Description>\n	</rdf:RDF>\n</x:xmpmeta>\n<?xpacket end=\"w\"?>\nendstream\nendobj\n18 0 obj\n<< /Type /Catalog /Version /1.7 /Pages 1 0 R /Names << >> /ViewerPreferences << /Direction /L2R >> /PageLayout /SinglePage /PageMode /UseNone /OpenAction [7 0 R /FitH null] /Metadata 17 0 R /Lang (˛ˇ\0e\0s) >>\nendobj\nxref\n0 19\n0000000000 65535 f \n0000012818 00000 n \n0000029954 00000 n \n0000012897 00000 n \n0000029510 00000 n \n0000013003 00000 n \n0000030090 00000 n \n0000000015 00000 n \n0000000465 00000 n \n0000002545 00000 n \n0000002996 00000 n \n0000005946 00000 n \n0000006398 00000 n \n0000009348 00000 n \n0000009818 00000 n \n0000013114 00000 n \n0000030362 00000 n \n0000030846 00000 n \n0000035285 00000 n \ntrailer\n<< /Size 19 /Root 18 0 R /Info 16 0 R /ID [ <efbcec7a62f5d6a5bae4bceffe50a0c5> <efbcec7a62f5d6a5bae4bceffe50a0c5> ] >>\nstartxref\n35509\n%%EOF\n');
/*!40000 ALTER TABLE `registro_evidencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registropagos`
--

DROP TABLE IF EXISTS `registropagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registropagos` (
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
  KEY `ID_Responsable_idx` (`ID_Responsable`),
  CONSTRAINT `ID_Pago` FOREIGN KEY (`ID_Pagos`) REFERENCES `pagos` (`idPagos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ID_Responsable_registrospagos_FK` FOREIGN KEY (`ID_Responsable`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registropagos`
--

LOCK TABLES `registropagos` WRITE;
/*!40000 ALTER TABLE `registropagos` DISABLE KEYS */;
INSERT INTO `registropagos` VALUES (1,9,2000.00,'2016-08-08 00:00:00',4,'2016-08-07 20:05:40',1,'venezuela','\0'),(2,10,2000.00,'2016-08-15 00:00:00',1,'2016-08-15 00:57:47',1,'mercantil','\0'),(3,10,2000.00,'2016-08-14 00:00:00',1,'2016-08-15 00:58:11',2,'venezuela','\0');
/*!40000 ALTER TABLE `registropagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semestre`
--

DROP TABLE IF EXISTS `semestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semestre` (
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
  KEY `ID_Configuracion_semestre_FK_idx` (`id_configuracion`),
  CONSTRAINT `ID_Configuracion_semestre_FK` FOREIGN KEY (`id_configuracion`) REFERENCES `configuraciones` (`IDConfiguracion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ID_UsuarioModificacion` FOREIGN KEY (`IDUsuarioModificacion`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semestre`
--

LOCK TABLES `semestre` WRITE;
/*!40000 ALTER TABLE `semestre` DISABLE KEYS */;
/*!40000 ALTER TABLE `semestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudes`
--

DROP TABLE IF EXISTS `solicitudes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitudes` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudes`
--

LOCK TABLES `solicitudes` WRITE;
/*!40000 ALTER TABLE `solicitudes` DISABLE KEYS */;
INSERT INTO `solicitudes` VALUES (1,'2016-08-02 00:00:00','2016-08-02 17:49:23','','impresiones de diplomas','','','giulliano torres','Gabriel Aparcero','2016-08-02 19:22:33','2016-08-02 19:22:33',''),(2,'2016-08-02 00:00:00','2016-08-02 00:00:00','','impresiones de diplomas','','','giulliano torres','Gabriel Aparcero','2016-08-02 19:22:33','2016-08-02 19:22:33',''),(3,'2016-08-02 00:00:00','2016-08-02 00:00:00','','impresiones de diplomas','','','giulliano torres','Gabriel Aparcero','2016-08-02 19:22:33','2016-08-02 19:22:33',''),(4,'2016-08-02 00:00:00','2016-08-02 00:00:00','','impresiones de diplomas','','','giulliano torres','Gabriel Aparcero','2016-08-02 19:22:33','2016-08-02 19:22:33',''),(5,'2016-08-02 00:00:00','2016-08-02 00:00:00','','impresiones de diplomas','','','giulliano torres','Gabriel Aparcero','2016-08-02 19:22:33','2016-08-02 19:22:33','\0'),(6,'2016-08-02 00:00:00','2016-08-02 00:00:00','','impresiones de diplomas','','','giulliano torres','Gabriel Aparcero','2016-08-02 19:22:33','2016-08-02 19:22:33',''),(7,'2016-08-02 00:00:00','2016-08-02 00:00:00','','impresiones de diplomas','','','giulliano torres','Gabriel Aparcero','2016-08-02 19:22:33','2016-08-02 19:22:33',''),(8,'2016-08-02 00:00:00','2016-08-02 00:00:00','','impresiones de diplomas','','','giulliano torres','Gabriel Aparcero','2016-08-02 19:22:33','2016-08-02 19:22:33',''),(9,'2016-08-02 00:00:00','2016-08-02 00:00:00','','impresiones de diplomas','','','giulliano torres','Gabriel Aparcero','2016-08-02 19:22:33','2016-08-02 19:22:33',''),(10,'2016-08-02 00:00:00','2016-08-02 00:00:00','','impresiones de diplomas','','','giulliano torres','Gabriel Aparcero','2016-08-02 19:22:33','2016-08-02 19:22:33',''),(11,'2016-08-02 00:00:00','2016-08-02 00:00:00','','impresiones de diplomas','','','giulliano torres','Gabriel Aparcero','2016-08-02 19:22:33','2016-08-02 19:22:33',''),(12,'2016-08-02 00:00:00','2016-08-02 00:00:00','','impresiones de diplomas','','','giulliano torres','Gabriel Aparcero','2016-08-02 19:22:33','2016-08-02 19:22:33',''),(13,'2016-08-02 00:00:00','2016-08-02 00:00:00','','impresiones de diplomas','','','giulliano torres','Gabriel Aparcero','2016-08-02 19:22:33','2016-08-02 19:22:33',''),(14,'2016-08-02 00:00:00','2016-08-02 00:00:00','','impresiones de diplomas','','','giulliano torres','Gabriel Aparcero','2016-08-02 19:22:33','2016-08-02 19:22:33',''),(15,'2016-08-02 00:00:00','2016-08-02 00:00:00','','impresiones de diplomas','','','giulliano torres','Gabriel Aparcero','2016-08-02 19:22:33','2016-08-02 19:22:33',''),(16,'2016-08-02 00:00:00','2016-08-02 00:00:00','','impresiones de diplomas','','','giulliano torres','Gabriel Aparcero','2016-08-02 19:22:33','2016-08-02 19:22:33','');
/*!40000 ALTER TABLE `solicitudes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_interesados`
--

DROP TABLE IF EXISTS `temp_interesados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_interesados` (
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
  KEY `ID_Responsable_idx` (`ID_Responsable`),
  CONSTRAINT `ID_Responsable` FOREIGN KEY (`ID_Responsable`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_interesados`
--

LOCK TABLES `temp_interesados` WRITE;
/*!40000 ALTER TABLE `temp_interesados` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_interesados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_interesadosdf`
--

DROP TABLE IF EXISTS `temp_interesadosdf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_interesadosdf` (
  `idtemp_interesadosDF` int(11) NOT NULL AUTO_INCREMENT,
  `idTemp_Interesados` int(11) DEFAULT NULL,
  `iddiplomados` int(11) DEFAULT NULL,
  `idformaciones` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtemp_interesadosDF`),
  KEY `ID_Diplomado_TempDF_FK_idx` (`iddiplomados`),
  KEY `ID_Formacion_TempDF_FK_idx` (`idformaciones`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_interesadosdf`
--

LOCK TABLES `temp_interesadosdf` WRITE;
/*!40000 ALTER TABLE `temp_interesadosdf` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_interesadosdf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo` (
  `idTipo` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Activo` bit(1) NOT NULL,
  `Eliminado` bit(1) NOT NULL,
  PRIMARY KEY (`idTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES (1,'Presencial','','\0');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipopagos`
--

DROP TABLE IF EXISTS `tipopagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipopagos` (
  `idTipoPagos` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Activo` bit(1) NOT NULL,
  `Eliminado` bit(1) NOT NULL,
  PRIMARY KEY (`idTipoPagos`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipopagos`
--

LOCK TABLES `tipopagos` WRITE;
/*!40000 ALTER TABLE `tipopagos` DISABLE KEYS */;
INSERT INTO `tipopagos` VALUES (1,'Pago Completo','','\0'),(2,'Pago En Cuotas','','\0');
/*!40000 ALTER TABLE `tipopagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
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
  KEY `id_usuario_idx` (`idusuariomodificacion`),
  CONSTRAINT `id_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `perfiles` (`idperfiles`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `id_usuario` FOREIGN KEY (`idusuariomodificacion`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,14,'Giulliano','Torres','gtorres','gtorres',NULL,NULL,'','\0'),(2,14,'gabriel','aparcero','gabo','vocem.2016',NULL,NULL,'','\0'),(3,14,'Helena','Lynch','Hlynch','hilshils',NULL,NULL,'','\0'),(4,13,'Prueba Finanza','sistemas','pfinanza','finanza','2016-08-06 11:38:27',1,'','\0'),(5,16,'Prueba Academica','sistemas','pacademica','academica','2016-08-06 11:46:43',1,'','\0');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-03 12:51:47
