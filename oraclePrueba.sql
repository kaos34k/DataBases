create database pruebaOracle

crate table Cajeros(
 codigocaja int,
 Nombre varchar(45),
 Apellido varchar(45),
 edad int,
 correo varchar (45),
 sueldo varchar(45)
)

create table Productos (
  Codigopro int,
  Nombre varchar(45),
  Precio int,
  Marca varchar(45)
)

create table Maquina_registradora(
  codigomaquina int,
  Piso int
)

create table Venta (
  codigopro int, 
  codigocaje int,
  codigomaquina int,
  fechaVenta date
  foing key (codigopro) references Productos (Codigopro)
)
