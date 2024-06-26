USE [master]
GO
/****** Object:  Database [CaloriePal]    Script Date: 29/04/2024 11:11:41 pm ******/
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
/****** Object:  User [Test]    Script Date: 29/04/2024 11:11:42 pm ******/
CREATE USER [Test] FOR LOGIN [Test] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rebster]    Script Date: 29/04/2024 11:11:42 pm ******/
CREATE USER [rebster] FOR LOGIN [rebster] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rebbieun32]    Script Date: 29/04/2024 11:11:42 pm ******/
CREATE USER [rebbieun32] FOR LOGIN [rebbieun32] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rebbieun212]    Script Date: 29/04/2024 11:11:42 pm ******/
CREATE USER [rebbieun212] FOR LOGIN [rebbieun212] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rebbieun12412]    Script Date: 29/04/2024 11:11:42 pm ******/
CREATE USER [rebbieun12412] FOR LOGIN [rebbieun12412] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rebbieun124]    Script Date: 29/04/2024 11:11:42 pm ******/
CREATE USER [rebbieun124] FOR LOGIN [rebbieun124] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rebbieun1234]    Script Date: 29/04/2024 11:11:42 pm ******/
CREATE USER [rebbieun1234] FOR LOGIN [rebbieun1234] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rebbieun1224]    Script Date: 29/04/2024 11:11:42 pm ******/
CREATE USER [rebbieun1224] FOR LOGIN [rebbieun1224] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rebbieun12]    Script Date: 29/04/2024 11:11:42 pm ******/
CREATE USER [rebbieun12] FOR LOGIN [rebbieun12] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rebbieun]    Script Date: 29/04/2024 11:11:42 pm ******/
CREATE USER [rebbieun] FOR LOGIN [rebbieun] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rebbie]    Script Date: 29/04/2024 11:11:42 pm ******/
CREATE USER [rebbie] FOR LOGIN [rebbie] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [marcopolos123]    Script Date: 29/04/2024 11:11:42 pm ******/
CREATE USER [marcopolos123] FOR LOGIN [marcopolos123] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [marcopolos]    Script Date: 29/04/2024 11:11:42 pm ******/
CREATE USER [marcopolos] FOR LOGIN [marcopolos] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [marcopolo]    Script Date: 29/04/2024 11:11:42 pm ******/
CREATE USER [marcopolo] FOR LOGIN [marcopolo] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [2marcopolos123]    Script Date: 29/04/2024 11:11:42 pm ******/
CREATE USER [2marcopolos123] FOR LOGIN [2marcopolos123] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [db_executor]    Script Date: 29/04/2024 11:11:42 pm ******/
CREATE ROLE [db_executor]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Test]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [Test]
GO
ALTER ROLE [db_executor] ADD MEMBER [rebster]
GO
ALTER ROLE [db_owner] ADD MEMBER [rebster]
GO
ALTER ROLE [db_owner] ADD MEMBER [rebbieun32]
GO
ALTER ROLE [db_owner] ADD MEMBER [rebbieun212]
GO
ALTER ROLE [db_owner] ADD MEMBER [rebbieun12412]
GO
ALTER ROLE [db_owner] ADD MEMBER [rebbieun124]
GO
ALTER ROLE [db_owner] ADD MEMBER [rebbieun1234]
GO
ALTER ROLE [db_owner] ADD MEMBER [rebbieun1224]
GO
ALTER ROLE [db_owner] ADD MEMBER [rebbieun12]
GO
ALTER ROLE [db_owner] ADD MEMBER [rebbieun]
GO
ALTER ROLE [db_datareader] ADD MEMBER [rebbie]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [rebbie]
GO
ALTER ROLE [db_executor] ADD MEMBER [marcopolos123]
GO
ALTER ROLE [db_owner] ADD MEMBER [marcopolos123]
GO
ALTER ROLE [db_owner] ADD MEMBER [marcopolos]
GO
ALTER ROLE [db_owner] ADD MEMBER [marcopolo]
GO
ALTER ROLE [db_executor] ADD MEMBER [2marcopolos123]
GO
ALTER ROLE [db_owner] ADD MEMBER [2marcopolos123]
GO
/****** Object:  Table [dbo].[BMR]    Script Date: 29/04/2024 11:11:42 pm ******/
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
/****** Object:  Table [dbo].[Calori_User]    Script Date: 29/04/2024 11:11:42 pm ******/
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
/****** Object:  Table [dbo].[Daily_Calories]    Script Date: 29/04/2024 11:11:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Daily_Calories](
	[User_ID] [bigint] NOT NULL,
	[DayOfWeek] [varchar](20) NOT NULL,
	[MaintainWeight] [decimal](10, 2) NULL,
	[MildWeightLoss] [decimal](10, 2) NULL,
	[WeightLoss] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Daily_Calories_1] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food_Data]    Script Date: 29/04/2024 11:11:42 pm ******/
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
/****** Object:  Table [dbo].[Goals]    Script Date: 29/04/2024 11:11:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goals](
	[Goal_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Goal_Notes] [varchar](128) NULL,
	[Goal_Level] [varchar](10) NULL,
	[User_ID] [bigint] NOT NULL,
	[Goal_BMR] [decimal](8, 3) NULL,
 CONSTRAINT [PK_Goals] PRIMARY KEY CLUSTERED 
(
	[Goal_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meal_Logs]    Script Date: 29/04/2024 11:11:42 pm ******/
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
/****** Object:  Table [dbo].[User_Meals]    Script Date: 29/04/2024 11:11:42 pm ******/
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
ALTER TABLE [dbo].[Daily_Calories]  WITH CHECK ADD  CONSTRAINT [FK_User_ID] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Calori_User] ([User_ID])
GO
ALTER TABLE [dbo].[Daily_Calories] CHECK CONSTRAINT [FK_User_ID]
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
/****** Object:  StoredProcedure [dbo].[sp_BMRwithGoalModifier]    Script Date: 29/04/2024 11:11:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_BMRwithGoalModifier]
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @goal_modifier DECIMAL(5,2);
    DECLARE @gbmr DECIMAL(8,3);
	DECLARE @bmr DECIMAL(8,3);
    DECLARE @user_ID BIGINT;

    -- Get the current username
    DECLARE @Username SYSNAME = SYSTEM_USER;

    -- Retrieve the User_ID from Calori_User table
    SELECT @user_ID = User_ID
    FROM Calori_User
    WHERE Username = @Username;

    -- Retrieve BMR for the specified user
    SELECT @bmr = BMR_Value
    FROM BMR
    WHERE User_ID = @user_ID;

    -- Get the goal modifier from the input parameter
    DECLARE @goal_Wmodified DECIMAL(5,2) = (SELECT Goal_Level FROM Goals WHERE User_ID = @user_ID);

    IF @goal_Wmodified = 1 -- Maintain
        SET @goal_modifier = 1.00;
    ELSE IF @goal_Wmodified = 2 --Mild Weight Loss
        SET @goal_modifier = 0.88;
    ELSE IF @goal_Wmodified = 3 --'Weight Loss'
        SET @goal_modifier = 0.75;
    ELSE 
        RAISERROR('Invalid Option',16,1);

    -- Apply goal modifier to BMR
    SET @gbmr = @bmr * @goal_modifier;

	UPDATE Goals SET
	Goal_BMR = @gbmr
	WHERE User_ID = @user_ID;

	SELECT @gbmr as Goal_BMR;
    SET NOCOUNT OFF;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CalculateBMR]    Script Date: 29/04/2024 11:11:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CalculateBMR]
(
    @user_id BIGINT,
    @activity_level TINYINT
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @age INT;
    DECLARE @gen CHAR(1);
    DECLARE @hei DECIMAL(6,2);  
    DECLARE @wei DECIMAL(6,2);  
    DECLARE @bmr DECIMAL(8,3);
    DECLARE @activity_multiplier DECIMAL(5,2);

    SELECT @age = Age, @gen = Gender, @hei = Height, @wei = Weight 
    FROM BMR 
    WHERE User_ID = @user_id;

    SELECT @activity_level = activity_level
    FROM BMR
    WHERE User_ID = @user_id;

    IF @gen = 'M' 
        SET @bmr = 13.397 * @wei + 4.799 * @hei - 5.677 * @age + 88.362; 
    ELSE
        SET @bmr = 9.247 * @wei + 3.098 * @hei - 4.330 * @age + 447.593;  

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

    SET @bmr = @bmr * @activity_multiplier;

    UPDATE Calori_User
    SET BMR_Value = @bmr
    WHERE User_ID = @user_id;

    UPDATE BMR
    SET BMR_Value = @bmr
    WHERE User_ID = @user_id;

    SELECT @bmr AS BMR_Value;
    SET NOCOUNT OFF;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CalculateDailyCalories]    Script Date: 29/04/2024 11:11:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CalculateDailyCalories]
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @user_id BIGINT;
    DECLARE @username SYSNAME = SYSTEM_USER;

    -- Retrieve the User_ID from Calori_User table based on the current username
    SELECT @user_id = User_ID
    FROM Calori_User
    WHERE Username = @username;

    -- Check if user ID is NULL (not found)
    IF @user_id IS NULL
    BEGIN
        RAISERROR('User ID not found for the currently logged-in user.', 16, 1);
        RETURN;
    END;

    DECLARE @bmr DECIMAL(8,3);
    DECLARE @activity_multiplier DECIMAL(5,2);

    -- Retrieve BMR value and activity level based on user's ID
    SELECT @bmr = BMR_Value, @activity_multiplier = Activity_Level
    FROM BMR 
    WHERE User_ID = @user_id;

    -- Check if BMR value or activity level is NULL (not found)
    IF @bmr IS NULL OR @activity_multiplier IS NULL
    BEGIN
        RAISERROR('BMR value or activity level not found for the provided user ID.', 16, 1);
        RETURN;
    END;

 -- Insert calculated daily calorie intake into Daily_Calories table
    INSERT INTO Daily_Calories (User_ID, DayOfWeek, MaintainWeight, MildWeightLoss, WeightLoss)
    VALUES (@user_id, 'Sunday', ROUND(@bmr * @activity_multiplier, 2), ROUND(@bmr * @activity_multiplier - 17, 2), ROUND(@bmr * @activity_multiplier - 20, 2)),
           (@user_id, 'Monday', ROUND(@bmr * @activity_multiplier, 2), ROUND(@bmr * @activity_multiplier - 9, 2), ROUND(@bmr * @activity_multiplier - 26, 2)),
           (@user_id, 'Tuesday', ROUND(@bmr * @activity_multiplier, 2), ROUND(@bmr * @activity_multiplier + 58, 2), ROUND(@bmr * @activity_multiplier - 22, 2)),
           (@user_id, 'Wednesday', ROUND(@bmr * @activity_multiplier, 2), ROUND(@bmr * @activity_multiplier - 17, 2), ROUND(@bmr * @activity_multiplier - 40, 2)),
           (@user_id, 'Thursday', ROUND(@bmr * @activity_multiplier, 2), ROUND(@bmr * @activity_multiplier + 0, 2), ROUND(@bmr * @activity_multiplier - 24, 2)),
           (@user_id, 'Friday', ROUND(@bmr * @activity_multiplier, 2), ROUND(@bmr * @activity_multiplier - 67, 2), ROUND(@bmr * @activity_multiplier - 47, 2)),
           (@user_id, 'Saturday', ROUND(@bmr * @activity_multiplier, 2), ROUND(@bmr * @activity_multiplier - 134, 2), ROUND(@bmr * @activity_multiplier - 64, 2));

    SET NOCOUNT OFF;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CalculateMealCalories]    Script Date: 29/04/2024 11:11:42 pm ******/
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

  -- Validate input parameters
  IF @Foods IS NULL OR LEN(@Foods) = 0
  BEGIN
    RAISERROR('Food list cannot be empty.', 16, 1);
    RETURN;
  END

  DECLARE @UserID BIGINT;
  DECLARE @TotalCalories DECIMAL(10,2) = 0;
  DECLARE @Grams DECIMAL(10,2), @FoodName NVARCHAR(255);
  DECLARE @CalPerG DECIMAL(10,2);
  DECLARE @Delimiter CHAR(1) = ',';
  DECLARE @Mealtime DATETIME = GETDATE();

  -- Get the current username
  DECLARE @Username SYSNAME = SYSTEM_USER;

  -- Retrieve the User_ID from Calori_User table
  SELECT @UserID = User_ID
  FROM Calori_User
  WHERE Username = @Username;

  -- Check if the user exists in the Calori_User table
  IF @UserID IS NOT NULL
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

      -- Check if the food item exists in the database
      IF NOT EXISTS (SELECT 1 FROM Food_data WHERE Food_Name = @FoodName)
      BEGIN
        -- If the food item doesn't exist, insert it into the Food_data table with default values
        INSERT INTO Food_data (Food_Name, Cal_PerG) VALUES (@FoodName, 50); -- Assuming default calories per gram is 50
      END

      -- If the user provides only calorie count without grams, convert it into grams
      IF @Grams IS NULL AND @UserProvidedCaloriesPerGram IS NOT NULL
      BEGIN
        -- Convert calorie count into grams based on calorie per gram value
        SET @Grams = @UserProvidedCaloriesPerGram / (SELECT Cal_PerG FROM Food_data WHERE Food_Name = @FoodName);
      END

      -- Calculate the calorie count for each food item
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
/****** Object:  StoredProcedure [dbo].[sp_CreateCaloriUser]    Script Date: 29/04/2024 11:11:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CreateCaloriUser](
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

    -- Add the new user to the db_executor role
    EXEC sp_addrolemember 'db_executor', @un;

	EXEC sp_CalculateBMR @uid, @act;  

    SET NOCOUNT OFF;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_LoginCaloriUser]    Script Date: 29/04/2024 11:11:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_LoginCaloriUser]
	@un VARCHAR(50),
	@pw VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @user_ID BIGINT;

	SELECT TOP 1 @user_ID = USER_ID from Calori_User WHERE Username = @un;

	IF @user_ID IS NOT NULL
		BEGIN
			DECLARE @pw_stored VARCHAR(50);
			SELECT @pw_stored = Password FROM Calori_User WHERE User_ID = @user_ID;
			SET @pw_stored = HASHBYTES('SHA2_256',@pw_stored);

			DECLARE @pw_input VARCHAR(MAX);
			SET @pw_input = HASHBYTES('SHA2_256',@pw);

			IF @pw_input = @pw_stored
			BEGIN
				SELECT 1 AsLoginSuccess;
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
/****** Object:  StoredProcedure [dbo].[sp_ReadCaloriUser]    Script Date: 29/04/2024 11:11:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_ReadCaloriUser]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ReadMealLogs]    Script Date: 29/04/2024 11:11:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[sp_ReadMealLogs]    Script Date: 28/04/2024 10:53:48 am ******/
CREATE PROCEDURE [dbo].[sp_ReadMealLogs]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCaloriUserFirstName]    Script Date: 29/04/2024 11:11:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCaloriUserFirstName]    Script Date: 28/04/2024 10:57:50 am ******/
CREATE PROCEDURE [dbo].[sp_UpdateCaloriUserFirstName]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCaloriUserLastName]    Script Date: 29/04/2024 11:11:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpdateCaloriUserLastName]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCaloriUserPassword]    Script Date: 29/04/2024 11:11:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpdateCaloriUserPassword]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCaloriUserUsername]    Script Date: 29/04/2024 11:11:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_UpdateCaloriUserUsername]
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
GO
USE [master]
GO
ALTER DATABASE [CaloriePal] SET  READ_WRITE 
GO
