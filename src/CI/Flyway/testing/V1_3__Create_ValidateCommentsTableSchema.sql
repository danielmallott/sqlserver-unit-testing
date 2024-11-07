CREATE OR ALTER PROCEDURE [StackOverflow.SchemaValidationTests].[Validate Comments Table Schema]
AS
BEGIN
    -- Arrange
    CREATE TABLE dbo.Comments_Test (
        Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
        CreationDate DATETIME NOT NULL,
        PostId INT NOT NULL,
        Score INT NULL,
        [Text] NVARCHAR(700) NOT NULL,
        UserId INT NULL
    );

    -- Assert
    EXEC tSQLt.AssertEqualsTableSchema @Expected = 'dbo.Comments_Test', @Actual = 'dbo.Comments', @Message = 'dbo.Comments schema does not match expected';

    DROP TABLE dbo.Comments_Test;
END;
