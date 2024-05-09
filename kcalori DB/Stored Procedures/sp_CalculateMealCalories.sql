USE CaloriePal
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

    SELECT @UserID = User_ID
    FROM Calori_User
    WHERE Username = @Username;

    IF @UserID IS NULL
    BEGIN
        RAISERROR('User not found in Calori_User table', 16, 1);
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

-- Logging meal details
DECLARE @GoalLevel VARCHAR(20);
SELECT @GoalLevel = Goal_Level
FROM dbo.Goals
WHERE User_ID = @UserID;

DECLARE @GoalCalories DECIMAL(10, 2);
DECLARE @DayOfWeek INT = DATEPART(WEEKDAY, GETDATE()); -- Get current day of the week

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


DECLARE @RemainingCalories DECIMAL(10, 2);
SET @RemainingCalories = @GoalCalories - @TotalCalories;

-- Insert into Meal_Logs table
INSERT INTO dbo.Meal_Logs (User_ID, User_Meal_ID, Meal_Date, Meal_Time, Calories, Remaining_Calories)
VALUES (@UserID, @MealID, @MealDate, @MealTime, @TotalCalories, @RemainingCalories);

SET NOCOUNT OFF;

END;