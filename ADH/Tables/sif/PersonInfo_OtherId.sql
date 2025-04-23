-- Create the table for OtherId
CREATE TABLE sif.PersonInfo_OtherId (
    [Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
    PersonInfoId UNIQUEIDENTIFIER NOT NULL,
    OtherIdCodeItemId UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [BK_PersonInfo_OtherId] UNIQUE (PersonInfoId, OtherIdCodeItemId),
	CONSTRAINT [FK_PersonInfo_OtherId_Entity] FOREIGN KEY (Id) REFERENCES dbo.Entity(Id),
    CONSTRAINT [FK_PersonInfo_OtherId_PersonInfo] FOREIGN KEY (PersonInfoId) REFERENCES sif.PersonInfo([Id]),
    CONSTRAINT [FK_PersonInfo_OtherId_OtherIdCodeItem] FOREIGN KEY (OtherIdCodeItemId) REFERENCES sif.CodeItem([Id]),
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Lists all "other" identifiers associated with the person.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_OtherId';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to PersonInfo.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_OtherId', 
    @level2type=N'COLUMN', @level2name=N'PersonInfoId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The identifier value from another type of identifier (e.g., ''SSN'', ''Passport'').', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_OtherId', 
    @level2type=N'COLUMN', @level2name=N'OtherIdCodeItemId';
GO