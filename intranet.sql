-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-05-2023 a las 21:29:31
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `intranet`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultas` ()   BEGIN
 DECLARE estudiante char;
 DECLARE registro char;

  SET registro = (SELECT desertores.id_desertores,estudiante.nombre,carrera.nombre,carrera.semestre,carrera.modalidad,desertores.fecha,causas.nombre,causas.motivo FROM carrera INNER JOIN estudiante ON carrera.id_carrera=estudiante.id_carrera INNER JOIN desertores ON estudiante.id_estudiante=desertores.id_estudiante INNER JOIN causas ON desertores.id_causa=causas.id_causa);
  SET estudiante=(SELECT * FROM estudiante);

   SELECT estudiante as est,registro as reg;
   
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertRegis` (`id_estudiante` VARCHAR(10), `id_carrera` VARCHAR(10), `nombre` CHAR(30), `correo` VARCHAR(30), `telefono` VARCHAR(19), `departamento` CHAR(30), `municipio` CHAR(30), `direccion` VARCHAR(50), `id_causa` VARCHAR(10), `nombre_causa` CHAR(40), `motivo` TEXT, `fecha` DATE, `genero` CHAR(10))   BEGIN
INSERT INTO estudiante( id_estudiante,id_carrera,nombre,correo,telefono,departamento,municipio,direccion,genero)VALUES(id_estudiante,id_carrera,nombre,correo,telefono,departamento,municipio,direccion,genero);
INSERT INTO causas(id_causa,causa,motivo)VALUES(id_causa, nombre_causa, motivo);
INSERT INTO desertores(id_causa,id_estudiante,fecha)VALUES(id_causa,id_estudiante,fecha);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `id_carrera` varchar(10) NOT NULL,
  `carrera` char(50) DEFAULT NULL,
  `semestre` int(11) DEFAULT NULL,
  `modalidad` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`id_carrera`, `carrera`, `semestre`, `modalidad`) VALUES
('adme1', 'administracion de empresas', 9, 'presencial'),
('contp1', 'contauria publica', 9, 'presencial'),
('ingag1', 'ingeniería agricula', 10, 'presencial'),
('ingcv1', 'ingeniería civil', 10, 'presencial'),
('ingid1', 'ingenieria industial', 10, 'presencial'),
('isum1', 'ingenieria de sistemas', 10, 'presencial'),
('pgi1', 'pedagogia infaltil', 9, 'presencial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `ID_Categoria` int(11) NOT NULL,
  `categoria` varchar(45) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `ruta` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`ID_Categoria`, `categoria`, `descripcion`, `ruta`) VALUES
(1, 'Registro estudiante', 'Alojamiento de los datos del estudiante donde lo contactaremos.', 'RegistroEstudiante.php'),
(2, 'Centro Progresa E.P.E', 'Este espacio esta pensado para tener acceso a las ofertas laborales para los estudiantes.', 'CentroProgresa.php'),
(3, 'Bienestar', 'En bienestar queremos verte bien y por eso queremos recordarte que estamos contigo. ', 'Bienestar.php'),
(4, 'Cooperativa Minuto De Dios', 'Tu futuro, nuestro presente. Crédito Educativo. Con nuestro crédito educativo podrás lograr tus sueños estudiando lo que te apasiona. Crédito Consumo. Te ofrecemos la facilidad de financiar tus necesidades personales.', 'Cooperativa.php');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `causas`
--

