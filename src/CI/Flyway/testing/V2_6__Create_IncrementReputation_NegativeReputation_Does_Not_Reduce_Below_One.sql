CREATE OR ALTER PROCEDURE [StackOverflow.IncrementReputationTests].[Test Negative Reputation Does Not Reduce Below One]
AS
BEGIN
    -- Arrange
    DECLARE @userId INT = 1337;

    EXEC tSQLt.FakeTable @TableName = N'dbo.Users';
    INSERT INTO dbo.Users (Id, Reputation) VALUES (@userId, 5);

    -- Act
    EXEC dbo.IncrementReputation @userId, -10;

    -- Assert
    DECLARE @actualReputation INT = (SELECT Reputation FROM dbo.Users WHERE Id = @userId);
    EXEC tSQLt.AssertEquals @Expected = 1, @Actual = @actualReputation, @Message = 'Reputation was not adjusted correctly';
END;