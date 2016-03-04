CREATE PROCEDURE sp_borrar_pro_bop(
	@referencia int,
	@cod_bod int,
	@cod_usu varchar(10)
)
GO
AS BEGIN
	BEGIN transaction tx1
		BEGIN TRY
			IF EXISTS(SELECT referencia FROM TBLX)
			BEGIN

			END ELSE
			BEGIN

			END
			IF(@@ERROR>0)
			BEGIN
				rollback tx1
			END ELSE
			BEGIN
				commit tx1
			END	
		END TRY
		BEGIN CATCH
			ERROR_MESSAGE()
		END CATCH
	END				
