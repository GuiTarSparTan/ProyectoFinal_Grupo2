CREATE DATABASE db_discover_cr;

use db_discover_cr;

--Creacion de tablas
create table tb_usuario
(
id_usuario int NOT NULL AUTO_INCREMENT primary key,
nombreUsuario varchar(50) not null,
clave varchar(50) not null,
nombre varchar(50) not null,
apellido1 varchar(50) not null,
apellido2 varchar(50) not null,
email varchar(100) not null,
tipo varchar(30) not null,
infoGeneral text not null,
fotoPerfil varchar(200) not null,
bloqueado varchar(2) not null
);

create table tb_reporteUsuario 
(
id_reporte int NOT NULL AUTO_INCREMENT primary key,
idUsuario int not null,
usuarioReporte int not null,
fecha date not null,
comentario text not null,
constraint FK_usuario foreign key (idUsuario) references tb_usuario(id_usuario),
constraint FK_usuarioReporte foreign key (usuarioReporte) references tb_usuario(id_usuario)
);

create table tb_categoria
(
id_categoria int NOT NULL AUTO_INCREMENT primary key,
nombreCategoria varchar(100) not null,
descripcion varchar(200) not null
);

create table tb_sitio
(
id_sitio int NOT NULL AUTO_INCREMENT primary key,
nombreSitio varchar(200) not null,
usuarioSitio varchar(50) not null,
ubicacion text not null,
descripcion text not null
);

create table tb_actividad
(
id_actividad int NOT NULL AUTO_INCREMENT primary key,
id_sitio int NOT NULL,
id_categoria int NOT NULL,
nombre_actividad varchar(255) NOT NULL,
descripcion text not null,
constraint FK_sitio foreign key (id_sitio) references tb_sitio(id_sitio),
constraint FK_categoria foreign key (id_categoria) references tb_categoria(id_categoria)
);

create table tb_blog
(
id_blog int NOT NULL AUTO_INCREMENT primary key,
id_actividad int NOT NULL,
id_categoria int NOT NULL,
id_imagen int NOT NULL,
id_usuario int NOT NULL,
titulo VARCHAR(200) NOT NULL,
contenido text NOT NULL,
constraint FK_actividadBlog foreign key (id_actividad) references tb_actividad(id_actividad),
constraint FK_categoriaBlog foreign key (id_categoria) references tb_categoria(id_categoria),
constraint FK_usuarioBlog foreign key (id_usuario) references tb_usuario(id_usuario)
);

create table tb_blog_imagen
(
id_blog_imagen int NOT NULL AUTO_INCREMENT primary key,
id_blog int NOT NULL,
titulo VARCHAR(50) NOT NULL,
ruta VARCHAR(200) NOT NULL,
constraint FK_blog foreign key (id_blog) references tb_blog(id_blog)
);

create table tb_blog_resenha
(
id_blog_reseña int NOT NULL AUTO_INCREMENT primary key,
id_usuario int NOT NULL,
id_blog int NOT NULL,
puntuacion int NOT NULL,
comentario text NOT NULL,
constraint FK_blogResenha foreign key (id_blog) references tb_blog(id_blog),
constraint FK_usuarioBResenha foreign key (id_usuario) references tb_usuario(id_usuario)
);

--Procedimientos almacenados de Usuarios--
--Procedimiento Create
create procedure agregarUsuario (in id_usuario int,
	nombreUsuario varchar(50),
	clave varchar(50),
	nombre varchar(50),
	apellido1 varchar(50),
	apellido2 varchar(50),
	email varchar(100),
	tipo varchar(30),
	infoGeneral text,
	fotoPerfil varchar(200),
	bloqueado varchar(2))
	INSERT INTO tb_usuario VALUES
	(id_usuario,nombreUsuario,clave,nombre,apellido1,
	apellido2,email,tipo,infoGeneral,fotoPerfil,bloqueado);

--Procedimiento Read
create procedure mostrarUsuario (id_usuario int)
	SELECT * FROM tb_usuario
	WHERE id_usuario=id_usuario;

create procedure mostrarUsuarios ()
	SELECT * FROM tb_usuario;

--Procedimiento Update
create procedure modificarUsuario (in id_usuario int,
	nombreUsuario varchar(50),
	clave varchar(50),
	nombre varchar(50),
	apellido1 varchar(50),
	apellido2 varchar(50),
	email varchar(100),
	tipo varchar(30),
	infoGeneral text,
	fotoPerfil varchar(200),
	bloqueado varchar(2))
	UPDATE tb_usuario
	SET nombreUsuario = nombreUsuario,
		clave = clave,
		nombre = nombre,
		apellido1 = apellido1,
		apellido2 = apellido2,
		email = email,
		tipo = tipo,
		infoGeneral = infoGeneral,
		fotoPerfil = fotoPerfil,
		bloqueado = bloqueado
	WHERE id_usuario = id_usuario;

