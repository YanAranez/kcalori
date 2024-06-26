USE [CaloriePal]


GO


ALTER PROCEDURE [dbo].[sp_ReadCaloriUser]
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Username SYSNAME = SYSTEM_USER;
    DECLARE @User_ID BIGINT;

    SELECT @User_ID = User_ID
    FROM Calori_User
    WHERE Username = @Username;

    SELECT *
    FROM dbo.Calori_User
    WHERE User_ID = @User_ID;

    SET NOCOUNT OFF;
END;