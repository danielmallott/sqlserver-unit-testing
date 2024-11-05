SET IDENTITY_INSERT dbo.LinkTypes ON;

WITH linkTypes AS (
    SELECT 1 AS Id, 'Linked' AS [Type]
    UNION ALL
    SELECT 3, 'Duplicate'
)
MERGE INTO dbo.LinkTypes AS target
USING linkTypes AS source
ON target.Id = source.Id
WHEN NOT MATCHED BY target THEN
    INSERT ([Id], [Type])
    VALUES (source.Id, source.[Type])
WHEN NOT MATCHED BY source THEN
    DELETE;

SET IDENTITY_INSERT dbo.LinkTypes OFF;
SET IDENTITY_INSERT dbo.PostTypes ON;

WITH postTypes AS (
    SELECT 1 AS Id, 'Question' AS [Type] UNION ALL
    SELECT 2 AS Id, 'Answer' AS [Type] UNION ALL
    SELECT 3 AS Id, 'Wiki' AS [Type] UNION ALL
    SELECT 4 AS Id, 'TagWikiExerpt' AS [Type] UNION ALL
    SELECT 5 AS Id, 'TagWiki' AS [Type] UNION ALL
    SELECT 6 AS Id, 'ModeratorNomination' AS [Type] UNION ALL
    SELECT 7 AS Id, 'WikiPlaceholder' AS [Type] UNION ALL
    SELECT 8 AS Id, 'PrivilegeWiki' AS [Type]
)
MERGE INTO dbo.PostTypes AS target
USING postTypes AS source
ON target.Id = source.Id
WHEN NOT MATCHED BY target THEN
    INSERT ([Id], [Type])
    VALUES (source.Id, source.[Type])
WHEN NOT MATCHED BY source THEN
    DELETE;

SET IDENTITY_INSERT dbo.PostTypes OFF;
SET IDENTITY_INSERT dbo.VoteTypes ON;

WITH voteTypes AS (
    SELECT 1 AS Id, 'AcceptedByOriginator' AS [Name] UNION ALL
    SELECT 2 AS Id, 'UpMod' AS [Name] UNION ALL
    SELECT 3 AS Id, 'DownMod' AS [Name] UNION ALL
    SELECT 4 AS Id, 'Offensive' AS [Name] UNION ALL
    SELECT 5 AS Id, 'Favorite' AS [Name] UNION ALL
    SELECT 6 AS Id, 'Close' AS [Name] UNION ALL
    SELECT 7 AS Id, 'Reopen' AS [Name] UNION ALL
    SELECT 8 AS Id, 'BountyStart' AS [Name] UNION ALL
    SELECT 9 AS Id, 'BountyClose' AS [Name] UNION ALL
    SELECT 10 AS Id, 'Deletion' AS [Name] UNION ALL
    SELECT 11 AS Id, 'Undeletion' AS [Name] UNION ALL
    SELECT 12 AS Id, 'Spam' AS [Name] UNION ALL
    SELECT 13 AS Id, 'InformModerator' AS [Name] UNION ALL
    SELECT 15 AS Id, 'ModeratorReview' AS [Name] UNION ALL
    SELECT 16 AS Id, 'ApproveEditSuggestion' AS [Name]
)
MERGE INTO dbo.VoteTypes AS target
USING voteTypes AS source
ON target.Id = source.Id
WHEN NOT MATCHED BY target THEN
    INSERT ([Id], [Name])
    VALUES (source.Id, source.[Name])
WHEN NOT MATCHED BY source THEN
    DELETE;

SET IDENTITY_INSERT dbo.VoteTypes OFF;
