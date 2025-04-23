-- Create the table for CountriesOfResidency
CREATE TABLE sif.StudentPersonal_CountriesOfResidency (
    StudentPersonalRefId UNIQUEIDENTIFIER NOT NULL,
    CountryOfResidency NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_StudentPersonal_CountriesOfResidency PRIMARY KEY (StudentPersonalRefId, CountryOfResidency),
    CONSTRAINT FK_StudentPersonal_CountriesOfResidency_StudentPersonal FOREIGN KEY (StudentPersonalRefId) REFERENCES sif.StudentPersonal(RefId)
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'List of countries where the student resides.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_CountriesOfResidency';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to StudentPersonal.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_CountriesOfResidency', 
    @level2type=N'COLUMN', @level2name=N'StudentPersonalRefId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'A country where the student resides (CountryType).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_CountriesOfResidency', 
    @level2type=N'COLUMN', @level2name=N'CountryOfResidency';
GO