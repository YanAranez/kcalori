USE [CaloriePal]
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateCaloriUser]    Script Date: 28/04/2024 10:49:04 am ******/
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
    @gen CHAR(1),
    @hei DECIMAL(6,2),
    @wei DECIMAL(6,2),
    @act TINYINT
) AS
BEGIN
    SET NOCOUNT ON;

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
    DECLARE @uid BIGINT = SCOPE_IDENTITY();
    SET IDENTITY_INSERT dbo.BMR ON;
    
    INSERT INTO dbo.BMR(User_ID, Age, Gender, Height, Weight, activity_level) VALUES (@uid, @age, @gen, @hei, @wei, @act);
    SET IDENTITY_INSERT dbo.BMR OFF;
    
    -- Execute stored procedure to calculate BMR
    EXEC sp_CalculateBMR @uid, @act;  

    SET NOCOUNT OFF;

END
