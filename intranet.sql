-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: intranet
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrera` (
  `id_carrera` varchar(10) NOT NULL,
  `nombre` char(50) DEFAULT NULL,
  `semestre` int(11) DEFAULT NULL,
  `modalidad` char(50) DEFAULT NULL,
  PRIMARY KEY (`id_carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES ('adme1','administracion de empresas',9,'presencial'),('contp1','contauria publica',9,'presencial'),('ingag1','ingenier├¡a agricula',10,'presencial'),('ingcv1','ingenier├¡a civil',10,'presencial'),('ingid1','ingenieria industial',10,'presencial'),('isum1','ingenieria de sistemas',10,'presencial'),('pgi1','pedagogia infaltil',9,'presencial');
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `ID_Categoria` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(45) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `ruta` varchar(40) NOT NULL,
  PRIMARY KEY (`ID_Categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'registro estudiante','alojamiento de los datos del estudiante donde lo contactaremos','multimedia.php'),(2,'Material Acad├®mico','Esta secci├│n incluye material acad├®mico para descargar.','material.php'),(3,'Tareas','Esta secci├│n presenta una serie de tareas para los alumnos.','tareas.php'),(4,'Curiosidades','Frases c├®lebres, proverbios y adivinanzas.','curiosidades.php');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `causas`
--

DROP TABLE IF EXISTS `causas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `causas` (
  `id_causa` varchar(10) NOT NULL,
  `nombre` char(40) DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  PRIMARY KEY (`id_causa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `causas`
--

LOCK TABLES `causas` WRITE;
/*!40000 ALTER TABLE `causas` DISABLE KEYS */;
INSERT INTO `causas` VALUES ('100','Academica','Mi nivel de aprendizaje es muy bajo'),('128','Academica','No me gusta la programaci├│n y es por eso que quiero cambiar por otra carrera en otra universidad'),('450','Academica','perdida de la misma materia'),('500','Economica','plagio academico'),('69','Academica','Mi nivel de aprendizaje es muy bajo'),('c2','Economica','me quede sin trabajo'),('c4','Cambio de residencia','me pelie con el arrendatario'),('c6','Personal','problemas emocionales');
/*!40000 ALTER TABLE `causas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datospersonales`
--

DROP TABLE IF EXISTS `datospersonales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datospersonales` (
  `usuario` varchar(45) NOT NULL,
  `nombre` varchar(65) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`usuario`),
  CONSTRAINT `datospersonales_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datospersonales`
--

LOCK TABLES `datospersonales` WRITE;
/*!40000 ALTER TABLE `datospersonales` DISABLE KEYS */;
/*!40000 ALTER TABLE `datospersonales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desertores`
--

DROP TABLE IF EXISTS `desertores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desertores` (
  `id_desertores` int(11) NOT NULL AUTO_INCREMENT,
  `id_causa` varchar(10) DEFAULT NULL,
  `id_estudiante` varchar(10) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_desertores`),
  KEY `id_causa` (`id_causa`),
  KEY `id_estudiante` (`id_estudiante`),
  CONSTRAINT `desertores_ibfk_1` FOREIGN KEY (`id_causa`) REFERENCES `causas` (`id_causa`),
  CONSTRAINT `desertores_ibfk_2` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id_estudiante`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desertores`
--

LOCK TABLES `desertores` WRITE;
/*!40000 ALTER TABLE `desertores` DISABLE KEYS */;
INSERT INTO `desertores` VALUES (2,'c6','101016','2022-11-05');
/*!40000 ALTER TABLE `desertores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudiante` (
  `id_estudiante` varchar(10) NOT NULL,
  `id_carrera` varchar(10) DEFAULT NULL,
  `nombre` char(30) DEFAULT NULL,
  `correo` varchar(30) DEFAULT NULL,
  `telefono` varchar(19) DEFAULT NULL,
  `departamento` char(30) DEFAULT NULL,
  `municipio` char(30) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_estudiante`),
  KEY `id_carrera` (`id_carrera`),
  CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES ('.13123','isum1','.jeferson','.picassgarzon@gmail.com','.434345','.cundinmarca','.zipaquira','.san jorje'),('.751356','isum1','.Juan David Garzon Robelto','.juan.garzon-r@uniminuto.edu.c','.+573204682550','.cundinamarca','.chia','.vereda la balsa'),('101014','contp1','Karen Urbina Gonzales','karen.urbina@uniminuto.edu.co','3022960992','cundinamarca','chia','las juntas'),('101016','ingag1','Karen Urbina Gonzales','karen.urbina@uniminuto.edu.co','3022960992','cundinamarca','chia','las juntas'),('10123','pgi1','Karen Urbina Gonzales','karen.urbina@uniminuto.edu.co','3022960992','cundinamarca','chia','las juntas'),('56123','isum1','Eliana Guevara','Eliana.guevara@gmail.com','3153982412','cundinamarca','zipaquira','exito'),('751326','isum1','juan camilo casas','juan.casas-ca├▒on@uniminuto.edu','342523220','cundinmarca','cajica','capellania');
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facultad`
--

DROP TABLE IF EXISTS `facultad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facultad` (
  `id_facultad` varchar(10) NOT NULL,
  `nombre` char(30) DEFAULT NULL,
  `id_carrera` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_facultad`),
  KEY `id_carrera` (`id_carrera`),
  CONSTRAINT `facultad_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facultad`
--

LOCK TABLES `facultad` WRITE;
/*!40000 ALTER TABLE `facultad` DISABLE KEYS */;
INSERT INTO `facultad` VALUES ('ing1','ingenieria','ingag1'),('ing2','ingenieria','ingcv1'),('ing3','ingenieria','isum1'),('ing4','ingenieria','ingid1');
/*!40000 ALTER TABLE `facultad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materia` (
  `nrc_materia` varchar(10) NOT NULL,
  `id_profesor` varchar(10) DEFAULT NULL,
  `nombre` char(20) DEFAULT NULL,
  `creditos` int(11) DEFAULT NULL,
  `numero_inscritos` int(11) DEFAULT NULL,
  PRIMARY KEY (`nrc_materia`),
  KEY `id_profesor` (`id_profesor`),
  CONSTRAINT `materia_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_profesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `materia` VALUES ('78956','346790','Ceplec_1',3,20),('78957','346790','Ceplec_3',3,15);
--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permisos` (
  `usuario` varchar(45) NOT NULL,
  `ID_Categoria` int(11) NOT NULL,
  PRIMARY KEY (`usuario`,`ID_Categoria`),
  KEY `ID_Categoria` (`ID_Categoria`),
  CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`usuario`),
  CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`ID_Categoria`) REFERENCES `categorias` (`ID_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES ('UsuarioTest',1),('UsuarioTest',4);
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesor` (
  `id_profesor` varchar(10) NOT NULL,
  `nombre` char(45) DEFAULT NULL,
  `especialidad` char(20) DEFAULT NULL,
  PRIMARY KEY (`id_profesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `usuario` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('Admin','147258',1),('UsuarioPrueba','665544',0),('UsuarioTest','654321',0);
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

-- Dump completed on 2022-11-05 23:23:39

START TRANSACTION;
UPDATE estudiante SET nombre="Pedro", telefono="3114569032" WHERE id_estudiante="751356";
UPDATE causas SET nombre="Economico", motivo="Sin recursos" WHERE id_causa="128";
COMMIT;


CREATE PROCEDURE `insertRegis`( id_estudiante varchar(10), id_carrera varchar(10), nombre char(30), correo varchar(30), telefono varchar(19), departamento char(30), municipio char(30), direccion varchar(50), id_causa varchar(10), nombre_causa char(40), motivo text )BEGIN INSERT INTO estudiante( id_estudiante,id_carrera,nombre,correo,telefono,departamento,municipio,direccion)VALUES(id_estudiante,id_carrera,nombre,correo,telefono,departamento,municipio,direccion); INSERT INTO causas(id_causa,nombre,motivo)VALUES(id_causa, nombre_causa, motivo); END; 

DELIMITER $$ -- CAMBIO EL DELIMITADOR POR "$$"
DROP PROCEDURE IF EXISTS `insertRegis` $$
CREATE PROCEDURE `insertRegis`(
  id_estudiante varchar(10),
  id_carrera varchar(10),
  nombre char(30),
  correo varchar(30),
  telefono varchar(19),
  departamento char(30),
  municipio char(30),
  direccion varchar(50),
  id_causa varchar(10),
  nombre_causa char(40),
  motivo text,
  fecha date,
  user varchar(45)
    
)BEGIN
INSERT INTO estudiante( id_estudiante,id_carrera,nombre,correo,telefono,departamento,municipio,direccion,user)VALUES(id_estudiante,id_carrera,nombre,correo,telefono,departamento,municipio,direccion,user);
INSERT INTO causas(id_causa,nombre,motivo)VALUES(id_causa, nombre_causa, motivo);
INSERT INTO desertores(id_causa,id_estudiante,fecha)VALUES(id_causa,id_estudiante,fecha);
END $$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registroL`(
  usuario varchar(45),
  clave varchar(45),
  admin tinyint(1) 
)
BEGIN
INSERT INTO usuarios(usuario,clave,admin)VALUES(usuario,clave,admin);
END$$
DELIMITER ;

DELIMITER $$ -- CAMBIO DE DELIMITADOR POR "$$"
DROP PROCEDURE IF EXISTS `consultas` $$
CREATE PROCEDURE `consultas`()
BEGIN
 DECLARE estudiante char;
 DECLARE usuario char;
 DECLARE registro char;

  SET registro = (SELECT desertores.id_desertores,estudiante.nombre,carrera.nombre,carrera.semestre,carrera.modalidad,desertores.fecha,causas.nombre,causas.motivo FROM carrera INNER JOIN estudiante ON carrera.id_carrera=estudiante.id_carrera INNER JOIN desertores ON estudiante.id_estudiante=desertores.id_estudiante INNER JOIN causas ON desertores.id_causa=causas.id_causa);
  SET estudiante=(SELECT * FROM estudiante);
  SET usuario=(SELECT usuarios.usuario, usuarios.clave,estudiante.nombre FROM usuarios RIGHT JOIN estudiante ON 
   usuarios.usuario=estudiante.user);

   SELECT estudiante as est, usuario as user, registro as reg;
   
END $$

DELIMITER ;

DELIMITER //

CREATE TRIGGER `eliminar` AFTER DELETE ON `desertores`
 FOR EACH ROW BEGIN
DELETE FROM estudiante WHERE estudiante.id_estudiante=OLD.id_estudiante;
DELETE FROM causas WHERE causas.id_causa=OLD.id_causa;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER elimDeser_Ad AFTER DELETE ON desertores FOR EACH ROW INSERT INTO 
desertores_elim(id_desertores,id_causa,id_estudiante,fecha_eliminacion)
VALUES(OLD.id_desertores,OLD.id_causa,OLD.id_estudiante,NOW());

DELIMITER :

DELIMITER //
CREATE TRIGGER elimEst_Ad AFTER DELETE ON estudiante FOR EACH ROW INSERT INTO elimestudiante_ad(id_estudiante,id_carrera,nombre,correo,telefono,departamento,municipio, direccion,user,fecha_elimi)
VALUES(OLD.id_estudiante,OLD.id_carrera,OlD.nombre,OLD.correo,OLD.telefono,
OLD.departamento,OLD.municipio,OLD.direccion,OLD.user,NOW());

DELIMITER ;