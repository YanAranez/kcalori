USE [CaloriePal]
GO
/****** Object:  StoredProcedure [dbo].[sp_ReadMealLogs]    Script Date: 28/04/2024 10:53:48 am ******/
ALTER PROCEDURE [dbo].[sp_ReadMealLogs]
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Username SYSNAME = SYSTEM_USER;
    DECLARE @User_ID BIGINT;

    -- Retrieve the User_ID from Calori_User table
    SELECT @User_ID = User_ID
    FROM Calori_User
    WHERE Username = @Username;

    -- Select the meal logs of the current user
    SELECT *
    FROM dbo.Meal_Logs
    WHERE User_ID = @User_ID;

    SET NOCOUNT OFF;
END;
