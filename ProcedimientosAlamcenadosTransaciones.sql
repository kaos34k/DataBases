USE compras; -- base de datos inexistente solo es para hacer el ejercicio.
CREATE PROCEDURE crear_producto (
  @id int,
  @nombre varchar(60),
  @valor_neto DOUBLE,
  @valor_iva DOUBLE,
  @tipo varchar(60),
)
AS BEGIN
  BEGIN TRANSACTION guardar
    BEGIN TRY
      IF EXISTS ( SELECT * FROM producto WHERE id = @id ) -- pregunto si el id ya existe y retorno un mensaje con una alerta.
        BEGINT
          SELECT "El prodcto ya existe por favor igresa uno diferente" AS mensaje;
        END
      ELSE IF ( @tipo = servicio )
        BEGINT
          @valor_iva =  @valor_neto * 0.5;
          INSERT INTO producto  (id, nombre, valor_neto, tipo)
                 VALUES (@id, @nombre, @valor_neto, @tipo);
          SELECT "El prodcto ya a sido creado y se le a incrementado un 0.5% al valor real" AS mensaje;       
        END
      ELSE IF ( @tipo = bien )
      END
    END TRY
    BEGIN CATCH
    END CATCH
  END
