-- Create the table for EmailList
CREATE TABLE sif.PersonInfo_EmailList (
    PersonInfoRefId UNIQUEIDENTIFIER NOT NULL,
    Email NVARCHAR(255) NOT NULL,
    EmailType NVARCHAR(50) NOT NULL,                            -- e.g., 'Primary', 'Alternate'
    CONSTRAINT PK_PersonInfo_EmailList PRIMARY KEY (PersonInfoRefId, Email, EmailType),
    CONSTRAINT FK_PersonInfo_EmailList_PersonInfo FOREIGN KEY (PersonInfoRefId) REFERENCES sif.PersonInfo(RefId)
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The person''s e-mail address(es).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_EmailList';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to PersonInfo.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_EmailList', 
    @level2type=N'COLUMN', @level2name=N'PersonInfoRefId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The email address.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_EmailList', 
    @level2type=N'COLUMN', @level2name=N'Email';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The type of the email address (e.g., ''Primary'', ''Alternate'').', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_EmailList', 
    @level2type=N'COLUMN', @level2name=N'EmailType';
GO