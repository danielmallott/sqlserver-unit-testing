CREATE OR ALTER PROCEDURE [StackOverflow.IncrementReputationTests].[Test Reputation Adjusted Successfully]
AS
BEGIN
    -- Arrange
    DECLARE @userId INT = 1337;

    EXEC tSQLt.FakeTable @TableName = N'dbo.Users';
    INSERT INTO dbo.Users (Id, Reputation) VALUES (@userId, 20);

    -- Act
    EXEC dbo.IncrementReputation @userId, 10;

    -- Assert
    DECLARE @actualReputation INT = (SELECT Reputation FROM dbo.Users WHERE Id = @userId);
    EXEC tSQLt.AssertEquals @Expected = 30, @Actual = @actualReputation, @Message = 'Reputation was not adjusted correctly';
END;