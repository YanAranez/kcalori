USE [CaloriePal]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCaloriUserPassword]    Script Date: 28/04/2024 11:03:57 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_UpdateCaloriUserPassword]
    @pw VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Username SYSNAME = SYSTEM_USER;
    DECLARE @User_ID BIGINT;

    SELECT @User_ID = User_ID
    FROM Calori_User
    WHERE Username = @Username;

    UPDATE Calori_User SET
        Password = @pw
    WHERE USER_ID = @User_ID;

    SET NOCOUNT OFF;
END;