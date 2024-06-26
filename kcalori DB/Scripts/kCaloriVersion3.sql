USE [master]
GO
/****** Object:  Database [CaloriePal]    Script Date: 23/04/2024 8:18:11 pm ******/
CREATE DATABASE [CaloriePal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CaloriePal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.CALORI\MSSQL\DATA\CaloriePal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CaloriePal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.CALORI\MSSQL\DATA\CaloriePal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CaloriePal] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CaloriePal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CaloriePal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CaloriePal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CaloriePal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CaloriePal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CaloriePal] SET ARITHABORT OFF 
GO
ALTER DATABASE [CaloriePal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CaloriePal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CaloriePal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CaloriePal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CaloriePal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CaloriePal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CaloriePal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CaloriePal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CaloriePal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CaloriePal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CaloriePal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CaloriePal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CaloriePal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CaloriePal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CaloriePal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CaloriePal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CaloriePal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CaloriePal] SET RECOVERY FULL 
GO
ALTER DATABASE [CaloriePal] SET  MULTI_USER 
GO
ALTER DATABASE [CaloriePal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CaloriePal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CaloriePal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CaloriePal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CaloriePal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CaloriePal] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CaloriePal] SET QUERY_STORE = ON
GO
ALTER DATABASE [CaloriePal] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CaloriePal]
GO
/****** Object:  Table [dbo].[BMR]    Script Date: 23/04/2024 8:18:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BMR](
	[User_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Age] [int] NOT NULL,
	[Gender] [char](1) NOT NULL,
	[Height] [decimal](6, 2) NOT NULL,
	[Weight] [decimal](6, 2) NOT NULL,
	[BMR_Value] [decimal](8, 3) NULL,
	[activity_level] [tinyint] NULL,
 CONSTRAINT [PK_BMR] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calori_User]    Script Date: 23/04/2024 8:18:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calori_User](
	[User_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[First_Name] [varchar](50) NOT NULL,
	[Last_Name] [varchar](50) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[BMR_Value] [decimal](8, 3) NULL,
 CONSTRAINT [PK_Calori_User] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food_Data]    Script Date: 23/04/2024 8:18:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food_Data](
	[Food_ID] [bigint] NOT NULL,
	[Food_Name] [nvarchar](50) NOT NULL,
	[Hundred_G] [tinyint] NOT NULL,
	[Cal_PerG] [smallint] NOT NULL,
	[kCal_PerG] [smallint] NOT NULL,
 CONSTRAINT [PK_calories] PRIMARY KEY CLUSTERED 
(
	[Food_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Goals]    Script Date: 23/04/2024 8:18:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goals](
	[Goal_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Goal_Notes] [varchar](128) NOT NULL,
	[Goal_Level] [varchar](10) NULL,
	[User_ID] [bigint] NOT NULL,
 CONSTRAINT [PK_Goals] PRIMARY KEY CLUSTERED 
(
	[Goal_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meal_Logs]    Script Date: 23/04/2024 8:18:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meal_Logs](
	[Meal_Logs_ID] [bigint] NOT NULL,
	[User_ID] [bigint] NOT NULL,
	[Calories] [decimal](7, 2) NOT NULL,
	[Meal_Date] [nchar](10) NOT NULL,
	[User_Meal_ID] [bigint] NOT NULL,
	[Meal_Time] [datetime] NOT NULL,
 CONSTRAINT [PK_Meal_Logs] PRIMARY KEY CLUSTERED 
(
	[Meal_Logs_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Meals]    Script Date: 23/04/2024 8:18:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Meals](
	[User_Meal_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[User_ID] [bigint] NOT NULL,
	[Food_ID] [bigint] NULL,
	[Calories] [decimal](7, 2) NOT NULL,
	[Meal_Time] [datetime] NOT NULL,
 CONSTRAINT [PK_User_Meals] PRIMARY KEY CLUSTERED 
(
	[User_Meal_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_User_Meals_Calories] UNIQUE NONCLUSTERED 
(
	[Calories] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BMR]  WITH CHECK ADD  CONSTRAINT [FK_BMR_Calori_User1] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Calori_User] ([User_ID])
GO
ALTER TABLE [dbo].[BMR] CHECK CONSTRAINT [FK_BMR_Calori_User1]
GO
ALTER TABLE [dbo].[Goals]  WITH CHECK ADD  CONSTRAINT [FK_Goals_Calori_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Calori_User] ([User_ID])
GO
ALTER TABLE [dbo].[Goals] CHECK CONSTRAINT [FK_Goals_Calori_User]
GO
ALTER TABLE [dbo].[Meal_Logs]  WITH CHECK ADD  CONSTRAINT [FK_Meal_Logs_Calori_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Calori_User] ([User_ID])
GO
ALTER TABLE [dbo].[Meal_Logs] CHECK CONSTRAINT [FK_Meal_Logs_Calori_User]
GO
ALTER TABLE [dbo].[Meal_Logs]  WITH CHECK ADD  CONSTRAINT [FK_Meal_Logs_User_Meals] FOREIGN KEY([Calories])
REFERENCES [dbo].[User_Meals] ([Calories])
GO
ALTER TABLE [dbo].[Meal_Logs] CHECK CONSTRAINT [FK_Meal_Logs_User_Meals]
GO
ALTER TABLE [dbo].[User_Meals]  WITH CHECK ADD  CONSTRAINT [FK_User_Meals_Calori_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Calori_User] ([User_ID])
GO
ALTER TABLE [dbo].[User_Meals] CHECK CONSTRAINT [FK_User_Meals_Calori_User]
GO
ALTER TABLE [dbo].[User_Meals]  WITH CHECK ADD  CONSTRAINT [FK_User_Meals_Food_Data] FOREIGN KEY([Food_ID])
REFERENCES [dbo].[Food_Data] ([Food_ID])
GO
ALTER TABLE [dbo].[User_Meals] CHECK CONSTRAINT [FK_User_Meals_Food_Data]
GO
/****** Object:  StoredProcedure [dbo].[sp_BMRwithGoalModifier]    Script Date: 23/04/2024 8:18:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_BMRwithGoalModifier](
    @user_ID BIGINT,
    @goal_Wmodified DECIMAL(5,2)
)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @goal_modifier DECIMAL(5,2);
    DECLARE @bmr DECIMAL(8,3);

    -- Retrieve BMR for the specified user
    SELECT @bmr = BMR_Value
    FROM BMR
    WHERE User_ID = @user_ID;

    IF @goal_Wmodified = 1 -- Maintain
        SET @goal_modifier = 1.00;
    ELSE IF @goal_Wmodified = 2 --Mild Weight Loss
        SET @goal_modifier = 0.88;
    ELSE IF @goal_Wmodified = 3 --'Weight Loss'
        SET @goal_modifier = 0.75;
    ELSE 
        RAISERROR('Invalid Option',16,1);

    -- Apply goal modifier to BMR
    SET @bmr = @bmr * @goal_modifier;

    SET NOCOUNT OFF;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CalculateBMR]    Script Date: 23/04/2024 8:18:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CalculateBMR](
    @user_id BIGINT,
    @activity_level TINYINT
)
AS
BEGIN
    DECLARE @age INT;
    DECLARE @gen CHAR(1);
    DECLARE @hei DECIMAL(6,2);  
    DECLARE @wei DECIMAL(6,2);  
    DECLARE @bmr DECIMAL(8,3);
    DECLARE @activity_multiplier DECIMAL(5,2);

    -- Retrieve user details from BMR table
    SELECT @age = Age, @gen = Gender, @hei = Height, @wei = Weight 
    FROM BMR 
    WHERE User_ID = @user_id;

    -- Calculate BMR based on gender
    IF @gen = 'M' 
        SET @bmr = 13.397 * @wei + 4.799 * @hei - 5.677 * @age + 88.362; 
    ELSE
        SET @bmr = 9.247 * @wei + 3.098 * @hei - 4.330 * @age + 447.593;  

    -- Determine activity multiplier
    IF @activity_level = 1 -- Sedentary
        SET @activity_multiplier = 1.2;
    ELSE IF @activity_level = 2 -- Lightly Active
        SET @activity_multiplier = 1.375;
    ELSE IF @activity_level = 3 -- Moderately Active
        SET @activity_multiplier = 1.55;
    ELSE IF @activity_level = 4 -- Active
        SET @activity_multiplier = 1.725;
    ELSE 
        RAISERROR('Invalid activity level provided.', 16, 1);

    -- Apply activity multiplier to BMR
    SET @bmr = @bmr * @activity_multiplier;

    -- Update BMR_Value in both Calori_User and BMR tables
    UPDATE Calori_User
    SET BMR_Value = @bmr
    WHERE User_ID = @user_id;

    UPDATE BMR
    SET BMR_Value = @bmr
    WHERE User_ID = @user_id;

    -- Return the calculated BMR
    SELECT @bmr AS BMR_Value;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CalculateMealCalories]    Script Date: 23/04/2024 8:18:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CalculateMealCalories](
  @Foods NVARCHAR(4000),
  @UserProvidedCaloriesPerGram DECIMAL(10,2) = NULL  -- Optional user-entered calories per gram
)
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @UserID BIGINT;
  DECLARE @TotalCalories DECIMAL(10,2) = 0;
  DECLARE @Grams DECIMAL(10,2), @FoodName NVARCHAR(255);
  DECLARE @CalPerG DECIMAL(10,2);
  DECLARE @Delimiter CHAR(1) = ',';
  DECLARE @Mealtime DATETIME = GETDATE();

  -- Retrieve the current user's ID
  SET @UserID = USER_ID();

  -- Check if the user exists in the Calori_User table
  IF EXISTS (SELECT 1 FROM Calori_User WHERE User_ID = @UserID)
  BEGIN
    -- Loop through each food item
    WHILE LEN(@Foods) > 0
    BEGIN
      -- Extract food name and grams
      IF CHARINDEX(@Delimiter, @Foods) > 0
      BEGIN
        SET @FoodName = LEFT(@Foods, CHARINDEX(@Delimiter, @Foods) - 1);
        SET @Foods = SUBSTRING(@Foods, CHARINDEX(@Delimiter, @Foods) + 1, LEN(@Foods) - CHARINDEX(@Delimiter, @Foods));
      END
      ELSE
      BEGIN
        SET @FoodName = @Foods;
        SET @Foods = '';
      END

      -- Extract grams
      IF CHARINDEX(':', @FoodName) > 0
      BEGIN
        SET @Grams = TRY_CAST(SUBSTRING(@FoodName, CHARINDEX(':', @FoodName) + 1, LEN(@FoodName)) AS DECIMAL(10,2));
        SET @FoodName = LEFT(@FoodName, CHARINDEX(':', @FoodName) - 1);
      END
      ELSE
      BEGIN
        -- Handle error if delimiter ":" is not found in food name
        RAISERROR('Invalid food format: %s', 16, 1, @FoodName);
        RETURN;
      END

      -- Check for user-provided calorie value
      IF @UserProvidedCaloriesPerGram IS NOT NULL
      BEGIN
        SET @TotalCalories = @TotalCalories + @UserProvidedCaloriesPerGram * ISNULL(@Grams, 0);
      END
      ELSE
      BEGIN
        -- Existing logic for database lookup and calculation (if food name provided)
        IF @FoodName IS NOT NULL
        BEGIN
          SELECT @CalPerG = Cal_PerG
          FROM Food_data
          WHERE Food_Name = @FoodName;

          IF @@ROWCOUNT = 0  -- Check if food was not found
          BEGIN
            RAISERROR('Food not found in database: %s', 16, 1, @FoodName);
            RETURN;
          END

          SET @TotalCalories = @TotalCalories + (ISNULL(@CalPerG, 0) * ISNULL(@Grams, 0));
        END
        -- Handle cases where only grams are provided (assuming default food)
        ELSE
        BEGIN
          SET @TotalCalories = @TotalCalories + (ISNULL(@Grams, 0) * 100); -- Assuming default food with Cal_PerHundredG = 100
        END
      END
    END



    -- Insert the meal information into User_Meals table
    INSERT INTO User_Meals(User_ID, Food_ID,Calories, Meal_Time)
    VALUES (@UserID, NULL, @TotalCalories, GETDATE());

    -- Return the total calories
    SELECT @TotalCalories AS Calories;
    SET NOCOUNT OFF;
  END
  ELSE
  BEGIN
    RAISERROR('User not found in Calori_User table', 16, 1);
    RETURN;
  END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateCaloriUser]    Script Date: 23/04/2024 8:18:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_CreateCaloriUser](
	@fn VARCHAR(50),
	@ln VARCHAR(50),
	@un VARCHAR(50),
	@pw VARCHAR(50),
	@age int,
	@gen CHAR(1),
	@hei DECIMAL(6,2),
	@wei DECIMAL(6,2),
	@act TINYINT
	

	)

AS

BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.Calori_User(First_Name, Last_Name, Username, Password) VALUES (@fn, @ln, @un, @pw);
	DECLARE @uid BIGINT = SCOPE_IDENTITY();
	SET IDENTITY_INSERT dbo.BMR ON;
	
	INSERT INTO dbo.BMR(User_ID, Age, Gender, Height, Weight, activity_level) VALUES (@uid, @age, @gen, @hei, @wei, @act);
	SET IDENTITY_INSERT dbo.BMR OFF;
	
	--
	EXEC sp_CalculateBMR @uid,@act;  

	SET NOCOUNT OFF;


END
GO
/****** Object:  StoredProcedure [dbo].[sp_LoginCaloriUser]    Script Date: 23/04/2024 8:18:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_LoginCaloriUser](
	@un VARCHAR(50),
	@pw VARCHAR(50)
)


AS


BEGIN	
	SET NOCOUNT ON;

	DECLARE @user_ID BIGINT;

	SELECT TOP 1 @user_ID = USER_ID from Calori_User WHERE Username = @user_ID;
	
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ReadCaloriUser]    Script Date: 23/04/2024 8:18:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ReadCaloriUser]

AS


BEGIN
SET NOCOUNT ON;

SELECT * FROM dbo.Calori_User;

SET NOCOUNT OFF;


END
GO
/****** Object:  StoredProcedure [dbo].[sp_ReadMealLogs]    Script Date: 23/04/2024 8:18:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ReadMealLogs]


AS

BEGIN

	SET NOCOUNT ON;

	SELECT * FROM dbo.Meal_Logs;

	SET NOCOUNT OFF;

END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCaloriUserFirstName]    Script Date: 23/04/2024 8:18:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_UpdateCaloriUserFirstName](
	@user_ID BIGINT,
	@fn VARCHAR(50)
)


AS 

BEGIN
	SET NOCOUNT ON;
	UPDATE Calori_User SET
	First_Name = @fn
	WHERE USER_ID = @user_ID;
	SET NOCOUNT OFF;


END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCaloriUserLastName]    Script Date: 23/04/2024 8:18:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_UpdateCaloriUserLastName](
	@user_ID BIGINT,
	@ln VARCHAR(50)
)


AS 

BEGIN
	SET NOCOUNT ON;
	UPDATE Calori_User SET
	Last_Name = @ln
	WHERE USER_ID = @user_ID;
	SET NOCOUNT OFF;


END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCaloriUserPassword]    Script Date: 23/04/2024 8:18:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_UpdateCaloriUserPassword] (
	@user_ID BIGINT,
	@pw VARCHAR(50)
)

AS

BEGIN
	SET NOCOUNT ON;
	UPDATE Calori_User SET
	Password = @pw
	WHERE USER_ID = @user_ID;
	SET NOCOUNT OFF;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCaloriUserUsername]    Script Date: 23/04/2024 8:18:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_UpdateCaloriUserUsername] (
	@user_id BIGINT,
	@un VARCHAR(64)

)


AS


BEGIN
	SET NOCOUNT ON;
		UPDATE Calori_User SET
		Username = @un
		WHERE User_ID = @user_id;
	SET NOCOUNT OFF;
END;
GO
USE [master]
GO
ALTER DATABASE [CaloriePal] SET  READ_WRITE 
GO
