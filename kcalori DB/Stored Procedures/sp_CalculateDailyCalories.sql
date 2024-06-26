USE [CaloriePal]
GO
/****** Object:  StoredProcedure [dbo].[sp_CalculateDailyCalories]    Script Date: 09/05/2024 5:43:18 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_CalculateDailyCalories]
    @uid BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @gbmr DECIMAL(8,3);
   

    -- Retrieve BMR value and activity level based on user's ID
    SELECT @gbmr = Goal_BMR
    FROM Goals
    WHERE User_ID = @uid;

 
    -- Merge calculated daily calorie intake into Daily_Calories table
    MERGE INTO Daily_Calories AS target
    USING (
        VALUES -- 1 = Sunday, 2 = Monday, 3 = Tuesday, 4 = Wednesday, 5 = Thursday, 6 = Friday, 7 = Saturday
            (@uid, 1, ROUND(@gbmr, 2), ROUND(@gbmr, 2), ROUND(@gbmr - 517, 2)),
            (@uid, 2, ROUND(@gbmr, 2), ROUND(@gbmr - 350, 2), ROUND(@gbmr - 457, 2)),
            (@uid, 3, ROUND(@gbmr, 2), ROUND(@gbmr - 350, 2), ROUND(@gbmr - 457, 2)),
            (@uid, 4, ROUND(@gbmr, 2), ROUND(@gbmr - 350, 2), ROUND(@gbmr - 457, 2)),
            (@uid, 5, ROUND(@gbmr, 2), ROUND(@gbmr - 350, 2), ROUND(@gbmr - 457, 2)),
            (@uid, 6, ROUND(@gbmr, 2), ROUND(@gbmr - 350, 2), ROUND(@gbmr - 457, 2)),
            (@uid, 7, ROUND(@gbmr, 2), ROUND(@gbmr, 2, 2), ROUND(@gbmr - 517, 2))
    ) AS source (User_ID, DayOfWeek, MaintainWeight, MildWeightLoss, WeightLoss)
    ON (target.User_ID = source.User_ID AND target.DayOfWeek = source.DayOfWeek)
    WHEN NOT MATCHED THEN 
        INSERT (User_ID, DayOfWeek, MaintainWeight, MildWeightLoss, WeightLoss) 
        VALUES (source.User_ID, source.DayOfWeek, source.MaintainWeight, source.MildWeightLoss, source.WeightLoss);

    SET NOCOUNT OFF;
END;