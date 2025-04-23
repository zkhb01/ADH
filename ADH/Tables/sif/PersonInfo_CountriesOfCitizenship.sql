-- Create the table for CountriesOfCitizenship (from Demographics)
CREATE TABLE sif.PersonInfo_CountriesOfCitizenship (
    PersonInfoRefId UNIQUEIDENTIFIER NOT NULL,
    CountryOfCitizenship NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_PersonInfo_CountriesOfCitizenship PRIMARY KEY (PersonInfoRefId, CountryOfCitizenship),
    CONSTRAINT FK_PersonInfo_CountriesOfCitizenship_PersonInfo FOREIGN KEY (PersonInfoRefId) REFERENCES sif.PersonInfo(RefId)
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'List of countries where the person holds citizenship.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_CountriesOfCitizenship';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to PersonInfo.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_CountriesOfCitizenship', 
    @level2type=N'COLUMN', @level2name=N'PersonInfoRefId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'A country where the person holds citizenship (CountryType).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_CountriesOfCitizenship', 
    @level2type=N'COLUMN', @level2name=N'CountryOfCitizenship';
GO