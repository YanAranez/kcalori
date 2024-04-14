USE [CaloriePal]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[sp_CreateCaloriUser](
	@fn VARCHAR(50),
	@ln VARCHAR(50),
	@un VARCHAR(50),
	@pw VARCHAR(50),
	@age int,
	@gen CHAR(1),
	@hei DECIMAL(6,2),
	@wei DECIMAL(6,2)
)

AS

BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.Calori_User(First_Name, Last_Name, Username, Password) VALUES (@fn, @ln, @un, @pw);
	DECLARE @uid BIGINT = SCOPE_IDENTITY();
	SET IDENTITY_INSERT dbo.BMR ON;
	INSERT INTO dbo.BMR(User_ID, Age, Gender, Height, Weight) VALUES (@uid, @age, @gen, @hei, @wei);
	SET IDENTITY_INSERT dbo.BMR OFF;

	--
	EXEC sp_CalculateBMR @uid;  

	SET NOCOUNT OFF;


END