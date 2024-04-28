USE [CaloriePal]
GO
/****** Object:  StoredProcedure [dbo].[sp_CalculateMealCalories]    Script Date: 28/04/2024 10:48:08 am ******/
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

  DECLARE @UserID BIGINT;
  DECLARE @TotalCalories DECIMAL(10,2) = 0;
  DECLARE @Grams DECIMAL(10,2), @FoodName NVARCHAR(255);
  DECLARE @CalPerG DECIMAL(10,2);
  DECLARE @Delimiter CHAR(1) = ',';
  DECLARE @Mealtime DATETIME = GETDATE();

  DECLARE @Username SYSNAME = SYSTEM_USER;

  SELECT @UserID = User_ID
  FROM Calori_User
  WHERE Username = @Username;

  -- Check if the user exists in the Calori_User table
  IF @UserID IS NOT NULL
  BEGIN
    WHILE LEN(@Foods) > 0
    BEGIN
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

      IF CHARINDEX(':', @FoodName) > 0
      BEGIN
        SET @Grams = TRY_CAST(SUBSTRING(@FoodName, CHARINDEX(':', @FoodName) + 1, LEN(@FoodName)) AS DECIMAL(10,2));
        SET @FoodName = LEFT(@FoodName, CHARINDEX(':', @FoodName) - 1);
      END
      ELSE
      BEGIN
        RAISERROR('Invalid food format: %s', 16, 1, @FoodName);
        RETURN;
      END

      IF @UserProvidedCaloriesPerGram IS NOT NULL
      BEGIN
        SET @TotalCalories = @TotalCalories + @UserProvidedCaloriesPerGram * ISNULL(@Grams, 0);
      END
      ELSE
      BEGIN
        IF @FoodName IS NOT NULL
        BEGIN
          SELECT @CalPerG = Cal_PerG
          FROM Food_data
          WHERE Food_Name = @FoodName;

          IF @@ROWCOUNT = 0 
          BEGIN
            RAISERROR('Food not found in database: %s', 16, 1, @FoodName);
            RETURN;
          END

          SET @TotalCalories = @TotalCalories + (ISNULL(@CalPerG, 0) * ISNULL(@Grams, 0));
        END
        ELSE
        BEGIN
          SET @TotalCalories = @TotalCalories + (ISNULL(@Grams, 0) * 100); -- Assuming default food with Cal_PerHundredG = 100
        END
      END
    END

    INSERT INTO User_Meals(User_ID, Food_ID,Calories, Meal_Time)
    VALUES (@UserID, NULL, @TotalCalories, GETDATE());

    SELECT @TotalCalories AS Calories;
    SET NOCOUNT OFF;
  END
  ELSE
  BEGIN
    RAISERROR('User not found in Calori_User table', 16, 1);
    RETURN;
  END
END;