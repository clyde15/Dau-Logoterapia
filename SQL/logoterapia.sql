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
INSERT INTO `alumnos` VALUES (1,'alumno1','prueba','12345678','caricuao','04241394098',NULL,'prueba@prueba.com','prueba','1992-03-08 00:00:00','','\0'),(2,'alumno2','prueba2','1234567','caño amarillo','0424694460',NULL,'prueba2@prueba.com','prueba2','1991-02-01 00:00:00','','\0'),(3,'alumno3','prueba3','12345678','la guaira','04241234567',NULL,'prueba3@prueba3.com','prueba3','1990-04-02 00:00:00','','\0');
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
INSERT INTO `registro_evidencias` VALUES (7,'recibo Factura Impresiones',1,'%PDF-1.7\n%\�\�\�\�\n7 0 obj\n<< /Type /Page /Parent 1 0 R /LastModified (D:20160602200051-04\'30\') /Resources 2 0 R /MediaBox [0.000000 0.000000 595.276000 841.890000] /CropBox [0.000000 0.000000 595.276000 841.890000] /BleedBox [0.000000 0.000000 595.276000 841.890000] /TrimBox [0.000000 0.000000 595.276000 841.890000] /ArtBox [0.000000 0.000000 595.276000 841.890000] /Contents 8 0 R /Rotate 0 /Group << /Type /Group /S /Transparency /CS /DeviceRGB >> /PZ 1 >>\nendobj\n8 0 obj\n<</Filter /FlateDecode /Length 2009>> stream\nx�\�\\\�r\�\�\�\�+ziW)0\�{ESP.])��\�\�e1F̨@�J9w?\��Yf\�Eʻ�\�3A�e��,@�$�\�c\0L\��\�\�=C��\����\n\��u?��o!�~\�\�d\�\�^j���*`|�xOݸ�^mx�n\�=��-V�7>\�\�\�\�\�h�\�\�L�^�{l\�\�{���_�\rc�\�uC�\�p�Sx\�u���\�y�=\�T4\�\�u�\�?˶O�,Ӏ\�V\\K�\r\n#�\���k�\�\�|�ֵ\��\�ګlb���\�eԴ��\�.\�\�e*�g\������k\�\�M\�,\�D��W=\r�\Z\�ץ\�\�ܺ6\�}��w2��\������b��\�\�=0ߧ;��~�5׽y[4{k4\�lT=��*�c��\��v�m�w\�L\0O��I�\�~\�3���\�*��ښ	�c�O�\"��C�\�Ew\��;�n�>�Q\��K/��;\����h�S�=8B=G�,\�\�\���c\���tZ\�S<\�Y�~(���X�%.\�U-E�\�\n��٪�\�c\�j� ��\r��_\r��\�\�S��!O��$�à?\�6\��\���\�2\�R�\�M7L�@\�\�\�\�]q\�\�Du�0\�PL57�\�*\�(�ه��\�ި7�^\�׹��g=\0\�\�%x�:\�\'$!Hy\��\�C�X\��8\�H0\"Vi\�B*�h\n�c\�&$ゴg	Mi��H�ɖ��\"��v�Q\�B\�\�\�}\�b��Mp��F�=�B]\�<\��1r�{-�%z�Z\0�g\�6zA�3f�\"�bŪ\�M:e\�H)\�x\��,\�蔼i��\\�\'�\��E��H�v`[�}��a�ܢN�MO�!ۏ#8tO��>\�c�\�Ν\�-UѴ[o\"\\\�)�\�\�/�\�8���}�_oƟi����\�z�\�~�AA\�PP�$�!� %\\�p/>G�.o=�4�\�\�^{�g/�\�\�$�ଐO�\�\"�\��>gHn�Ď�¤\����\�U�!��:	�R�~\�:\�3\�[w�$\�j�M\�i�`\���A�n\��`l�ߗq�^p|�΅s��#\�xJ��Ir\� z��\�A�c����\�\�\n�?Ѐ\�<m1][L[��a#,�Q���L8Rn�t;CL3�Z��yr��\0\��&\�\�1�~L誦E~\�H�\"\��=�-ר\��F4\�&bO�$�\�c2��}��\�:n?\��g\�/W,�.H����9\�L1΍\�^\�0��\�Ha{\�&9�\�\�\���&��\�hH�s�7\�c\�Z �Z�\�\�\���Jz�\Z\�$��3�\0�j�s\�0m�s�@x\�<��} \�\�,aW\"�	�O���,�AȐ_�\�ܭ��N\\\�~í��\�y\�\�\r�U-+Ȗj�\�\�\�%�\�T*\�\'\�A\�?\��D��-\"\�յݷ6�1Kq��\�K>_�\�\�\�Ъ��$�\�\"��\�z\�,\"1��R\�2\�:g\��\nj�E51�{�VkN	ٴ\�\�K\�ו\�\�j\�\�	\��Y�\�ƖPu\�RL��D�N\�\�V\�S\�(NR�q!�QR�\�G*G\�	\����P\�i\�&�fV3�Ә��\r�H$�J�+U1?!�0\�[H]$���\�RZ�����Fן��j\�W��}a��y\�~bH����rpD\���\�	�H\�~z�B�m\�k\�8\�~�m��+�\�eT*J�����gQ,G\�`�U^BS�+)\�\�3\"#ë\�}��\�\�G䅕\�12\Z�\�P��\n�<�|5c�׉7In`�5:�/(��/Ʉ\�E^�/\��ʾV)>���x\�\�4!�5\�U�Qy>0��l9Ŷ\�c\�\�˖�X�wk\�&��U8���OI�N@\��\'\�\�\�}9����Q�\��<�\�~\��4\�e�Ͱ�5\\목h\�m�Z�\�7\�\��2\Z�\�D ����\�6�[�51=\0Lkp��h�\�-�\rB�Vf�\�x$�E�\��h�\�2Tųs��j�\�yx=)\0�4��թ�\�\�I\�T�S}ݩP\ZV�\�\"f:�\\\n�\�tW\�v\�ںӓu\'ͫƨ]�ey?�\��\���\���\Z\�)%YNN\�t牤$媑m(��[%U\�ϻ�i����\��\��GX�0��\�~<�\����\�s2\Z@\0ǝ��\��\������w\��/�\�y�\�j\��*��\�P�.�����\�y�\�;>�c�5\�\�a\��h\�/�\Z���C\n�\���E��O�\�\�~z\�:V\�\�\�\��\�V\�\�\���\0���k\nendstream\nendobj\n9 0 obj\n<< /Type /Page /Parent 1 0 R /LastModified (D:20160602200051-04\'30\') /Resources 2 0 R /MediaBox [0.000000 0.000000 595.276000 841.890000] /CropBox [0.000000 0.000000 595.276000 841.890000] /BleedBox [0.000000 0.000000 595.276000 841.890000] /TrimBox [0.000000 0.000000 595.276000 841.890000] /ArtBox [0.000000 0.000000 595.276000 841.890000] /Contents 10 0 R /Rotate 0 /Group << /Type /Group /S /Transparency /CS /DeviceRGB >> /PZ 1 >>\nendobj\n10 0 obj\n<</Filter /FlateDecode /Length 2878>> stream\nx�\�]\�r\�J\Z\��)zyR�;\�V_$�F\�Q��-cW��S��8�\��\�ɣ\�k\�nv�<�Ye�\�t-��/H�]N\0��������E\Z�\\?\�\��[��O��⿞�;\�\�]���A-�\�\��\�hn��\roW@\�����\�!G�s���\�w]\Z����}��-`2���Xi8=��\�f/\�\�7?�+��\�*>\�4�I�\rD!3)\�\r�\�<�{\���\nD5&�+`Du%����Ccv�ր&\\��\�\�9\�xk1/W�vc\�-�Lt\�2\�dzΡaB�e��9Ŭ3щ\�0k�s1�d\�0\���`VԼ��5\Z��\�9\�]Q3\�La�wK\�\n\�Q�\�vF\�s\�ۭf���\�b<��/S��`V��}��\��Y՜w8�\�\�\"ē7\�\�e=\�+�\�FI�ނy\",�趓�2�1)\Zp���\��\����v5��,��\�Z�����\r��\"3���\�Qp\�p���� �6�e/(|\�H�v�\�j�\�;\'�\�\�2\���o\��SD\rȉƐ,_\�\'�,\�v{\��\�\��E\�j\�4l\�\�NÖ\�^��oe��l\�-\�?;CM)M?��S���S��\�L���\�\�o�\nDg�\�Tޢ�Q�M6�\�Ә&�\�\ZS(��\�BxUd�M�\"��8��^Ơ\�v\�U\�o���\�3Z�y\"���4I5\r���]���T�\���Lv`�tJr�7#�k��\�\�\�-p\�i:W�\�X\�\�A^\�m�å\�|�\�b��;��:\�\nkꝖs\���=��N���\�u\�\�i���n\��nǵ�{\�\�@+D�B�6\��2�\�1x�s\Z�3NW�\�:s�{�\�B+��B�6\�f\Z+Ӻl;u\�\�ti:Ƕ+�\���\�5\�,Q�l#xҰ\ZK�љ庝�Kgo_r�b@�F��\r\�F13v	/\�:�K��\�4��ͿT�rf�l۳�R\�]1*�kPgH\�t\��&t�>�	���\���\�iuD�\�\�/�\�]�?\Z{Q/A!�\��(H@/\0npG�׋P��}�a\�7^�ķ\�Л٫\Z��\�o\�XQ��便�Yl\"�4fbCq�x\"�y�W�p$İ�.\��0��	I\r\��\�D��/�Q絛�~\�{=O\n�\��\'�\�\�C�v\'I7����V1��lJW�ƨ>#\�q\��zI\�E�yD��q �~�c\�Ǒ�dn\���%\�n�`D���FA*h��{BxQ\��\�u��\�T��	a��TX�(1+��֕c��j\�ﬆxq\�io>\�ҡt\r\�$LX�6g[V��\�B�h\n#\�\n+:E87Y�i_�<?�#�\n\�V���9a\0\�<W�i=�Ӵ\�-\�\'��C\r\�P�\�\�(\�a�;;\��\�\�䛰\'lU�ea\�+�hj�L\�W�!2�f0S���	3!e3��\r��8����\�=\�d�4yl�\�[��s+��p��;\�K\�j\�m�5\�z\�r�i�\�\0�P\nV\r�T�i�\��\��T��\�䐛�-W�\'��k�ie\�z�Jj�b���\�/ާp�:�\�q2)U ���4��\��\�\�0���0	|�Z;\�B6ɁJ؍L}\rAS\�pƝ\�\�4\�S�?\�\�\�&��X\��U\�Z�iR^Q��	$q��\�r\�\'.�\�\�\�<��]*�MlRH�\�\�\�fJ\��1\�r)�>øZ��\�\'/\n�{iɨ�\�$Ȅ&eX\�ub\�Mpj�rƫP�ul5�\�\�.\�2�9��v�Ụ,S\�\�Q��\�]$A���sqU��BT�\�,DZI.\Z:D�\�J�\�@\�VTHS��f�|�/[2m��\�#fT���!_�ퟃ �e\�\�\r������z\�\r9i�L\�׫FfH0\0��T-�H�\�S�y}4N� A?�G\��\�G�I�J�\�\����kw\��i����\�t[�ӄ�N��\��\Zh\�PF\�\�\Z\���hT��l>��f\�X\�=��LTl\�=	ڑ]� b9\�!�\�¥F\�txy�x�\��\�A�\�\�Ynx������2�x\�I�Q�\�F�\�x9�/�7��^{�8	�ӥ���.�\���\'�r\rkv)��Cl�k}\�o(S\�\�5\r$��X\�<\��X\�\���0H@�H�n\�D\�\�Qf�}|��8v\����xqW\�\�+\��p-\�N\�Q\�\�7��z\�ޫ?\���O\�\�u�I|vǹoN�\�g<�a+>���\�_��q?6@A~\�\�\r6�j5�\�\�	lF�\�ب��� \�\��\\	0\�:5<�\�:5mN�\�\�I�gO¡\���\�\�\\\�\�\�+�5���.㋶��{*�7�T\�M�g�Bź�L惹�PƦ� e0e�*\�\�ўn\�\�=\�֥\�P[�%�~J\�ލ\\�\��lS�\�ٶ.\�(�Le[Gz\�ƴ��[\�ڙt]\�8\�I\�]��\�W�7�?�Ȥ���\�t�e\0\�\�\n\�4��\�=\0_媵\��$\���$\�r����\�\�\�\n�d��2k3\'U�\�r�k\\K\�\�t\�(�I[1�Ԃ\�&�\\\��\�Z@\�@Z\�\0�`8\Z\�\��\�:_y\�&	�\n�\��\�v�\�_�hu��\�{��\�=v�\���/-$޽����$�\� .o*-\�����=O�rli`W&\�(� �\�Z!A��\�l�yQ�I\�\�|�3^b�o�Cf,\\��\�h�M�v1$�I��\�;\�\�ϓ셽C�\\Ύg\'%աa\���-7)\r�B\�U\�Ѐ\'ڽeט��\�\na�+L]��	�U�B��;�l\r\�X.��C���\�p����o(#��Ց�:\��x^cd,���\n1gƨ\�\nї���T\�\�Ũ�7�e���(�\�H\�\�=�I��,�Kk2͚�7\�ߗ\�H\��}/	��8��^�Q	�;��\"��\��v�\�\�9�\ZZ�|���>������I\�媁\�k߆��˽T�x);���r\�O�Z���Z�[�k���k2p9���X�X�Yv�b\�\0{\�铗s`-\Z��\�*�)R6_\�\�R\"������ �\�N�aw2�mI@~R���{u\�\�\�v�����\�hZ�~wf7��ݣ9\�g�}a��6Pn_�w���\�M����ku/�\�\�坫\�m�9�^���7roq�\�8X\�+q�\�\���<w3����?~x9\nendstream\nendobj\n11 0 obj\n<< /Type /Page /Parent 1 0 R /LastModified (D:20160602200051-04\'30\') /Resources 2 0 R /MediaBox [0.000000 0.000000 595.276000 841.890000] /CropBox [0.000000 0.000000 595.276000 841.890000] /BleedBox [0.000000 0.000000 595.276000 841.890000] /TrimBox [0.000000 0.000000 595.276000 841.890000] /ArtBox [0.000000 0.000000 595.276000 841.890000] /Contents 12 0 R /Rotate 0 /Group << /Type /Group /S /Transparency /CS /DeviceRGB >> /PZ 1 >>\nendobj\n12 0 obj\n<</Filter /FlateDecode /Length 2878>> stream\nx�\�]\�r\�J\Z\��)zyR�;\�V_$�F\�Q��-cW��S��8�\��\�ɣ\�k\�nv�<�Ye�\�t-��/H�]N\0��������E\Z�\\?\�\��[��O��⿞�;\�\�]���A-�\�\��\�hn��\roW@\�����\�!G�s���\�w]\Z����}��-`2���Xi8=��\�f/\�\�7?�+��\�*>\�4�I�\rD!3)\�\r�\�<�{\���\nD5&�+`Du%����Ccv�ր&\\��\�\�9\�xk1/W�vc\�-�Lt\�2\�dzΡaB�e��9Ŭ3щ\�0k�s1�d\�0\���`VԼ��5\Z��\�9\�]Q3\�La�wK\�\n\�Q�\�vF\�s\�ۭf���\�b<��/S��`V��}��\��Y՜w8�\�\�\"ē7\�\�e=\�+�\�FI�ނy\",�趓�2�1)\Zp���\��\����v5��,��\�Z�����\r��\"3���\�Qp\�p���� �6�e/(|\�H�v�\�j�\�;\'�\�\�2\���o\��SD\rȉƐ,_\�\'�,\�v{\��\�\��E\�j\�4l\�\�NÖ\�^��oe��l\�-\�?;CM)M?��S���S��\�L���\�\�o�\nDg�\�Tޢ�Q�M6�\�Ә&�\�\ZS(��\�BxUd�M�\"��8��^Ơ\�v\�U\�o���\�3Z�y\"���4I5\r���]���T�\���Lv`�tJr�7#�k��\�\�\�-p\�i:W�\�X\�\�A^\�m�å\�|�\�b��;��:\�\nkꝖs\���=��N���\�u\�\�i���n\��nǵ�{\�\�@+D�B�6\��2�\�1x�s\Z�3NW�\�:s�{�\�B+��B�6\�f\Z+Ӻl;u\�\�ti:Ƕ+�\���\�5\�,Q�l#xҰ\ZK�љ庝�Kgo_r�b@�F��\r\�F13v	/\�:�K��\�4��ͿT�rf�l۳�R\�]1*�kPgH\�t\��&t�>�	���\���\�iuD�\�\�/�\�]�?\Z{Q/A!�\��(H@/\0npG�׋P��}�a\�7^�ķ\�Л٫\Z��\�o\�XQ��便�Yl\"�4fbCq�x\"�y�W�p$İ�.\��0��	I\r\��\�D��/�Q絛�~\�{=O\n�\��\'�\�\�C�v\'I7����V1��lJW�ƨ>#\�q\��zI\�E�yD��q �~�c\�Ǒ�dn\���%\�n�`D���FA*h��{BxQ\��\�u��\�T��	a��TX�(1+��֕c��j\�ﬆxq\�io>\�ҡt\r\�$LX�6g[V��\�B�h\n#\�\n+:E87Y�i_�<?�#�\n\�V���9a\0\�<W�i=�Ӵ\�-\�\'��C\r\�P�\�\�(\�a�;;\��\�\�䛰\'lU�ea\�+�hj�L\�W�!2�f0S���	3!e3��\r��8����\�=\�d�4yl�\�[��s+��p��;\�K\�j\�m�5\�z\�r�i�\�\0�P\nV\r�T�i�\��\��T��\�䐛�-W�\'��k�ie\�z�Jj�b���\�/ާp�:�\�q2)U ���4��\��\�\�0���0	|�Z;\�B6ɁJ؍L}\rAS\�pƝ\�\�4\�S�?\�\�\�&��X\��U\�Z�iR^Q��	$q��\�r\�\'.�\�\�\�<��]*�MlRH�\�\�\�fJ\��1\�r)�>øZ��\�\'/\n�{iɨ�\�$Ȅ&eX\�ub\�Mpj�rƫP�ul5�\�\�.\�2�9��v�Ụ,S\�\�Q��\�]$A���sqU��BT�\�,DZI.\Z:D�\�J�\�@\�VTHS��f�|�/[2m��\�#fT���!_�ퟃ �e\�\�\r������z\�\r9i�L\�׫FfH0\0��T-�H�\�S�y}4N� A?�G\��\�G�I�J�\�\����kw\��i����\�t[�ӄ�N��\��\Zh\�PF\�\�\Z\���hT��l>��f\�X\�=��LTl\�=	ڑ]� b9\�!�\�¥F\�txy�x�\��\�A�\�\�Ynx������2�x\�I�Q�\�F�\�x9�/�7��^{�8	�ӥ���.�\���\'�r\rkv)��Cl�k}\�o(S\�\�5\r$��X\�<\��X\�\���0H@�H�n\�D\�\�Qf�}|��8v\����xqW\�\�+\��p-\�N\�Q\�\�7��z\�ޫ?\���O\�\�u�I|vǹoN�\�g<�a+>���\�_��q?6@A~\�\�\r6�j5�\�\�	lF�\�ب��� \�\��\\	0\�:5<�\�:5mN�\�\�I�gO¡\���\�\�\\\�\�\�+�5���.㋶��{*�7�T\�M�g�Bź�L惹�PƦ� e0e�*\�\�ўn\�\�=\�֥\�P[�%�~J\�ލ\\�\��lS�\�ٶ.\�(�Le[Gz\�ƴ��[\�ڙt]\�8\�I\�]��\�W�7�?�Ȥ���\�t�e\0\�\�\n\�4��\�=\0_媵\��$\���$\�r����\�\�\�\n�d��2k3\'U�\�r�k\\K\�\�t\�(�I[1�Ԃ\�&�\\\��\�Z@\�@Z\�\0�`8\Z\�\��\�:_y\�&	�\n�\��\�v�\�_�hu��\�{��\�=v�\���/-$޽����$�\� .o*-\�����=O�rli`W&\�(� �\�Z!A��\�l�yQ�I\�\�|�3^b�o�Cf,\\��\�h�M�v1$�I��\�;\�\�ϓ셽C�\\Ύg\'%աa\���-7)\r�B\�U\�Ѐ\'ڽeט��\�\na�+L]��	�U�B��;�l\r\�X.��C���\�p����o(#��Ց�:\��x^cd,���\n1gƨ\�\nї���T\�\�Ũ�7�e���(�\�H\�\�=�I��,�Kk2͚�7\�ߗ\�H\��}/	��8��^�Q	�;��\"��\��v�\�\�9�\ZZ�|���>������I\�媁\�k߆��˽T�x);���r\�O�Z���Z�[�k���k2p9���X�X�Yv�b\�\0{\�铗s`-\Z��\�*�)R6_\�\�R\"������ �\�N�aw2�mI@~R���{u\�\�\�v�����\�hZ�~wf7��ݣ9\�g�}a��6Pn_�w���\�M����ku/�\�\�坫\�m�9�^���7roq�\�8X\�+q�\�\���<w3����?~x9\nendstream\nendobj\n13 0 obj\n<< /Type /Page /Parent 1 0 R /LastModified (D:20160602200051-04\'30\') /Resources 2 0 R /MediaBox [0.000000 0.000000 595.276000 841.890000] /CropBox [0.000000 0.000000 595.276000 841.890000] /BleedBox [0.000000 0.000000 595.276000 841.890000] /TrimBox [0.000000 0.000000 595.276000 841.890000] /ArtBox [0.000000 0.000000 595.276000 841.890000] /Contents 14 0 R /Rotate 0 /Group << /Type /Group /S /Transparency /CS /DeviceRGB >> /Annots [ 6 0 R ] /PZ 1 >>\nendobj\n14 0 obj\n<</Filter /FlateDecode /Length 2928>> stream\nx�\�]\�r\�J\Z\��)z�TᎺ\�ɫ�AN�\�`\�ؕ��S�d!;�\�\�ɣ\�k\�nv�<�Ye�\�t-��/H\0.�\�H\���\�\�\�\� \�x�;���\��O��⿮x�\�\�\�xw�\0Ҡ��@\�\n؝=\�\�\rq�\�\��h�6�a~��9\�q��\�\�{��C@#\�;���9L�v\�+\r\'u\\\��;�\�\'�\�\"qcC\�G�&6)\����(d&ź�\0��\'�qozM�u�A�H�\�Dt��N\0���oL�\�Є됓��9�o,\�Ŋ\�l̘B����� C��L�\�7L\�631\'�u&:�=fmz\�>Ɛl晞̊�7��f�Ac\�\�<ü-j&�)L�v�Y��5jV\�֨y�y�լ@\���G�\�\�`\n�\�*�7�B=����v\�\�]Z�x�F���b�G�d�\�()\�[0K�\�\�v\\�A&4\�E\�ФW�}�\�A��Ӳ��\�ޥ\�\�_Z\�BB�u\�T���pQ\�`�>;\�\�?	\�\�\�#N�\�\�\�Vf\�|�\�	�ob\\	\�\�\�W\\m�y\�$\�@�R�&�}w\'\�(�EԀ�h\��}�\�Bm�~So�\�:V�\�X�a\�>s\Z�\�z�\�|�\�O�%���\�59�4�x�N4�*N\�\"t3u��\ns?�*�A�Sy��F!6ٔ\nXCLc���lhL��*2H\�U�71\��\�?\�yI�v˭W���\�\�7_\��\�\"�t��H�i\0\�\�E��dW��e���S�Cؽ)9\\�\�?�M�n�\�vӹ�\\\�j��\�nٿ�\�\�\'�\�\r6\�\�\Z�C���\�>vΜ�Ƒ\�{\�\�Aݹp�\�3��v�\�v�\�99\�\n��P��2����E\�h��\�\���N�Ύ+�\�\n��P��r��F\�\�����s\��4�Cە\�qwDɁVH\�\Z��(F6�<iX�\�\�\�r\��鹳�/�\�\n1�P��҆g��);�r���\�\�r�T�\�_�Q9�~�\�Y�\���\�5�3�k:\�\�	|�k\�)}>s@��\�\"\�=n�ά\�]�?yQ7A�!�\��0H@7\0np��׍P��=�e\�7^�ķ�Лګ\Z菢\�o\�XQ�\���\�\�,6�Q\ZS�!��\�<\�,ث�`0b�Kj`\\����qo\�?\"\������\�\�\��^ד�}\���Г�t\��Q���\��L��\�D6�+RcT��\�0\�߼$�\"O���\��(X�z\�1�\�HH2��\0|��\�7I0�\�\�E\� 4z�G]!�(}\�A�z*\�X��0\�X*�Y��\�G\�±]`5\�OVC|x\�n�&6~˥C\�\Z�I���lN[���3�)��s(�\�\�\�Ld�}9��0��^(H[M\�\"F\���\\}��\�v\�j�� [���54E�\\�\�p(oK\�\�i�\�ؒaWتT\�WR\�2\�J���\�}dp\�`�VIEfBʦ(�)\Z�\�Q(t%5I\�k$\�\�\�i�\��\�G�+\�V2\�\�D\r:s�\�ul�D$ְ\�M˭�5BD�\\�B)X5�R��\�R7�SI�\"�CnB�\\�ه�����*�Ql�~��Fh�F�z�\�0u(Wq\�)U ���4��\��\�\�0�\�n��L-��f!\�\�@%\�F����)b8\�^�e�\�S�?\��\�&��X\��U\�ZǓ���v�H�\�,W�\�)S��D|E�(�k�dZv��6�I!�&#(W�e(�ƨ˩$�\�r]�\'�^~�ҒQ%\�I�	Mʰ�\�9]\�Ȳ�\�\�\��B�֡\�lVS��c\�(\��ڭV1��L1�CD\�b�Y`�݊\Z\�\�Y2p\nQ�:�i%�h\�\�SpK�WuoPQ�!aLƚ��\�:?�i���0�\Z\'��l�\�I,S�N\���*�\�j\�U7\�}f0=_�\ZA�!�\0lVR��\"�Op\��\�8I���&?D\��&\�+i�G�c�>;�\���\�j��Ӳ��\�9��&���+\�\�)���P\r\�:\\\��n \�#\Z�),�\r���{�\�HQ&	*6\�\�H\�]@?�c9\�!W#\�R���txy\�x\0z\�ݍ�Q?��\�\�78\�\�\�zV�T<\�$Ĩ\�h�Bn��ޗ<�ھ\�\�\�0N¹\�t\�G.�)uA�\���Ú��i\�\�\\_�\�\�wtM�ɵ<\�:ϗ7��\�\�]	\��i�M�\�9\�h�/o\�\�6�\�W��.\�\�x|e��e\��Q<���&���\�\�y�Y\��9��\�3�\��8��I_]�g2l\�ǃQ�֡zK\�\�~2\�F\0�!\��!��T�Fz\�S\"��\�p����>�+\�FY���SZ��͉\�q9\�\�٣p\�{=�\�\�}y��\�\�\�e|Ѧ�~GE�b����)\�\�R�X���x07\�\�\����Q�\�=\�\�Mٻ�۪t\�jK�$�\�\�\�\�\�\�9:\�`\�6u\�m���\�T���WmL�\�\�Ů�I\�u�C\\�t�\�	\�(~\�y�#�L��!\�MfY��\��L㋡H\��M\�Z���=\�O�n(gh���7�πJf1I737s\\E���\\\�Z���8�����%#\�J-Hl\��H�\�A\r�U @�Ñ��\'�\�\��\�7I�M\�e�\��M7;�\��V\�(����\�cG\�\�\�W\rxi!�~t�\'���2�`����H�ϻ��2�JȱY��u\\�H���T:k�Y���\�E�MB�\�\��\Z�}\�2c\�%���k\�diC\"�d\�m�|g�y=\�Z\�[\�\�\�\�xqRR\Z}x\�r�\��)�\\�\rx�\�[����)�\n�6��\�ԕ+�PX� �_��\�\�P��U\���\�g��\n�����2R\�XI��,��5F\���sj�J�}�8K\�A\�\�]�J;�_��R:|��\��s�4H\�⠸�&Ѭ\��0\nz=Y���a\��`��cʉ\�\Z�����(B\��V�b\�v\\}0\"�PCs��qҧ�@�0_<\�\\5�Y\�\�0wu�ת/d\�˳R��iV��\"�RsKVm\�1pE.f3\�\�k\�b \�ޯ�{��{+�\�\�X�FD>\�\ns��\���ԙH�b��g?Ȭ_�d؞dS�_�\�K.\�A\�ty�ݨ��(\�2��?�\�\r�~�hN�ŉk�٭�\r�ǟ\�gb\���iwҥ�m�޵:\�N\�\��\�U\�؜JOV\�̋��x;\�Q\��ŝ\ZzZfE\��\���r�\\�\\�:��\���\�\�\���\���\�ٴ\��\�;��\�\�\�\�%�0�\�?\�r���dX\nendstream\nendobj\n1 0 obj\n<< /Type /Pages /Kids [ 7 0 R 9 0 R 11 0 R 13 0 R ] /Count 4 >>\nendobj\n3 0 obj\n<</Type /Font /Subtype /Type1 /BaseFont /Helvetica /Name /F1 /Encoding /WinAnsiEncoding >>\nendobj\n5 0 obj\n<</Type /Font /Subtype /Type1 /BaseFont /Helvetica-Bold /Name /F2 /Encoding /WinAnsiEncoding >>\nendobj\n15 0 obj\n<</Type /XObject /Subtype /Image /Width 210 /Height 142 /ColorSpace /DeviceRGB /BitsPerComponent 8 /Filter /FlateDecode /DecodeParms << /Predictor 15 /Colors 3 /BitsPerComponent 8 /Columns 210 >> /Length 16149 >> stream\nx�\�]w|TU�?\�73�I\�$@H @\�4Ai�\�\�\�u׮��)b��(�\�\�?E)���.�J\�P\�+\�\�\��\����ʼ�L�!���χ�̼w\�y�~\�i�\�s�sg\'\0�6g��NCD\�\�\�h%jf��\�\��N\�D=[a\�\�\�\�p4\�F��\�\��!�\��r/�� r�`�ƍSP�9�\�\0 #\���\�\\�l_N�\�=�}���t�\�O�{�\�P˰��\��\�\�ݽ���]-\�Ɓ-�\�&���]PB@ g?��\�|\r(\00DN�k\�v���$Əj!\��\�\�\�a\���yI�\0\0 s{tĂK�N��\'b\�3��\0��\�\�~�lK�\0P�������{\ZF�\"��\�SO��\�\�1! P�F�\�\�\�\0h �O���\�؃B2F�\�S뚙PZ\���\�Vg�$}Ґ�\�#�t��3\�}\��$�I#\'���\0��<���\�G*0��\���e;���{\��ǁ�/��I���f 28T���\�S@�q\�?|6����\'rk��`\����\'@Ծ\�.g(ɴ!����\��~��6S�8	\�Q.��h��5Γ��[\�!\0D`۳X\�\�>�=9�����J>���$\�Qd\0��C�+�\"�r^�Ɍ\�C\�k\� \0\�>\\�����VZAH\nc\�`#jT.�m\�y�\��L�����\r��\�\�\�S\n\��\�S\�e�\�T?_��X�?��\�Eh\�%l�>�aJ���\����a�&	@plɋу��G\�(�[����ś�VV2\�\���poayƑ�A]\��aaC��\�œ\'��]rH��\0��X}�H޷\�vN��\�+<�\�s�/�\�%$Z\�CQJ��\��݄\�\Z�\Z����*��\�O9�\�\�z\�\�\0!ĸ�(dW\�;RyNrlJrd3\�\0D���\�{o�\�\�\�_�Շ�\�\�R϶ݑ=#\�n\�6��3v!h@$~�q�\�?�ˀ�C�\0G&\096���\��)�\�\\\"\0\�{�{���ynWȘS\�Q\�*�\�q��G\\d\�\�\�Mf\�{`G�]��\\��4J� ���\�,�pn\�k\�\�5�\�t4F\�h\�5FT+{�*V\�\06\Z�DݲA$ℌ	\�\�\n\�|��GsH]��)�{\�ÃO�\�W\�u��9\�\�C\�\�{Q(��ݒQ\�\�b\�\�=66괉\��\�\��{*\�T̂/H>�{\0wYm\����2\���M\���\�Y\n;D��\��\��݀L�\��\r\0H���1@9v�3#���CM�q�O��\���G\�%��%\�+��\�d�s\�\�2�$\�R#��9�[�7\��=u�V0L9�ۘ\�$B`R��\��l�l�Q 4q�ᬄ\"��\�G��\�\r@ոk(� D �\�\�\0��\\�ș��n\�)\�}Amr�qʋ[\�\�x�Z�j�$\�\�\��1�\�\��5�\�Z\�L\n�\�FD�\��\�{paeF�\�[�\�%Y�Q\�W\�\�Rŏ8d2-Mqt\�>\�! P\�v�\�?ɹU��(0BDd�\r8�\�\�\�\08\0�\�\�13���\�\0�Rі\����WS#\��\�o\�\�s\�20�\n\�P�>����\�\��%�L.�.�$6���\�\����^�\�4`�1�54G8U�|\�\�\�1x(�:e����*\�\�ǧ�{/���֘��}�\�\0fo9v#�cT߆\�@,(q��\�_�:Q\���C|�z\�5�1�\��\�\�Y\�\�M��ԯ\��\�\'��\�Q\�b��k�quw��X�9S,\�1��\�.�W��u\���\�>�3#\�%!S0��&�Jȱ\r(����\�\�_\��qhB�9$\�6\�s\�c��2�<��*x\�kW�\�ߞ�?C檮{+T\�\��̝�A=�\�\�\�\�8�`����>\�9H\����uռGDD0�TI�[�F.۸�\�E��W�\�\�4�\�\�/\�̨�o���ʎ�����\�Wou�\"D89�U�\n�������Al��tv��\�\�������fC������\�I��\�\�\�\�� X@\�\�7�\�ݽd\�ᚚS\�5�\0\����CG�\�\�ۡ�M�yInѤ{�W\�\�.�b%:\�\�>b͉bϮ]��cŴzm\�\�\�!�r\�[\�KP�P\" \�~\�DD\�\�2\�nO�\Z�b\0.�6s\�;�]� �u<�w�d\�\�#���:�F!�7c_\�\��(�\�8\�A��k\Z��DG^�k�\�n\�\�cp\�\�q���N�Q\�\\De\�#/%l�L\rP��\�\�\'\�\0R\�\�)ƸAo~Z9�\�\�����˓\�\�-�ٖQ\�=!&ݱ?��ɥ\�4/\���pI85�g�0\�%յ�\�%ך�]\�\���i�\�\��o\�E��T\�@-��AI�#\�\�\�j��EWN\��Iߏ�\�p<X��\�\�v>\0�NH�\0���r=Z��\�p�M�(\�6\�\Z&ٜ���Ց�<�\'��q\�N#D��y\�\"�x)�P\0\���y%���uBz2�	1����ͩN=X�\�S��CzH�^\�\�\�v\�;E�8z���\�vN\�\�1��ʟ�X\��\�<_\�̄\"x�\�\��ɷ�� 䕧&=\�ظ!��\027%\��\\^\�\�37Ė��\�&�6��̛#�z\��<��!\�{\�T7�\�\�#/��\�E\�or�Fc���\"83\�칼\�`\�O~��PEH sS|T���:����ɼ&��)G]`a��\n5�\n\0@.6�ɶ�\�zd5\�^mr\�\r�\�\r\�T��\'L��#ɉ?\�`�H�y֓�r5�f\'���P[�$2\�Fv�),�8w_��\�{A\�`�kC,�\\@	د\�NбWf�\�\�AqBmZ�XŶl��\�:���\��F����\�\�OR�w(ݭB\nB\�Q�H<B4{��w�i�T���@\�)\�\��\n\�6���\�Ԟ�yq5<�\�X\��re\�ğ9U��g�=�j~I~\'ˉ��\\N\0$�92�``\����Ys\0\�\��6\"\�\�M$s@\0 }\�鹮[?OT4YkC�-Fd�	\"D}s�`\�\�\�_\�\�\��.��w\"���\�\�\�[\0�\02\�\��M�\"\�\�\�KO �a\�0r[!=B�zw�ꓟ�d�\�\��0Q`��\0ֲ�v��g��\�\�+\��\�T�\\\�}�;��\0�\�	\�\0\08\0#%\\\'0Y���z6�E\"\�`$E�6&�~*�r�\��^	\�8�\"�fC��pq�\' 0	$\�\�\�\�\�\�?�=�@\0\��o˅�Q.f1JOǎ�\�HQZ\0D��W����Q H\�hUE�&j4b� @/3DDC�k\'(4оA\��^a���\�-�K^\� 0)qŎ��`t�\0	\�\��$|\�+{;�\�m�\�y\�h\�U]:8%YB\"\�\�Z�8W~1콣%qR��\�d�T�\r��c�;�]�� \�a	\�X¸\�\�Vh�Zӈ�\�\����\�\��e \��I�:� 0\"�\�\�!~��@rӹ\'BDd��\�:8ʾ�?ɪ<�W��\�\�\�OV{$\�W\�$\�[s�n\�yލ�ӻ��\�\"���\�\�\�J]Z\�S��i��D#�w�/\'\���\�j�Vc/��A�W�\��s+�\�\�a\��\n&\\BD�g��E���������3\n���� \��p\��0�\�s\���\�zB�1@4\"\"@����`5�\�\�<�\�׸�\��<�\�\�Ş#��;\�\0��\�\�#\":th����\�Ph\�-DD\�\��}\�\�> \�Y��\�]>1*\�\�͸����x\"\0F\0\"�<O\������^vV�\�bn��k�\�\�2c��p��\��\�\�_E\0�\���\'>ݿ��,&�t\�\�\�~ޤ\�\�3;x\�������m6�P\���\�	�#$\0\"�\�˯���x6�Ν�r��l�lPޒ��q<Iw�\�zux\�qS�Q��Bl|�hX)\�#_\�\��?��\�c�\�ص\�f�\�\�\Z\�}<Tkƀfe@`\�E#.\Z9**�����\�A0���\"~>�\��\�\�GG7q\�3q��!\�D( j�k\�y\�\�y\�.�|\�\�	q�G�o\�Ƽ���\0�@���ud�`R\�}\�]6��˜1\�\�iB����:\�\�ٽ�,\�\0@.\'x\�\n\�\0O\�d�\�pn\�\��\��AR�4P��\�\�;C\�/?����ޱk�-\"�8gB#;����1\"\"\"\0\"\���0\�!���zrr�rx��$\�:	Qs\�)d��������˪�޺m\�\�n�u\�Ss\n��Fk�\�\�C�\'����o�Y�~Ƙ��JLڻ\�\�i�Z��	�s�}�slsDĉPu�H��C��\\��s\�\�\0R�ۿ�\�\�R\�h�\�\�$�ӽ\�ڽ�R]\�A�\�\�|=��}�\�c�=v\�\��H��1�\�{Ǘ�\��\�,f�%c\�~�|yr\��\�\�sfP�&�HՂ\���T{�ҥԔO @�F!�ꫯ<�\�S9\�YC%M�KO�8O���0s\�\�AI�\�>Z�\�ٳ:d�ٔi�\�%\0\0&0\�^P\"@d�@ \�\�l6�3f��\�S;@\�ss�?o`\�\�[�\0�Lev��\�=(\�\�\��<*D|m\�%K�\�\�\�\�l6\"U�4�a\�VHѰ\'\��[�\�+\'N\\�\�R&�T�Qʺ<� �R	�\�\�\�=Eū�-\�c4\0bbc>��]�>6{��s\�\�20mKI�w3Ǧu�1��-Y�\�\�rss#,�)&024���q$�d���\�\�+����	&\�ə�����B-_�\�~o\�K\��	.\�,iO\\�ϧ\�\ZU\�li\�z�\����KKK\�f皧J?+3\�\0�\�=nw����S�\���\0��\�o��� WZkJ];�\�4�\059��\�\�e�$UA��\�5�{��\'νc\0\�	\0Oϟ���\�+--�X�}@�������F\�\��DEE\�q�\��y\0���x\�El�j��\�m��a%e\�)\�\�WE\�3�\�\�j+�NG�\�\�=k\��+jjk\�&��~�b\�5\�\��W\0�9�\�\�={Ξ=��k�%\�I\'�+e? +{\n�hU�!~�\�et�\ZF���Q=\"D`{�\�۾}\�\��حK��\�+>YQ][k2�а�9]\�\�/\\��x�q��<0uڣ\�@*\�.�:�\�#\�#���\�����\�\�\�l�\�ajlM\��Î��P^^>}ڴ\�>��!\�\�P�\�4\�W\�=ι\�\�\Zп����/7��j^�L\�y�Eś>�\rj�è\�d=q\�\�G׽\0CF\��z�����w�9W6�\�ԟX�/\�[*C�}�t\0�\\�\�\�gϾ��\��{l\�}SK\�\�\�R�!dd�2xb��\��\�=�\��v�aG\0�L(.*z��gV�^-�DP�c�\0dY���I\�n�\'�\��K�\�^OJJʤ�c���\�S\�^\�ς�D\�^�\�\�8q�#c�t\�\�`���P\\\\�m�v�\�\�\�`\"@\0������\'Kbbb?Y�|\�\�U&\�\�!\�\�V�m\�yCF�\�t9�>\�vpp\�CNU񌱱�\�\r;��s�V+\0���R0yz�\�-�v\�\�\r�\��a�S_x\�<�c�v*�\�55;v\�dSFW�\\.WRz�C=x\�\�+Cj�&\�ȕ\�󞕋\�E1\��-/l�95��1E\�M�<��˯����D\\�n\�رc\�v;\�\\}AD`�\�o�\�\�p>t�8�jAD�$Y4�.�p��?R\�\����O\� ����շr��#���!��\�\�nwqz�Y����>d-\r��	�\0\03\0*�2��1L.�AW%\0���y�����\�\ne�W\�\�%\�k��9D R��@D  ��\�?\"\'\�GQ�bE�\�y52\'T\�\�A�C\0�91�Dd2	�S\"�,�{cJN�sȗ�ID�|������,\�Y�xMeЩB�\�hZ�Y\�\�p���\�\�]5e̺[\�bQ_\�2x��\�\�~\�����li\�\��Jג�z�\��sbj-0P�@SJ\0\�ۼ7��)T%�\0�L�ɠ��\0#N���^K�\�loE\0 E\�\�?��Ձ�#�\�k�J�bb^�m\�c;\�).�\"\�\�z\�\�\��ZW\�nW\�\�\�羾��$}G1MpD�\�\�\�D2xSod��@L;\�T\�\�+\\�H\�\�\�\�\��@\�Fe��.6`hn��E�D\�\�����\��PƐ1M\�*�8V{U3�p�B\\\�_1>�1%�pɕ�\r_\0��]\�6���\�5<�/��<�˙hM\�+a�N},�=0<qѫM��&\��N~-\�/\���B\�\0\0\0du\0\�;jԋUoP�\r\��tW+rr\�\\rԈK�%S\"cȹ�LA����D�M��\�\�04D@��L@NĴd5��G��\�)�0��޵\�2\'�z}Rͪ\��л\0\0-b�\�{<��a�� \0�IH{lL\�#\�`t|\�\�[vJVz�s\�>�\�d\����\�Z�Ʒ��E�%�/\�\0�damj\�\�q��\�\0e\�\�h��A�w\��\�l;��Eݷ���:m�㞪�x\�\�W�t�8٩�u\��An���ͻ<\�y`279a�E�,\0\�[ʛC�l`a.;wVR}OS<\"�\�\�\�^w\�<��\�\�c\"\"\0r�\"����rc\�A45\'I�Ť\"\���T.yyMK�c:KHE�˽j\�ꝻvI��\0���I�\�\�Uۊ;O����n��og�n�s\���9D�ߠ�9ot��N\�\�n���\�\�?�\��[\�s�\���d\"-U\��\�!Ƙ$K�Y�\'�2A7U9gZ�ӭC\�%0h\�@\�Jv��\�5h�P\�ȁḁ��/N�\\|sXr\�\�;�\�@W\�]\�\�?\"2\n\�8�������ЏjL15�Я�����cC�~�\�wSRS�\���X�+S��z\�\0@w\�._�f�`b��y�v��9G\�Y�+�̪Xw\�[0vy6��J\"S\�j�\\W\�\Zj\�\�Q�\�V�ų\�o��ftL\0T<�\��\�fQM\Z��\�~B\�\�?n\�?:�z�U\�\"R��3�W�B�rl��9\�n���r\�c\�\Z7\�R\�B�\�m���\'��t)D O\�G\n\��\�]\�n�K2xR�\���|�{�\�\�P�<YD�\�(g\�\�U\��\"@��c롵6j���e�*\�\�\�wU�ĉ<Odd\�\�\��\�o	�	%��+��\�y�Gp+�\'�Ӥ�\�-~9옃�I;D*�AΝO\�\�+Ǥ\�s\�\��,\'4���a�����\�$I����:Uͷ�����N9�YFc�vu}\�\']f����\�>옃����\�\�\�u��Sv\�L$%;�)�v=�?6k\�u\�\�\0\0ތ}E��Y�6��|;cpN�,Ԭ�fR�a�\��O.|�\\�m��\�$˲\�fv��v���z�8xP||(�vS��m*a�G�\�b$sbt(Y\�ͤ\���<<\�M^�\�r\"�\�\�~8I�eS��\�B	\�\�8xmi��қI�îNpN�\�/�\�wIv��)��\��C��o�ȋ\n��[��m,ے\'�9�\��J\�)e�7�B��?\�<\�r\���}@%��-8R��61ߎD0Q=&[�D2�\�vJ}�A�\�kO�\�8u%�\�L9\�^��/8�\�\�^Ӊ��|;8s����1cԾmxjZV�L\�\�q�M[�\"\�Z\�\��x\��\�׻�\rs͢&\�\�\���\0P�\�\�)\�s_\�M�,�;�\�ퟝ#�>�tZH�;D�\�\�s\��\��}YM\�!\0q�)\�j\�i_�у\�\�\�4�L�����+�5$\�HB�\0��ׇV��\�g�k�Ӎ3\�|�ɾ\�Q4�~1\��\�\'\�\��O�U2씬�\�y\�\�d�\�)�:�լGe\�Q\�Ƃz\�A\�jE��\nrTp����K�W�\�I)�\�\�g\�GJ7�2\"0��\�[�\�ۅ�\�dk��\�\�O��\n\rv�t�+9\�Yr\�E!�\�L��u�V�J�\�F$\nBUe\�\�_}y�\�A�\�\�$C�\�\�B\�4\"\"�\�\���s.7^E  \��\n��cJP��L��o�s\��⢢�79߮aBQɉ�xbb⒥�Y,�\�\n=�\0;D*���@\�\�\0V\��qo�JZq �	1\�Q��mc=ch����<�ɪ\�j\�@c%\�\Z��-8qk�u\�W\\|ɟDQT��ZbS���USS3a���\'6pq��\�\Z&�G-\�\�l6_x�nɅ\����D\0\�yo\���+ �r\�@S�\��R�OD\�\�\Z<\�\�d��U\0D\\\�\�D\�)[��\�cLiJ�9 \�r�%b�����\�U��J\�hX�E�\�1l\�\�i\�8xP\�\��Ɣni\"����dY�Z,�����5Q\�:A��q5�ވ��<g�\\�I\'��\0������D���+\'&6r����u��{�\0�1\��궈j\�fZq\�z%)\�f���\���\�{f�Ew���U�R�\�\��vJI��`��э\�)1;uʩiÊ�n�_�\�C �z%�\�v�\r׿�\�Y\"l6[�\�\'�\�-\�\�\�\�H��\�\Z\0-<|\�DD(F�{���s��5r$c\�8��#\�!T�l�Y@Z����\�\��DEF�cҤ\�/�\"s\�/t\Z�]-\���,w\�\�\���=v\�X\�m\�o�E\��dn�mDmʅ�o\�(y<��\�\��&Mz\�\�W\0�\r�i\0�d�\�YO\�%��\"���\����9�4q/\�\�\�_\�I�/��B�\�$\�Λ\�v�)%)\�#@�\�\�%-m\�\�g�ɪj\�V{\�\�\�^�7�uB��e�\�/\r�h$T�ș�l�s_Bb#Y�M˷k�\\nw\\\\ܬY3�I��[[mY�\�\�qTΜ\�O��~`��9�yČ#�v���8�\�z�\�j�ʞ=zP�\�N���\0-鋞 �\�\�4`�ҥK���[\�\�\�/,?p��f!�\��\n�\\��9i\�̍��[�\�\�F��<��\�~�IL���b\�H�Ϸk�?\0^��]R\�3\�<=y\�T\0��lj�\�z%+=s�X�b�3\�8!\'\�F��҉�����\�\�\�\����(�ǃzHE\�\���ӒD\\�&!s�\�5b��W�,5ztI�s\��\��w�5·\�S	q_}�X��\r�4�\�@\�*�tM\�j�\�#G�\��mf� 0��T\�i��\���y<����7\�x����]\�\�w�pn� �+�.\�_���}m�0$��\�IG\�SLK\����M��nݺ�׭\�\�/0�\�f� �\�ԓ��_/\�rzz���3---?�vƲ=\�~\�\0��s*v��kF^4\�\ZaE�\�\�\"�\�9c8��a\0��\�U+\�ꪓ�\�A\�2���D�#�\�\0��qw\�q��3��\�\�=�؃U\��B`�\�\rU�1q\���\�\�\�$\�\0	8�º�\�9�gԟ\\�Ӻv�0\�2{b�Q��\�z̩�\�8D^�	\�Y@R\�\�\�ת�\�\�4�X❬ݍ`N�\�Hĕz+T���?\�\���s�E�fꨋ�$�L�>+˼\��y����W�D_�u_sa�\�\�Ү�Um\�QQ��?�>\�ꭕ0���%��;\�<J���ӚbO?���ߥ�Y<o!�\0����Ƙdz\�\nG�a\�e;�Et1�\�Y\n\� ɬ�,��\"\�X�\�ݢ@Jj��P�\�M�\�l\�̮q��7\�,\�,<pQ\�1綏��2\'c6������3\�\�ޙ_��\�\�{N_g\'��!���쥋MRlΌcŋ>�ږKMH\�lI���\�\Zb\"0��\�����IA4�ι�\�\���䃝�=@\�\�U0@��9����\�c�#Cv����O\'��0�\�\�8�-p\0f��A\��\ZC�\03�\�	H\�0��ޤ��i��t\�\�\�\����\�$\0���ޣ�\�\�K����wn�V�\Z)h�s\�A~�?\0\nq(\�)\�v\�4  B54�e\0\"C\�\�����Lؖ3\�\�\�\�^�tROzB�\�#-\�O��C$\�b�4\��Z1�80���C�\�����KGD=��\���wԂ͈s��o�\�1��5\�\�B\0\�\�i<+\�︽V#?\�c\�(�]@��%\�Z�MX\�\0@��I�a\\�3D\\OV2b\�$����u\�=۫c���~p���\��V�(�\nQ/\�ɵs*�!ӂf@�N\�\��5�^\���3~�\�9�w9���>ծ@2\0N������YCD2x���\��\��*悓\�}k�~�\0w!�/;6�\�9\00\0\�=D�\�1�ds\�q\0���6\�M\"[�k\�#?\\�\��\�)l\�ʌj!�o��?�O\n��h�ih�t���d\�Fe\��\�\�r3]`�k�\r\05�g�T\�\�E\0hB��\�%��=�8�+e=}�\���T0B\� ��`H&Qxw\�__��\"��z3g[�|&��ο\�z���>M,-�^I���b?s\��	\\�?+�9\�<YD �JWK\'�\0Mڱ��lp�Yz�A�;M��şnzv\����3���\�\'�@�\�|\�\��~U[-i\�NC~�^w�\�\�JoՅ�b�0 �*����\�o�^���K\n:�\�$Xg{\�ҽ��$�\�\�]E�NҸ�F��5_��d�\�.j�!0\0s\�\�\�\�\�.\���)�\0\�@_\Z5�N�؋\�\�+@l�d��{\�[\�R�@[�U�W4\���U\�\�*��\�(`��\���S�c\�D\��\�׭\\#Ȳђ4DWZN\�!NiO|��3s\n5ph;\�\�>.e\�I\�=�ւ��<�\�3��\��]�:\�\��\�{\�\��\�\�\����\�F��%���\�ђMc��\�\r\�*z�N��\�h;\�\Z;\�Y��?\�\�ՕvF\"\0�\�b\�,z�a�\�\�\�k.;\���d�\�]\�\"a��1\�\���A��\��\�y��O�\��:\�?\����\\`HW@-h�>\�J�\0Y��v[te\�㯞��S�i\�x�||*/��ֻ�&\�\0Ȣ�\n\���	ĚJ\�+<�\�~05=ᶉ䑆t�/�u\�\�\�՟�ʺ\�	\�ـXk)�\�A�&\�v^x�\�\�Yg(\� �\'[υ ;y\��\�G\0L[]	cH�iō8a\�eB\�WA���({\�\�o�\��\�V0��\�u�\r��1@\�#�\�\�~ѝ�L$\0\�\�o�;q�O��eL\���s�0\�JoE\nv\�\���ܧ\�¥�Q�\�Qh3��e�@>\�5|\0.$\�\�Ҟ�Έ({�\�\r�{c�W?F0\�C@\ZO\0\0\���HOYt\��>=\�H_���ҡ\�\'�z\�q�d=�\�&K�:Kk\0\0 �;n@\�\�\'[.�\�\��\n\�\�ˁ$^�T\�}\Z\0ECH/\�F�紏Hh?Ky���wADY\�\�v�\\��/�^/\�4kD�S�\\9��W\��\rJK\r(0�@2\�?����k���\�,\�=\��J�/\�\��i\���|�cNv��K�\�Y3e\"ݷ`J\�#�>Q��s�X\�\�,y\n0�Q���D{�T�e�J\'0\�\�vXE�[\�s\�\�\�?01���d�\"+\��i�kwp0��jb��e�:<������\0s\�\�)ږd��F>6����,\��ƽ��	v\rĴg1\�o��cNm�df;���\�\�Uj�S�Hu@@`5�\rM�=��\�*64؈\�,̻\�ҏ\�r0��P9\0\0\��\�\��\�[��\0;�F\0j6JG\�!oũ�P��v;@�\�m)\�_(��{�%E\�\�_�e\�\�Yxb2��Y\�둻��\�0!�\\^�\�\�EKWr0�y\�AN�w��\�g��\�g\r\��y΃\�ѻ��\�\�\'!t�\n>!NL��M\�\"V�Kw��i\�\�lͽm�\�唘\�9\�z\�}S�SiD�꒹/\�\��3�L�&\�a\�\�\�cg,Z�Vz+Rs`��7Wθ�;�(h!w0�t\����MƜB�\�\���\���~\�\0K3Bz^�{B�3W��nb\�SiDG�\�ws�.�U\�5�\�Z\�O�)��h�:s\�s�Q�a\0\�I�\�?x\�z@\0`����V�\�\�I7*V\"`�s�\�SX\"��(��S\�{\�{�\"�!��\�Emy͘�\�\�\���\r\��\�D邈\��xE\�m�e/k\�\�\�\0\Z\�J?(,�#@r���/]Ȕ������8��QB�� &�q	e��#\�>\�ffH*�UFm�I���S�\�:`İ\�i4D\�n\�\�f^���J�`��a�\��[^[ZB\�7\�n��X��Oa��\�p\�~J.~����E��@	&�U\��\�a�ʈ({i\��w����4\�\�V4 \�x�\��\�݃����F\��\�\�x\�\�i��\�\�Q�%2xb�v\��½�\�yc\�	;P�[\���\��Pˉ\0-s�$\0.���u�\�\�B\�CA޷��_��b��l�\r3j�#��g\�\�{v\�\Z��F.\�\'���\�Î}y�+\�\�\�<��қCa��\�+zG\�~\�`]1DN$�\��\��\�P\�\�!ec󾲫_\�P\�r��8\�\r\�Mt\�9���o`r{[�\�\�J\�\'�g]�H\���\\]?.�θ��fRxa��	��z���2\�|hB��h#�>�q#��k\n�L\'j�~q�\�\�Z-��\�\�:�I\�\�A]��o@l���k�o�U�\�b�e��\�\�>\�\�{_�G��\�t\"\�\�\�< �)	L\�-�?\'8��u\�6e��{#�\�)\�b�>�\��{\�1���lD��\�\��Tɿ�\���\Z����z\�@��b\�9\�A\�.Dj�\�4���\��\�wY�;t\�d�\�*\n#S\�\�\�+O=8\�d&����>���ʫ�\�J�;����Ǟ\�u�\�`~�;M��E\']e\�I���V�P��Rn�{\�\�Rn.\�֊\�{����Ds\�Y�k��@�k�\�5����ڨ��\rvm\�\n\��\�F̑�cYu:5�\��6\n��:\�y\�\�\�ڤ]�����Z�\�`\�F�@m�k�V�6صQ+P\�ڨ�\rvm\�\n\��6jj�]�����Z��Ȱkh=����6��wj<\�w\�N�Zm!j\�B/\0p\n-\�su\�\�o}��m��]\�\nCb�\�B��~G؃r\�p(\�=��Aƿ�>4l��\�\�S���\�7������@;\�\�r^�\�+l6�\���\�_|��\�QmH\�Cr�\\����t��Ͷa\��\�~�\�l6\�[��_Q�d�\�6lذ#G*\'�\�gee9�J!E@ D�\���~� \�۳gÆ\r\'KKDQ\��^=8@�ydT\�ī�\�֭[]�  \"JϡÇ�\�f3\0#\�\0lQQ��������\�\�=�w4\�oD\�8\���^�\'+++/\'ǰ3�dY���햞��`W�oD\�cG���2�s\0�e)2*z\�y\�I�w\�\�^���RdP��A�(����\�\��?�T[[��Jʖ`\"A4w\�\�\�k�)**\\�jUYY�(\n\ng@@\��s�)>�>a\��\�i]\�oٴ�/��E\�g^1Y�FFF�\Z3z�\���v\�X�\�\'�II��קO_Ah\�6\�0\�2眈��\�;}���\�l���D{BB|�\�n�\�\�	��v\�p\�ܹD��\�.\Z>\�f�&\�\�\�\�$\�UE�\��e�\�O\�_zitttb�]�\�H111]�v]�\�s��\�ǎ�=:...>.Ξ���h�\���\�\�\�+�/�z�D�\�O`�Y}�\�\'&\�cbb��u^�r%��r\����s;��\�\�\�\�\�\�\�%&\�_}啪�*\"Z�\�O�G���\�ǝ8v,�Y�8W;\�\�v�\�\���G\��L�	\�\�\�ܱ���sY�<�ą\�\���			jg&$$\�\�\�\�:s��\�D�\�;\�\�v{\\llZ\�Ώ͚ջg/{B�ݞ\�}		I��������7x�`�\�f�������2:���\�QQ�}�_\"�\�\�ӻv���VF\�ؓ\�\�\�=\�ӟ}z���������\��\�vf�DD�I;DD|qѢ�\�~���0\"\"B�\r�\�!u\�X���!�C�-۶mܼ96&\�ĉO\Z[�\�\�{�\"2e�s�3�\�-on2�\�\�\�\�x\�K\�]z\�w�8q�1\�ԣX�\�r���/z\��q\�\�\r�C�\�m\�Z-\0.s`\�d2efe��v\�رc\�v�.Ep>�\�C+V����5�M\0D�(:&z��\�\�p�\�bQ�T\��\��6v�R\�nײ�=�\�td��\�9\"VVU�\�/�?o^�޽@��m۶\�}\�\��J�2�#.�\��\�/��\�tkD���\�A��sj\�W^��GWVU2�){S;G\�s�y˖_~\�P[S#�\"p\"D\�X[Ε\�a\05.\��\r\�7mڸ\�\�O�KJ,0X�\�9\"�\�\���o��.%%\�l6\�Dr3�u�J�\0pͧ�f=z\�\�Ν;p�_}?D�2y�\'�|\"0aٲ�\�\�ױc�\��\�1s��Gķ\�zk����[\��,\�\�\�:x\�iDOƑ\�s\�\�Y�z�\�\���믊KJ\�++_}\�\�Ç\�\�\�Ȳ\�-�[RR{#z\0�\�p̜9�\'�`/\��\�{\��\��\�՚?�[0\����\�\�_�_Xx�M7\�r\�-qq��GM]����vP�8G \�D��Ըࠝ�������T\�I\��\��[`HD�$%�K\�\�-=**Zi\�\�p~��7�\�e\�\�۷m<dp������g]{\�5�W��\�%�̝;w��EEE\�>�tiY)\'~`\��N�Ӕ{��1\�p8V|��\�)Sl��\0�VUU5k\�\�3g\�\�\��\���KKK���\�̝�\��o������3yʔ\�>���\�q�d� ���\�T\�\� �\Z��o\�i�\�I�C�XueeMmmtL�>�\�#��H9F�\�<HQ0dL=�ԃV��0d\�Ѐ\�\r��Ϡk����\�Ņ	@�S���/�0>��2(���\�{�ޖ�[F I�h2�3\�\�Y�\�и\�P.3qAE\�H\��h}2 �\� Y5R1x�q��B}�o��s�F�R\�D�wJ\�\���E�S\"d�P]:�\� dA�h\"\�\�\�p_dd\��y�\�|\�\rY��\�q\�#\"\"Ǝ{�w�L&\�N\�`�\0\0;wli�KN�S\�_^�\�ĉ&AL\�\�)��h`����X,?���\�w\�͘ߩ�RSg͞ݮ];#��g\���Hf������k�\�$%�\�\�阜|\�\r7��\�\�&El4j�zIS��4\�@\���W\�#���w\�\���\�\�+*D\�\0���\�DL\�\�=�K�\�\�\�\�zk\�ΝVk�r�z�_r�\�\�b�c\�	\�׍PH�\�ƪk\�\�\��!�e\�\�\�h��)��Bf�y��=�\�;\0ι\�l�0a�\���wQT�\'ź�X\�;�o��\�[\n\nM&�\�\�\�u{.|v�)\�7�}|�D1;\'\';7\��.\0���)S&\�\�\�+�\�M����\�\� 0�׻\�\�\�9ȹ\�+\�\'ďw��9C?4>�š\�\��s�ĸR��0�\�\�\�>]�\�\�%K�n\�f�\��\�kkkg͜9k֬�\�\�\�3f�Y�&..N�\�\��N7n\���6o\�\�\��\r��I;\�XE�\�\�o��z�֭\�3\0��p`�~�\�\��\�\�c\���zT CƄ�X76\��x\�6�]R;I�d\"Y�\r�\�SO�ֳ��9�q�]RR׮]۷o�g\�^A$IN\�\�u��\���\��\�\"�%Y\�ީ{��]� 瀐��4iҤ~�\�U��\�����U�K�,�L�Ç��p�\\w\�q�5\�]�_\�\0dIמ\r���\'\0N��q�D��~�5����I�ۇ\r�}\�N�\�$\nB�~�&^y\�w\�e6�\�̙�r\�\�=z�ӧ�h2)\�;55���s��\�\�0�8b��S\�K4#	v��i6\�\�T/}u\�\�ٳ-Ƙ\�\�\�\�nݺeeeI^/�t��\0@\"����H�l�3\�W������\'�\Z3fL}Q\"ՃHII���\�o�\������\�oï�ʜwJ\�4x��\�\Z�v�\\.�\�1c�x�ɺ���(9\'�X\�7 ����8QLL�\�U��\�v��\\CR��M��z��PKE2�wctL\�C�<�y\�Ă��?^�<2*J�\�n�9::�0?\�\�v@�޽���ZJj�\�\�\�\�\�U\�\�5З�[\rM�S�\��^��/��\�l��!\0\0�\�r����?�\�\�>�~\�ZN����m\�\�\Z�U��QQQ���\\�\nC\0D�x=�w쬮�D�b��8q���R\���\�\�i���QB\�\�5k�(1��\�\�Rm[m4�;v|uɒk��\�\�쬯���[�Ӧ=���D\�i~FaQ\�ƍ�\�\�\�z�^Z��\�l.)*��-\0PS[�m۶\�\�\\Y��QE&����4\�\0n�{��uȘΫ\�\Z�-Q\nD �\�\�;�,9N\�u�z|DQQ�C�c�-`Dq󦍹\�Y�W�;Ap8G�\�z/�e�t\�:k�쌣G�\�۷kϞY�f=�\��\�\�\0U\�U[6onw\�W��2\'�(��TTV\"��X#\"�圜\�\r?�,���\�\�\�e\�f�\�׿�\�G7@!\�v\0\0�ys\�\��\��\��ؽ{�ݻ,��?^n\�)T]]5bĈQ#G�\�\�\0\'r9\�����\�8N%\�\0\�\�b�\�3w\�<4��4�sޯo\�+��\�j��n,q��%w\����\�\�yǝ^��֛o�tL�<e�\�X�D)\��v\�\�\�׮�}�\�^�۝��~�\�wu\�\�\�$����\����Р�,\�\�Ə%BMm\�5\�]\�\"rU\�ɲ5��\�=�\\\0����9k��s��D�xń	�y�}J�����[���\0DQ���!\�M�x\���p�H�uȐ����Z���^����\�;\��\�?9]\�e|p\�\\<v�\�l�o߾{&M�;jDd��DGE\'\��\�t���\�/�@�!�+�	\"�dy\�!\�?Y\�(\�B�\r}\�t�*a\�\�1\�Gw8����kYD����ꪫ��\�\�1��x<7\�t�\�\�~\�t�DQ@%\�\�v{\��\�}7\0rd�5w�1\�\r�bŊ^={:N_g!�(��3gNrr�\�K���\�_\�\�\�׾26�\�9\�,��w{��\�&O�:jԨ�))�Ǡk\0C�\�c�\�\�Λ;c\�\��2Ɛ8\�}&R���W��6\�u\�\\�b\�\�{\'M\�գ� \\�գJ�Pq�\�rӍ7��\�Ș=>aɫ�\��[�o\�v�mw\�>d�`\�$ʲ��yD�$�\�\�/�x���SS4�Z��@��]\�y��\�l��|���\n\n\n/�lBJǎn�[�̪���\�\�MLL���|��	�[}E�#�L\��z/;���\�\r\����\�;��m\�\��\�wKWc��]Y]]}�رғ%�(�:\"\�\�l1�\�ٳ]��N��ĉ\�E�L�!��{\�\"\� vHNN\�\�}\�\�\�?���\�\�b�! 皧�����Ĥ\�\�\�Ǐ����\�ի[zz@Pt\�\�\�Uղ,�\�ݻsZZ`09\�\�\�\�֖����`|-Eԙ-\�^{M\�\�i\n\��rs�\�\�g�X�!q�ȉ�o��]z�\�YVZ�\�k<d6����z2�\n����_�\�+����zn�\�%\�9B\�e�\�|ላ\ZY��\�E\��\"\�H[����\�H��v\�޽��ݻwO\�\�E\�t�r����\�\�\�\�nO\�޽\�\�\�r��<h�(g3k\��\��vHnߧ\�9n�g��=��ŏ\�\�r%I���n�\'6�P{Z*>��B����wC.\�\�Sᠥ�%}�L[��6jj+4\�F�C�\�\�Fm6j�vm\�\n\��6jj�]��?����\nendstream\nendobj\n4 0 obj\n<< /Type /XObject /Subtype /Form /FormType 1 /Filter /FlateDecode /BBox [0.000000 0.000000 595.276000 14.173228] /Matrix [1 0 0 1 0 0] /Resources << /ProcSet [/PDF /Text /ImageB /ImageC /ImageI] /Font << /F2 5 0 R /F1 3 0 R >> >> /Length 166 >> stream\nx���1\�0����7\�`��4�sA\�\�l�[� u�K���B��j\��\�\�w�\"b{��\� ^����\�s�R]Q7z��R\�S$��\�y-���a\�⍚�\\�`\��\�8��$��E�ºA�R\�Q7\���\r\��\��S�g^~\�\�g\�pf98�|i��\�l�$Y\�\�\'?\0&�[�\nendstream\nendobj\n2 0 obj\n<< /ProcSet [/PDF /Text /ImageB /ImageC /ImageI] /Font << /F1 3 0 R /F2 5 0 R >> /XObject << /XT4 4 0 R /I1 15 0 R >> >>\nendobj\n6 0 obj\n<</Type /Annot /Subtype /Link /Rect [2.835000 1.000000 19.005000 2.156000] /Contents (��\0h\0t\0t\0p\0:\0/\0/\0w\0w\0w\0.\0t\0c\0p\0d\0f\0.\0o\0r\0g) /P 13 0 R /NM (0004-0000) /M (D:20160602200051-04\'30\') /F 4 /Border [0 0 0] /A <</S /URI /URI (http://www.tcpdf.org)>> /H /I>>\nendobj\n16 0 obj\n<< /Title (��\0C\0o\0n\0s\0t\0a\0n\0c\0i\0a\0 \0d\0e\0 \0R\0e\0s\0i\0d\0e\0n\0c\0i\0a) /Author (��\0C\0o\0n\0s\0t\0a\0n\0c\0i\0a\0 \0d\0e\0 \0R\0e\0s\0i\0d\0e\0n\0c\0i\0a) /Subject (��\0C\0o\0n\0s\0t\0a\0n\0c\0i\0a\0 \0d\0e\0 \0R\0e\0s\0i\0d\0e\0n\0c\0i\0a) /Keywords (��\0C\0o\0n\0s\0t\0a\0n\0c\0i\0a\0 \0d\0e\0 \0R\0e\0s\0i\0d\0e\0n\0c\0i\0a\0 \0T\0C\0P\0D\0F) /Creator (��\0T\0C\0P\0D\0F) /Producer (��\0T\0C\0P\0D\0F\0 \05\0.\09\0.\01\09\07\0 \0\\(\0h\0t\0t\0p\0:\0/\0/\0w\0w\0w\0.\0t\0c\0p\0d\0f\0.\0o\0r\0g\0\\)) /CreationDate (D:20160602200051-04\'30\') /ModDate (D:20160602200051-04\'30\') /Trapped /False >>\nendobj\n17 0 obj\n<< /Type /Metadata /Subtype /XML /Length 4356 >> stream\n<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?>\n<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 4.2.1-c043 52.372728, 2009/01/18-15:08:04\">\n	<rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">\n		<rdf:Description rdf:about=\"\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\">\n			<dc:format>application/pdf</dc:format>\n			<dc:title>\n				<rdf:Alt>\n					<rdf:li xml:lang=\"x-default\">Constancia de Residencia</rdf:li>\n				</rdf:Alt>\n			</dc:title>\n			<dc:creator>\n				<rdf:Seq>\n					<rdf:li>Constancia de Residencia</rdf:li>\n				</rdf:Seq>\n			</dc:creator>\n			<dc:description>\n				<rdf:Alt>\n					<rdf:li xml:lang=\"x-default\">Constancia de Residencia</rdf:li>\n				</rdf:Alt>\n			</dc:description>\n			<dc:subject>\n				<rdf:Bag>\n					<rdf:li>Constancia de Residencia</rdf:li>\n				</rdf:Bag>\n			</dc:subject>\n		</rdf:Description>\n		<rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\">\n			<xmp:CreateDate>2016-06-02T20:00:51+04:30</xmp:CreateDate>\n			<xmp:CreatorTool>TCPDF</xmp:CreatorTool>\n			<xmp:ModifyDate>2016-06-02T20:00:51+04:30</xmp:ModifyDate>\n			<xmp:MetadataDate>2016-06-02T20:00:51+04:30</xmp:MetadataDate>\n		</rdf:Description>\n		<rdf:Description rdf:about=\"\" xmlns:pdf=\"http://ns.adobe.com/pdf/1.3/\">\n			<pdf:Keywords>Constancia de Residencia TCPDF</pdf:Keywords>\n			<pdf:Producer>TCPDF 5.9.197 (http://www.tcpdf.org)</pdf:Producer>\n		</rdf:Description>\n		<rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\">\n			<xmpMM:DocumentID>uuid:efbcec7a-62f5-d6a5-bae4-bceffe50a0c5</xmpMM:DocumentID>\n			<xmpMM:InstanceID>uuid:efbcec7a-62f5-d6a5-bae4-bceffe50a0c5</xmpMM:InstanceID>\n		</rdf:Description>\n		<rdf:Description rdf:about=\"\" xmlns:pdfaExtension=\"http://www.aiim.org/pdfa/ns/extension/\" xmlns:pdfaSchema=\"http://www.aiim.org/pdfa/ns/schema#\" xmlns:pdfaProperty=\"http://www.aiim.org/pdfa/ns/property#\">\n			<pdfaExtension:schemas>\n				<rdf:Bag>\n					<rdf:li rdf:parseType=\"Resource\">\n						<pdfaSchema:namespaceURI>http://ns.adobe.com/pdf/1.3/</pdfaSchema:namespaceURI>\n						<pdfaSchema:prefix>pdf</pdfaSchema:prefix>\n						<pdfaSchema:schema>Adobe PDF Schema</pdfaSchema:schema>\n					</rdf:li>\n					<rdf:li rdf:parseType=\"Resource\">\n						<pdfaSchema:namespaceURI>http://ns.adobe.com/xap/1.0/mm/</pdfaSchema:namespaceURI>\n						<pdfaSchema:prefix>xmpMM</pdfaSchema:prefix>\n						<pdfaSchema:schema>XMP Media Management Schema</pdfaSchema:schema>\n						<pdfaSchema:property>\n							<rdf:Seq>\n								<rdf:li rdf:parseType=\"Resource\">\n									<pdfaProperty:category>internal</pdfaProperty:category>\n									<pdfaProperty:description>UUID based identifier for specific incarnation of a document</pdfaProperty:description>\n									<pdfaProperty:name>InstanceID</pdfaProperty:name>\n									<pdfaProperty:valueType>URI</pdfaProperty:valueType>\n								</rdf:li>\n							</rdf:Seq>\n						</pdfaSchema:property>\n					</rdf:li>\n					<rdf:li rdf:parseType=\"Resource\">\n						<pdfaSchema:namespaceURI>http://www.aiim.org/pdfa/ns/id/</pdfaSchema:namespaceURI>\n						<pdfaSchema:prefix>pdfaid</pdfaSchema:prefix>\n						<pdfaSchema:schema>PDF/A ID Schema</pdfaSchema:schema>\n						<pdfaSchema:property>\n							<rdf:Seq>\n								<rdf:li rdf:parseType=\"Resource\">\n									<pdfaProperty:category>internal</pdfaProperty:category>\n									<pdfaProperty:description>Part of PDF/A standard</pdfaProperty:description>\n									<pdfaProperty:name>part</pdfaProperty:name>\n									<pdfaProperty:valueType>Integer</pdfaProperty:valueType>\n								</rdf:li>\n								<rdf:li rdf:parseType=\"Resource\">\n									<pdfaProperty:category>internal</pdfaProperty:category>\n									<pdfaProperty:description>Amendment of PDF/A standard</pdfaProperty:description>\n									<pdfaProperty:name>amd</pdfaProperty:name>\n									<pdfaProperty:valueType>Text</pdfaProperty:valueType>\n								</rdf:li>\n								<rdf:li rdf:parseType=\"Resource\">\n									<pdfaProperty:category>internal</pdfaProperty:category>\n									<pdfaProperty:description>Conformance level of PDF/A standard</pdfaProperty:description>\n									<pdfaProperty:name>conformance</pdfaProperty:name>\n									<pdfaProperty:valueType>Text</pdfaProperty:valueType>\n								</rdf:li>\n							</rdf:Seq>\n						</pdfaSchema:property>\n					</rdf:li>\n				</rdf:Bag>\n			</pdfaExtension:schemas>\n		</rdf:Description>\n	</rdf:RDF>\n</x:xmpmeta>\n<?xpacket end=\"w\"?>\nendstream\nendobj\n18 0 obj\n<< /Type /Catalog /Version /1.7 /Pages 1 0 R /Names << >> /ViewerPreferences << /Direction /L2R >> /PageLayout /SinglePage /PageMode /UseNone /OpenAction [7 0 R /FitH null] /Metadata 17 0 R /Lang (��\0e\0s) >>\nendobj\nxref\n0 19\n0000000000 65535 f \n0000012818 00000 n \n0000029954 00000 n \n0000012897 00000 n \n0000029510 00000 n \n0000013003 00000 n \n0000030090 00000 n \n0000000015 00000 n \n0000000465 00000 n \n0000002545 00000 n \n0000002996 00000 n \n0000005946 00000 n \n0000006398 00000 n \n0000009348 00000 n \n0000009818 00000 n \n0000013114 00000 n \n0000030362 00000 n \n0000030846 00000 n \n0000035285 00000 n \ntrailer\n<< /Size 19 /Root 18 0 R /Info 16 0 R /ID [ <efbcec7a62f5d6a5bae4bceffe50a0c5> <efbcec7a62f5d6a5bae4bceffe50a0c5> ] >>\nstartxref\n35509\n%%EOF\n');
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
