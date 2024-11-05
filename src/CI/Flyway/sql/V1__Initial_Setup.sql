CREATE TABLE dbo.Badges(
	Id int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Badges__Id PRIMARY KEY CLUSTERED,
	Name nvarchar(40) NOT NULL,
	UserId int NOT NULL,
	Date datetime NOT NULL
);

CREATE TABLE dbo.Comments(
	Id int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Comments__Id PRIMARY KEY CLUSTERED,
	CreationDate datetime NOT NULL,
	PostId int NOT NULL,
	Score int NULL,
	Text nvarchar(700) NOT NULL,
	UserId int NULL
);

CREATE TABLE dbo.LinkTypes(
	Id int IDENTITY(1,1) NOT NULL CONSTRAINT PK_LinkTypes__Id PRIMARY KEY CLUSTERED,
	[Type] varchar(50) NOT NULL
);

CREATE TABLE dbo.PostLinks(
	Id int IDENTITY(1,1) NOT NULL CONSTRAINT PK_PostLinks__Id PRIMARY KEY CLUSTERED,
	CreationDate datetime NOT NULL,
	PostId int NOT NULL,
	RelatedPostId int NOT NULL,
	LinkTypeId int NOT NULL
);

CREATE TABLE dbo.Posts(
	Id int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Posts__Id PRIMARY KEY CLUSTERED,
	AcceptedAnswerId int NULL,
	AnswerCount int NULL,
	Body nvarchar(max) NOT NULL,
	ClosedDate datetime NULL,
	CommentCount int NULL,
	CommunityOwnedDate datetime NULL,
	CreationDate datetime NOT NULL,
	FavoriteCount int NULL,
	LastActivityDate datetime NOT NULL,
	LastEditDate datetime NULL,
	LastEditorDisplayName nvarchar(40) NULL,
	LastEditorUserId int NULL,
	OwnerUserId int NULL,
	ParentId int NULL,
	PostTypeId int NOT NULL,
	Score int NOT NULL,
	Tags nvarchar(150) NULL,
	Title nvarchar(250) NULL,
	ViewCount int NOT NULL
);

CREATE TABLE dbo.PostTypes(
	Id int IDENTITY(1,1) NOT NULL CONSTRAINT PK_PostTypes__Id PRIMARY KEY CLUSTERED,
	[Type] nvarchar(50) NOT NULL
);

CREATE TABLE dbo.Users(
	Id int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Users_Id PRIMARY KEY CLUSTERED,
	AboutMe nvarchar(max) NULL,
	Age int NULL,
	CreationDate datetime NOT NULL,
	DisplayName nvarchar(40) NOT NULL,
	DownVotes int NOT NULL,
	EmailHash nvarchar(40) NULL,
	LastAccessDate datetime NOT NULL,
	Location nvarchar(100) NULL,
	Reputation int NOT NULL,
	UpVotes int NOT NULL,
	Views int NOT NULL,
	WebsiteUrl nvarchar(200) NULL,
	AccountId int NULL
);

CREATE TABLE dbo.Votes(
	Id int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Votes__Id PRIMARY KEY CLUSTERED,
	PostId int NOT NULL,
	UserId int NULL,
	BountyAmount int NULL,
	VoteTypeId int NOT NULL,
	CreationDate datetime NOT NULL
);

CREATE TABLE dbo.VoteTypes(
	Id int IDENTITY(1,1) NOT NULL CONSTRAINT PK_VoteType__Id PRIMARY KEY CLUSTERED,
	[Name] varchar(50) NOT NULL
);
