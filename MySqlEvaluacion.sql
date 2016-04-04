CREATE DATABASE evaluacion; 
USE evaluacion; 
CREATE TABLE modelo ( 
    id_modelo int primary key, 
    nombre_modelo varchar(60) 
); 
CREATE TABLE avion( 
    id_avion int primary key, 
    id_modelo int, 
    nombre_avion varchar(60), 
    foreign key(id_modelo) references modelo(id_modelo) 
); 
CREATE TABLE ciudad( 
    id_ciudad int primary key, 
    nombre_ciudad varchar(60) 
);
CREATE TABLE vuelo( 
    id_vuelo int primary key,
    id_avion int, 
    id_ciudad_salidad int, 
    id_ciudad_llegada int, 
    fecha date,
    foreign key(id_avion) references avion (id_avion),
    foreign key(id_ciudad_salidad) references ciudad (id_ciudad), 
    foreign key(id_ciudad_llegada) references ciudad (id_ciudad) 
); 
CREATE TABLE persona( 
    id_persona int primary key, 
    id_vuelo int, 
    nombre_personas varchar(60), 
    edad date, 
    cargo varchar(60), 
    foreign key(id_vuelo) references vuelo(id_vuelo) 
);
