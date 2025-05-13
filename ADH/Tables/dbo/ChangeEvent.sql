CREATE TABLE [dbo].[ChangeEvent](
	[Id] [uniqueidentifier] NOT NULL,
	[EntityId] [uniqueidentifier] NOT NULL,
	[EntityName] [varchar](255) NOT NULL,
	[EventType] [varchar](255) NOT NULL,
	[SerializedEntityBefore] [varchar](8000) NULL,
	[SerializedEntityAfter] [varchar](8000) NULL,
	[TimeStamp] [datetime] NOT NULL,
	[Action] [varchar](8) NULL,
 CONSTRAINT [PK_ChangeEvent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ChangeEvent] ADD  CONSTRAINT [DF_ChangeEvent_TimeStamp]  DEFAULT (getdate()) FOR [TimeStamp]
GO

ALTER TABLE [dbo].[ChangeEvent] ADD  CONSTRAINT [DF_ChangeEvent_Action]  DEFAULT ('Confirm') FOR [Action]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Action to be taken to apply the change: Confirm = Check if SerializedEntityBefore is same as entity just prior to applying change, if not abort. Force = no checking, just apply change.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChangeEvent', @level2type=N'COLUMN',@level2name=N'Action'
GO