--Procedimiento Delete
create procedure eliminarUsuario (id_usuario int)
	DELETE FROM tb_usuario
	WHERE id_usuario=id_usuario;

--Procedimientos almacenados de ReporteUsuario--
--Procedimiento Create
create procedure agregarReporte (id_reporte int,
	idUsuario int,
	usuarioReporte int,
	fecha date not null,
	comentario text not null)
	INSERT INTO tb_reporteUsuario VALUES
	(id_reporte,id_usuario,usuarioReporte,fecha,comentario);

--Procedimiento Read
create procedure mostrarReporte (id_reporte int)
	SELECT * FROM tb_reporteUsuario
	WHERE id_reporte=id_reporte;

create procedure mostrarReportes ()
	SELECT * FROM tb_reporteUsuario;

--Procedimiento Update
create procedure modificarReporte (id_reporte int,
	idUsuario int,
	usuarioReporte int,
	fecha date not null,
	comentario text not null)
	UPDATE tb_reporteUsuario
	SET idUsuario = idUsuario,
		usuarioReporte = usuarioReporte,
		fecha = fecha,
		comentario = comentario
	WHERE id_reporte = id_reporte;

--Procedimiento Delete
create procedure eliminarReporte (id_reporte int)
	DELETE FROM tb_reporteUsuario
	WHERE id_reporte=id_reporte;

--Procedimientos almacenados de Categoria--
--Procedimiento Create
create procedure agregarCategoria (id_categoria int,
	nombreCategoria varchar(100),
	descripcion varchar(200))
	INSERT INTO tb_categoria VALUES
	(id_categoria,nombreCategoria,descripcion);

--Procedimiento Read
create procedure mostrarCategoria (id_categoria int)
	SELECT * FROM tb_categoria
	WHERE id_categoria=id_categoria;

create procedure mostrarCategorias ()
	SELECT * FROM tb_categoria;

--Procedimiento Update
create procedure modificarCategoria (id_categoria int,
	nombreCategoria varchar(100),
	descripcion varchar(200))
	UPDATE tb_categoria
	SET nombreCategoria = nombreCategoria,
		descripcion = descripcion
	WHERE id_categoria = id_categoria;

--Procedimiento Delete
create procedure eliminarCategoria (id_categoria int)
	DELETE FROM tb_categoria
	WHERE id_categoria=id_categoria;

--Procedimientos almacenados de Sitio--
--Procedimiento Create
create procedure agregarSitio (id_sitio int,
	nombreSitio varchar(200),
	usuarioSitio varchar(50),
	ubicacion text,
	descripcion text)
	INSERT INTO tb_sitio VALUES
	(id_sitio,nombreSitio,usuarioSitio,ubicacion,descripcion);

--Procedimiento Read
create procedure mostrarSitio (id_sitio int)
	SELECT * FROM tb_sitio
	WHERE id_sitio=id_sitio;

create procedure mostrarSitios ()
	SELECT * FROM tb_sitio;

--Procedimiento Update
create procedure modificarSitio (id_sitio int,
	nombreSitio varchar(200),
	usuarioSitio varchar(50),
	ubicacion text,
	descripcion text)
	UPDATE tb_categoria
	SET nombreSitio = nombreSitio,
		usuarioSitio = usuarioSitio,
		ubicacion = ubicacion,
		descripcion = descripcion
	WHERE id_sitio = id_sitio;

--Procedimiento Delete
create procedure eliminarSitio (id_sitio int)
	DELETE FROM tb_sitio
	WHERE id_sitio=id_sitio;

--Procedimientos almacenados de Actividad--
--Procedimiento Create
create procedure agregarActividad (id_actividad int,
	id_sitio int,
	id_categoria int,
	nombre_actividad varchar(255),
	descripcion text)
	INSERT INTO tb_actividad VALUES
	(id_actividad,id_sitio,id_categoria,nombre_actividad,descripcion);

--Procedimiento Read
create procedure mostrarActividad (id_actividad int)
	SELECT * FROM tb_actividad
	WHERE id_actividad=id_actividad;

create procedure mostrarActividades ()
	SELECT * FROM tb_actividad;

--Procedimiento Update
create procedure modificarActividad (id_actividad int,
	id_sitio int,
	id_categoria int,
	nombre_actividad varchar(255),
	descripcion text)
	UPDATE tb_actividad
	SET id_sitio = id_sitio,
		id_categoria = id_categoria,
		nombre_actividad = nombre_actividad,
		descripcion = descripcion
	WHERE id_actividad = id_actividad;

--Procedimiento Delete
create procedure eliminarActividad (id_actividad int)
	DELETE FROM tb_actividad
	WHERE id_actividad=id_actividad;