CREATE TABLE [sif].[CodeSet]
(
	[Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, 
    [Url] VARCHAR(255) NULL, 
    [Name] VARCHAR(255) NULL
)
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'URL to an external code set whose values are not (yet) present in the system.' , @level0type=N'SCHEMA',@level0name=N'sif', @level1type=N'TABLE',@level1name=N'CodeSet', @level2type=N'COLUMN',@level2name=N'Url'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of the CodeSet, ie: Country, Relationship' , @level0type=N'SCHEMA',@level0name=N'sif', @level1type=N'TABLE',@level1name=N'CodeSet', @level2type=N'COLUMN',@level2name=N'Name'
GO