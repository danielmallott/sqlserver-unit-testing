CREATE OR ALTER PROCEDURE [StackOverflow.SchemaValidationTests].[Test LinkTypes Table Schema]
AS
BEGIN
    -- Arrange
    CREATE TABLE dbo.LinkTypes_Test (
        Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	    [Type] VARCHAR(50) NOT NULL
    );

    -- Assert
    EXEC tSQLt.AssertEqualsTableSchema @Expected = 'dbo.LinkTypes_Test', @Actual = 'dbo.LinkTypes', @Message = 'dbo.LinkTypes schema does not match expected';

    DROP TABLE dbo.LinkTypes_Test;
END;
