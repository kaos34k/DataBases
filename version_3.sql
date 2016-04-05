CREATE DATABASE version_3
GO
USE version_3
GO
CREATE TABLE categoria(
	id_catgoria int primary key,
	nombre varchar(60)
)
GO
CREATE TABLE producto(
	id_producto int primary key, 
	id_catgoria int,
	nombre varchar(60),
	foreign key(id_catgoria) references categoria(id_catgoria)
)
GO
CREATE TABLE persona(
 id_persona int primary key,
 nombre varchar(60),
 email varchar(60), 
 apellido varchar(60),
 direccion varchar(120),
 cargo varchar(60),
 salario float,
 cliente_ingresos float,
 foreign key(id_persona) references persona(id_persona)
)
GO
CREATE TABLE proveedor(
	id_proveedor int primary key, 
	nombre varchar(60),
	apellido varchar(60) 

)
GO
CREATE TABLE telefono(
	id_telefono int primary key,
	id_persona int,
	id_proveedor int, 
	foreign key(id_persona) references persona(id_persona),
	foreign key(id_proveedor) references proveedor(id_proveedor) 
)
GO
CREATE TABLE factura (
	id_factura int primary key,
	id_proveedor int,
	fecha date,
	tipo varchar(60),
	iva float,
	total float,
	subtotal float,
	foreign key (id_proveedor) references proveedor(id_proveedor), 
)
GO
CREATE TABLE movimiento(
	id_producto int, 
	id_factura int,
	foreign key (id_producto) references producto(id_producto),
	foreign key (id_factura) references factura(id_factura),
	primary key(id_producto, id_factura),  
)
