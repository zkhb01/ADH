-- Create the table for OtherNames
CREATE TABLE sif.PersonInfo_OtherNames (
    PersonInfoRefId UNIQUEIDENTIFIER NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    NameType NVARCHAR(50) NOT NULL,                             -- e.g., 'Previous', 'Alias'
    CONSTRAINT PK_PersonInfo_OtherNames PRIMARY KEY (PersonInfoRefId, FirstName, LastName, NameType),
    CONSTRAINT FK_PersonInfo_OtherNames_PersonInfo FOREIGN KEY (PersonInfoRefId) REFERENCES sif.PersonInfo(RefId)
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Previous, alternate or other names or aliases associated with the person.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_OtherNames';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to PersonInfo.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_OtherNames', 
    @level2type=N'COLUMN', @level2name=N'PersonInfoRefId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The first name of the alternate name.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_OtherNames', 
    @level2type=N'COLUMN', @level2name=N'FirstName';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The last name of the alternate name.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_OtherNames', 
    @level2type=N'COLUMN', @level2name=N'LastName';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The type of the name (e.g., ''Previous'', ''Alias'').', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_OtherNames', 
    @level2type=N'COLUMN', @level2name=N'NameType';
GO