ALTER PROCEDURE [dbo].[sp_CalculateMealCalories](
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
  DECLARE @Mealtime DATETIME = GETDATE();
  DECLARE @Username SYSNAME = SYSTEM_USER;
  DECLARE @TotalCalories DECIMAL(10, 2) = 0;

  SELECT @UserID = User_ID
  FROM Calori_User
  WHERE Username = @Username;

  IF @UserID IS NULL
  BEGIN
    RAISERROR('User not found in Calori_User table', 16, 1);
    RETURN;
  END

  -- Split the comma-separated list into rows
  DECLARE @FoodTable TABLE (
    FoodName NVARCHAR(255),
    Grams DECIMAL(10, 2)
  );

  INSERT INTO @FoodTable (FoodName, Grams)
  SELECT LEFT(value, CHARINDEX(':', value) - 1) AS FoodName,
         TRY_CAST(SUBSTRING(value, CHARINDEX(':', value) + 1, LEN(value)) AS DECIMAL(10, 2)) AS Grams
  FROM STRING_SPLIT(@Foods, ',');

  -- Calculate total calories
  SELECT @TotalCalories = @TotalCalories + (ISNULL(fd.Cal_PerG, 0) * ISNULL(ft.Grams, 0) / 100)
  FROM @FoodTable ft
  LEFT JOIN Food_data fd ON ft.FoodName = fd.Food_Name;

  -- Insert into User_Meals table
  INSERT INTO User_Meals (User_ID, Meal_Time, Calories)
  VALUES (@UserID, @Mealtime, @TotalCalories);

 -- Insert into User_Meal_Foods table
DECLARE @MealID BIGINT;
SET @MealID = SCOPE_IDENTITY();

INSERT INTO dbo.User_Meal_Foods (User_Meal_ID, Food_Name, Grams, Calories)
SELECT @MealID, ft.FoodName, ft.Grams, SUM(fd.Cal_PerG * ft.Grams / 100) AS Calories
FROM @FoodTable ft
LEFT JOIN Food_data fd ON ft.FoodName = fd.Food_Name
GROUP BY ft.FoodName, ft.Grams;

  SET NOCOUNT OFF;
END;