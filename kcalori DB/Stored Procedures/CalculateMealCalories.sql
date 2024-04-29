USE [CaloriePal]
GO
/****** Object:  StoredProcedure [dbo].[sp_CalculateMealCalories]    Script Date: 29/04/2024 4:18:18 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_CalculateMealCalories](
  @Foods NVARCHAR(4000),
  @UserProvidedCaloriesPerGram DECIMAL(10,2) = NULL  -- Optional user-entered calories per gram
)
AS
BEGIN
  SET NOCOUNT ON;

  -- Validate input parameters
  IF @Foods IS NULL OR LEN(@Foods) = 0
  BEGIN
    RAISERROR('Food list cannot be empty.', 16, 1);
    RETURN;
  END

  DECLARE @UserID BIGINT;
  DECLARE @TotalCalories DECIMAL(10,2) = 0;
  DECLARE @Grams DECIMAL(10,2), @FoodName NVARCHAR(255);
  DECLARE @CalPerG DECIMAL(10,2);
  DECLARE @Delimiter CHAR(1) = ',';
  DECLARE @Mealtime DATETIME = GETDATE();

  -- Get the current username
  DECLARE @Username SYSNAME = SYSTEM_USER;

  -- Retrieve the User_ID from Calori_User table
  SELECT @UserID = User_ID
  FROM Calori_User
  WHERE Username = @Username;

  -- Check if the user exists in the Calori_User table
  IF @UserID IS NOT NULL
  BEGIN
    -- Loop through each food item
    WHILE LEN(@Foods) > 0
    BEGIN
      -- Extract food name and grams
      IF CHARINDEX(@Delimiter, @Foods) > 0
      BEGIN
        SET @FoodName = LEFT(@Foods, CHARINDEX(@Delimiter, @Foods) - 1);
        SET @Foods = SUBSTRING(@Foods, CHARINDEX(@Delimiter, @Foods) + 1, LEN(@Foods) - CHARINDEX(@Delimiter, @Foods));
      END
      ELSE
      BEGIN
        SET @FoodName = @Foods;
        SET @Foods = '';
      END

      -- Extract grams
      IF CHARINDEX(':', @FoodName) > 0
      BEGIN
        SET @Grams = TRY_CAST(SUBSTRING(@FoodName, CHARINDEX(':', @FoodName) + 1, LEN(@FoodName)) AS DECIMAL(10,2));
        SET @FoodName = LEFT(@FoodName, CHARINDEX(':', @FoodName) - 1);
      END
      ELSE
      BEGIN
        -- Handle error if delimiter ":" is not found in food name
        RAISERROR('Invalid food format: %s', 16, 1, @FoodName);
        RETURN;
      END

      -- Check if the food item exists in the database
      IF NOT EXISTS (SELECT 1 FROM Food_data WHERE Food_Name = @FoodName)
      BEGIN
        -- If the food item doesn't exist, insert it into the Food_data table with default values
        INSERT INTO Food_data (Food_Name, Cal_PerG) VALUES (@FoodName, 50); -- Assuming default calories per gram is 50
      END

      -- If the user provides only calorie count without grams, convert it into grams
      IF @Grams IS NULL AND @UserProvidedCaloriesPerGram IS NOT NULL
      BEGIN
        -- Convert calorie count into grams based on calorie per gram value
        SET @Grams = @UserProvidedCaloriesPerGram / (SELECT Cal_PerG FROM Food_data WHERE Food_Name = @FoodName);
      END

      -- Calculate the calorie count for each food item
      IF @UserProvidedCaloriesPerGram IS NOT NULL
      BEGIN
        SET @TotalCalories = @TotalCalories + @UserProvidedCaloriesPerGram * ISNULL(@Grams, 0);
      END
      ELSE
      BEGIN
        -- Existing logic for database lookup and calculation (if food name provided)
        IF @FoodName IS NOT NULL
        BEGIN
          SELECT @CalPerG = Cal_PerG
          FROM Food_data
          WHERE Food_Name = @FoodName;

          IF @@ROWCOUNT = 0  -- Check if food was not found
          BEGIN
            RAISERROR('Food not found in database: %s', 16, 1, @FoodName);
            RETURN;
          END

          SET @TotalCalories = @TotalCalories + (ISNULL(@CalPerG, 0) * ISNULL(@Grams, 0));
        END
        -- Handle cases where only grams are provided (assuming default food)
        ELSE
        BEGIN
          SET @TotalCalories = @TotalCalories + (ISNULL(@Grams, 0) * 100); -- Assuming default food with Cal_PerHundredG = 100
        END
      END
    END

    -- Insert the meal information into User_Meals table
    INSERT INTO User_Meals(User_ID, Food_ID,Calories, Meal_Time)
    VALUES (@UserID, NULL, @TotalCalories, GETDATE());

    -- Return the total calories
    SELECT @TotalCalories AS Calories;
    SET NOCOUNT OFF;
  END
  ELSE
  BEGIN
    RAISERROR('User not found in Calori_User table', 16, 1);
    RETURN;
  END
END;
