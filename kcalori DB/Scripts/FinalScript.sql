USE [master]
GO
/****** Object:  Database [CaloriePal]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE DATABASE [CaloriePal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CaloriePal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.CALORI\MSSQL\DATA\CaloriePal.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CaloriePal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.CALORI\MSSQL\DATA\CaloriePal_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  User [yno]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [yno] FOR LOGIN [yno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Usernametest13421]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Usernametest13421] FOR LOGIN [Usernametest13421] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Usernametest1342]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Usernametest1342] FOR LOGIN [Usernametest1342] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Usernametest134]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Usernametest134] FOR LOGIN [Usernametest134] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Usernametest13]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Usernametest13] FOR LOGIN [Usernametest13] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Usernametest12]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Usernametest12] FOR LOGIN [Usernametest12] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Usernametest1]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Usernametest1] FOR LOGIN [Usernametest1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Usernametest]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Usernametest] FOR LOGIN [Usernametest] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Testing123]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Testing123] FOR LOGIN [Testing123] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Tester25]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Tester25] FOR LOGIN [Tester25] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Tester24]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Tester24] FOR LOGIN [Tester24] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Tester]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Tester] FOR LOGIN [Tester] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Test53]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Test53] FOR LOGIN [Test53] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Test35]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Test35] FOR LOGIN [Test35] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Test154]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Test154] FOR LOGIN [Test154] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Test123]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Test123] FOR LOGIN [Test123] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [test12]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [test12] FOR LOGIN [test12] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [test1]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [test1] FOR LOGIN [test1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Test]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Test] FOR LOGIN [Test] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rebster]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [rebster] FOR LOGIN [rebster] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rebbieun32]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [rebbieun32] FOR LOGIN [rebbieun32] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rebbieun212]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [rebbieun212] FOR LOGIN [rebbieun212] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rebbieun12412]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [rebbieun12412] FOR LOGIN [rebbieun12412] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rebbieun124]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [rebbieun124] FOR LOGIN [rebbieun124] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rebbieun1234]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [rebbieun1234] FOR LOGIN [rebbieun1234] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rebbieun1224]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [rebbieun1224] FOR LOGIN [rebbieun1224] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rebbieun12]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [rebbieun12] FOR LOGIN [rebbieun12] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rebbieun]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [rebbieun] FOR LOGIN [rebbieun] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rebbie123]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [rebbie123] FOR LOGIN [rebbie123] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rebbie]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [rebbie] FOR LOGIN [rebbie] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Professors666666]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Professors666666] FOR LOGIN [Professors666666] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Professors66666]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Professors66666] FOR LOGIN [Professors66666] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Professors6666]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Professors6666] FOR LOGIN [Professors6666] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Professors6662666]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Professors6662666] FOR LOGIN [Professors6662666] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Professors66626616]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Professors66626616] FOR LOGIN [Professors66626616] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Professors666]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Professors666] FOR LOGIN [Professors666] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Professors662626616]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Professors662626616] FOR LOGIN [Professors662626616] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Professors66]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Professors66] FOR LOGIN [Professors66] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Professors5]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Professors5] FOR LOGIN [Professors5] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Professors4]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Professors4] FOR LOGIN [Professors4] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Professors3]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Professors3] FOR LOGIN [Professors3] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Professors2]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Professors2] FOR LOGIN [Professors2] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Professors]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Professors] FOR LOGIN [Professors] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Overknox]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Overknox] FOR LOGIN [Overknox] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [OnecallAway]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [OnecallAway] FOR LOGIN [OnecallAway] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [obap]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [obap] FOR LOGIN [obap] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [nametester1]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [nametester1] FOR LOGIN [nametester1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [marcopolos123]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [marcopolos123] FOR LOGIN [marcopolos123] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [marcopolos]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [marcopolos] FOR LOGIN [marcopolos] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [marcopolo]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [marcopolo] FOR LOGIN [marcopolo] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Jermey]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [Jermey] FOR LOGIN [Jermey] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [firstlast]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [firstlast] FOR LOGIN [firstlast] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [blue]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [blue] FOR LOGIN [blue] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [4blue]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [4blue] FOR LOGIN [4blue] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [3blue]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [3blue] FOR LOGIN [3blue] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [2marcopolos123]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [2marcopolos123] FOR LOGIN [2marcopolos123] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [2blue]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE USER [2blue] FOR LOGIN [2blue] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [db_executor]    Script Date: 11/05/2024 12:55:30 am ******/
CREATE ROLE [db_executor]
GO
ALTER ROLE [db_executor] ADD MEMBER [yno]
GO
ALTER ROLE [db_owner] ADD MEMBER [yno]
GO
ALTER ROLE [db_executor] ADD MEMBER [Usernametest13421]
GO
ALTER ROLE [db_owner] ADD MEMBER [Usernametest13421]
GO
ALTER ROLE [db_executor] ADD MEMBER [Usernametest1342]
GO
ALTER ROLE [db_owner] ADD MEMBER [Usernametest1342]
GO
ALTER ROLE [db_executor] ADD MEMBER [Usernametest134]
GO
ALTER ROLE [db_owner] ADD MEMBER [Usernametest134]
GO
ALTER ROLE [db_executor] ADD MEMBER [Usernametest13]
GO
ALTER ROLE [db_owner] ADD MEMBER [Usernametest13]
GO
ALTER ROLE [db_executor] ADD MEMBER [Usernametest12]
GO
ALTER ROLE [db_owner] ADD MEMBER [Usernametest12]
GO
ALTER ROLE [db_executor] ADD MEMBER [Usernametest1]
GO
ALTER ROLE [db_owner] ADD MEMBER [Usernametest1]
GO
ALTER ROLE [db_executor] ADD MEMBER [Usernametest]
GO
ALTER ROLE [db_owner] ADD MEMBER [Usernametest]
GO
ALTER ROLE [db_executor] ADD MEMBER [Testing123]
GO
ALTER ROLE [db_owner] ADD MEMBER [Testing123]
GO
ALTER ROLE [db_executor] ADD MEMBER [Tester25]
GO
ALTER ROLE [db_owner] ADD MEMBER [Tester25]
GO
ALTER ROLE [db_executor] ADD MEMBER [Tester24]
GO
ALTER ROLE [db_owner] ADD MEMBER [Tester24]
GO
ALTER ROLE [db_executor] ADD MEMBER [Tester]
GO
ALTER ROLE [db_owner] ADD MEMBER [Tester]
GO
ALTER ROLE [db_executor] ADD MEMBER [Test53]
GO
ALTER ROLE [db_owner] ADD MEMBER [Test53]
GO
ALTER ROLE [db_executor] ADD MEMBER [Test35]
GO
ALTER ROLE [db_owner] ADD MEMBER [Test35]
GO
ALTER ROLE [db_executor] ADD MEMBER [Test154]
GO
ALTER ROLE [db_owner] ADD MEMBER [Test154]
GO
ALTER ROLE [db_executor] ADD MEMBER [Test123]
GO
ALTER ROLE [db_owner] ADD MEMBER [Test123]
GO
ALTER ROLE [db_executor] ADD MEMBER [test12]
GO
ALTER ROLE [db_owner] ADD MEMBER [test12]
GO
ALTER ROLE [db_executor] ADD MEMBER [test1]
GO
ALTER ROLE [db_owner] ADD MEMBER [test1]
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
ALTER ROLE [db_executor] ADD MEMBER [rebbie123]
GO
ALTER ROLE [db_owner] ADD MEMBER [rebbie123]
GO
ALTER ROLE [db_datareader] ADD MEMBER [rebbie]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [rebbie]
GO
ALTER ROLE [db_executor] ADD MEMBER [Professors666666]
GO
ALTER ROLE [db_owner] ADD MEMBER [Professors666666]
GO
ALTER ROLE [db_executor] ADD MEMBER [Professors66666]
GO
ALTER ROLE [db_owner] ADD MEMBER [Professors66666]
GO
ALTER ROLE [db_executor] ADD MEMBER [Professors6666]
GO
ALTER ROLE [db_owner] ADD MEMBER [Professors6666]
GO
ALTER ROLE [db_executor] ADD MEMBER [Professors6662666]
GO
ALTER ROLE [db_owner] ADD MEMBER [Professors6662666]
GO
ALTER ROLE [db_executor] ADD MEMBER [Professors66626616]
GO
ALTER ROLE [db_owner] ADD MEMBER [Professors66626616]
GO
ALTER ROLE [db_executor] ADD MEMBER [Professors666]
GO
ALTER ROLE [db_owner] ADD MEMBER [Professors666]
GO
ALTER ROLE [db_executor] ADD MEMBER [Professors662626616]
GO
ALTER ROLE [db_owner] ADD MEMBER [Professors662626616]
GO
ALTER ROLE [db_executor] ADD MEMBER [Professors66]
GO
ALTER ROLE [db_owner] ADD MEMBER [Professors66]
GO
ALTER ROLE [db_executor] ADD MEMBER [Professors5]
GO
ALTER ROLE [db_owner] ADD MEMBER [Professors5]
GO
ALTER ROLE [db_executor] ADD MEMBER [Professors4]
GO
ALTER ROLE [db_owner] ADD MEMBER [Professors4]
GO
ALTER ROLE [db_executor] ADD MEMBER [Professors3]
GO
ALTER ROLE [db_owner] ADD MEMBER [Professors3]
GO
ALTER ROLE [db_executor] ADD MEMBER [Professors2]
GO
ALTER ROLE [db_owner] ADD MEMBER [Professors2]
GO
ALTER ROLE [db_executor] ADD MEMBER [Professors]
GO
ALTER ROLE [db_owner] ADD MEMBER [Professors]
GO
ALTER ROLE [db_executor] ADD MEMBER [Overknox]
GO
ALTER ROLE [db_owner] ADD MEMBER [Overknox]
GO
ALTER ROLE [db_executor] ADD MEMBER [OnecallAway]
GO
ALTER ROLE [db_owner] ADD MEMBER [OnecallAway]
GO
ALTER ROLE [db_executor] ADD MEMBER [obap]
GO
ALTER ROLE [db_owner] ADD MEMBER [obap]
GO
ALTER ROLE [db_executor] ADD MEMBER [nametester1]
GO
ALTER ROLE [db_owner] ADD MEMBER [nametester1]
GO
ALTER ROLE [db_executor] ADD MEMBER [marcopolos123]
GO
ALTER ROLE [db_owner] ADD MEMBER [marcopolos123]
GO
ALTER ROLE [db_owner] ADD MEMBER [marcopolos]
GO
ALTER ROLE [db_owner] ADD MEMBER [marcopolo]
GO
ALTER ROLE [db_executor] ADD MEMBER [Jermey]
GO
ALTER ROLE [db_owner] ADD MEMBER [Jermey]
GO
ALTER ROLE [db_executor] ADD MEMBER [firstlast]
GO
ALTER ROLE [db_owner] ADD MEMBER [firstlast]
GO
ALTER ROLE [db_executor] ADD MEMBER [blue]
GO
ALTER ROLE [db_owner] ADD MEMBER [blue]
GO
ALTER ROLE [db_executor] ADD MEMBER [4blue]
GO
ALTER ROLE [db_owner] ADD MEMBER [4blue]
GO
ALTER ROLE [db_executor] ADD MEMBER [3blue]
GO
ALTER ROLE [db_owner] ADD MEMBER [3blue]
GO
ALTER ROLE [db_executor] ADD MEMBER [2marcopolos123]
GO
ALTER ROLE [db_owner] ADD MEMBER [2marcopolos123]
GO
ALTER ROLE [db_executor] ADD MEMBER [2blue]
GO
ALTER ROLE [db_owner] ADD MEMBER [2blue]
GO
/****** Object:  Table [dbo].[BMR]    Script Date: 11/05/2024 12:55:30 am ******/
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
/****** Object:  Table [dbo].[Calori_User]    Script Date: 11/05/2024 12:55:31 am ******/
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
/****** Object:  Table [dbo].[Daily_Calories]    Script Date: 11/05/2024 12:55:31 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Daily_Calories](
	[User_ID] [bigint] NOT NULL,
	[DayOfWeek] [varchar](20) NOT NULL,
	[MaintainWeight] [decimal](10, 2) NULL,
	[MildWeightLoss] [decimal](10, 2) NULL,
	[WeightLoss] [decimal](10, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food_Data]    Script Date: 11/05/2024 12:55:31 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food_Data](
	[Food_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Food_Name] [nvarchar](50) NOT NULL,
	[Grams] [smallint] NULL,
	[Calories] [smallint] NULL,
 CONSTRAINT [PK_calories] PRIMARY KEY CLUSTERED 
(
	[Food_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Goals]    Script Date: 11/05/2024 12:55:31 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goals](
	[Goal_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Goal_Level] [varchar](20) NULL,
	[User_ID] [bigint] NOT NULL,
	[Goal_BMR] [decimal](8, 3) NULL,
 CONSTRAINT [PK_Goals] PRIMARY KEY CLUSTERED 
(
	[Goal_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meal_Logs]    Script Date: 11/05/2024 12:55:31 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meal_Logs](
	[Meal_Logs_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[User_ID] [bigint] NOT NULL,
	[User_Meal_ID] [bigint] NOT NULL,
	[Meal_Date] [nchar](10) NOT NULL,
	[Meal_Time] [datetime] NOT NULL,
	[Calories] [decimal](12, 2) NOT NULL,
	[Remaining_Calories] [int] NULL,
	[Day] [int] NULL,
	[Calorie_Percentage] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Meal_Logs] PRIMARY KEY CLUSTERED 
(
	[Meal_Logs_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Meal_Foods]    Script Date: 11/05/2024 12:55:31 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Meal_Foods](
	[User_Meal_Food_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_Meal_ID] [int] NULL,
	[Food_Name] [nvarchar](255) NULL,
	[Grams] [decimal](10, 2) NULL,
	[Calories] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[User_Meal_Food_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Meals]    Script Date: 11/05/2024 12:55:31 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Meals](
	[User_Meal_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[User_ID] [bigint] NOT NULL,
	[Calories] [decimal](12, 2) NULL,
	[Meal_Time] [time](7) NULL,
	[Meal_Date] [date] NULL,
 CONSTRAINT [PK_User_Meals] PRIMARY KEY CLUSTERED 
(
	[User_Meal_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_User_Meals_UserID_MealTime] UNIQUE NONCLUSTERED 
(
	[User_ID] ASC,
	[Meal_Time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_Meals_Calories]    Script Date: 11/05/2024 12:55:31 am ******/
