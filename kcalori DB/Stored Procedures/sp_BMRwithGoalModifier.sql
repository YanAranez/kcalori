USE CaloriePal
GO

ALTER PROCEDURE [dbo].[sp_BMRwithGoalModifier]
    @uid BIGINT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @goal_modifier DECIMAL(5,2);
    DECLARE @gbmr DECIMAL(8,3);
    DECLARE @bmr DECIMAL(8,3);
    DECLARE @goal_Wmodified DECIMAL(5,2);

    SELECT @bmr = BMR_Value
    FROM BMR
    WHERE User_ID = @uid;

    SELECT @goal_Wmodified = Goal_Level
    FROM Goals
    WHERE User_ID = @uid;

    IF @goal_Wmodified = 1 -- Maintain
        SET @goal_modifier = 1.00;
    ELSE IF @goal_Wmodified = 2 --Mild Weight Loss
        SET @goal_modifier = 0.88;
    ELSE IF @goal_Wmodified = 3 --'Weight Loss'
        SET @goal_modifier = 0.75;
    ELSE 
        RAISERROR('Invalid Option',16,1);

    SET @gbmr = @bmr * @goal_modifier;

    UPDATE Goals SET
    Goal_BMR = @gbmr
    WHERE User_ID = @uid; -- Make sure to update the correct row for the user
    SELECT @gbmr as Goal_BMR;
    SET NOCOUNT OFF;
END;