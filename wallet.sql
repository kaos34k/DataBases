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
  idtipoMenbresia int primary key,
  nombreMembresia varchar (45),
  descripcionMenbresia varchar(45)
)
go
create table usuario(
  idusuarios int primary key,
  rolUsuario int,
  tipoCuenta_idtipoMembresia int,
  nombre varchar(45),
  correo varchar(45),
  pwd varchar(45),
  foreign key (rolUsuario) references rol(idrolUsuarios),
  foreign key (tipoCuenta_idtipoMembresia) references tipoMenbresia(idtipoMenbresia),
)
go 
create table tipoMovimiento(
  idtipoMovimiento int primary key,
  nombreMovimiento varchar(45),
  perCRUDMovimiento varchar(45)
)
go 
create table estadoCuenta(
  idestadoCuenta int primary key,
  usuarios_idusuarios int,
  tipoMovimiento_idtipoMovimiento int,
  monto bigint,
  fecha date,
  foreign key (usuarios_idusuarios) references usuario(idusuarios),
  foreign key (tipoMovimiento_idtipoMovimiento) references tipoMovimiento(idtipoMovimiento)
)



--consultas:
--estado total de los ingresos
--estado total de los egresos
--estado actual de ingresos
--historico o reporte de ingresos y egresos
--usuarios con mayores ingresos
--usuarios con menores ingresos
--usuarios con permisos de crud

-- procedimientos almacenados
--login
--crear usuarios
--editar usuario
--crear estados de cuenta
--crear tipo de cuenta
--bloquear usuarios a partir de cierto numero de uso
--estado total de los ingresos



--crear procedimiento para encriptado de usuario
Create Procedure IngresarUsuario
  @nombre nvarchar(50), 
  @pwd nvarchar(50)
As
Begin
    Insert Into usuario (
        nombre,
        pwd
    )
    Values (
        @nombre,
        ENCRYPTBYPASSPHRASE('password', @pwd )
    )
End
Go
