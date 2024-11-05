CREATE OR ALTER PROCEDURE [StackOverflow.IncrementReputationTests].[Test Null Reputation Amount Throws Error]
AS
BEGIN
    -- Arrange
    EXEC tSQLt.ExpectException 
        @ExpectedMessage = 'Reputation Adjustment Amount must not be null', 
        @ExpectedSeverity = NULL, 
        @ExpectedState = 1;

    -- Act
    EXEC dbo.IncrementReputation -1, 10;
END;
