-- Create StudentContactPersonal table in sif schema
CREATE TABLE sif.StudentContactPersonal (
    RefId UNIQUEIDENTIFIER NOT NULL,
    PersonInfoRefId UNIQUEIDENTIFIER NOT NULL UNIQUE, -- 1-to-1 relationship with PersonInfo
    EmployerType NVARCHAR(50) NULL, -- xs:token
    EmployerType_Codeset NVARCHAR(255) NULL, -- xs:token (URL or identifier)
    EducationLevel NVARCHAR(50) NULL, -- EducationalLevelType (simplified as string)
    OptOutEmail NVARCHAR(50) NULL, -- xs:token
    OptOutEmail_Codeset NVARCHAR(255) NULL, -- xs:token (URL or identifier)
    SIF_Metadata NVARCHAR(MAX) NULL, -- SIF_MetadataType (complex type)
    SIF_ExtendedElements NVARCHAR(MAX) NULL, -- SIF_ExtendedElementsType (complex type)
    CONSTRAINT PK_StudentContactPersonal PRIMARY KEY (RefId),
    CONSTRAINT FK_StudentContactPersonal_PersonInfo FOREIGN KEY (PersonInfoRefId) 
        REFERENCES sif.PersonInfo(RefId) ON DELETE CASCADE
);
GO

-- Extended Properties for StudentContactPersonal Table
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Demographic and other information for each person who might be referenced as a student contact.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentContactPersonal';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The Id (GUID) that uniquely identifies the instance of the object.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentContactPersonal', 
    @level2type = N'COLUMN', @level2name = N'RefId';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Reference to the associated PersonInfo record containing common person demographic information.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentContactPersonal', 
    @level2type = N'COLUMN', @level2name = N'PersonInfoRefId';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Code that defines the employer type.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentContactPersonal', 
    @level2type = N'COLUMN', @level2name = N'EmployerType';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used for EmployerType.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentContactPersonal', 
    @level2type = N'COLUMN', @level2name = N'EmployerType_Codeset';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The highest level of education completed by the contact person.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentContactPersonal', 
    @level2type = N'COLUMN', @level2name = N'EducationLevel';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A "yes" value indicates person may only be contacted as authorized via email. This usually indicates they have requested contact be limited to essential purposes and use/release of their contact information (e.g. to Parent Teacher organizations) may be limited.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentContactPersonal', 
    @level2type = N'COLUMN', @level2name = N'OptOutEmail';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used for OptOutEmail.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentContactPersonal', 
    @level2type = N'COLUMN', @level2name = N'OptOutEmail_Codeset';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'SIF metadata associated with the student contact.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentContactPersonal', 
    @level2type = N'COLUMN', @level2name = N'SIF_Metadata';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'SIF extended elements for additional student contact data.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentContactPersonal', 
    @level2type = N'COLUMN', @level2name = N'SIF_ExtendedElements';
GO