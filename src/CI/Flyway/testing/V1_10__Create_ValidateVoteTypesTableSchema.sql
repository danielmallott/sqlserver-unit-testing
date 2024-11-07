CREATE OR ALTER PROCEDURE [StackOverflow.SchemaValidationTests].[Validate VoteTypes Table Schema]
AS
BEGIN
    -- Arrange
    CREATE TABLE dbo.VoteTypes_Test (
        Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
        [Name] VARCHAR(50) NOT NULL
    );

    -- Assert
    EXEC tSQLt.AssertEqualsTableSchema @Expected = 'dbo.VoteTypes_Test', @Actual = 'dbo.VoteTypes', @Message = 'dbo.VoteTypes schema does not match expected';

    DROP TABLE dbo.VoteTypes_Test;
END;
