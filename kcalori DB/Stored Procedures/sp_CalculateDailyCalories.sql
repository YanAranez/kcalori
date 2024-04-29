Use CaloriePal

Go

ALTER PROCEDURE [dbo].[sp_CalculateDailyCalories]
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