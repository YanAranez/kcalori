USE [CaloriePal]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateBMRAndGoalBMR]    Script Date: 10/05/2024 6:36:07 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_UpdateBMRAndGoalBMR]
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
