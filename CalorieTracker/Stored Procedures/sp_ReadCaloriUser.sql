USE CaloriePal

GO

CREATE PROCEDURE sp_ReadCaloriUser

AS


BEGIN
SET NOCOUNT ON;

SELECT * FROM dbo.Calori_User;

SET NOCOUNT OFF;


END