USE [CaloriePal]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCaloriUserUsername]    Script Date: 28/04/2024 11:04:28 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[sp_UpdateCaloriUserUsername]
    @un VARCHAR(64)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Username SYSNAME = SYSTEM_USER;
    DECLARE @User_ID BIGINT;

    SELECT @User_ID = User_ID
    FROM Calori_User
    WHERE Username = @Username;

    UPDATE Calori_User SET
        Username = @un
    WHERE USER_ID = @User_ID;

    SET NOCOUNT OFF;
END;