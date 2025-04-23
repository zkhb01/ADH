-- Create the table for CountriesOfResidency (from Demographics)
CREATE TABLE sif.PersonInfo_CountryOfResidency (
    [Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
    PersonInfoId UNIQUEIDENTIFIER NOT NULL,
    CountryCodeItemId UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [BK_PersonInfo_CountryOfResidency] UNIQUE (PersonInfoId, CountryCodeItemId),
	CONSTRAINT [FK_PersonInfo_CountryOfResidency_Entity] FOREIGN KEY (Id) REFERENCES dbo.Entity(Id),
    CONSTRAINT [FK_PersonInfo_CountryOfResidency_PersonInfo] FOREIGN KEY (PersonInfoId) REFERENCES sif.PersonInfo([Id]),
    CONSTRAINT [FK_PersonInfo_CountryOfResidency_CountryCodeItem] FOREIGN KEY (CountryCodeItemId) REFERENCES sif.CodeItem([Id]),
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'List of countries where the person resides.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_CountryOfResidency';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to PersonInfo.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_CountryOfResidency', 
    @level2type=N'COLUMN', @level2name=N'PersonInfoId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'A country where the person resides (CountryType).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_CountryOfResidency', 
    @level2type=N'COLUMN', @level2name=N'CountryCodeItemId';
GO