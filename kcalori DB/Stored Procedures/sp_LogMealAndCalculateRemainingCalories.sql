USE [CaloriePal]
GO
/****** Object:  StoredProcedure [dbo].[sp_LogMealAndCalculateRemainingCalories]    Script Date: 30/04/2024 11:40:27 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_LogMealAndCalculateRemainingCalories]
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

    SET @DayOfWeek = DATENAME(weekday, @Meal_DateTime);

    SELECT @Daily_Calories = MaintainWeight
    FROM Daily_Calories
    WHERE User_ID = @User_ID AND DayOfWeek = @DayOfWeek;

    SELECT @CalorieGoal = CASE
                            WHEN @Meal_DateTime >= DATEADD(day, 1 - DATEPART(dw, GETDATE()), GETDATE()) THEN MildWeightLoss
                            ELSE WeightLoss
                          END
    FROM Daily_Calories
    WHERE User_ID = @User_ID AND DayOfWeek = @DayOfWeek;

    SELECT @Total_Consumed_Calories = COALESCE(SUM(Meal_Calories), 0)
    FROM Meal_Logs
    WHERE User_ID = @User_ID AND CAST(Meal_DateTime AS DATE) = CAST(@Meal_DateTime AS DATE);

    SET @Remaining_Calories = @CalorieGoal - (@Total_Consumed_Calories + @Meal_Calories);

    INSERT INTO Meal_Logs (User_ID, Meal_Name, Meal_Calories, Meal_DateTime, Total_Consumed_Calories, Remaining_Calories)
    VALUES (@User_ID, @Meal_Name, @Meal_Calories, @Meal_DateTime, @Total_Consumed_Calories + @Meal_Calories, @Remaining_Calories);

    SELECT @Remaining_Calories AS Remaining_Calories;

    SET NOCOUNT OFF;
END;
