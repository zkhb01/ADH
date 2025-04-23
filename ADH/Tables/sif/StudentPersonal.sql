-- StudentPersonal table with student-specific data and 1-to-1 link to PersonInfo
CREATE TABLE sif.StudentPersonal (
    RefId UNIQUEIDENTIFIER NOT NULL,
    PersonInfoRefId UNIQUEIDENTIFIER NOT NULL UNIQUE, -- 1-to-1 relationship
    StateProvinceId NVARCHAR(50) NULL, -- StateProvinceIdType
    ProjectedGraduationYear NVARCHAR(4) NULL, -- ProjectedGraduationYearType
    OnTimeGraduationYear NVARCHAR(4) NULL, -- OnTimeGraduationYearType
    GraduationDate DATE NULL, -- GraduationDateType
    MostRecent NVARCHAR(MAX) NULL, -- StudentMostRecentContainerType (complex type, single instance)
    AcceptableUsePolicy NVARCHAR(50) NULL, -- xs:token
    AcceptableUsePolicy_Codeset NVARCHAR(255) NULL, -- xs:token
    IDEA NVARCHAR(50) NULL, -- xs:token
    IDEA_Codeset NVARCHAR(255) NULL, -- xs:token
    Migrant NVARCHAR(50) NULL, -- xs:token
    Migrant_Codeset NVARCHAR(255) NULL, -- xs:token
    Title1 NVARCHAR(50) NULL, -- xs:token
    Title1_Codeset NVARCHAR(255) NULL, -- xs:token
    GiftedTalented NVARCHAR(50) NULL, -- xs:token
    GiftedTalented_Codeset NVARCHAR(255) NULL, -- xs:token
    EconomicDisadvantage NVARCHAR(50) NULL, -- xs:token
    EconomicDisadvantage_Codeset NVARCHAR(255) NULL, -- xs:token
    ELL NVARCHAR(50) NULL, -- xs:token
    ELL_Codeset NVARCHAR(255) NULL, -- xs:token
    Homeless NVARCHAR(50) NULL, -- xs:token
    Homeless_Codeset NVARCHAR(255) NULL, -- xs:token
    Section504 NVARCHAR(50) NULL, -- xs:token
    Section504_Codeset NVARCHAR(255) NULL, -- xs:token
    VocationalConcentrator NVARCHAR(50) NULL, -- xs:token
    VocationalConcentrator_Codeset NVARCHAR(255) NULL, -- xs:token
    Immigrant NVARCHAR(50) NULL, -- xs:token
    Immigrant_Codeset NVARCHAR(255) NULL, -- xs:token
    NeglectedDelinquent NVARCHAR(50) NULL, -- xs:token
    NeglectedDelinquent_Codeset NVARCHAR(255) NULL, -- xs:token
    FirstUSEnrollment DATE NULL, -- xs:date
    SIF_Metadata NVARCHAR(MAX) NULL, -- SIF_MetadataType (complex type, single instance)
    SIF_ExtendedElements NVARCHAR(MAX) NULL, -- SIF_ExtendedElementsType (complex type, single instance)
    CONSTRAINT PK_StudentPersonal PRIMARY KEY (RefId),
    CONSTRAINT FK_StudentPersonal_PersonInfo FOREIGN KEY (PersonInfoRefId) 
        REFERENCES sif.PersonInfo(RefId) ON DELETE CASCADE
);
GO

-- ElectronicIdList table (1-to-many with StudentPersonal)
CREATE TABLE StudentElectronicIds (
    ElectronicId INT IDENTITY(1,1) NOT NULL,
    StudentRefId UNIQUEIDENTIFIER NOT NULL,
    ElectronicIdentifier NVARCHAR(50) NOT NULL, -- Simplified representation of ElectronicIdListType
    CONSTRAINT PK_StudentElectronicIds PRIMARY KEY (ElectronicId),
    CONSTRAINT FK_StudentElectronicIds_StudentPersonal FOREIGN KEY (StudentRefId) 
        REFERENCES sif.StudentPersonal(RefId) ON DELETE CASCADE
);
GO

-- Extended Properties for StudentPersonal Table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'This object contains all the personal information related to the student.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The GUID of the student.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'RefId';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Reference to the associated PersonInfo record.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'PersonInfoRefId';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The state-assigned identifier for this student.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'StateProvinceId';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Currently projected graduation year.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'ProjectedGraduationYear';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'First projected graduation year, usually determined when student is accepted into 9th grade.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'OnTimeGraduationYear';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Date student officially graduated from secondary education.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'GraduationDate';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Container for elements reflecting the most recent enrollment of a student. If the student is currently enrolled in the district, the elements contain current information.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'MostRecent';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Does the student have a current signed Acceptable Use Policy document for system access?', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'AcceptableUsePolicy';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'AcceptableUsePolicy_Codeset';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'IDEA_Codeset';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'Migrant_Codeset';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'Title1_Codeset';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'GiftedTalented_Codeset';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'EconomicDisadvantage_Codeset';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'ELL_Codeset';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'Homeless_Codeset';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'Section504_Codeset';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'VocationalConcentrator_Codeset';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'Immigrant_Codeset';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'NeglectedDelinquent_Codeset';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The date on which the student was first enrolled in the US school system.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'FirstUSEnrollment';
GO