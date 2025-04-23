-- Create the table for EnglishProficiency OtherCodeList
CREATE TABLE sif.PersonInfo_EnglishProficiency_OtherCodeList (
    PersonInfoRefId UNIQUEIDENTIFIER NOT NULL,
    OtherCode NVARCHAR(50) NOT NULL,
    Codeset NVARCHAR(255) NULL,                                 -- The codeset identifier (e.g., URL) for this other code.
    CONSTRAINT PK_PersonInfo_EnglishProficiency_OtherCodeList PRIMARY KEY (PersonInfoRefId, OtherCode),
    CONSTRAINT FK_PersonInfo_EnglishProficiency_OtherCodeList_PersonInfo FOREIGN KEY (PersonInfoRefId) REFERENCES sif.PersonInfo(RefId)
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'List of other codes describing the person''s English proficiency.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_EnglishProficiency_OtherCodeList';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to PersonInfo.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_EnglishProficiency_OtherCodeList', 
    @level2type=N'COLUMN', @level2name=N'PersonInfoRefId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'An additional code describing the person''s English proficiency.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_EnglishProficiency_OtherCodeList', 
    @level2type=N'COLUMN', @level2name=N'OtherCode';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'A unique indicator (usually a URL) that points to the codeset used for this other code.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_EnglishProficiency_OtherCodeList', 
    @level2type=N'COLUMN', @level2name=N'Codeset';
GO