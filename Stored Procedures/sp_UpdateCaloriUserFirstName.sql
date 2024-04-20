USE CaloriePal

GO


CREATE PROCEDURE sp_UpdateCaloriUserFirstName(
	@user_ID BIGINT,
	@fn VARCHAR(50)
)


AS 

BEGIN
	SET NOCOUNT ON;
	UPDATE Calori_User SET
	First_Name = @fn
	WHERE USER_ID = @user_ID;
	SET NOCOUNT OFF;


END;