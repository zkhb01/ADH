-- Create the table for Race (from Demographics)
CREATE TABLE sif.PersonInfo_Race (
    [Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
    PersonInfoId UNIQUEIDENTIFIER NOT NULL,
    RaceCodeItemId UNIQUEIDENTIFIER NULL,
    CONSTRAINT [BK_PersonInfo_Race] UNIQUE (PersonInfoId, RaceCodeItemId),
	CONSTRAINT [FK_PersonInfo_Race_Entity] FOREIGN KEY (Id) REFERENCES dbo.Entity(Id),
    CONSTRAINT [FK_PersonInfo_Race_PersonInfo] FOREIGN KEY (PersonInfoId) REFERENCES sif.PersonInfo([Id]),
    CONSTRAINT [FK_PersonInfo_Race_RaceCodeItem] FOREIGN KEY (RaceCodeItemId) REFERENCES sif.CodeItem(Id),
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'List of races associated with the person.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_Race';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to PersonInfo.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_Race', 
    @level2type=N'COLUMN', @level2name=N'PersonInfoId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The race of the person (e.g., ''White'', ''Black'').', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_Race', 
    @level2type=N'COLUMN', @level2name=N'RaceCodeItemId';
GO