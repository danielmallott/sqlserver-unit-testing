CREATE OR ALTER PROCEDURE [StackOverflow.SchemaValidationTests].[Test Users Table Schema]
AS
BEGIN
    -- Arrange
    CREATE TABLE dbo.Users_Test (
        Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
        AboutMe NVARCHAR(MAX) NULL,
        Age INT NULL,
        CreationDate DATETIME NOT NULL,
        DisplayName NVARCHAR(40) NOT NULL,
        DownVotes INT NOT NULL,
        EmailHash NVARCHAR(40) NULL,
        LastAccessDate DATETIME NOT NULL,
        [Location] NVARCHAR(100) NULL,
        Reputation INT NOT NULL,
        UpVotes INT NOT NULL,
        Views INT NOT NULL,
        WebsiteUrl NVARCHAR(200) NULL,
        AccountId INT NULL
    );

    -- Assert
    EXEC tSQLt.AssertEqualsTableSchema @Expected = 'dbo.Users_Test', @Actual = 'dbo.Users', @Message = 'dbo.Users schema does not match expected';

    DROP TABLE dbo.Users_Test;
END;
