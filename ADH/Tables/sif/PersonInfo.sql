-- Create the table
CREATE TABLE sif.PersonInfo (
    [Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(), -- The GUID of this person (implied for SIF objects).
    LocalId NVARCHAR(50) NULL,                                  -- The locally-assigned identifier for this person.
    FirstName NVARCHAR(50) NOT NULL,                            -- Part of Name: The person’s first name (mandatory per NameOfRecordType with Type=04).
    LastName NVARCHAR(50) NOT NULL,                             -- Part of Name: The person’s last name (mandatory per NameOfRecordType with Type=04).
    -- DemographicsType fields (flattened)
    BirthDate DATE NULL,
    BirthDateVerificationCodeItemId UNIQUEIDENTIFIER NULL,
    PlaceOfBirth NVARCHAR(100) NULL,
    CountyOfBirth NVARCHAR(100) NULL,
    StateOfBirth NVARCHAR(50) NULL,
    CountryOfBirth NVARCHAR(50) NULL,
    CountryArrivalDate DATE NULL,
    CitizenshipStatusCodeItemId UNIQUEIDENTIFIER NULL,
    GenderCodeItemId UNIQUEIDENTIFIER NULL,
    HispanicLatino BIT NULL,
    HispanicLatinoCodeItemId UNIQUEIDENTIFIER NULL,
    MaritalStatusCodeItemId UNIQUEIDENTIFIER NULL,
    EnglishProficiencyCodeItemId UNIQUEIDENTIFIER NULL,         -- Person's proficiency in English (xs:token from EnglishProficiencyType).
    --CreatedDate DATETIME DEFAULT GETDATE(),
    --LastModifiedDate DATETIME DEFAULT GETDATE(),
    [EXCLUDEFROMSTATEREPORTING] BIT NULL, 
    -- Constraints
    CONSTRAINT CHK_PersonInfo_Name CHECK (FirstName <> '' AND LastName <> ''),
   	CONSTRAINT FK_PersonInfo_Entity FOREIGN KEY (Id) REFERENCES dbo.Entity(Id),
    CONSTRAINT FK_PersonInfo_BirthDateVerificationCodeItem FOREIGN KEY (BirthDateVerificationCodeItemId) REFERENCES sif.CodeItem(Id),
    CONSTRAINT FK_PersonInfo_CitizenshipStatusCodeItem FOREIGN KEY (CitizenshipStatusCodeItemId) REFERENCES sif.CodeItem(Id),
    CONSTRAINT FK_PersonInfo_GenderCodeItem FOREIGN KEY (GenderCodeItemId) REFERENCES sif.CodeItem(Id),
    CONSTRAINT FK_PersonInfo_HispanicLatinoCodeItem FOREIGN KEY (HispanicLatinoCodeItemId) REFERENCES sif.CodeItem(Id),
    CONSTRAINT FK_PersonInfo_MaritalStatusCodeItem FOREIGN KEY (MaritalStatusCodeItemId) REFERENCES sif.CodeItem(Id),
    CONSTRAINT FK_PersonInfo_EnglishProficiencyCodeItem FOREIGN KEY (EnglishProficiencyCodeItemId) REFERENCES sif.CodeItem(Id)
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'A wrapper element for information that describes a generic person. This element may be used as a basic building block for person-type objects.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The GUID of this person.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name='Id';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The locally-assigned identifier for this person. May be used as a unique person identifier rather than a unique contact identifier.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'LocalId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Part of Name: The person''s first name (mandatory per NameOfRecordType with Type=04).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'FirstName';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Part of Name: The person''s last name (mandatory per NameOfRecordType with Type=04).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'LastName';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The person''s date of birth.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'BirthDate';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Means by which the person''s birth date was validated.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'BirthDateVerificationCodeItemId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The person''s place of birth—like village, town, city etc.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'PlaceOfBirth';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The county in which the person was born.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'CountyOfBirth';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The person''s state of birth.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'StateOfBirth';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The person''s country of birth.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'CountryOfBirth';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Date the person first arrived in the country.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'CountryArrivalDate';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The person''s citizenship status.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'CitizenshipStatusCodeItemId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Person''s gender.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'GenderCodeItemId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Indicates if the person identifies as Hispanic/Latino (Yes = 1, No = 0).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'HispanicLatino';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'A unique indicator (usually a URL) that points to the CodeItem used for HispanicLatino, referencing dbo.CodeItem.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'HispanicLatinoCodeItemId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The person''s marital status.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'MaritalStatusCodeItemId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Person''s proficiency in English (CEDS ID: 000180).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'EnglishProficiencyCodeItemId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'KHB - Carry over from PowerSchool, will need to determine how this is set', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'EXCLUDEFROMSTATEREPORTING';
GO