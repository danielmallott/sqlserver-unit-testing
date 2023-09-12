USE WideWorldImporters;
GO

-- Test that our Stored Procedure returns the proper error message
-- when NULL @fullName parameter is passed
BEGIN TRY
    -- Act
    EXEC dbo.InsertPerson NULL, NULL, NULL, NULL;
END TRY
BEGIN CATCH
    DECLARE @errorMessage VARCHAR(100);
    SET @errorMessage = ERROR_MESSAGE();

    -- Assert
    IF @errorMessage <> '@fullName must not be null'
        THROW 55000, 'Error Message not produced for NULL @fullName', 1;
    SELECT 'NULL @fullName Parameter Test Passed' AS Result;
END CATCH;
GO