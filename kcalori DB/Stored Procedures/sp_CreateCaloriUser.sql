USE [CaloriePal]
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateCaloriUser]    Script Date: 10/05/2024 11:52:39 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_CreateCaloriUser](
    @fn VARCHAR(50),
    @ln VARCHAR(50),
    @un VARCHAR(50),
    @pw VARCHAR(50),
    @age INT,
    @gen char(1),
    @hei DECIMAL(6,2),
    @wei DECIMAL(6,2),
    @act TINYINT,
    @goal_Wmodified varchar(20)
) AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @uid BIGINT;

    -- Check if the username already exists
    IF EXISTS (SELECT 1 FROM dbo.Calori_User WHERE Username = @un)
    BEGIN
        THROW 51000, 'The username already exists.', 1;
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM sys.sql_logins WHERE name = @un)
    BEGIN
        DECLARE @sql NVARCHAR(MAX);
        SET @sql = 'CREATE LOGIN ' + QUOTENAME(@un) + ' WITH PASSWORD = ' + QUOTENAME(@pw, '''') + ', DEFAULT_DATABASE = [CaloriePal];';
        EXEC(@sql);
    END

    DECLARE @sql2 NVARCHAR(MAX);
    SET @sql2 = 'CREATE USER ' + QUOTENAME(@un) + ' FOR LOGIN ' + QUOTENAME(@un) + ';';
    EXEC(@sql2);

    EXEC sp_addrolemember 'db_owner', @un;

    INSERT INTO dbo.Calori_User(First_Name, Last_Name, Username, Password) VALUES (@fn, @ln, @un, @pw);
    SET @uid = SCOPE_IDENTITY();
    SET IDENTITY_INSERT dbo.BMR ON;

    INSERT INTO dbo.BMR(User_ID, Age, Gender, Height, Weight, activity_level) VALUES (@uid, @age, @gen, @hei, @wei, @act);
    SET IDENTITY_INSERT dbo.BMR OFF;

    INSERT INTO dbo.Goals(User_ID, Goal_Level) VALUES (@uid, @goal_Wmodified);

    -- Add the new user to the db_executor role
    EXEC sp_addrolemember 'db_executor', @un;

    EXEC sp_CalculateBMR @uid, @act;  

    EXEC sp_BMRwithGoalModifier @uid;  

    -- Call the sp_CalculateDailyCalories stored procedure with the @uid parameter
    EXEC sp_CalculateDailyCalories @uid;

    SET NOCOUNT OFF;

END;