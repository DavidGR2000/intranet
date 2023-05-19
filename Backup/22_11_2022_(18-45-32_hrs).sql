SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE IF NOT EXISTS intranet;

USE intranet;

DROP TABLE IF EXISTS carrera;

CREATE TABLE `carrera` (
  `id_carrera` varchar(10) NOT NULL,
  `nombre` char(50) DEFAULT NULL,
  `semestre` int(11) DEFAULT NULL,
  `modalidad` char(50) DEFAULT NULL,
  PRIMARY KEY (`id_carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO carrera VALUES("adme1","administracion de empresas","9","presencial");
INSERT INTO carrera VALUES("contp1","contauria publica","9","presencial");
INSERT INTO carrera VALUES("ingag1","ingenier├¡a agricula","10","presencial");
INSERT INTO carrera VALUES("ingcv1","ingenier├¡a civil","10","presencial");
INSERT INTO carrera VALUES("ingid1","ingenieria industial","10","presencial");
INSERT INTO carrera VALUES("isum1","ingenieria de sistemas","10","presencial");
INSERT INTO carrera VALUES("pgi1","pedagogia infaltil","9","presencial");



DROP TABLE IF EXISTS categorias;

CREATE TABLE `categorias` (
  `ID_Categoria` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(45) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `ruta` varchar(40) NOT NULL,
  PRIMARY KEY (`ID_Categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO categorias VALUES("1","Registro estudiante","Alojamiento de los datos del estudiante donde lo contactaremos.","RegistroEstudiante.php");
INSERT INTO categorias VALUES("2","Centro Progresa E.P.E","Este espacio esta pensado para tener acceso a las ofertas laborales para los estudiantes.","CentroProgresa.php");
INSERT INTO categorias VALUES("3","Bienestar","En bienestar queremos verte bien y por eso queremos recordarte que estamos contigo. ","Bienestar.php");
INSERT INTO categorias VALUES("4","Cooperativa Minuto De Dios","Tu futuro, nuestro presente. Crédito Educativo. Con nuestro crédito educativo podrás lograr tus sueños estudiando lo que te apasiona. Crédito Consumo. Te ofrecemos la facilidad de financiar tus necesidades personales.","Cooperativa.php");



DROP TABLE IF EXISTS causas;

CREATE TABLE `causas` (
  `id_causa` varchar(10) NOT NULL,
  `nombre` char(40) DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  PRIMARY KEY (`id_causa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO causas VALUES("k17e8oz5","Economico","wadssqadwsqd");



DROP TABLE IF EXISTS causaselim_ad;

CREATE TABLE `causaselim_ad` (
  `id_causa` varchar(10) DEFAULT NULL,
  `nombre` char(30) DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  `fecha_elim` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO causaselim_ad VALUES("hexwkfe","Personal","aaaaaaaaaaaaaaaaaaaaa","2022-11-22");
INSERT INTO causaselim_ad VALUES("dly2411","Institucional","aasfewsgredfghtrf","2022-11-22");



DROP TABLE IF EXISTS desertores;

CREATE TABLE `desertores` (
  `id_desertores` int(10) NOT NULL AUTO_INCREMENT,
  `id_causa` varchar(10) DEFAULT NULL,
  `id_estudiante` varchar(10) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_desertores`),
  KEY `id_causa` (`id_causa`),
  KEY `id_estudiante` (`id_estudiante`),
  CONSTRAINT `desertores_ibfk_1` FOREIGN KEY (`id_causa`) REFERENCES `causas` (`id_causa`),
  CONSTRAINT `desertores_ibfk_2` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id_estudiante`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO desertores VALUES("2","k17e8oz5","1212","2022-11-22");



DROP TABLE IF EXISTS desertores_elim;

CREATE TABLE `desertores_elim` (
  `id_desertores` varchar(10) DEFAULT NULL,
  `id_causa` varchar(10) DEFAULT NULL,
  `id_estudiante` varchar(10) DEFAULT NULL,
  `fecha_eliminacion` date DEFAULT NULL,
  `usuario` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO desertores_elim VALUES("1","hexwkfe","2233","2022-11-22","root@localhost");
INSERT INTO desertores_elim VALUES("3","dly2411","1313","2022-11-22","root@localhost");



DROP TABLE IF EXISTS elimestudiante_ad;

CREATE TABLE `elimestudiante_ad` (
  `id_estudiante` varchar(10) DEFAULT NULL,
  `id_carrera` varchar(10) DEFAULT NULL,
  `nombre` char(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `departamento` char(20) DEFAULT NULL,
  `municipio` char(20) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `user` char(26) DEFAULT NULL,
  `fecha_elimi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO elimestudiante_ad VALUES("2233","ingcv1","JIAM","jiam.blanco@gmail.com","3143200098","cundinamarca","Zipaquira","cll 19 #14-55","jiam13","2022-11-22");
INSERT INTO elimestudiante_ad VALUES("1313","isum1","alfredito","alfre@gmail.com","3123519880","cundinamarca","Zipaquira","cll 19 #14-56","alfredo","2022-11-22");



DROP TABLE IF EXISTS estudiante;

CREATE TABLE `estudiante` (
  `id_estudiante` varchar(10) NOT NULL,
  `id_carrera` varchar(10) DEFAULT NULL,
  `nombre` char(30) DEFAULT NULL,
  `correo` varchar(30) DEFAULT NULL,
  `telefono` varchar(19) DEFAULT NULL,
  `departamento` char(30) DEFAULT NULL,
  `municipio` char(30) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `user` varchar(45) NOT NULL,
  PRIMARY KEY (`id_estudiante`),
  KEY `id_carrera` (`id_carrera`),
  KEY `user` (`user`),
  CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`),
  CONSTRAINT `estudiante_ibfk_2` FOREIGN KEY (`user`) REFERENCES `usuarios` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO estudiante VALUES("1212","contp1","milena","mile@gmail.com","21433214","cundinamarca","Zipaquira","cll 19 #14-54","milena");



DROP TABLE IF EXISTS facultad;

CREATE TABLE `facultad` (
  `id_facultad` varchar(10) NOT NULL,
  `nombre` char(30) DEFAULT NULL,
  `id_carrera` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_facultad`),
  KEY `id_carrera` (`id_carrera`),
  CONSTRAINT `facultad_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO facultad VALUES("ing1","ingenieria","ingag1");
INSERT INTO facultad VALUES("ing2","ingenieria","ingcv1");
INSERT INTO facultad VALUES("ing3","ingenieria","isum1");
INSERT INTO facultad VALUES("ing4","ingenieria","ingid1");



DROP TABLE IF EXISTS materia;

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




DROP TABLE IF EXISTS permisos;

CREATE TABLE `permisos` (
  `usuario` varchar(45) NOT NULL,
  `ID_Categoria` int(11) NOT NULL,
  PRIMARY KEY (`usuario`,`ID_Categoria`),
  KEY `ID_Categoria` (`ID_Categoria`),
  CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`usuario`),
  CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`ID_Categoria`) REFERENCES `categorias` (`ID_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO permisos VALUES("alfredo","1");
INSERT INTO permisos VALUES("eliana123","1");
INSERT INTO permisos VALUES("eliana123","2");
INSERT INTO permisos VALUES("eliana123","3");
INSERT INTO permisos VALUES("eliana123","4");
INSERT INTO permisos VALUES("milena","1");



DROP TABLE IF EXISTS profesor;

CREATE TABLE `profesor` (
  `id_profesor` varchar(10) NOT NULL,
  `nombre` char(45) DEFAULT NULL,
  `especialidad` char(20) DEFAULT NULL,
  PRIMARY KEY (`id_profesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS usuarios;

CREATE TABLE `usuarios` (
  `usuario` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO usuarios VALUES("Admin","147258","1");
INSERT INTO usuarios VALUES("alfredo","147258","0");
INSERT INTO usuarios VALUES("eliana","12345","0");
INSERT INTO usuarios VALUES("eliana123","12345","0");
INSERT INTO usuarios VALUES("jiam13","12345","0");
INSERT INTO usuarios VALUES("milena","147258","0");
INSERT INTO usuarios VALUES("UsuarioPrueba","665544","0");
INSERT INTO usuarios VALUES("UsuarioTest","654321","0");



SET FOREIGN_KEY_CHECKS=1;