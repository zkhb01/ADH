-- Create the table for Language (from Demographics)
CREATE TABLE sif.PersonInfo_Language (
    [Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
    PersonInfoId UNIQUEIDENTIFIER NOT NULL,
    LanguageCodeItemId UNIQUEIDENTIFIER NULL,
    CONSTRAINT [BK_PersonInfo_Language] UNIQUE (PersonInfoId, LanguageCodeItemId),
	CONSTRAINT [FK_PersonInfo_Language_Entity] FOREIGN KEY (Id) REFERENCES dbo.Entity(Id),
    CONSTRAINT [FK_PersonInfo_Language_PersonInfo] FOREIGN KEY (PersonInfoId) REFERENCES sif.PersonInfo([Id]),
    CONSTRAINT [FK_PersonInfo_Language_LanguageCodeItem] FOREIGN KEY (LanguageCodeItemId) REFERENCES sif.CodeItem(Id),
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'List of languages the person uses to communicate.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_Language';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to PersonInfo.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_Language', 
    @level2type=N'COLUMN', @level2name=N'PersonInfoId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'A language the person uses to communicate.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_Language', 
    @level2type=N'COLUMN', @level2name=N'LanguageCodeItemId';
GO