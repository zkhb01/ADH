-- Create the table for EnglishProficiency OtherCode
CREATE TABLE sif.PersonInfo_EnglishProficiency_OtherCode (
    [Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
    PersonInfoId UNIQUEIDENTIFIER NOT NULL,
    OtherCodeItemId UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [BK_PersonInfo_EnglishProficiency_OtherCode] UNIQUE (PersonInfoId, OtherCodeItemId),
	CONSTRAINT [FK_PersonInfo_EnglishProficiency_OtherCode_Entity] FOREIGN KEY (Id) REFERENCES dbo.Entity(Id),
    CONSTRAINT [FK_PersonInfo_EnglishProficiency_OtherCode_PersonInfo] FOREIGN KEY (PersonInfoId) REFERENCES sif.PersonInfo([Id]),
    CONSTRAINT [FK_PersonInfo_EnglishProficiency_OtherCode_OtherCodetem] FOREIGN KEY (OtherCodeItemId) REFERENCES sif.CodeItem([Id]),
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'List of other codes describing the person''s English proficiency.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_EnglishProficiency_OtherCode';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to PersonInfo.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_EnglishProficiency_OtherCode', 
    @level2type=N'COLUMN', @level2name=N'PersonInfoId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Other code describing the person''s English proficiency.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_EnglishProficiency_OtherCode', 
    @level2type=N'COLUMN', @level2name=N'OtherCodeItemId';

GO