DROP DATABASE IF EXISTS intranet;

CREATE DATABASE intranet;
USE intranet;

CREATE TABLE usuarios(
	usuario varchar(45) PRIMARY KEY,
	clave varchar(45) NOT NULL,
	admin boolean NOT NULL
);

CREATE TABLE datosPersonales(
	usuario varchar(45) PRIMARY KEY,
	nombre varchar(65),
	email varchar(45),
	FOREIGN KEY (usuario) REFERENCES usuarios(usuario)
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

Create Table profesor(
	id_profesor varchar(10),
	primary key(id_profesor),
	nombre char(45),
	especialidad char(20)
);

create table materia(
	nrc_materia varchar(10) primary key,
	id_profesor varchar(10), 
	FOREIGN key(id_profesor) REFERENCES profesor(id_profesor),
	nombre char(20),
	creditos integer,
	numero_inscritos integer
);

create table carrera(
	id_carrera varchar(10) primary key,
	nombre char(50),
	semestre integer,
	modalidad char(50)
);
create table facultad(
	id_facultad varchar(10) primary key,
	nombre char(30),
	id_carrera varchar(10),
	FOREIGN key (id_carrera)REFERENCES carrera(id_carrera)
);


create table estudiante(
	id_estudiante varchar(10) primary key,
	id_carrera varchar(10),
	FOREIGN key (id_carrera) REFERENCES carrera(id_carrera), 
	nombre char(30),
	correo varchar(30),
	telefono varchar(19),
	departamento char(30),
	municipio char(30),
	direccion varchar(50)
);


create table causas(
	id_causa varchar(10) primary key,
	nombre char(40),
	motivo text
);


create table desertores(
	id_desertores varchar(10) primary key,
	id_causa varchar(10),
	id_carrera varchar(10),
	FOREIGN key(id_causa ) REFERENCES causas(id_causa),
	FOREIGN key(id_estudiante) REFERENCES carrera(estudiante),
	fecha date
);


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