-- Create the table for LanguageList (from Demographics)
CREATE TABLE sif.PersonInfo_LanguageList (
    PersonInfoRefId UNIQUEIDENTIFIER NOT NULL,
    Language NVARCHAR(50) NOT NULL,
    LanguageCodesetId UNIQUEIDENTIFIER NULL,
    CONSTRAINT PK_PersonInfo_LanguageList PRIMARY KEY (PersonInfoRefId, Language),
    CONSTRAINT FK_PersonInfo_LanguageList_PersonInfo FOREIGN KEY (PersonInfoRefId) REFERENCES sif.PersonInfo(RefId),
    CONSTRAINT FK_PersonInfo_LanguageList_CodeSet FOREIGN KEY (LanguageCodesetId) REFERENCES sif.CodeSet(Id)
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'List of languages the person uses to communicate.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_LanguageList';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to PersonInfo.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_LanguageList', 
    @level2type=N'COLUMN', @level2name=N'PersonInfoRefId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'A language the person uses to communicate.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_LanguageList', 
    @level2type=N'COLUMN', @level2name=N'Language';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'A unique indicator (usually a URL) that points to the codeset used for Language, referencing dbo.CodeSet.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_LanguageList', 
    @level2type=N'COLUMN', @level2name=N'LanguageCodesetId';
GO