USE CaloriePal;


GO


CREATE PROCEDURE sp_UpdateCaloriUserPassword (
	@user_ID BIGINT,
	@pw VARCHAR(50)
)

AS

BEGIN
	SET NOCOUNT ON;
	UPDATE Calori_User SET
	Password = @pw
	WHERE USER_ID = @user_ID;
	SET NOCOUNT OFF;
END;