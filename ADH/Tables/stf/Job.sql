CREATE TABLE [stf].[Job](
	[Id] [uniqueidentifier] NOT NULL,
	[Code] [varchar](255) NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[JobCategoryId] [uniqueidentifier] NOT NULL,
	[JobTypeId] [uniqueidentifier] NOT NULL,
	[SupervisorJobId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO

