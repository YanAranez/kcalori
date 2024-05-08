Use CaloriePal

GO

ALTER PROCEDURE sp_CalculateMealandUserMeal
    @MealCaloriesFoods NVARCHAR(4000),
    @UserFoodItems NVARCHAR(4000),
    @UserMealID BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    -- Parameter validation
    IF @MealCaloriesFoods IS NULL OR LEN(@MealCaloriesFoods) = 0
        THROW 50001, 'Meal calories foods cannot be empty.', 1;

    IF @UserFoodItems IS NULL OR LEN(@UserFoodItems) = 0
        THROW 50002, 'User food items cannot be empty.', 1;

    IF @UserMealID IS NULL
        THROW 50003, 'User meal ID cannot be null.', 1;

    BEGIN TRANSACTION;

    BEGIN TRY
        -- Calculate meal calories
        DECLARE @MealCalories DECIMAL(10, 2);
        EXEC sp_CalculateMealCalories @Foods = @MealCaloriesFoods, @TotalCalories = @MealCalories OUTPUT;

        -- Calculate user food items calories
        DECLARE @UserFoodItemsCalories INT;
        EXEC sp_CalculateUserFoodItems @Foods = @UserFoodItems, @TotalCalories = @UserFoodItemsCalories OUTPUT;

        -- Update User_Meals with the total calories
        UPDATE um
        SET um.Calories = @MealCalories + @UserFoodItemsCalories
        FROM User_Meals um
        WHERE um.User_Meal_ID = @UserMealID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;

    SET NOCOUNT OFF;
END;