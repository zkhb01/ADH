CREATE TABLE [sif].[CodeSet]
(
	[Id] UNIQUEIDENTIFIER NOT NULL, 
    [Name] VARCHAR(255) NOT NULL,
    [Url] VARCHAR(255) NULL, 
    CONSTRAINT [PK_CodeSet] PRIMARY KEY (Id),
	CONSTRAINT [BK_CodeSet] UNIQUE ([Name]),
	CONSTRAINT [FK_CodeSet_Entity] FOREIGN KEY (Id) REFERENCES dbo.Entity(Id),
)
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'A standardized, predefined collection of codes (values) established and maintained by the SIF Association.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'CodeSet';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
	@name=N'MS_Description',
	@value=N'URL to an external code set whose values are not (yet) present in the system.',
	@level0type=N'SCHEMA', @level0name=N'sif', 
	@level1type=N'TABLE', @level1name=N'CodeSet',
	@level2type=N'COLUMN', @level2name=N'Url'
GO

EXEC sys.sp_addextendedproperty 
	@name=N'MS_Description',
	@value=N'Name of the CodeSet, ie: Country, Relationship',
	@level0type=N'SCHEMA', @level0name=N'sif',
	@level1type=N'TABLE', @level1name=N'CodeSet',
	@level2type=N'COLUMN', @level2name=N'Name'
GO