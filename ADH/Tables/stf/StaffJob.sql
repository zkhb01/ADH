CREATE TABLE [stf].[StaffJob](
	[Id] [uniqueidentifier] NOT NULL,
	[StaffId] [uniqueidentifier] NOT NULL,
	[ManagerId] [uniqueidentifier] NULL,
	[JobId] [uniqueidentifier] NULL,
	[LocationId] [uniqueidentifier] NULL,
	[AssignmentTypeId] [uniqueidentifier] NULL,
	[StartDate] [datetime] NOT NULL
) ON [PRIMARY]
GO

