USE WideWorldImporters;
GO

-- Test the dbo.InsertUser stored procedure, making sure to clean up after ourselves.
BEGIN TRANSACTION;

DECLARE @newPersonId INT;

-- Act
EXEC @newPersonId = dbo.InsertPerson 'Test', 'TestUser', 1, 1;

-- Assert
IF EXISTS (SELECT * FROM Application.People WHERE PersonID = @newPersonId)
    SELECT 'Insert Person test passed' AS Result;
ELSE
    SELECT 'Insert Person test failed' AS Result;

ROLLBACK;

IF EXISTS (SELECT * FROM Application.People WHERE PersonID = @newPersonId)
    SELECT 'ALERT! Clean up from Insert Person stored procedure failed! Make sure to delete user with Id: ' + CAST(@newPersonId AS VARCHAR(7)) AS Result;