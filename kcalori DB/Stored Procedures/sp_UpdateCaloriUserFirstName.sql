USE [CaloriePal]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCaloriUserFirstName]    Script Date: 28/04/2024 10:57:50 am ******/
ALTER PROCEDURE [dbo].[sp_UpdateCaloriUserFirstName]
    @fn VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Username SYSNAME = SYSTEM_USER;
    DECLARE @User_ID BIGINT;

    SELECT @User_ID = User_ID
    FROM Calori_User
    WHERE Username = @Username;

    UPDATE Calori_User SET
        First_Name = @fn
    WHERE USER_ID = @User_ID;

    SET NOCOUNT OFF;
END;