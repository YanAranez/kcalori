ALTER PROCEDURE [dbo].[sp_CalculateBMR](
    @user_id BIGINT,
    @activity_level TINYINT
)
AS
BEGIN
    DECLARE @age INT;
    DECLARE @gen CHAR(1);
    DECLARE @hei DECIMAL(6,2);  
    DECLARE @wei DECIMAL(6,2);  
    DECLARE @bmr DECIMAL(8,3);
    DECLARE @activity_multiplier DECIMAL(5,2);

    -- Retrieve user details from BMR table
    SELECT @age = Age, @gen = Gender, @hei = Height, @wei = Weight 
    FROM BMR 
    WHERE User_ID = @user_id;

    -- Calculate BMR based on gender
    IF @gen = 'M' 
        SET @bmr = 13.397 * @wei + 4.799 * @hei - 5.677 * @age + 88.362; 
    ELSE
        SET @bmr = 9.247 * @wei + 3.098 * @hei - 4.330 * @age + 447.593;  

    -- Determine activity multiplier
    IF @activity_level = 1 -- Sedentary
        SET @activity_multiplier = 1.2;
    ELSE IF @activity_level = 2 -- Lightly Active
        SET @activity_multiplier = 1.375;
    ELSE IF @activity_level = 3 -- Moderately Active
        SET @activity_multiplier = 1.55;
    ELSE IF @activity_level = 4 -- Active
        SET @activity_multiplier = 1.725;
    ELSE 
        RAISERROR('Invalid activity level provided.', 16, 1);

    -- Apply activity multiplier to BMR
    SET @bmr = @bmr * @activity_multiplier;

    -- Update BMR_Value in both Calori_User and BMR tables
    UPDATE Calori_User
    SET BMR_Value = @bmr
    WHERE User_ID = @user_id;

    UPDATE BMR
    SET BMR_Value = @bmr
    WHERE User_ID = @user_id;

    -- Return the calculated BMR
    SELECT @bmr AS BMR_Value;
END;
