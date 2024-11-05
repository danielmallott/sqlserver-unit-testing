CREATE OR ALTER PROCEDURE [StackOverflow.CheckUserDisplayNameExistsTests].[Test That Non-existing User Display Name Returns 0]
AS
BEGIN
    -- Arrange
    EXEC tSQLt.FakeTable @TableName = 'dbo.Users', @Identity = 1;
    DECLARE @result INT;

    -- Act
    SET @result = (SELECT dbo.CheckUserDisplayNameExists('test-display-name'));

    -- Assert
    EXEC tSQLt.AssertEquals 0, @result, 'Did not return that User Display Name Does Not Exist';
END;