CREATE TABLE `causas` (
  `id_causa` varchar(10) NOT NULL,
  `causa` char(40) DEFAULT NULL,
  `motivo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `causas`
--

INSERT INTO `causas` (`id_causa`, `causa`, `motivo`) VALUES
('c1h4nb', 'Academico', 'sfsdfasdf'),
('fgbl9j8k', 'Institucional', 'me pelie con una compalera'),
('mgq2y', 'Personal', 'sdfsadaf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `causaselim_ad`
--

CREATE TABLE `causaselim_ad` (
  `id_causa` varchar(10) DEFAULT NULL,
  `nombre` char(30) DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  `fecha_elim` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `causaselim_ad`
--

INSERT INTO `causaselim_ad` (`id_causa`, `nombre`, `motivo`, `fecha_elim`) VALUES
('1hc917gy', 'Academico', 'Perdida de asignaturas', '2022-11-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datospersonales`
--

CREATE TABLE `datospersonales` (
  `usuario` varchar(45) NOT NULL,
  `nombre` varchar(65) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desertores`
--

CREATE TABLE `desertores` (
  `id_desertores` int(10) NOT NULL,
  `id_causa` varchar(10) DEFAULT NULL,
  `id_estudiante` varchar(10) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `desertores`
--

INSERT INTO `desertores` (`id_desertores`, `id_causa`, `id_estudiante`, `fecha`) VALUES
(6, 'mgq2y', '751356', '2023-05-28'),
(7, 'c1h4nb', '32324', '2023-05-28'),
(8, 'fgbl9j8k', '3456', '2023-05-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desertores_elim`
--

CREATE TABLE `desertores_elim` (
  `id_desertores` varchar(10) DEFAULT NULL,
  `id_causa` varchar(10) DEFAULT NULL,
  `id_estudiante` varchar(10) DEFAULT NULL,
  `fecha_eliminacion` date DEFAULT NULL,
  `usuario` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `desertores_elim`
--

INSERT INTO `desertores_elim` (`id_desertores`, `id_causa`, `id_estudiante`, `fecha_eliminacion`, `usuario`) VALUES
('1', '1hc917gy', '746478', '2022-11-22', 'root@localhost');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elimestudiante_ad`
--

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

--
-- Volcado de datos para la tabla `elimestudiante_ad`
--

INSERT INTO `elimestudiante_ad` (`id_estudiante`, `id_carrera`, `nombre`, `correo`, `telefono`, `departamento`, `municipio`, `direccion`, `user`, `fecha_elimi`) VALUES
('746478', 'isum1', 'Juan Camilo Casas Cañon', 'juan.casas-c@uniminuto.edu.co', '3207498299', 'Cundinamarca', 'Cajica', 'Cra 2 - 54', 'Camilo', '2022-11-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `id_estudiante` varchar(10) NOT NULL,
  `id_carrera` varchar(10) DEFAULT NULL,
  `nombre` char(30) DEFAULT NULL,
  `correo` varchar(30) DEFAULT NULL,
  `telefono` varchar(19) DEFAULT NULL,
  `departamento` char(30) DEFAULT NULL,
  `municipio` char(30) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `genero` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id_estudiante`, `id_carrera`, `nombre`, `correo`, `telefono`, `departamento`, `municipio`, `direccion`, `genero`) VALUES
('24345', 'PGI1', 'Karen casallas', 'keren@uniminuto.edu.co', '3204682550', 'cundinamrca', 'chia', 'vereda la balsa sector la pollera', 'Mujer'),
('32324', 'INGID1', ' juan camilo', 'robelto.david134@gmail.com', '3204682550', 'cundinamrca', 'zipaquira', 'vereda la balsa sector la pollera', 'Hombre'),
('3456', 'PGI1', 'Karen casallas', 'keren@uniminuto.edu.co', '3204682550', 'cundinamrca', 'chia', 'vereda la balsa sector la pollera', 'Mujer'),
('751356', 'ISUM1', 'juan david garzon', 'picassogarzon@gmail.com', '3022945309', 'cundinamrca', 'zipaquira', 'vereda la balsa sector la pollera', 'Hombre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultad`
--

CREATE TABLE `facultad` (
  `id_facultad` varchar(10) NOT NULL,
  `nombre` char(30) DEFAULT NULL,
  `id_carrera` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facultad`
--

INSERT INTO `facultad` (`id_facultad`, `nombre`, `id_carrera`) VALUES
('ing1', 'ingenieria', 'ingag1'),
('ing2', 'ingenieria', 'ingcv1'),
('ing3', 'ingenieria', 'isum1'),
('ing4', 'ingenieria', 'ingid1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `usuario` varchar(45) NOT NULL,
  `ID_Categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario`, `clave`, `admin`) VALUES
('Admin', '147258', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`id_carrera`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`ID_Categoria`);

--
-- Indices de la tabla `causas`
--
ALTER TABLE `causas`
  ADD PRIMARY KEY (`id_causa`);

--
-- Indices de la tabla `datospersonales`
--
ALTER TABLE `datospersonales`
  ADD PRIMARY KEY (`usuario`);

--
-- Indices de la tabla `desertores`
--
ALTER TABLE `desertores`
  ADD PRIMARY KEY (`id_desertores`),
  ADD KEY `id_causa` (`id_causa`),
  ADD KEY `id_estudiante` (`id_estudiante`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id_estudiante`),
  ADD KEY `id_carrera` (`id_carrera`);

--
-- Indices de la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD PRIMARY KEY (`id_facultad`),
  ADD KEY `id_carrera` (`id_carrera`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`usuario`,`ID_Categoria`),
  ADD KEY `ID_Categoria` (`ID_Categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `ID_Categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `desertores`
--
ALTER TABLE `desertores`
  MODIFY `id_desertores` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `desertores`
--
ALTER TABLE `desertores`
  ADD CONSTRAINT `desertores_ibfk_1` FOREIGN KEY (`id_causa`) REFERENCES `causas` (`id_causa`),
  ADD CONSTRAINT `desertores_ibfk_2` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id_estudiante`);

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`);

--
-- Filtros para la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD CONSTRAINT `facultad_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`);

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`usuario`),
  ADD CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`ID_Categoria`) REFERENCES `categorias` (`ID_Categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
