USE [CaloriePal]
GO
/****** Object:  StoredProcedure [dbo].[sp_BMRwithGoalModifier]    Script Date: 30/04/2024 11:38:03 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_BMRwithGoalModifier]
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @goal_modifier DECIMAL(5,2);
    DECLARE @gbmr DECIMAL(8,3);
	DECLARE @bmr DECIMAL(8,3);
    DECLARE @user_ID BIGINT;

    DECLARE @Username SYSNAME = SYSTEM_USER;

    SELECT @user_ID = User_ID
    FROM Calori_User
    WHERE Username = @Username;

    SELECT @bmr = BMR_Value
    FROM BMR
    WHERE User_ID = @user_ID;

    DECLARE @goal_Wmodified DECIMAL(5,2) = (SELECT Goal_Level FROM Goals WHERE User_ID = @user_ID);

    IF @goal_Wmodified = 1 -- Maintain
        SET @goal_modifier = 1.00;
    ELSE IF @goal_Wmodified = 2 --Mild Weight Loss
        SET @goal_modifier = 0.88;
    ELSE IF @goal_Wmodified = 3 --'Weight Loss'
        SET @goal_modifier = 0.75;
    ELSE 
        RAISERROR('Invalid Option',16,1);

    SET @gbmr = @bmr * @goal_modifier;

	UPDATE Goals SET
	Goal_BMR = @gbmr
	WHERE User_ID = @user_ID;

	SELECT @gbmr as Goal_BMR;
    SET NOCOUNT OFF;
END;