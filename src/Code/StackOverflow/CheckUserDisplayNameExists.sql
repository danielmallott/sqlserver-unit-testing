USE StackOverflow;
GO

CREATE OR ALTER FUNCTION dbo.CheckUserDisplayNameExists(@userDisplayName NVARCHAR(40))
RETURNS BIT
AS
BEGIN
    DECLARE @result BIT;
    IF EXISTS (SELECT 1 FROM dbo.Users WHERE DisplayName = @userDisplayName)
    BEGIN
        SET @result = 1;
    END;
    ELSE
    BEGIN
        SET @result = 0;
    END;
    RETURN (@result);
END;
GO