USE [CaloriePal]
GO
/****** Object:  StoredProcedure [dbo].[sp_CalculateDailyCalories]    Script Date: 01/05/2024 11:34:37 am ******/
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
        VALUES 
            (@uid, 'Sunday', ROUND(@gbmr, 2), ROUND(@gbmr, 2), ROUND(@gbmr - 517, 2)),
            (@uid, 'Monday', ROUND(@gbmr, 2), ROUND(@gbmr - 350, 2), ROUND(@gbmr - 457, 2)),
            (@uid, 'Tuesday', ROUND(@gbmr, 2), ROUND(@gbmr - 350, 2), ROUND(@gbmr - 457, 2)),
            (@uid, 'Wednesday', ROUND(@gbmr, 2), ROUND(@gbmr - 350, 2), ROUND(@gbmr - 457, 2)),
            (@uid, 'Thursday', ROUND(@gbmr, 2), ROUND(@gbmr - 350, 2), ROUND(@gbmr - 457, 2)),
            (@uid, 'Friday', ROUND(@gbmr, 2), ROUND(@gbmr - 350, 2), ROUND(@gbmr - 457, 2)),
            (@uid, 'Saturday', ROUND(@gbmr, 2), ROUND(@gbmr, 2, 2), ROUND(@gbmr - 517, 2))
    ) AS source (User_ID, DayOfWeek, MaintainWeight, MildWeightLoss, WeightLoss)
    ON (target.User_ID = source.User_ID AND target.DayOfWeek = source.DayOfWeek)
    WHEN NOT MATCHED THEN 
        INSERT (User_ID, DayOfWeek, MaintainWeight, MildWeightLoss, WeightLoss) 
        VALUES (source.User_ID, source.DayOfWeek, source.MaintainWeight, source.MildWeightLoss, source.WeightLoss);

    SET NOCOUNT OFF;
END;