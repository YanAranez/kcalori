USE CaloriePal

GO


CREATE PROCEDURE sp_UpdateCaloriUserLastName(
	@user_ID BIGINT,
	@ln VARCHAR(50)
)


AS 

BEGIN
	SET NOCOUNT ON;
	UPDATE Calori_User SET
	Last_Name = @ln
	WHERE USER_ID = @user_ID;
	SET NOCOUNT OFF;


END;