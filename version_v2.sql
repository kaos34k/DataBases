USE version_2
GO
CREATE TABLE cliente (
	id_cliente int primary key,
	nombre varchar(60),
	email varchar(120)
)
GO
CREATE TABLE proveedor(
	id_proveedor int primary key, 
	nombre varchar(60),
	direccion varchar(120)
)
GO
CREATE TABLE empleado(
	id_empleado int primary key,
	direccion varchar(120),
	nombre varchar(60),
	apellido varchar(60),
	tipo_empleado varchar(60),
	foreign key (id_empleado) references empleado(id_empleado)
)
GO
CREATE TABLE telefono(
	id_telefono int primary key,
	id_cliente int,
	id_proveedor int,
	foreign key (id_cliente) references cliente(id_cliente),
	foreign  key (id_proveedor) references proveedor(id_proveedor)
)
GO
CREATE TABLE venta(
	id_venta int primary key,
	id_cliente int,
	id_empleado int,
	foreign key (id_cliente) references cliente(id_cliente),
	foreign key (id_empleado) references empleado(id_empleado)
)
GO	
CREATE TABLE compra (
	id_compra int primary key,
	id_empleado int,
	id_proveedor int,
	detalle_compra varchar(60),
	foreign key (id_empleado) references empleado (id_empleado),
	foreign key (id_proveedor) references proveedor(id_proveedor)
)
GO 
CREATE TABLE producto(
	id_producto int primary key, 
	nombre varchar (60),
	detalle_producto varchar(70),
	existencia int, 
)
GO
CREATE TABLE categoria(
	id_categoria int primary key,
	id_producto int,
	nombre_categoria varchar(60),
	foreign key (id_producto) references producto(id_producto)
)  	

GO	
CREATE TABLE factura (
	id_producto int,
	id_venta int,
	primary key(id_producto, id_venta ),
	constraint id_venta foreign key (id_venta)
	references venta(id_venta),
	constraint id_producto foreign key (id_producto)
	references producto(id_producto),
)
GO
CREATE TABLE remision(
	id_compra int ,
	id_producto int,
	primary key (id_compra, id_producto ), 
	detalle varchar(120),
	valor_compra float,
	total_compra float,
	foreign key (id_compra) references compra(id_compra),
	foreign key (id_producto) references producto(id_producto),
)
GO
