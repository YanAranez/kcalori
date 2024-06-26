USE [CaloriePal]
GO
/****** Object:  StoredProcedure [dbo].[sp_CalculateMealCalories]    Script Date: 10/05/2024 11:36:04 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_CalculateMealCalories]
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
