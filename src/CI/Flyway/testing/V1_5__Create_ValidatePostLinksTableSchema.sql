CREATE OR ALTER PROCEDURE [StackOverflow.SchemaValidationTests].[Validate PostLinks Table Schema]
AS
BEGIN
    -- Arrange
    CREATE TABLE dbo.PostLinks_Test (
        Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
        CreationDate DATETIME NOT NULL,
        PostId INT NOT NULL,
        RelatedPostId INT NOT NULL,
        LinkTypeId INT NOT NULL
    );

    -- Assert
    EXEC tSQLt.AssertEqualsTableSchema @Expected = 'dbo.PostLinks_Test', @Actual = 'dbo.PostLinks', @Message = 'dbo.PostLinks schema does not match expected';

    DROP TABLE dbo.PostLinks_Test;
END;
