-- StudentPersonal table with student-specific data and 1-to-1 link to PersonInfo
CREATE TABLE sif.StudentPersonal (
    Id UNIQUEIDENTIFIER NOT NULL,
    PersonInfoId UNIQUEIDENTIFIER NOT NULL UNIQUE, -- 1-to-1 relationship
    StateAssignedId NVARCHAR(50) NULL, -- StateProvinceIdType
    ProjectedGraduationYear NVARCHAR(4) NULL, -- ProjectedGraduationYearType
    OnTimeGraduationYear NVARCHAR(4) NULL, -- OnTimeGraduationYearType
    GraduationDate DATE NULL, -- GraduationDateType
    MostRecent NVARCHAR(MAX) NULL, -- StudentMostRecentContainerType (complex type, single instance)
    AcceptableUsePolicyCodeItemId UNIQUEIDENTIFIER NULL, -- xs:token
    IDEACodeItemId UNIQUEIDENTIFIER NULL, -- xs:token
    MigrantCodeItemId UNIQUEIDENTIFIER NULL, -- xs:token
    Title1CodeItemId UNIQUEIDENTIFIER NULL, -- xs:token
    GiftedTalentedCodeItemId UNIQUEIDENTIFIER NULL, -- xs:token
    EconomicDisadvantageCodeItemId UNIQUEIDENTIFIER NULL, -- xs:token
    ELLCodeItemId UNIQUEIDENTIFIER NULL, -- xs:token
    HomelessCodeItemId UNIQUEIDENTIFIER NULL, -- xs:token
    Section504CodeItemId UNIQUEIDENTIFIER NULL, -- xs:token
    VocationalConcentratorCodeItemId UNIQUEIDENTIFIER NULL, -- xs:token
    ImmigrantCodeItemId UNIQUEIDENTIFIER NULL, -- xs:token
    NeglectedDelinquentCodeItemId UNIQUEIDENTIFIER NULL, -- xs:token
    FirstUSEnrollment DATE NULL, -- xs:date
    SIF_Metadata NVARCHAR(MAX) NULL, -- SIF_MetadataType (complex type, single instance)
    SIF_ExtendedElements NVARCHAR(MAX) NULL, -- SIF_ExtendedElementsType (complex type, single instance)
    CONSTRAINT [PK_StudentPersonal] PRIMARY KEY (Id),
    CONSTRAINT [BK_StudentPersonal] UNIQUE (PersonInfoId),
    CONSTRAINT [FK_StudentPersonal_Entity] FOREIGN KEY (Id) REFERENCES dbo.Entity(Id),
    CONSTRAINT [FK_StudentPersonal_PersonInfo] FOREIGN KEY (PersonInfoId) REFERENCES sif.PersonInfo([Id]),
    CONSTRAINT [FK_StudentPersonal_AcceptableUsePolicyCodeItem] FOREIGN KEY (AcceptableUsePolicyCodeItemId) REFERENCES sif.CodeItem([Id]),
    CONSTRAINT [FK_StudentPersonal_IDEACodeItem] FOREIGN KEY (IDEACodeItemId) REFERENCES sif.CodeItem([Id]),
    CONSTRAINT [FK_StudentPersonal_MigrantCodeItem] FOREIGN KEY (MigrantCodeItemId) REFERENCES sif.CodeItem([Id]),
    CONSTRAINT [FK_StudentPersonal_Title1CodeItem] FOREIGN KEY (Title1CodeItemId) REFERENCES sif.CodeItem([Id]),
    CONSTRAINT [FK_StudentPersonal_GiftedTalentedCodeItem] FOREIGN KEY (GiftedTalentedCodeItemId) REFERENCES sif.CodeItem([Id]),
    CONSTRAINT [FK_StudentPersonal_EconomicDisadvantageCodeItem] FOREIGN KEY (EconomicDisadvantageCodeItemId) REFERENCES sif.CodeItem([Id]),
    CONSTRAINT [FK_StudentPersonal_ELLCodeItem] FOREIGN KEY (ELLCodeItemId) REFERENCES sif.CodeItem([Id]),
    CONSTRAINT [FK_StudentPersonal_HomelessCodeItem] FOREIGN KEY (HomelessCodeItemId) REFERENCES sif.CodeItem([Id]),
    CONSTRAINT [FK_StudentPersonal_Section504CodeItem] FOREIGN KEY (Section504CodeItemId) REFERENCES sif.CodeItem([Id]),
    CONSTRAINT [FK_StudentPersonal_VocationalConcentratorCodeItem] FOREIGN KEY (VocationalConcentratorCodeItemId) REFERENCES sif.CodeItem([Id]),
    CONSTRAINT [FK_StudentPersonal_ImmigrantCodeItem] FOREIGN KEY (ImmigrantCodeItemId) REFERENCES sif.CodeItem([Id]),
    CONSTRAINT [FK_StudentPersonal_NeglectedDelinquentCodeItem] FOREIGN KEY (NeglectedDelinquentCodeItemId) REFERENCES sif.CodeItem([Id]),
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
    @level2type = N'COLUMN', @level2name = N'Id';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Reference to the associated PersonInfo record.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'PersonInfoId';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The state-assigned identifier for this student.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'StateAssignedId';
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
    @level2type = N'COLUMN', @level2name = N'AcceptableUsePolicyCodeItemId';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'IDEACodeItemId';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'MigrantCodeItemId';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'Title1CodeItemId';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'GiftedTalentedCodeItemId';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'EconomicDisadvantageCodeItemId';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'ELLCodeItemId';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'HomelessCodeItemId';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'Section504CodeItemId';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'VocationalConcentratorCodeItemId';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'ImmigrantCodeItemId';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'NeglectedDelinquentCodeItemId';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The date on which the student was first enrolled in the US school system.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentPersonal', 
    @level2type = N'COLUMN', @level2name = N'FirstUSEnrollment';
GO