-- Create the table for PhoneNumberList
CREATE TABLE sif.PersonInfo_PhoneNumberList (
    PersonInfoRefId UNIQUEIDENTIFIER NOT NULL,
    PhoneNumber NVARCHAR(20) NOT NULL,
    PhoneNumberType NVARCHAR(50) NOT NULL,                      -- e.g., 'Home', 'Mobile'
    CONSTRAINT PK_PersonInfo_PhoneNumberList PRIMARY KEY (PersonInfoRefId, PhoneNumber, PhoneNumberType),
    CONSTRAINT FK_PersonInfo_PhoneNumberList_PersonInfo FOREIGN KEY (PersonInfoRefId) REFERENCES sif.PersonInfo(RefId)
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The person''s phone number(s).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_PhoneNumberList';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to PersonInfo.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_PhoneNumberList', 
    @level2type=N'COLUMN', @level2name=N'PersonInfoRefId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The phone number.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_PhoneNumberList', 
    @level2type=N'COLUMN', @level2name=N'PhoneNumber';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The type of the phone number (e.g., ''Home'', ''Mobile'').', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_PhoneNumberList', 
    @level2type=N'COLUMN', @level2name=N'PhoneNumberType';
GO