CREATE OR ALTER PROCEDURE SampleTests.[Test That Null Display Name On Insert User Throws Error]
AS
BEGIN
    EXEC tSQLt.ExpectException 
        @ExpectedMessage = '@displayName must not be null', 
        @ExpectedSeverity = NULL, 
        @ExpectedState = 1;
    EXEC dbo.InsertUser 'I''m a test', NULL, 'CI/CD', 'https://www.contoso.com';
END;
GO