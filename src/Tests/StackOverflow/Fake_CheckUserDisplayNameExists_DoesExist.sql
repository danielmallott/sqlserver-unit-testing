USE StackOverflow;
GO

CREATE OR ALTER FUNCTION SampleTests.Fake_CheckUserDisplayNameExists_DoesExist (@userDisplayName NVARCHAR(40))
RETURNS BIT
AS
BEGIN
    RETURN 1;
END;