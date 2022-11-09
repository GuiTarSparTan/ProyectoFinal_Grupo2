CREATE DATABASE db_discover_cr;

use db_discover_cr;

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
infoGeneral varchar(30) not null,
fotoPerfil varchar(200) not null,
bloqueado varchar(2) not null
);

create table tb_reporteUsuario 
(
id_reporte int NOT NULL AUTO_INCREMENT primary key,
idUsuario int not null,
UsuarioReporte int not null,
fecha date not null,
comentario text not null,
constraint FK_usuario foreign key (idUsuario) references tb_usuario(id_usuario),
constraint FK_usuarioReporte foreign key (UsuarioReporte) references tb_usuario(id_usuario)
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




