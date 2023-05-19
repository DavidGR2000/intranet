DROP DATABASE IF EXISTS intranet;

CREATE DATABASE intranet;
USE intranet;

CREATE TABLE usuarios(
	usuario varchar(45) PRIMARY KEY,
	clave varchar(45) NOT NULL,
	admin boolean NOT NULL
);


CREATE TABLE categorias(
	ID_Categoria int AUTO_INCREMENT PRIMARY KEY,
	categoria varchar(45) NOT NULL,
	descripcion varchar(255) NOT NULL,
	ruta varchar(40) NOT NULL
);

CREATE TABLE permisos(
	usuario varchar(45),
	ID_Categoria int,
	PRIMARY KEY (usuario, ID_Categoria),
	FOREIGN KEY (usuario) REFERENCES usuarios(usuario),
	FOREIGN KEY (ID_Categoria) REFERENCES categorias(ID_Categoria)
);


CREATE TABLE carrera (
  id_carrera varchar(10) NOT NULL,
  nombre char(50) DEFAULT NULL,
  semestre int(11) DEFAULT NULL,
  modalidad char(50) DEFAULT NULL,
  PRIMARY KEY (id_carrera)
) ;

CREATE TABLE facultad (
  id_facultad varchar(10) NOT NULL,
  nombre char(30) DEFAULT NULL,
  id_carrera varchar(10) DEFAULT NULL,
  PRIMARY KEY (id_facultad),
  FOREIGN KEY (id_carrera) REFERENCES carrera(id_carrera)
) ;
CREATE TABLE profesor (
  id_profesor varchar(10) NOT NULL,
  nombre char(45) DEFAULT NULL,
  especialidad char(20) DEFAULT NULL,
  PRIMARY KEY (id_profesor)
) ;

CREATE TABLE materia (
  nrc_materia varchar(10) NOT NULL,
  id_profesor varchar(10) DEFAULT NULL,
  nombre char(20) DEFAULT NULL,
  creditos int(11) DEFAULT NULL,
  numero_inscritos int(11) DEFAULT NULL,
  PRIMARY KEY (nrc_materia),
  FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor)
);


CREATE TABLE estudiante (
  id_estudiante varchar(10) NOT NULL,
  id_carrera varchar(10) DEFAULT NULL,
  PRIMARY KEY (id_estudiante),
  nombre char(30) DEFAULT NULL,
  correo varchar(30) DEFAULT NULL,
  telefono varchar(19) DEFAULT NULL,
  departamento char(30) DEFAULT NULL,
  municipio char(30) DEFAULT NULL,
  direccion varchar(50) DEFAULT NULL,
  user varchar(45) NOT NULL,
  FOREIGN KEY (id_carrera) REFERENCES carrera(id_carrera),
  FOREIGN KEY (user) REFERENCES usuarios(usuario)
);

CREATE TABLE causas (
  id_causa varchar(10) NOT NULL,
  nombre char(40) DEFAULT NULL,
  motivo text DEFAULT NULL,
  PRIMARY KEY (id_causa)
);

CREATE TABLE desertores (
  id_desertores int(10) AUTO_INCREMENT PRIMARY KEY,
  id_causa varchar(10),
  id_estudiante varchar(10) DEFAULT NULL,
  fecha date DEFAULT NULL,
  FOREIGN KEY (id_causa) REFERENCES causas(id_causa),
  FOREIGN KEY (id_estudiante) REFERENCES estudiante(id_estudiante)

) ;

<<<<<<< HEAD




INSERT categorias VALUES
(NULL, 'Sección Multimedia', 'Esta es una sección de videos explicativos.', 'multimedia.php'), -- 1
(NULL, 'Material Académico', 'Esta sección incluye material académico para descargar.', 'material.php'),
(NULL, 'Tareas', 'Esta sección presenta una serie de tareas para los alumnos.', 'tareas.php'), -- 3
(NULL, 'Curiosidades', 'Frases célebres, proverbios y adivinanzas.', 'curiosidades.php'); -- 4

INSERT usuarios VALUES
('UsuarioTest', '654321', 0),
('UsuarioPrueba', '665544', 0),
('Admin', '147258', 1);

INSERT permisos VALUES
('UsuarioTest', 1), ('UsuarioTest', 4),
('UsuarioPrueba', 2), ('UsuarioPrueba', 3);
=======
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
>>>>>>> 09b96eb5096bc3cee1c51124174b7a50ae7a0a5a
