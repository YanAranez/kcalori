USE [CaloriePal]
GO
/****** Object:  StoredProcedure [dbo].[sp_ReadMealLogs]    Script Date: 30/04/2024 11:41:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[sp_ReadMealLogs]    Script Date: 28/04/2024 10:53:48 am ******/
ALTER PROCEDURE [dbo].[sp_ReadMealLogs]
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Username SYSNAME = SYSTEM_USER;
    DECLARE @User_ID BIGINT;

    SELECT @User_ID = User_ID
    FROM Calori_User
    WHERE Username = @Username;

    SELECT * FROM dbo.Meal_Logs
    WHERE User_ID = @User_ID;

    SET NOCOUNT OFF;
END;
