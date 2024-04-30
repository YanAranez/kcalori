USE [CaloriePal]
GO
/****** Object:  StoredProcedure [dbo].[sp_CalculateDailyCalories]    Script Date: 30/04/2024 11:38:51 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_CalculateDailyCalories]
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @user_id BIGINT;
    DECLARE @username SYSNAME = SYSTEM_USER;

    SELECT @user_id = User_ID
    FROM Calori_User
    WHERE Username = @username;

    IF @user_id IS NULL
    BEGIN
        RAISERROR('User ID not found for the currently logged-in user.', 16, 1);
        RETURN;
    END;

    DECLARE @bmr DECIMAL(8,3);
    DECLARE @activity_multiplier DECIMAL(5,2);

    SELECT @bmr = BMR_Value, @activity_multiplier = Activity_Level
    FROM BMR 
    WHERE User_ID = @user_id;

    IF @bmr IS NULL OR @activity_multiplier IS NULL
    BEGIN
        RAISERROR('BMR value or activity level not found for the provided user ID.', 16, 1);
        RETURN;
    END;

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