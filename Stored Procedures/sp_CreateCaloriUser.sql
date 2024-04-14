USE [CaloriePal]
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateCaloriUser]    Script Date: 15/04/2024 12:03:16 am ******/
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
