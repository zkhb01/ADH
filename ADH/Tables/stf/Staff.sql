CREATE TABLE [stf].[Staff](
	[Id] [uniqueidentifier] NOT NULL,
	[EmployeeId] [varchar](15) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[HrStatus] [varchar](255) NULL,
	[FirstName] [varchar](255) NOT NULL,
	[LastName] [varchar](255) NOT NULL,
	[MiddleName] [varchar](255) NULL,
	[AssignmentTypeId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO

