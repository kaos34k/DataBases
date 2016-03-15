CREATE DATABASE modelo_v1
GO
USE  modelo_v1
GO

CREATE TABLE categoria (
	idcategoria int primary key,
) 
GO
CREATE TABLE persona (
	idpersona int primary key,
) 
GO
CREATE TABLE cliente (
	idcliente int primary key,
	idpersona int,
	ingresos varchar(60),
	foreign key (idpersona) references persona(idpersona)
) 
GO
CREATE TABLE empleado (
	idempleado int primary key,
	idpersona int,
	foreign key (idpersona) references persona(idpersona),
	foreign key(idempleado) references empleado(idempleado),
) 
GO
CREATE TABLE proveedor (
	idproveedor int primary key,
	nombre varchar(60),
	apellido varchar(60),
	telefono varchar(60),
) 
GO
CREATE TABLE producto (
	idproducto int primary key,
) 
GO
CREATE TABLE relacion_rara_que_encontre_por_hay(
	idrelacion_rara_que_encontre_por_hay int,
	idproducto int,
	idc int, -- este id no se ni de donde salio eso esta en el modelo y si no escriben las variables completas pues ovbio no se va a entender.
	PRIMARY KEY(idproducto,idc),
	valor_total varchar(60),
	cantidad varchar(60),
)
GO
CREATE TABLE factura (
	idfactura int primary key,
) 
GO
CREATE TABLE venta (
	idventa int primary key,
) 
GO
CREATE TABLE persona_venta (
	idventa int,
	idpersona int,
	foreign key (idventa) references venta(idventa),
	foreign key (idpersona) references persona(idpersona)
)
GO
CREATE TABLE compra (
	idcompra int primary key,
	idempleado int,
	foreign key (idempleado) references  empleado(idempleado),
) 
GO
