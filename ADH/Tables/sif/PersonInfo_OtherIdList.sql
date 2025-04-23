-- Create the table for OtherIdList
CREATE TABLE sif.PersonInfo_OtherIdList (
    PersonInfoRefId UNIQUEIDENTIFIER NOT NULL,
    OtherId NVARCHAR(50) NOT NULL,
    OtherIdType NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_PersonInfo_OtherIdList PRIMARY KEY (PersonInfoRefId, OtherId, OtherIdType),
    CONSTRAINT FK_PersonInfo_OtherIdList_PersonInfo FOREIGN KEY (PersonInfoRefId) REFERENCES sif.PersonInfo(RefId)
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Lists all "other" identifiers associated with the person.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_OtherIdList';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to PersonInfo.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_OtherIdList', 
    @level2type=N'COLUMN', @level2name=N'PersonInfoRefId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The identifier value.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_OtherIdList', 
    @level2type=N'COLUMN', @level2name=N'OtherId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The type of the identifier (e.g., ''SSN'', ''Passport'').', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_OtherIdList', 
    @level2type=N'COLUMN', @level2name=N'OtherIdType';
GO