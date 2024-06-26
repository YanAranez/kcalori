USE [CaloriePal]
GO
/****** Object:  StoredProcedure [dbo].[sp_LoginCaloriUser]    Script Date: 18/04/2024 5:51:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_LoginCaloriUser](
	@un VARCHAR(50),
	@pw VARCHAR(50)
)


AS


BEGIN	
	SET NOCOUNT ON;

	DECLARE @user_ID BIGINT;

	SELECT TOP 1 @user_ID = USER_ID from Calori_User WHERE Username = @un;
	
	IF @user_ID IS NOT NULL
		BEGIN
			DECLARE @pw_stored VARCHAR(50);
			SELECT @pw_stored = Password FROM Calori_User WHERE User_ID = @user_ID;
			SET @pw_stored = HASHBYTES('SHA2_256',@pw_stored);

			DECLARE @pw_input VARCHAR(MAX);
			SET @pw_input = HASHBYTES('SHA2_256',@pw);

			IF @pw_input = @pw_stored
			BEGIN
				SELECT 1 As LoginSuccess;
			END
			ELSE
			BEGIN
				SELECT 0 AS Loginsuccess;
			END

		END
		ELSE
		BEGIN
			SELECT 0 AS Loginsuccess;
		END

	SET NOCOUNT OFF;
END
