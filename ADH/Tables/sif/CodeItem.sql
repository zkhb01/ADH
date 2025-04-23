CREATE TABLE [sif].[CodeItem](
	[Id] [uniqueidentifier] NOT NULL,
	[Number] [int] NOT NULL,
	[ParentCodeItemId] [uniqueidentifier] NULL,
	[ParentNumber] [int] NULL,
	[CodeSetId] [uniqueidentifier] NULL,
	[CodeSetName] [varchar](255) NULL,
	[Code] [varchar](255) NULL,
	[Description] [varchar](255) NULL,
	[DisplayValue] [varchar](255) NULL,
	[IsVisible] [bit] NULL,
	[IsModifiable] [bit] NULL,
	[IsDeletable] [bit] NULL,
    [UiDisplayOrder] [int] NULL,
	[CodeOrigin] [varchar](255) NULL,
	--[WhoCreated] [varchar](255) NOT NULL,
	--[WhenCreated] [datetime2](7) NOT NULL,
	--[WhoModified] [varchar](255) NOT NULL,
	--[WhenModified] [datetime2](7) NOT NULL,
	[ExcludeFromStateReporting] [bit] NOT NULL,
    CONSTRAINT [PK_CodeItem] PRIMARY KEY (Id),
	CONSTRAINT [FK_CodeItem_Entity] FOREIGN KEY (Id) REFERENCES dbo.Entity(Id),
	CONSTRAINT [FK_CodeItem_CodeSet] FOREIGN KEY (CodeSetId) REFERENCES sif.CodeSet(Id),
	CONSTRAINT [FK_CodeItem_ParentCodeItem] FOREIGN KEY (ParentCodeItemId) REFERENCES sif.CodeItem(Id),
	)
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'An individual entry or element within a SIF Association CodeSet.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'CodeItem';
GO

-- Add column descriptions
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the code item', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'CodeItem', 
    @level2type = N'COLUMN', @level2name = N'Id'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the PS CodeSetId. Not requred', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'CodeItem', 
    @level2type = N'COLUMN', @level2name = N'Number'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Foreign key to the parent CodeItem', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'CodeItem', 
    @level2type = N'COLUMN',@level2name = N'ParentCodeItemId'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Unique identifier for the PS Parent CodeSetId', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'CodeItem', 
    @level2type = N'COLUMN', @level2name = N'ParentNumber'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Foreign key to the CodeSet this CodeItem is associated with', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'CodeItem', 
    @level2type = N'COLUMN', @level2name = N'CodeSetId'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Name of the CodeSet this CodeItem is associated with. Not required', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'CodeItem', 
    @level2type = N'COLUMN', @level2name = N'CodeSetName'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Official abbreviation for the given value', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'CodeItem', 
    @level2type = N'COLUMN', @level2name = N'Code'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Human readable explanation of what the code represents', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'CodeItem', 
    @level2type = N'COLUMN', @level2name = N'Description'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Carry over from PowerSchool - ', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'CodeItem', 
    @level2type = N'COLUMN', @level2name = N'DisplayValue'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Carry over from PowerSchool - ', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'CodeItem', 
    @level2type = N'COLUMN', @level2name = N'IsVisible'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Carry over from PowerSchool - ', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'CodeItem', 
    @level2type = N'COLUMN', @level2name = N'IsModifiable'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Carry over from PowerSchool - ', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'CodeItem', 
    @level2type = N'COLUMN', @level2name = N'IsDeletable'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Carry over from PowerSchool - ', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'CodeItem', 
    @level2type = N'COLUMN', @level2name = N'UiDisplayOrder'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Carry over from PowerSchool - ', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'CodeItem', 
    @level2type = N'COLUMN', @level2name = N'CodeOrigin'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Carry over from PowerSchool - ', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'CodeItem', 
    @level2type = N'COLUMN', @level2name = N'ExcludeFromStateReporting'
GO