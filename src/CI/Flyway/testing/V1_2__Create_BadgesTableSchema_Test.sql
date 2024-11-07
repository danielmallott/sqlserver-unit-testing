CREATE OR ALTER PROCEDURE [StackOverflow.SchemaValidationTests].[Test Badges Table Schema]
AS
BEGIN
    -- Arrange
    CREATE TABLE dbo.Badges_Test (
        Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
        [Name] NVARCHAR(40) NOT NULL,
        UserId INT NOT NULL,
        [Date] DATETIME NOT NULL
    );

    -- Assert
    EXEC tSQLt.AssertEqualsTableSchema @Expected = 'dbo.Badges_Test', @Actual = 'dbo.Badges', @Message = 'dbo.Badges schema does not match expected';

    DROP TABLE dbo.Badges_Test;
END;
