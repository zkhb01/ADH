CREATE TABLE [lctn].[Location](
	[Id] [uniqueidentifier] NOT NULL,
	[Code] [varchar](255) NOT NULL,
	[Name] [varchar](255) NOT NULL
) ON [PRIMARY]
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Physical location of a school, office, or maintenance building', @level0type = N'SCHEMA', @level0name = 'lctn', @level1type = N'TABLE',  @level1name = 'Location';
GO