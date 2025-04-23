-- Create the table for CountriesOfResidency (from Demographics)
CREATE TABLE sif.PersonInfo_CountriesOfResidency (
    PersonInfoRefId UNIQUEIDENTIFIER NOT NULL,
    CountryOfResidency NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_PersonInfo_CountriesOfResidency PRIMARY KEY (PersonInfoRefId, CountryOfResidency),
    CONSTRAINT FK_PersonInfo_CountriesOfResidency_PersonInfo FOREIGN KEY (PersonInfoRefId) REFERENCES sif.PersonInfo(RefId)
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'List of countries where the person resides.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_CountriesOfResidency';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to PersonInfo.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_CountriesOfResidency', 
    @level2type=N'COLUMN', @level2name=N'PersonInfoRefId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'A country where the person resides (CountryType).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_CountriesOfResidency', 
    @level2type=N'COLUMN', @level2name=N'CountryOfResidency';
GO