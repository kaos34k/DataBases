CREATE DATABASE evaluacion
GO
USE evaluacion
GO
CREATE TABLE modelo (
  id_modelo int primary key,
  nombre_modelo varchar(60)
)
GO
CREATE TABLE avion(
  id_aereolinea int primary key,
  id_modelo int,
  nombre_avion varchar(60),
  foreign key(id_modelo) references modelo(id_modelo)
)
GO
CREATE TABLE ciudad(
  id_pais int primary key,
  nombre_ciudad varchar(60)
)
GO
CREATE TABLE vuelo(
  id_vuelo int primary key,
  id_avion int,
  id_ciudad_salidad int,
  id_ciudad_llegada int,
  fecha date,
  foreign key(id_ciudad_salidad) references ciudad (id_cudad),
  foreign key(id_ciudad_llegada) references ciudad (id_ciudad)
)
GO
CREATE TABLE persona( 
  id_avion int primary key,
  id_vuelo int,
  nombre_personas varchar(60),
  edad date(),
  cargo varchar(60)
  foreign key(id_vuelo) references vuelo(id_vuelo)  
)
GO

--Consultas:
--Ciudad en la que mas aterrizan vuelos
SELECT nombre_cuidad FROM SELECT WHERE id_ciudad IN ( SELECT count(id_ciudad_llegada) FROM VUELO );
--Ciudad en la que menos aterrizan vuelos
SELECT nombre_cuidad FROM SELECT WHERE id_ciudad IN ( 
                                                      SELECT Top 1 id_ciudad_llegada, Count(id_ciudad_llegada)
                                                      FROM VUELO
                                                      GROUP BY id_ciudad_llegada
                                                      ORDER BY 2  DESC 
                                                      );
--promedio de edad de los tripulantes del 1mer y ultimo vuelo.
CREATE PRCEDURE edad_prom_primer_vuelo()
AS
BEGIN
  @primer_vuelo  = SELECT TOP 1 id_vuelo FROM VUELO ORDER BY Fecha ASC LIMIT 1;
  SELECT AVG(edad) FROM personas WHERE id_vuelo = @primer_vuelo;
END

CREATE PRCEDURE edad_prom_ultimo_vuelo()
AS
BEGIN
  @ultimo_vuelo = SELECT TOP 1 id_vuelo FROM VUELO ORDER BY Fecha DESC LIMIT 1;
  SELECT AVG(edad) FROM personas WHERE id_vuelo = @ultimo_vuelo;
END


--promedio de de las asafatas en los 20 ultimos vuelos
CREATE PROCEDURE promedio_vuelos (@vuelos, @azafatas, @num_azafatas int, @personas)
AS
BEGIN
@vuelos  = SELECT id_vuelo FROM VUELO ORDER BY Fecha ASC LIMIT 20;
WHILE ( @vuelos )
  BEGIN
    @azafatas = SELECT count(id_personas) FROM personas WHERE crago = 'azafatas';
    @num_azafatas = @num_azafatas + @azafatas;
  END
  @personas = SELECT count(id_personas) FROM personas WHERE crago !=  'azafatas';
  @Promedio =  (@num_azafatas + @personas)/@vuelos; 
END;


--promedio de asiemtos vacios de los ultimos 20 vuelos

--modelo de avion que mas vuelos a realizado
CREATE PROCEDURE promedio_asientos_vacios ()
AS
BEGIN
  @id_avion = SELECT SUM(id_avion) FROM VUELO;
  @avion = SELECT id_modelo FROM avion WHERE id_avion = @id_avion;
  SELECT * FROM modelo WHERE  id_modelo = @avion;
END;