CREATE NONCLUSTERED INDEX [IX_User_Meals_Calories] ON [dbo].[User_Meals]
(
	[Calories] ASC
)
WHERE ([Calories] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
ALTER TABLE [dbo].[Goals]  WITH CHECK ADD  CONSTRAINT [FK_Goals_Calori_User1] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Calori_User] ([User_ID])
GO
ALTER TABLE [dbo].[Goals] CHECK CONSTRAINT [FK_Goals_Calori_User1]
GO
ALTER TABLE [dbo].[Meal_Logs]  WITH CHECK ADD  CONSTRAINT [FK_Meal_Logs_Calori_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Calori_User] ([User_ID])
GO
ALTER TABLE [dbo].[Meal_Logs] CHECK CONSTRAINT [FK_Meal_Logs_Calori_User]
GO
ALTER TABLE [dbo].[User_Meals]  WITH CHECK ADD  CONSTRAINT [FK_User_Meals_Calori_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Calori_User] ([User_ID])
GO
ALTER TABLE [dbo].[User_Meals] CHECK CONSTRAINT [FK_User_Meals_Calori_User]
GO
/****** Object:  StoredProcedure [dbo].[sp_BMRwithGoalModifier]    Script Date: 11/05/2024 12:55:31 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_BMRwithGoalModifier]
    @uid BIGINT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @goal_modifier DECIMAL(5,2);
    DECLARE @gbmr DECIMAL(8,3);
    DECLARE @bmr DECIMAL(8,3);
    DECLARE @goal_Wmodified varchar(20);

    SELECT @bmr = BMR_Value
    FROM BMR
    WHERE User_ID = @uid;

    SELECT @goal_Wmodified = Goal_Level
    FROM Goals
    WHERE User_ID = @uid;

    IF @goal_Wmodified = 'Maintain' -- Maintain
        SET @goal_modifier = 1.00;
    ELSE IF @goal_Wmodified = 'Mild Weight Loss' --Mild Weight Loss
        SET @goal_modifier = 0.88;
    ELSE IF @goal_Wmodified = 'Weight Loss' --'Weight Loss'
        SET @goal_modifier = 0.75;
    ELSE 
        RAISERROR('Invalid Option',16,1);

    SET @gbmr = @bmr * @goal_modifier;

    UPDATE Goals SET
    Goal_BMR = @gbmr
    WHERE User_ID = @uid; -- Make sure to update the correct row for the user
    SELECT @gbmr as Goal_BMR;
    SET NOCOUNT OFF;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CalculateBMR]    Script Date: 11/05/2024 12:55:31 am ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CalculateDailyCalories]    Script Date: 11/05/2024 12:55:31 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CalculateDailyCalories]
    @uid BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @gbmr DECIMAL(8,3);
   

    -- Retrieve BMR value and activity level based on user's ID
    SELECT @gbmr = Goal_BMR
    FROM Goals
    WHERE User_ID = @uid;

 
    -- Merge calculated daily calorie intake into Daily_Calories table
    MERGE INTO Daily_Calories AS target
    USING (
        VALUES -- 1 = Sunday, 2 = Monday, 3 = Tuesday, 4 = Wednesday, 5 = Thursday, 6 = Friday, 7 = Saturday
            (@uid, 1, ROUND(@gbmr, 2), ROUND(@gbmr, 2), ROUND(@gbmr - 517, 2)),
            (@uid, 2, ROUND(@gbmr, 2), ROUND(@gbmr - 350, 2), ROUND(@gbmr - 457, 2)),
            (@uid, 3, ROUND(@gbmr, 2), ROUND(@gbmr - 350, 2), ROUND(@gbmr - 457, 2)),
            (@uid, 4, ROUND(@gbmr, 2), ROUND(@gbmr - 350, 2), ROUND(@gbmr - 457, 2)),
            (@uid, 5, ROUND(@gbmr, 2), ROUND(@gbmr - 350, 2), ROUND(@gbmr - 457, 2)),
            (@uid, 6, ROUND(@gbmr, 2), ROUND(@gbmr - 350, 2), ROUND(@gbmr - 457, 2)),
            (@uid, 7, ROUND(@gbmr, 2), ROUND(@gbmr, 2, 2), ROUND(@gbmr - 517, 2))
    ) AS source (User_ID, DayOfWeek, MaintainWeight, MildWeightLoss, WeightLoss)
    ON (target.User_ID = source.User_ID AND target.DayOfWeek = source.DayOfWeek)
    WHEN NOT MATCHED THEN 
        INSERT (User_ID, DayOfWeek, MaintainWeight, MildWeightLoss, WeightLoss) 
        VALUES (source.User_ID, source.DayOfWeek, source.MaintainWeight, source.MildWeightLoss, source.WeightLoss);

    SET NOCOUNT OFF;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CalculateFoodCalories]    Script Date: 11/05/2024 12:55:31 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CalculateFoodCalories]
  @FoodsAndGrams NVARCHAR(MAX)
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @UserID BIGINT;
  DECLARE @FoodName NVARCHAR(255);
  DECLARE @Grams DECIMAL(10,2);
  DECLARE @CalPerG DECIMAL(10,2);
  DECLARE @Delimiter CHAR(1) = ',';
  DECLARE @TotalCalories DECIMAL(10,2) = 0;
  DECLARE @MealTime DATETIME = GETDATE();
  DECLARE @FoodItems TABLE (FoodName NVARCHAR(255), Grams DECIMAL(10,2));
  DECLARE @User_Meal_ID INT;

  -- Get the current username
  DECLARE @Username SYSNAME = SYSTEM_USER;

  -- Retrieve the User_ID from Calori_User table
  SELECT @UserID = User_ID
  FROM Calori_User
  WHERE Username = @Username;

  -- Check if the user exists in the Calori_User table
  IF @UserID IS NOT NULL
  BEGIN
    -- Split the input string into individual food items
    DECLARE @xml XML = CAST('<r>' + REPLACE(@FoodsAndGrams, @Delimiter, '</r><r>') + '</r>' AS XML);
    INSERT INTO @FoodItems (FoodName, Grams)
    SELECT 
      LTRIM(RTRIM(SUBSTRING(r.value('.','nvarchar(MAX)'), 1, CHARINDEX(':', r.value('.','nvarchar(MAX)')) - 1))),
      TRY_CAST(SUBSTRING(r.value('.','nvarchar(MAX)'), CHARINDEX(':', r.value('.','nvarchar(MAX)')) + 1, LEN(r.value('.','nvarchar(MAX)'))) AS DECIMAL(10,2))
    FROM @xml.nodes('//r') AS records(r);

    -- Calculate total calories
    SELECT @TotalCalories = SUM(Cal_PerG * Grams / 100)
    FROM @FoodItems fi
    INNER JOIN Food_Data fd ON fi.FoodName = fd.Food_Name;

    -- Check if a record with the same Calories already exists in User_Meals
    SELECT @User_Meal_ID = User_Meal_ID
    FROM User_Meals
    WHERE User_ID = @UserID
    AND Meal_Time = @MealTime
    AND Calories = @TotalCalories;

    -- If no record exists, insert a new record into User_Meals
    IF @User_Meal_ID IS NULL
    BEGIN
      INSERT INTO User_Meals (User_ID, Meal_Time, Calories)
      VALUES (@UserID, @MealTime, @TotalCalories);

      SET @User_Meal_ID = SCOPE_IDENTITY();
    END

    -- Insert food items into User_Meal_Foods
    INSERT INTO User_Meal_Foods (User_Meal_ID, Food_Name, Grams, Calories)
    SELECT @User_Meal_ID, fi.FoodName, fi.Grams, fi.Grams * fd.Cal_PerG / 100
    FROM @FoodItems fi
    INNER JOIN Food_Data fd ON fi.FoodName = fd.Food_Name;

    -- Return the User_Meal_ID
    SELECT @User_Meal_ID AS User_Meal_ID;
  END
  ELSE
  BEGIN
    RAISERROR('User not found in Calori_User table', 16, 1);
    RETURN;
  END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CalculateMealandUserMeal]    Script Date: 11/05/2024 12:55:31 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CalculateMealandUserMeal]
    @MealCaloriesFoods NVARCHAR(4000),
    @UserFoodItems NVARCHAR(4000),
    @UserMealID BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    -- Parameter validation
    IF @MealCaloriesFoods IS NULL OR LEN(@MealCaloriesFoods) = 0
        THROW 50001, 'Meal calories foods cannot be empty.', 1;

    IF @UserFoodItems IS NULL OR LEN(@UserFoodItems) = 0
        THROW 50002, 'User food items cannot be empty.', 1;

    IF @UserMealID IS NULL
        THROW 50003, 'User meal ID cannot be null.', 1;

    BEGIN TRANSACTION;

    BEGIN TRY
        -- Calculate meal calories
        DECLARE @MealCalories DECIMAL(10, 2);
        EXEC sp_CalculateMealCalories @Foods = @MealCaloriesFoods, @TotalCalories = @MealCalories OUTPUT;

        -- Calculate user food items calories
        DECLARE @UserFoodItemsCalories INT;
        EXEC sp_CalculateUserFoodItems @Foods = @UserFoodItems, @TotalCalories = @UserFoodItemsCalories OUTPUT;

        -- Update User_Meals with the total calories
        UPDATE um
        SET um.Calories = @MealCalories + @UserFoodItemsCalories
        FROM User_Meals um
        WHERE um.User_Meal_ID = @UserMealID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;

    SET NOCOUNT OFF;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CalculateMealCalories]    Script Date: 11/05/2024 12:55:31 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CalculateMealCalories]
(
    @Foods NVARCHAR(4000)
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @Foods IS NULL OR LEN(@Foods) = 0
    BEGIN
        RAISERROR('Food list cannot be empty.', 16, 1);
        RETURN;
    END

    DECLARE @UserID BIGINT;
    DECLARE @MealDate DATE = CONVERT(DATE, GETDATE());
    DECLARE @MealTime TIME = CONVERT(TIME, GETDATE());
    DECLARE @Username SYSNAME = SYSTEM_USER;
    DECLARE @TotalCalories DECIMAL(10, 2) = 0;
    DECLARE @MealID BIGINT;
    DECLARE @Day NVARCHAR(20); -- Declare variable to store the day

    SELECT @UserID = User_ID
    FROM Calori_User
    WHERE Username = @Username;

    IF @UserID IS NULL
    BEGIN
        RAISERROR('User not found in Calori_User table', 16, 1);
        RETURN;
    END

    -- Get the current day of the week
    DECLARE @DayOfWeek INT = DATEPART(WEEKDAY, GETDATE());

    -- Get the day from Daily_Calories based on DayOfWeek
    SELECT @Day = DayOfWeek
    FROM dbo.Daily_Calories
    WHERE User_ID = @UserID AND DayOfWeek = @DayOfWeek;

    IF @Day IS NULL
    BEGIN
        RAISERROR('Day not found in Daily_Calories table', 16, 1);
        RETURN;
    END

    -- Insert into User_Meals table
    INSERT INTO User_Meals (User_ID, Meal_Date, Meal_Time)
    VALUES (@UserID, @MealDate, @MealTime);

    -- Get the generated Meal_ID
    SET @MealID = SCOPE_IDENTITY();

    -- Split the comma-separated list into rows
    DECLARE @FoodTable TABLE (
        FoodName NVARCHAR(255),
        Calories DECIMAL(10, 2),
        Grams DECIMAL(10, 2)
    );

    INSERT INTO @FoodTable (FoodName, Calories, Grams)
    SELECT 
        SUBSTRING(value, 1, CHARINDEX(':', value) - 1) AS FoodName,
        CAST(SUBSTRING(value, CHARINDEX(':', value) + 1, CHARINDEX(':', value, CHARINDEX(':', value) + 1) - CHARINDEX(':', value) - 1) AS DECIMAL(10, 2)) AS Calories,
        CAST(SUBSTRING(value, CHARINDEX(':', value, CHARINDEX(':', value) + 1) + 1, LEN(value)) AS DECIMAL(10, 2)) AS Grams
    FROM STRING_SPLIT(@Foods, ',');

    -- Calculate total calories
    SELECT @TotalCalories = @TotalCalories + (ISNULL(ft.Calories, 0) * ISNULL(ft.Grams, 0))
    FROM @FoodTable ft;

    -- Update the User_Meals table with the calculated total calories
    UPDATE User_Meals SET Calories = @TotalCalories WHERE User_Meal_ID = @MealID;

    -- Insert into Food_Data table
    INSERT INTO dbo.Food_Data (Food_Name, Grams, Calories)
    SELECT FoodName, Grams, Calories
    FROM @FoodTable;

    -- Insert into User_Meal_Foods table
    INSERT INTO dbo.User_Meal_Foods (User_Meal_ID, Food_Name, Grams, Calories)
    SELECT @MealID, FoodName, Grams, Calories
    FROM @FoodTable;

    DECLARE @GoalLevel VARCHAR(20);
    SELECT @GoalLevel = Goal_Level
    FROM dbo.Goals
    WHERE User_ID = @UserID;

    DECLARE @GoalCalories DECIMAL(10, 2);
    DECLARE @RemainingCalories DECIMAL(10, 2);

    IF @GoalLevel = 'Maintain Weight'
        SELECT @GoalCalories = MaintainWeight
        FROM dbo.Daily_Calories
        WHERE User_ID = @UserID AND DayOfWeek = @DayOfWeek;
    ELSE IF @GoalLevel = 'Mild Weight Loss'
        SELECT @GoalCalories = MildWeightLoss
        FROM dbo.Daily_Calories
        WHERE User_ID = @UserID AND DayOfWeek = @DayOfWeek;
    ELSE IF @GoalLevel = 'Weight Loss'
        SELECT @GoalCalories = WeightLoss
        FROM dbo.Daily_Calories
        WHERE User_ID = @UserID AND DayOfWeek = @DayOfWeek;

    -- Declare a variable to store previous day's remaining calories
    DECLARE @PreviousRemainingCalories DECIMAL(10, 2);

    -- Retrieve previous day's remaining calories
    SELECT TOP 1 @PreviousRemainingCalories = Remaining_Calories
    FROM dbo.Meal_Logs
    WHERE User_ID = @UserID AND [Day] = @Day
    ORDER BY Meal_Logs_ID DESC;

    -- Calculate remaining calories for the day
    IF @PreviousRemainingCalories IS NULL
    BEGIN
        SET @RemainingCalories = @GoalCalories - @TotalCalories;
        IF @RemainingCalories < 0
        BEGIN
            SET @RemainingCalories = 0;
        END
    END
    ELSE
    BEGIN
        SET @RemainingCalories = CASE 
                                    WHEN (@PreviousRemainingCalories - @TotalCalories) < 0 THEN 0 
                                    ELSE (@PreviousRemainingCalories - @TotalCalories)
                                END;
    END;

    -- Calculate the Percentage Remaining
    DECLARE @PercentageRemaining DECIMAL(5, 2);

    IF @GoalCalories > 0
    BEGIN
        SET @PercentageRemaining = (@RemainingCalories / @GoalCalories) * 100;
    END
    ELSE
    BEGIN
        SET @PercentageRemaining = 0; -- Default to 0 if the goal calories are not set
    END;

    -- Insert into Meal_Logs table with Day and Remaining Calories
    INSERT INTO dbo.Meal_Logs (User_ID, User_Meal_ID, Meal_Date, Meal_Time, Calories, Remaining_Calories, [Day], Calorie_Percentage)
    VALUES (@UserID, @MealID, @MealDate, @MealTime, @TotalCalories, @RemainingCalories, @Day, @PercentageRemaining);

    SET NOCOUNT OFF;

END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateCaloriUser]    Script Date: 11/05/2024 12:55:31 am ******/
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
GO
/****** Object:  StoredProcedure [dbo].[sp_FinalCalculatorCalorie]    Script Date: 11/05/2024 12:55:31 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_FinalCalculatorCalorie]
    @FoodItemsUser NVARCHAR(MAX),
    @FoodItemsMeal NVARCHAR(MAX)
AS
BEGIN
    -- Step 1: Split the input string and insert food items and calories into temp table
    DECLARE @UserFoodItems TABLE (
        Food_Name NVARCHAR(100),
        Food_Calories INT
    )

    DECLARE @MealFoodItems TABLE (
        Food_Name NVARCHAR(100),
        Grams INT
    )

    DECLARE @Delimiter CHAR(1) = ','
    DECLARE @FoodItem NVARCHAR(100)
    DECLARE @Position INT

    -- Insert user food items and calories
    SET @Position = CHARINDEX(@Delimiter, @FoodItemsUser)
    WHILE @Position > 0
    BEGIN
        SET @FoodItem = LEFT(@FoodItemsUser, @Position - 1)
        INSERT INTO @UserFoodItems (Food_Name, Food_Calories)
        VALUES (LEFT(@FoodItem, CHARINDEX(':', @FoodItem) - 1), 
                SUBSTRING(@FoodItem, CHARINDEX(':', @FoodItem) + 1, LEN(@FoodItem) - CHARINDEX(':', @FoodItem)))
        SET @FoodItemsUser = SUBSTRING(@FoodItemsUser, @Position + 1, LEN(@FoodItemsUser) - @Position)
        SET @Position = CHARINDEX(@Delimiter, @FoodItemsUser)
    END

    -- Insert meal food items and grams
    SET @Position = CHARINDEX(@Delimiter, @FoodItemsMeal)
    WHILE @Position > 0
    BEGIN
        SET @FoodItem = LEFT(@FoodItemsMeal, @Position - 1)
        INSERT INTO @MealFoodItems (Food_Name, Grams)
        VALUES (LEFT(@FoodItem, CHARINDEX(':', @FoodItem) - 1), 
                SUBSTRING(@FoodItem, CHARINDEX(':', @FoodItem) + 1, LEN(@FoodItem) - CHARINDEX(':', @FoodItem)))
        SET @FoodItemsMeal = SUBSTRING(@FoodItemsMeal, @Position + 1, LEN(@FoodItemsMeal) - @Position)
        SET @Position = CHARINDEX(@Delimiter, @FoodItemsMeal)
    END

    -- Step 2: Calculate total calories of the user food items
     DECLARE @TotalUserFoodCalories INT
    SELECT @TotalUserFoodCalories = SUM(Food_Calories) FROM @UserFoodItems

    -- Step 3: Calculate total grams of the meal food items
    DECLARE @TotalMealGrams INT
    SELECT @TotalMealGrams = SUM(Grams) FROM @MealFoodItems

    -- Step 4: Call sp_CalculateMealCalories with total grams parameter
    DECLARE @TotalMealCalories INT
    EXEC sp_CalculateMealCalories @TotalMealGrams, @TotalMealCalories OUTPUT

    -- Step 5: Update meal data with the total calories
    DECLARE @TotalCalories INT
    SET @TotalCalories = @TotalUserFoodCalories + @TotalMealCalories

END
GO
/****** Object:  StoredProcedure [dbo].[sp_LoginCaloriUser]    Script Date: 11/05/2024 12:55:31 am ******/
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
/****** Object:  StoredProcedure [dbo].[sp_LogMealAndCalculateRemainingCalories]    Script Date: 11/05/2024 12:55:31 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LogMealAndCalculateRemainingCalories]
    @User_ID BIGINT,
    @Meal_Name VARCHAR(50),
    @Meal_Calories INT,
    @Meal_DateTime DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Daily_Calories INT;
    DECLARE @Total_Consumed_Calories INT;
    DECLARE @Remaining_Calories INT;
    DECLARE @DayOfWeek VARCHAR(10);
    DECLARE @CalorieGoal INT;

    -- Get the day of the week
    SET @DayOfWeek = DATENAME(weekday, @Meal_DateTime);

    -- Calculate daily calories needed
    SELECT @Daily_Calories = MaintainWeight
    FROM Daily_Calories
    WHERE User_ID = @User_ID AND DayOfWeek = @DayOfWeek;

    -- Determine the calorie goal based on the user's preference
    SELECT @CalorieGoal = CASE
                            WHEN @Meal_DateTime >= DATEADD(day, 1 - DATEPART(dw, GETDATE()), GETDATE()) THEN MildWeightLoss
                            ELSE WeightLoss
                          END
    FROM Daily_Calories
    WHERE User_ID = @User_ID AND DayOfWeek = @DayOfWeek;

    -- Calculate total consumed calories
    SELECT @Total_Consumed_Calories = COALESCE(SUM(Meal_Calories), 0)
    FROM Meal_Logs
    WHERE User_ID = @User_ID AND CAST(Meal_DateTime AS DATE) = CAST(@Meal_DateTime AS DATE);

    -- Calculate remaining calories
    SET @Remaining_Calories = @CalorieGoal - (@Total_Consumed_Calories + @Meal_Calories);

    -- Insert the meal into the MealLog table
    INSERT INTO Meal_Logs (User_ID, Meal_Name, Meal_Calories, Meal_DateTime, Total_Consumed_Calories, Remaining_Calories)
    VALUES (@User_ID, @Meal_Name, @Meal_Calories, @Meal_DateTime, @Total_Consumed_Calories + @Meal_Calories, @Remaining_Calories);

    -- Return the remaining calories
    SELECT @Remaining_Calories AS Remaining_Calories;

    SET NOCOUNT OFF;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ReadCaloriUser]    Script Date: 11/05/2024 12:55:31 am ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ReadMealLogs]    Script Date: 11/05/2024 12:55:31 am ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SeperateCalculateDailyCalories]    Script Date: 11/05/2024 12:55:31 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[sp_SeperateCalculateDailyCalories]

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
/****** Object:  StoredProcedure [dbo].[sp_UpdateBMRAndGoalBMR]    Script Date: 11/05/2024 12:55:31 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateBMRAndGoalBMR]
(
    -- Remove the @username parameter
    @gender CHAR(1),
    @age INT,
    @height DECIMAL(6,2),
    @weight DECIMAL(6,2),
    @activity_level TINYINT,
    @goal_level VARCHAR(20)
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @user_id BIGINT;

    -- Retrieve user_id based on the currently logged-in username
    SELECT @user_id = User_ID
    FROM Calori_User
    WHERE Username = (SELECT SUSER_SNAME()); -- This assumes the currently logged-in username is stored in the Calori_User table

    IF @user_id IS NULL
    BEGIN
        RAISERROR('User_ID not found for the current user.', 16, 1);
        RETURN;
    END;

    -- The rest of the stored procedure remains the same

    DECLARE @bmr DECIMAL(8,3);
    DECLARE @activity_multiplier DECIMAL(5,2);
    DECLARE @goal_modifier DECIMAL(5,2);
    DECLARE @goal_BMR DECIMAL(8,3);

    -- Calculate BMR
    IF @gender = 'M' 
        SET @bmr = 13.397 * @weight + 4.799 * @height - 5.677 * @age + 88.362; 
    ELSE
        SET @bmr = 9.247 * @weight + 3.098 * @height - 4.330 * @age + 447.593;  

    -- Apply activity level multiplier
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

    -- Update BMR table with calculated BMR
    UPDATE BMR
    SET 
        Age = @age,
        Gender = @gender,
        Height = @height,
        Weight = @weight,
        activity_level = @activity_level,
        BMR_Value = @bmr
    WHERE User_ID = @user_id;

    -- Determine goal modifier
    IF @goal_level = 'Maintain' -- Maintain
        SET @goal_modifier = 1.00;
    ELSE IF @goal_level = 'Mild Weight Loss' -- Mild Weight Loss
        SET @goal_modifier = 0.88;
    ELSE IF @goal_level = 'Weight Loss' -- Weight Loss
        SET @goal_modifier = 0.75;
    ELSE 
        RAISERROR('Invalid Option',16,1);

    -- Calculate goal BMR
    SET @goal_BMR = @bmr * @goal_modifier;

    -- Update Goals table with calculated goal BMR
    UPDATE Goals 
    SET Goal_Level = @goal_level,
        Goal_BMR = @goal_BMR
    WHERE User_ID = @user_id;

    SET NOCOUNT OFF;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCaloriUserFirstName]    Script Date: 11/05/2024 12:55:31 am ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateCaloriUserLastName]    Script Date: 11/05/2024 12:55:31 am ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateCaloriUserPassword]    Script Date: 11/05/2024 12:55:31 am ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateCaloriUserUsername]    Script Date: 11/05/2024 12:55:31 am ******/
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
