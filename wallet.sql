--Crear base de datos
--Entregar 23 junio
--Modelo relacional
--Procedimientos almacenados inserción
--Plan de backup
--Permisos de usuario
--Roles del servidor
--Alojado en azure 
--Crear datos
--Procedimientos almacenados
--Pruebas de penetración
--Trabajo escrito
--Scripts

create database wallet
go 
use wallet 
go 
create table rol(
  idrolUsuarios int primary key,
  rolUsuariocol varchar(45)
)
go
create table tipoMenbresia (
  idtipoMenbresia int,
  nombreMembresia varchar (45),
  descripcionMenbresia varchar(45)
)
go
create table usuario(
  idusuarios int,
  rolUsuario int,
  tipoCuenta_idtipoMembresia int,
  nombre varchar(45),
  correo varchar(45),
  pwd varchar(45),
  foreign key (rolUsuario) references usuario(idrolUsuarios),
  foreign key (tipoCuenta_idtipoMembresia) references usuario(idtipoMenbresia),
)
go 
create table tipoMovimiento(
  idtipoMovimiento int,
  nombreMovimiento varchar(45),
  perCRUDMovimiento varchar(45)
)
go 
create table estadoCuenta(
  idestadoCuenta int
  usuarios_idusuarios int,
  tipoMovimiento_idtipoMovimiento int,
  monto bigint(20),
  fecha date,
  foreign key (usuarios_idusuarios) references usuario(idusuarios),
  foreign key (tipoMovimiento_idtipoMovimiento) references usuario(idtipoMovimiento)
)
