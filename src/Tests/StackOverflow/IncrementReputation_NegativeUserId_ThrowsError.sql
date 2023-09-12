CREATE OR ALTER PROCEDURE SampleTests.[Test Negative User Id Throws Error]
AS
BEGIN
    -- Arrange
    EXEC tSQLt.ExpectException 
        @ExpectedMessage = 'User Id must be a positive number', 
        @ExpectedSeverity = NULL, 
        @ExpectedState = 1;

    -- Act
    EXEC dbo.IncrementReputation -1, 10;
END;
GO