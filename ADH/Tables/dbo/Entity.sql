CREATE TABLE [dbo].[Entity](
	[Id] [uniqueidentifier] NOT NULL,
	[SourceKey] [int] NULL,
	[DeactivatedDate] [datetime] NULL,
	[IsLogicallyDeleted] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[IsActive] [bit] NULL,
	[DeletedTimestamp] [datetime] NULL,
	[TxCount] [int] NULL,
	[Category] [varchar](255) NULL,
	[SecurityLevel] [int] NULL
) ON [PRIMARY]
GO
