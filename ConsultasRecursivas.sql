CREATE TABLE empleado(
NmrEmpleado int,
nombre varchar(60), 
apellido varchar(60),
cargo varchar(60),
NroJefe int,
constraint PK_EMPLEADO PRIMARY KEY (NmrEmpleado),
constraint FK_JEFE PRIMARY KEY(NroJefe)
)
GO

--Crear consulta recursiva
WHITH empleadorR(NroEmpleado, nombre, apellido, cargo, NroJefe)
  AS (
  SELECT NroEmpleado, nombre, apellido, cargo, NroJefe 
    FROM empleado 
    WHERE NroEmpleado = 4
  UNION ALL
--Recursividad
  SELECT NroEmpleado, nombre, apellido, cargo, NroJefe
    FROM empleado AS e JOIN empleadorR AS m
    ON e.NroJefe = m.NroEmpleado;
)
--desplegar resultados
SELECT * FROM empleadorR
  
  
--Crear consulta recursiva
WHITH empleadorR(NroEmpleado, nombre, apellido, cargo, NroJefe)
  AS (
  SELECT NroEmpleado, nombre, apellido, cargo, NroJefe 
    FROM empleado 
    WHERE NroEmpleado = 4
  UNION ALL
--Recursividad
  SELECT NroEmpleado, nombre, apellido, cargo, NroJefe
    FROM empleado AS e JOIN empleadorR AS m
    ON m.NroEmpleado = e.NroJefe;
)
--desplegar resultados
SELECT * FROM empleadorR


--Variables se definen con @
--@var (tipo de dato)
--Declarar variable
declare @var2 decimal(10,2)
declare @var int
--Como asignar variables SET o select
--SET variables independientes
--SELECT tambien maneja consultas de una base de datos 

SET @var = 10
SET @var2 = @var * 0.15
--Mostrar el resultado print, select
SELECT   set @var2 AS titulo
print @var2


-- Transaciones
BEGIN TRANSATION t1 
  update empreado set nombre = 'mariana'
  where NorEmpleado = 4 
ROLLBACK t1
COMMIT TRANSATION t1

CREATE PROCEDURE usp_insertar 
  @NorEmpleado int,
  @nombre varchar(60),
  @apellido varchar(60),
  @cargo varchar(60),
  @NroJefe int
  AS 
  BEGIN
    BEGIN TRANSATION t1
      INSER INTO empleado VALUES (@NorEmpleado,@nombre, @apellido, @cargo, @NroJefe)
      IF @@error >0
        BEGIN
          ROLLBACK  TRANSACTION t1
          return 
        END
      ELSE  
        BEGIN
          COMMIT TRANSATION t1 
          return
        END
  END


