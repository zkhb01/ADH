-- Create the table
CREATE TABLE sif.PersonInfo (
    RefId UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(), -- The GUID of this person (implied for SIF objects).
    LocalId NVARCHAR(50) NULL,                                  -- The locally-assigned identifier for this person.
    FirstName NVARCHAR(50) NOT NULL,                            -- Part of Name: The person’s first name (mandatory per NameOfRecordType with Type=04).
    LastName NVARCHAR(50) NOT NULL,                             -- Part of Name: The person’s last name (mandatory per NameOfRecordType with Type=04).
    -- DemographicsType fields (flattened)
    BirthDate DATE NULL,
    BirthDateVerification NVARCHAR(50) NULL,
    BirthDateVerificationCodesetId UNIQUEIDENTIFIER NULL,
    PlaceOfBirth NVARCHAR(100) NULL,
    CountyOfBirth NVARCHAR(100) NULL,
    StateOfBirth NVARCHAR(50) NULL,
    CountryOfBirth NVARCHAR(50) NULL,
    CountryArrivalDate DATE NULL,
    CitizenshipStatus NVARCHAR(50) NULL,
    CitizenshipStatusCodesetId UNIQUEIDENTIFIER NULL,
    Gender NVARCHAR(20) NULL,
    GenderCodesetId UNIQUEIDENTIFIER NULL,
    HispanicLatino BIT NULL,
    HispanicLatinoCodesetId UNIQUEIDENTIFIER NULL,
    MaritalStatus NVARCHAR(50) NULL,
    MaritalStatusCodesetId UNIQUEIDENTIFIER NULL,
    EnglishProficiencyCode NVARCHAR(50) NULL,                   -- Person's proficiency in English (xs:token from EnglishProficiencyType).
    EnglishProficiencyCodesetId UNIQUEIDENTIFIER NULL,          -- Codeset for EnglishProficiencyCode (FK to dbo.CodeSet).
    CreatedDate DATETIME DEFAULT GETDATE(),
    LastModifiedDate DATETIME DEFAULT GETDATE(),

    -- Constraints
    CONSTRAINT CHK_PersonInfo_Name CHECK (FirstName <> '' AND LastName <> ''),
    CONSTRAINT FK_PersonInfo_BirthDateVerificationCodeset FOREIGN KEY (BirthDateVerificationCodesetId) REFERENCES sif.CodeSet(Id),
    CONSTRAINT FK_PersonInfo_CitizenshipStatusCodeset FOREIGN KEY (CitizenshipStatusCodesetId) REFERENCES sif.CodeSet(Id),
    CONSTRAINT FK_PersonInfo_GenderCodeset FOREIGN KEY (GenderCodesetId) REFERENCES sif.CodeSet(Id),
    CONSTRAINT FK_PersonInfo_HispanicLatinoCodeset FOREIGN KEY (HispanicLatinoCodesetId) REFERENCES sif.CodeSet(Id),
    CONSTRAINT FK_PersonInfo_MaritalStatusCodeset FOREIGN KEY (MaritalStatusCodesetId) REFERENCES sif.CodeSet(Id),
    CONSTRAINT FK_PersonInfo_EnglishProficiencyCodeset FOREIGN KEY (EnglishProficiencyCodesetId) REFERENCES sif.CodeSet(Id)
);
GO

-- Create index
CREATE INDEX IX_PersonInfo_LocalId ON sif.PersonInfo(LocalId);
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
    @level2type=N'COLUMN', @level2name=N'RefId';
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
    @level2type=N'COLUMN', @level2name=N'BirthDateVerification';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'A unique indicator (usually a URL) that points to the codeset used for BirthDateVerification, referencing dbo.CodeSet.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'BirthDateVerificationCodesetId';
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
    @level2type=N'COLUMN', @level2name=N'CitizenshipStatus';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'A unique indicator (usually a URL) that points to the codeset used for CitizenshipStatus, referencing dbo.CodeSet.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'CitizenshipStatusCodesetId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Person''s gender.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'Gender';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'A unique indicator (usually a URL) that points to the codeset used for Gender, referencing dbo.CodeSet.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'GenderCodesetId';
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
    @value=N'A unique indicator (usually a URL) that points to the codeset used for HispanicLatino, referencing dbo.CodeSet.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'HispanicLatinoCodesetId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The person''s marital status.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'MaritalStatus';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'A unique indicator (usually a URL) that points to the codeset used for MaritalStatus, referencing dbo.CodeSet.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'MaritalStatusCodesetId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Person''s proficiency in English (CEDS ID: 000180).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'EnglishProficiencyCode';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'A unique indicator (usually a URL) that points to the codeset used for EnglishProficiencyCode, referencing dbo.CodeSet.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'EnglishProficiencyCodesetId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Audit field: Creation timestamp.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'CreatedDate';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Audit field: Last modification timestamp.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo', 
    @level2type=N'COLUMN', @level2name=N'LastModifiedDate';
GO