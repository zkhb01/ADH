-- Create the table for LanguageList
CREATE TABLE sif.StudentPersonal_LanguageList (
    StudentPersonalRefId UNIQUEIDENTIFIER NOT NULL,
    Language NVARCHAR(50) NOT NULL,
    LanguageCodesetId UNIQUEIDENTIFIER NULL,                    -- References the codeset used for Language, links to dbo.CodeSet.
    CONSTRAINT PK_StudentPersonal_LanguageList PRIMARY KEY (StudentPersonalRefId, Language),
    CONSTRAINT FK_StudentPersonal_LanguageList_StudentPersonal FOREIGN KEY (StudentPersonalRefId) REFERENCES sif.StudentPersonal(RefId),
    CONSTRAINT FK_StudentPersonal_LanguageList_CodeSet FOREIGN KEY (LanguageCodesetId) REFERENCES sif.CodeSet(Id)
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'List of languages the student uses to communicate.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_LanguageList';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to StudentPersonal.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_LanguageList', 
    @level2type=N'COLUMN', @level2name=N'StudentPersonalRefId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'A language the student uses to communicate.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_LanguageList', 
    @level2type=N'COLUMN', @level2name=N'Language';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'A unique indicator (usually a URL) that points to the codeset used for Language, referencing dbo.CodeSet.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_LanguageList', 
    @level2type=N'COLUMN', @level2name=N'LanguageCodesetId';
GO