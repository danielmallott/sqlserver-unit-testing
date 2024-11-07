CREATE OR ALTER PROCEDURE [StackOverflow.SchemaValidationTests].[Validate Votes Table Schema]
AS
BEGIN
    -- Arrange
    CREATE TABLE dbo.Votes_Test (
        Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
        PostId INT NOT NULL,
        UserId INT NULL,
        BountyAmount INT NULL,
        VoteTypeId INT NOT NULL,
        CreationDate DATETIME NOT NULL
    );

    -- Assert
    EXEC tSQLt.AssertEqualsTableSchema @Expected = 'dbo.Votes_Test', @Actual = 'dbo.Votes', @Message = 'dbo.Votes schema does not match expected';

    DROP TABLE dbo.Votes_Test;
END;
