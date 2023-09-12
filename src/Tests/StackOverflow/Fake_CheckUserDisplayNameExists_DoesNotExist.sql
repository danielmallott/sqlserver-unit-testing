USE StackOverflow;
GO

CREATE OR ALTER FUNCTION SampleTests.Fake_CheckUserDisplayNameExists_DoesNotExist (@displayName NVARCHAR(40))
RETURNS BIT
AS
BEGIN
    RETURN 0;
END;