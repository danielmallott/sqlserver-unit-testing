CREATE OR ALTER PROCEDURE [StackOverflow.IncrementReputationTests].[Test Null User Id Throws Error]
AS
BEGIN
    -- Arrange
    EXEC tSQLt.ExpectException 
        @ExpectedMessage = 'User Id must not be null', 
        @ExpectedSeverity = NULL, 
        @ExpectedState = 1;

    -- Act
    EXEC dbo.IncrementReputation -1, 10;
END;
