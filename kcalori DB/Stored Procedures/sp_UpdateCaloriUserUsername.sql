USE CaloriePal;


GO


CREATE PROCEDURE sp_UpdateCaloriUserUsername (
	@user_id BIGINT,
	@un VARCHAR(64)

)


AS


BEGIN
	SET NOCOUNT ON;
		UPDATE Calori_User SET
		Username = @un
		WHERE User_ID = @user_id;
	SET NOCOUNT OFF;
END;