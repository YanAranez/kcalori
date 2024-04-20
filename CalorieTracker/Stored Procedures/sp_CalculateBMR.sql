USE [CaloriePal]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_CalculateBMR](
	@user_id BIGINT
)

AS

BEGIN
	DECLARE @age INT;
	DECLARE @gen CHAR(1);
	DECLARE @hei DECIMAL(6,2);  
	DECLARE @wei DECIMAL(6,2);  
	DECLARE @bmr DECIMAL(8,3);

	SELECT @age = Age, @gen = Gender, @hei = Height, @wei = Weight FROM BMR WHERE User_ID = @user_id;

	IF @gen = 'M' 
		SET @bmr = 13.397 * @wei + 4.799 * @hei - 5.677 * @age + 88.362; 
		ELSE
		SET @bmr = 9.247 * @wei + 3.098 * @hei - 4.330 * @age + 447.593;  


	UPDATE Calori_User
	SET BMR_Value = @bmr
	WHERE User_ID = @user_id;

	SELECT @bmr AS BMR_Value;
END