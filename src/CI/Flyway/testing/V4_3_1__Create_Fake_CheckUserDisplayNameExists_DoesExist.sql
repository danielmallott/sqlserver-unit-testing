CREATE OR ALTER FUNCTION [StackOverflow.InsertUserTests].Fake_CheckUserDisplayNameExists_DoesExist (@userDisplayName NVARCHAR(40))
RETURNS BIT
AS
BEGIN
    RETURN 1;
END;
