-- Create the table for CountriesOfCitizenship
CREATE TABLE sif.StudentPersonal_CountriesOfCitizenship (
    StudentPersonalRefId UNIQUEIDENTIFIER NOT NULL,
    CountryOfCitizenship NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_StudentPersonal_CountriesOfCitizenship PRIMARY KEY (StudentPersonalRefId, CountryOfCitizenship),
    CONSTRAINT FK_StudentPersonal_CountriesOfCitizenship_StudentPersonal FOREIGN KEY (StudentPersonalRefId) REFERENCES sif.StudentPersonal(RefId)
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'List of countries where the student holds citizenship.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_CountriesOfCitizenship';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to StudentPersonal.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_CountriesOfCitizenship', 
    @level2type=N'COLUMN', @level2name=N'StudentPersonalRefId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'A country where the student holds citizenship (CountryType).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_CountriesOfCitizenship', 
    @level2type=N'COLUMN', @level2name=N'CountryOfCitizenship';
GO