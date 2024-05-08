USE [CaloriePal]
GO

/****** Object:  StoredProcedure [dbo].[sp_CalculateUserFoodItems]    Script Date: 07/05/2024 4:32:10 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_CalculateUserFoodItems](
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

  DECLARE @Username SYSNAME = SYSTEM_USER;

  -- Split the comma-separated list into rows
  DECLARE @FoodTable TABLE (
    Food_Name NVARCHAR(255),
    Calories INT
  );

  INSERT INTO @FoodTable (Food_Name, Calories)
  SELECT LEFT(value, CHARINDEX(':', value) - 1) AS Food_Name,
         TRY_CAST(SUBSTRING(value, CHARINDEX(':', value) + 1, LEN(value)) AS INT) AS Calories
  FROM STRING_SPLIT(@Foods, ',');

  -- Insert into Food_Data
  INSERT INTO dbo.Food_Data (Food_Name, Calories)
  SELECT Food_Name, Calories
  FROM @FoodTable
  WHERE Food_Name NOT IN (SELECT Food_Name FROM dbo.Food_Data);

  SET NOCOUNT OFF;
END;
