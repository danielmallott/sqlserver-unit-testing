CREATE OR ALTER PROCEDURE [StackOverflow.CheckUserDisplayNameExistsTests].[Test That Existing User Display Name Returns 1]
AS
BEGIN
    -- Arrange
    EXEC tSQLt.FakeTable @TableName = 'dbo.Users', @Identity = 1;
    INSERT INTO dbo.Users
    (AboutMe, Age, CreationDate, DisplayName, DownVotes, EmailHash, LastAccessDate, [Location], Reputation, UpVotes, Views, WebsiteUrl, AccountId)
    VALUES
    ('I''m a test', NULL, GETDATE(), 'test-display-name', 0, NULL, GETDATE(), 'CI/CD', 1, 0, 0, 'https://www.contoso.com', NULL);
    DECLARE @result INT;

    -- Act
    SET @result = (SELECT dbo.CheckUserDisplayNameExists('test-display-name'));

    -- Assert
    EXEC tSQLt.AssertEquals 1, @result, 'Did not return that User Display Name Exists';
END;
