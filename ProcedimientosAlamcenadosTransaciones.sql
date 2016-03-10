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
          IF ( @id = NULL )
            BEGINT
              @ultimo_registro SELECT MAX(id) FROM producto;
              @id =  @ultimo_registro + 1;
            END
          END
          @valor_iva =  @valor_neto * 0.5;
          INSERT INTO producto  (id, nombre, valor_neto, tipo)
                 VALUES (@id, @nombre, @valor_neto, @tipo);
          SELECT "El prodcto ya a sido creado y se le a incrementado un 0.5% al valor real" AS mensaje;       
        END
      ELSE IF ( @tipo = bien )
          IF ( @id = NULL )
            BEGINT
              @ultimo_registro SELECT MAX(id) FROM producto;
              @id =  @ultimo_registro + 1;
            END
          END
          @valor_iva =  @valor_neto * 0.2;
          INSERT INTO producto  (id, nombre, valor_neto, tipo)
                 VALUES (@id, @nombre, @valor_neto, @tipo);
          SELECT "El prodcto ya a sido creado y se le a incrementado un 0.5% al valor real" AS mensaje;    
      END
      IF(@@ERROR > 0)
        BEGINT
          ROLLBACK guardar
          SELECT "Existe un error por favor vielve a intentarlo de nuevo" AS mensaje;
        END
      ELSE
        BEGINT
          COMMIT guardar
        END
      END
    END TRY
    BEGIN CATCH
      ERROR_MESSAGE() AS mensaje;
    END CATCH
  END
EXECUTE crear_producto @id = NULL,  @nombre = "pañales"  @valor_neto  = 12312,@valor_iva,@tipo = "servicio";
