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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO carrera VALUES("adme1","administracion de empresas","9","presencial");
INSERT INTO carrera VALUES("contp1","contauria publica","9","presencial");
INSERT INTO carrera VALUES("ingag1","ingeniería agricula","10","presencial");
INSERT INTO carrera VALUES("ingcv1","ingeniería civil","10","presencial");
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO causas VALUES("1l7813rl","Personal","Cambio de residencia");
INSERT INTO causas VALUES("t4cpdoa","Personal","Problemas al adaptarse a la vida universitaria");
INSERT INTO causas VALUES("t6rk2per","Economico","Falta de dinero");



DROP TABLE IF EXISTS causaselim_ad;

CREATE TABLE `causaselim_ad` (
  `id_causa` varchar(10) DEFAULT NULL,
  `nombre` char(30) DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  `fecha_elim` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO causaselim_ad VALUES("1hc917gy","Academico","Perdida de asignaturas","2022-11-22");



DROP TABLE IF EXISTS datospersonales;

CREATE TABLE `datospersonales` (
  `usuario` varchar(45) NOT NULL,
  `nombre` varchar(65) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




DROP TABLE IF EXISTS desertores_elim;

CREATE TABLE `desertores_elim` (
  `id_desertores` varchar(10) DEFAULT NULL,
  `id_causa` varchar(10) DEFAULT NULL,
  `id_estudiante` varchar(10) DEFAULT NULL,
  `fecha_eliminacion` date DEFAULT NULL,
  `usuario` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO desertores_elim VALUES("1","1hc917gy","746478","2022-11-22","root@localhost");



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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO elimestudiante_ad VALUES("746478","isum1","Juan Camilo Casas Cañon","juan.casas-c@uniminuto.edu.co","3207498299","Cundinamarca","Cajica","Cra 2 - 54","Camilo","2022-11-22");



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
  CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO estudiante VALUES("123765","ingcv1","Ruben Dario Gomez Orjuela","ruben-d@uniminuto.edu.co","342445457","Cundinamarca","Cajica","Cra 53-32","Ruben");
INSERT INTO estudiante VALUES("746589","isum1","Juan Camilo Casas Cañon","juan.casas-c@uniminuto.edu.co","3207498299","Cundinamarca","Cajica","Cra 3-29","Camilo");
INSERT INTO estudiante VALUES("875432","adme1","Lina Rodríguez","lina.rodriguez@uniminuto.edu.c","314567587","Cundinamarca","Cajica","Cra 2 - 54","Lina");



DROP TABLE IF EXISTS facultad;

CREATE TABLE `facultad` (
  `id_facultad` varchar(10) NOT NULL,
  `nombre` char(30) DEFAULT NULL,
  `id_carrera` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_facultad`),
  KEY `id_carrera` (`id_carrera`),
  CONSTRAINT `facultad_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




DROP TABLE IF EXISTS permisos;

CREATE TABLE `permisos` (
  `usuario` varchar(45) NOT NULL,
  `ID_Categoria` int(11) NOT NULL,
  PRIMARY KEY (`usuario`,`ID_Categoria`),
  KEY `ID_Categoria` (`ID_Categoria`),
  CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`usuario`),
  CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`ID_Categoria`) REFERENCES `categorias` (`ID_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO permisos VALUES("Camilo","1");
INSERT INTO permisos VALUES("Camilo","2");
INSERT INTO permisos VALUES("Camilo","3");
INSERT INTO permisos VALUES("Camilo","4");
INSERT INTO permisos VALUES("Eliana","1");
INSERT INTO permisos VALUES("Eliana","2");
INSERT INTO permisos VALUES("Eliana","3");
INSERT INTO permisos VALUES("Eliana","4");
INSERT INTO permisos VALUES("f","1");
INSERT INTO permisos VALUES("f","2");
INSERT INTO permisos VALUES("f","3");
INSERT INTO permisos VALUES("f","4");
INSERT INTO permisos VALUES("Jeferson","1");
INSERT INTO permisos VALUES("Jeferson","2");
INSERT INTO permisos VALUES("Jeferson","3");
INSERT INTO permisos VALUES("Jeferson","4");
INSERT INTO permisos VALUES("Jiam","1");
INSERT INTO permisos VALUES("Jiam","2");
INSERT INTO permisos VALUES("Jiam","3");
INSERT INTO permisos VALUES("Jiam","4");
INSERT INTO permisos VALUES("Juan David","1");
INSERT INTO permisos VALUES("Juan David","2");
INSERT INTO permisos VALUES("Juan David","3");
INSERT INTO permisos VALUES("Juan David","4");
INSERT INTO permisos VALUES("Lina","1");
INSERT INTO permisos VALUES("Lina","2");
INSERT INTO permisos VALUES("Lina","3");
INSERT INTO permisos VALUES("Lina","4");
INSERT INTO permisos VALUES("Ruben","1");
INSERT INTO permisos VALUES("Ruben","2");
INSERT INTO permisos VALUES("Ruben","3");
INSERT INTO permisos VALUES("Ruben","4");
INSERT INTO permisos VALUES("santiago","1");



DROP TABLE IF EXISTS profesor;

CREATE TABLE `profesor` (
  `id_profesor` varchar(10) NOT NULL,
  `nombre` char(45) DEFAULT NULL,
  `especialidad` char(20) DEFAULT NULL,
  PRIMARY KEY (`id_profesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




DROP TABLE IF EXISTS usuarios;

CREATE TABLE `usuarios` (
  `usuario` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO usuarios VALUES("Admin","147258","1");
INSERT INTO usuarios VALUES("Camilo","123","0");
INSERT INTO usuarios VALUES("Eliana","123","0");
INSERT INTO usuarios VALUES("f","123","0");
INSERT INTO usuarios VALUES("Jeferson","123","0");
INSERT INTO usuarios VALUES("Jiam","123","0");
INSERT INTO usuarios VALUES("Juan David","123","0");
INSERT INTO usuarios VALUES("Lina","123","0");
INSERT INTO usuarios VALUES("Ruben","123","0");
INSERT INTO usuarios VALUES("santiago","12345","0");
INSERT INTO usuarios VALUES("UsuarioPrueba","665544","0");
INSERT INTO usuarios VALUES("UsuarioTest","654321","0");



SET FOREIGN_KEY_CHECKS=1;