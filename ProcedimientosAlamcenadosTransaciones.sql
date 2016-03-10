USE compras; -- base de datos inexistente solo es para hacer el ejercicio.
CREATE PROCEDURE crear_producto (
@id int,
@nombre varchar(60),
@tipo varchar(60),
AS BEGIN
  BEGIN TRANSACTION guardar
    BEGIN TRY
      IF EXISTS ( SELECT * FROM producto WHERE id = @id )
        BEGINT
          SELECT "El prodcto ya existe por favor igresa uno diferente" AS mensaje;
        END
      ELSE IF ()  
    END TRY
    BEGIN CATCH
    END CATCH
  END
)
