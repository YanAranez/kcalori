USE [CaloriePal]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCaloriUserLastName]    Script Date: 28/04/2024 11:00:33 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_UpdateCaloriUserLastName]
    @ln VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Username SYSNAME = SYSTEM_USER;
    DECLARE @User_ID BIGINT;

    SELECT @User_ID = User_ID
    FROM Calori_User
    WHERE Username = @Username;

    UPDATE Calori_User SET
        Last_Name = @ln
    WHERE USER_ID = @User_ID;

    SET NOCOUNT OFF;
END;