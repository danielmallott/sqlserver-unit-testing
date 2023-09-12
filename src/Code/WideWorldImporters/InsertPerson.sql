USE WideWorldImporters;
GO

CREATE OR ALTER PROCEDURE dbo.InsertPerson
    @fullName NVARCHAR(50),
    @preferredName NVARCHAR(50),
    @isEmployee BIT,
    @lastEditedBy INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Perform basic validation on required field
    IF (@fullName IS NULL)
        THROW 50001, '@fullName must not be null', 1;

    DECLARE @InsertedId TABLE (InsertedID INT);
    
    -- Insert new row, capturing the new identity
    INSERT INTO Application.People
    (FullName, PreferredName, IsPermittedToLogon, IsExternalLogonProvider, IsSystemUser, IsEmployee, IsSalesperson, LastEditedBy)
    OUTPUT inserted.PersonID INTO @InsertedId
    VALUES
    (@fullName, @preferredName, 1, 0, 0, @isEmployee, 0, @lastEditedBy);

    DECLARE @result INT = (SELECT TOP (1) InsertedID FROM @InsertedId);
    RETURN @result;
END;
GO
