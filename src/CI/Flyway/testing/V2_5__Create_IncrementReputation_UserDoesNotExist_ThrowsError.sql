CREATE OR ALTER PROCEDURE [StackOverflow.IncrementReputationTests].[Test User Does Not Exist Throws Error]
AS
BEGIN
    -- Arrange
    DECLARE @userId INT = 1337;
    DECLARE @expectedErrorMessage NVARCHAR(500) = 'User  with id: ' + (CAST(@userId AS VARCHAR(10))) + ' does not exist';

    EXEC tSQLt.FakeTable @TableName = N'dbo.Users';

    EXEC tSQLt.ExpectException 
        @ExpectedMessage = @expectedErrorMessage, 
        @ExpectedSeverity = NULL, 
        @ExpectedState = 1;

    -- Act
    EXEC dbo.IncrementReputation @userId, 10;
END;
