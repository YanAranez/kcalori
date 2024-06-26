USE [master]
GO
/****** Object:  Database [CaloriePal]    Script Date: 15/04/2024 11:37:15 pm ******/
CREATE DATABASE [CaloriePal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CaloriePal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.CALORIETRACK\MSSQL\DATA\CaloriePal.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CaloriePal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.CALORIETRACK\MSSQL\DATA\CaloriePal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
EXEC sys.sp_db_vardecimal_storage_format N'CaloriePal', N'ON'
GO
ALTER DATABASE [CaloriePal] SET QUERY_STORE = ON
GO
ALTER DATABASE [CaloriePal] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CaloriePal]
GO
/****** Object:  Table [dbo].[BMR]    Script Date: 15/04/2024 11:37:15 pm ******/
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
/****** Object:  Table [dbo].[Calori_User]    Script Date: 15/04/2024 11:37:15 pm ******/
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
/****** Object:  Table [dbo].[Food_Data]    Script Date: 15/04/2024 11:37:15 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food_Data](
	[Food_ID] [bigint] NOT NULL,
	[Food_Name] [nvarchar](50) NOT NULL,
	[Hundred_Grams] [nvarchar](50) NOT NULL,
	[Calories_Per_HG] [bigint] NOT NULL,
	[KCalories_Per_HG] [bigint] NOT NULL,
 CONSTRAINT [PK_Food_Data] PRIMARY KEY CLUSTERED 
(
	[Food_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Goals]    Script Date: 15/04/2024 11:37:15 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goals](
	[Goal_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Goal_Notes] [varchar](128) NOT NULL,
	[Goal_LeveL] [decimal](3, 2) NOT NULL,
 CONSTRAINT [PK_Goals] PRIMARY KEY CLUSTERED 
(
	[Goal_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Meals]    Script Date: 15/04/2024 11:37:15 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Meals](
	[User_Meal_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[User_ID] [bigint] NOT NULL,
	[Meal_Date] [date] NOT NULL,
	[Food_Item_ID] [bigint] NOT NULL,
	[Calories] [decimal](7, 2) NOT NULL,
 CONSTRAINT [PK_User_Meals] PRIMARY KEY CLUSTERED 
(
	[User_Meal_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BMR]  WITH CHECK ADD  CONSTRAINT [FK_BMR_Calori_User1] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Calori_User] ([User_ID])
GO
ALTER TABLE [dbo].[BMR] CHECK CONSTRAINT [FK_BMR_Calori_User1]
GO
ALTER TABLE [dbo].[User_Meals]  WITH CHECK ADD  CONSTRAINT [FK_User_Meals_Calori_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Calori_User] ([User_ID])
GO
ALTER TABLE [dbo].[User_Meals] CHECK CONSTRAINT [FK_User_Meals_Calori_User]
GO
/****** Object:  StoredProcedure [dbo].[sp_CalculateBMR]    Script Date: 15/04/2024 11:37:15 pm ******/
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
	

IF @activity_level = 1 -- Sedentary
    SET @activity_multiplier = 1.2;
ELSE IF @activity_level = 2 -- Lightly Active
    SET @activity_multiplier = 1.375;
ELSE IF @activity_level = 3 -- Moderately Active
    SET @activity_multiplier = 1.55;
ELSE IF @activity_level = 4 -- Active
    SET @activity_multiplier = 1.725;
ELSE 
    -- Handle invalid activity level (optional)
    RAISERROR('Invalid activity level provided.', 16, 1);


	SELECT @age = Age, @gen = Gender, @hei = Height, @wei= Weight FROM BMR WHERE User_ID = @user_id;

	IF @gen = 'M' 
		SET @bmr = 13.397 * @wei + 4.799 * @hei - 5.677 * @age + 88.362; 
	ELSE
		SET @bmr = 9.247 * @wei + 3.098 * @hei - 4.330 * @age + 447.593;  

-- Apply activity multiplier
	SET @bmr = @bmr * @activity_multiplier;
	
		UPDATE Calori_User		
		SET BMR_Value = @bmr
		WHERE User_ID = @user_id;
		SELECT @bmr AS BMR_Value;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateCaloriUser]    Script Date: 15/04/2024 11:37:15 pm ******/
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
/****** Object:  StoredProcedure [dbo].[sp_LoginCaloriUser]    Script Date: 15/04/2024 11:37:15 pm ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ReadCaloriUser]    Script Date: 15/04/2024 11:37:15 pm ******/
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
USE [master]
GO
ALTER DATABASE [CaloriePal] SET  READ_WRITE 
GO
