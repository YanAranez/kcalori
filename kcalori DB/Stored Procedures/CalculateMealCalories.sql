ALTER PROCEDURE CalculateMealCalories(
  @Foods NVARCHAR(4000),
  @UserProvidedCaloriesPerGram DECIMAL(10,2) = NULL  -- Optional user-entered calories per gram
)
AS
BEGIN
  -- Declare variables
  DECLARE @TotalCalories DECIMAL(10,2) = 0;
  DECLARE @Grams DECIMAL(10,2), @FoodName NVARCHAR(255);  -- Adjust length as needed
  DECLARE @CalPerG DECIMAL(10,2);  -- Declare missing variable
  DECLARE @Delimiter CHAR(1) = ',';
  DECLARE @Mealtime DATETIME = GETDATE();
  DECLARE @UserID BIGINT;

  -- Retrieve the current user's ID
  SET @UserID = USER_ID();

  -- Loop through each food item
  WHILE PATINDEX('%[^' + @Delimiter + ']%', @Foods) > 0  -- Check for non-delimiter characters
  BEGIN
    -- Extract food name (if present)
    SET @FoodName = LEFT(@Foods, PATINDEX('%[' + @Delimiter + ']%', @Foods) - 1);

    -- Extract grams
    SET @Grams = CAST(RIGHT(@Foods, LEN(@Foods) - PATINDEX('%[' + @Delimiter + ']%', @Foods)) AS DECIMAL(10,2));

    -- Remove the processed food item from the list
    SET @Foods = SUBSTRING(@Foods, 1, PATINDEX('%[' + @Delimiter + ']%', @Foods) - 1);

    -- Check for user-provided calorie value
    IF @UserProvidedCaloriesPerGram IS NOT NULL
    BEGIN
      SET @TotalCalories = @TotalCalories + @UserProvidedCaloriesPerGram * @Grams;
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

        SET @TotalCalories = @TotalCalories + (@CalPerG * @Grams);
      END
      -- Handle cases where only grams are provided (assuming default food)
      ELSE
      BEGIN
        SET @TotalCalories = @TotalCalories + (@Grams * 100);  -- Assuming default food with Cal_PerHundredG = 100
      END
    END
  END

  -- Insert the meal information into User_Meals table
  INSERT INTO User_Meals(User_ID, Calories, Meal_Time)
  VALUES (@UserID, @TotalCalories, GETDATE());

  -- Return the total calories
  SELECT @TotalCalories AS Calories;
END;
