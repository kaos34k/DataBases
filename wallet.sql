--Crear base de datos
--Entregar 23 junio
--Modelo relacional//listo
--Procedimientos almacenados inserción//listo
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
create table tipoMembresia (
  idtipoMembresia int primary key,
  nombreMembresia varchar (45),
  descripcionMembresia varchar(255)
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
  foreign key (tipoCuenta_idtipoMembresia) references tipoMembresia(idtipoMembresia),
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
--login//listo
--crear usuarios//listo
--editar usuario//listo
--eliminar usuario//listo
--crear rol //listo
--editar rol//listo
--crear tipomenbresia//listo
--editar tipomenbresia//listo
--crear tipo de cuenta//listo
--editar tipo de cuenta//listo
--crear estados de cuenta//listo
--edita estado de cuenta //listo


--crear procedimiento para encriptado de usuario
Create Procedure insertUsuario
  @idusuarios int,
  @rolUsuario int,
  @tipoCuenta_idtipoMembresia int,
  @nombre varchar(45),
  @correo varchar(45),
  @pwd varchar(45)
As
Begin
    Insert Into usuario (
      idusuarios,
      rolUsuario,
      tipoCuenta_idtipoMembresia,
      nombre,
      correo,
      pwd
    )
    Values (
         @idusuarios, @rolUsuario, @tipoCuenta_idtipoMembresia, @nombre, @correo, 
        ENCRYPTBYPASSPHRASE('password', @pwd )
    )
End
Go


-- crear procedimiento para login de usuario
Create Procedure LoginUsuario 
    @nombre nvarchar(50), 
    @pwd nvarchar(50),
    @Result bit Output
As
    Declare @PwdEncode As nvarchar(300)
    Declare @pwdDecode As nvarchar(50)
Begin
    Select @PwdEncode = pwd From usuario Where nombre = @nombre 
    and rolUsuario != 0
    Set @pwdDecode = DECRYPTBYPASSPHRASE('password', @PwdEncode)
End
 
Begin
    If @pwdDecode = @pwd
        Set @Result = 1
    Else
        Set @Result = 0
End
Go

--Editar usuario
create Procedure updateUsuario 
  @idusuarios int,
  @rolUsuario int,
  @tipoCuenta_idtipoMembresia int,
  @nombre varchar(45),
  @correo varchar(45),
  @pwd varchar(45)
AS
Begin
  UPDATE usuario
  SET rolUsuario = @rolUsuario, tipoCuenta_idtipoMembresia = @tipoCuenta_idtipoMembresia,
     nombre = @nombre, correo = @correo, pwd = @pwd
  WHERE idusuarios = @idusuarios;
end
Go

--eliminar usuario modo logico
-- 0 en la tabla rol debe ser inactivo y en programacion se debe validar que el usuario que tenga como rol = 0  no permitira acceso 
create Procedure deleteUsuario 
  @idusuarios int
AS
Begin
  UPDATE usuario
  SET rolUsuario = 0 
  WHERE idusuarios = @idusuarios;
end
Go
--crear rol 
create procedure insertRol
  @idrolUsuarios int, 
  @rolUsuariocol varchar(45)
as
begin
  insert into rol (
    idrolUsuarios,
    rolUsuariocol
  ) values (
    @idrolUsuarios,
    @rolUsuariocol
  )
end
Go

--editar rol
create procedure updateRol
  @idrolUsuarios int, 
  @rolUsuariocol varchar(45)
as
begin
  UPDATE usuario
  SET rolUsuario = @rolUsuariocol
  WHERE rolUsuario = @idrolUsuarios
end
Go

--crear menbresias
create Procedure insertTipoMenbresia
  @idtipoMenbresia int,
  @nombreMembresia varchar (45),
  @descripcionMenbresia varchar(45)
as
Begin
  insert into tipoMenbresia (
  idtipoMenbresia,
  nombreMembresia,
  descripcionMenbresia
  ) values (
    @idtipoMenbresia,
    @nombreMembresia,
    @descripcionMenbresia
  )
end
Go

--editar menbresia
create procedure updateTipoMenbresia
  @idtipoMembresia int, 
  @nombreMembresia varchar(45),
  @descripcionMembresia varchar(45)
as
begin
  UPDATE TipoMembresia
  SET nombreMembresia = @nombreMembresia, descripcionMembresia = @descripcionMembresia
  WHERE idtipoMembresia = @idtipoMembresia
end
Go

--crear tipo movimiento
create Procedure insertTipoMovimiento
  @idtipoMovimiento int,
  @nombreMovimiento varchar(45),
  @perCRUDMovimiento varchar(45)
as
begin
  insert into tipoMovimiento(
    idtipoMovimiento,
    nombreMovimiento,
    perCRUDMovimiento
  ) values (
    @idtipoMovimiento,
    @nombreMovimiento,
    @perCRUDMovimiento
  )
end
Go

create procedure updateTipoMovimiento
  @idtipoMovimiento int,
  @nombreMovimiento varchar(45),
  @perCRUDMovimiento varchar(45)
as
Begin
  update tipoMovimiento 
  set nombreMovimiento = @nombreMovimiento, perCRUDMovimiento = @perCRUDMovimiento
  where idtipoMovimiento = @idtipoMovimiento
end
Go


--Crear estado de cuenta
create procedure insertEstadoCuenta
  @idestadoCuenta int,
  @usuarios_idusuarios int,
  @tipoMovimiento_idtipoMovimiento int,
  @monto bigint,
  @fecha date
as
begin
  insert into estadoCuenta (
    idestadoCuenta,
    usuarios_idusuarios,
    tipoMovimiento_idtipoMovimiento,
    monto,
    fecha
  ) 
  values (
    @idestadoCuenta,
    @usuarios_idusuarios,
    @tipoMovimiento_idtipoMovimiento,
    @monto,
    @fecha
  )
end
Go

--Editar estado cuenta
create procedure updateEstadoCuenta
  @idestadoCuenta int primary key,
  @usuarios_idusuarios int,
  @tipoMovimiento_idtipoMovimiento int,
  @monto bigint,
  @fecha date
as
begin
  UPDATE estadoCuenta
  SET usuarios_idusuarios = @usuarios_idusuarios, tipoMovimiento_idtipoMovimiento = @tipoMovimiento_idtipoMovimiento,
  monto = @monto, fecha = @fecha
  WHERE idestadoCuenta = @idestadoCuenta
end
Go

