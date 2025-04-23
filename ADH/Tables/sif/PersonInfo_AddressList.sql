-- Create the table for AddressList
CREATE TABLE sif.PersonInfo_AddressList (
    PersonInfoRefId UNIQUEIDENTIFIER NOT NULL,
    AddressLine1 NVARCHAR(100) NOT NULL,
    City NVARCHAR(50) NOT NULL,
    PostalCode NVARCHAR(20) NOT NULL,
    AddressType NVARCHAR(50) NOT NULL,                          -- e.g., 'Mailing', 'Physical'
    CONSTRAINT PK_PersonInfo_AddressList PRIMARY KEY (PersonInfoRefId, AddressLine1, AddressType),
    CONSTRAINT FK_PersonInfo_AddressList_PersonInfo FOREIGN KEY (PersonInfoRefId) REFERENCES sif.PersonInfo(RefId)
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The person''s address(es).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_AddressList';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to PersonInfo.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_AddressList', 
    @level2type=N'COLUMN', @level2name=N'PersonInfoRefId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The street address.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_AddressList', 
    @level2type=N'COLUMN', @level2name=N'AddressLine1';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The city of the address.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_AddressList', 
    @level2type=N'COLUMN', @level2name=N'City';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The postal code of the address.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_AddressList', 
    @level2type=N'COLUMN', @level2name=N'PostalCode';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The type of the address (e.g., ''Mailing'', ''Physical'').', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_AddressList', 
    @level2type=N'COLUMN', @level2name=N'AddressType';
GO