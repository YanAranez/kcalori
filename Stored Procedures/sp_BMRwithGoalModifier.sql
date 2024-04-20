USE CaloriePal
GO

CREATE PROCEDURE sp_BMRwithGoalModifier(
    @user_ID BIGINT,
    @goal_Wmodified DECIMAL(5,2)
)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @goal_modifier DECIMAL(5,2);
    DECLARE @bmr DECIMAL(8,3);

    -- Retrieve BMR for the specified user
    SELECT @bmr = BMR_Value
    FROM BMR
    WHERE User_ID = @user_ID;

    IF @goal_Wmodified = 1 -- Maintain
        SET @goal_modifier = 1.00;
    ELSE IF @goal_Wmodified = 2 --Mild Weight Loss
        SET @goal_modifier = 0.88;
    ELSE IF @goal_Wmodified = 3 --'Weight Loss'
        SET @goal_modifier = 0.75;
    ELSE 
        RAISERROR('Invalid Option',16,1);

    -- Apply goal modifier to BMR
    SET @bmr = @bmr * @goal_modifier;

    SET NOCOUNT OFF;
END;
