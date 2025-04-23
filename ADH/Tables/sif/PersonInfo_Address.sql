-- Create the table for Address
CREATE TABLE sif.PersonInfo_Address (
    [Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
    PersonInfoId UNIQUEIDENTIFIER NOT NULL,
    AddressId UNIQUEIDENTIFIER NOT NULL,
    AddressTypeCodeItemId UNIQUEIDENTIFIER NOT NULL, [PriorityOrder] INT NULL,  -- e.g., 'Mailing', 'Physical'
    CONSTRAINT BK_PersonInfo_Address UNIQUE (PersonInfoId, AddressId, AddressTypeCodeItemId),
	CONSTRAINT FK_PersonInfo_Address_Entity FOREIGN KEY (Id) REFERENCES dbo.Entity(Id),
    CONSTRAINT FK_PersonInfo_Address_PersonInfo FOREIGN KEY (PersonInfoId) REFERENCES sif.PersonInfo([Id]),
    CONSTRAINT FK_PersonInfo_Address_AddressType FOREIGN KEY (AddressTypeCodeItemId) REFERENCES sif.CodeItem([Id]),
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The person''s address(es). KHB - need to look at how PS Feature for "Same address as Parent" works', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_Address';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to PersonInfo.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_Address', 
    @level2type=N'COLUMN', @level2name=N'PersonInfoId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The Id of the Address. ', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_Address', 
    @level2type=N'COLUMN', @level2name=N'AddressId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The type of the address (e.g., ''Mailing'', ''Physical'').', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_Address', 
    @level2type=N'COLUMN', @level2name=N'AddressTypeCodeItemId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Comes from PowerSchool and indicated priority order over any of the other addresses provided.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_Address', 
    @level2type=N'COLUMN', @level2name=N'PriorityOrder';
GO