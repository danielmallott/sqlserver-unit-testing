CREATE OR ALTER PROCEDURE [StackOverflow.SchemaValidationTests].[Test Posts Table Schema]
AS
BEGIN
    -- Arrange
    CREATE TABLE dbo.Posts_Test (
        Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
        AcceptedAnswerId INT NULL,
        AnswerCount INT NULL,
        Body NVARCHAR(MAX) NOT NULL,
        ClosedDate DATETIME NULL,
        CommentCount INT NULL,
        CommunityOwnedDate DATETIME NULL,
        CreationDate DATETIME NOT NULL,
        FavoriteCount INT NULL,
        LastActivityDate DATETIME NOT NULL,
        LastEditDate DATETIME NULL,
        LastEditorDisplayName NVARCHAR(40) NULL,
        LastEditorUserId INT NULL,
        OwnerUserId INT NULL,
        ParentId INT NULL,
        PostTypeId INT NOT NULL,
        Score INT NOT NULL,
        Tags NVARCHAR(150) NULL,
        Title NVARCHAR(250) NULL,
        ViewCount INT NOT NULL
    );

    -- Assert
    EXEC tSQLt.AssertEqualsTableSchema @Expected = 'dbo.Posts_Test', @Actual = 'dbo.Posts', @Message = 'dbo.Posts schema does not match expected';

    DROP TABLE dbo.Posts_Test;
END;
