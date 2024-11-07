CREATE OR ALTER PROCEDURE [StackOverflow.SchemaValidationTests].[Validate PostTypes Table Schema]
AS
BEGIN
    -- Arrange
    CREATE TABLE dbo.PostTypes_Test (
        Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	    [Type] NVARCHAR(50) NOT NULL
    );

    -- Assert
    EXEC tSQLt.AssertEqualsTableSchema @Expected = 'dbo.PostTypes_Test', @Actual = 'dbo.PostTypes', @Message = 'dbo.PostTypes schema does not match expected';

    DROP TABLE dbo.PostTypes_Test;
END;
