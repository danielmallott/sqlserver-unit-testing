CREATE OR ALTER PROCEDURE [StackOverflow.InsertUserTests].[Test That Already Existing Display Name On Insert User Throws Error]
AS
BEGIN
    -- Arrange
    EXEC tSQLt.FakeFunction 'dbo.CheckUserDisplayNameExists', '[StackOverflow.InsertUserTests].Fake_CheckUserDisplayNameExists_DoesExist';
    EXEC tSQLt.ExpectException 
        @ExpectedMessage = '@displayName already exists', 
        @ExpectedSeverity = NULL, 
        @ExpectedState = 1;

    -- Act
    EXEC dbo.InsertUser 'I''m a test', 'existing-display-name', 'CI/CD', 'https://www.contoso.com';
END;
