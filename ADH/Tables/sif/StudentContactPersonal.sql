-- Create StudentContactPersonal table in sif schema
CREATE TABLE sif.StudentContactPersonal (
    Id UNIQUEIDENTIFIER NOT NULL,
    PersonInfoId UNIQUEIDENTIFIER NOT NULL UNIQUE, -- 1-to-1 relationship with PersonInfo
    EmployerTypeCodeItemId UNIQUEIDENTIFIER NULL, -- xs:token (URL or identifier)
    EducationLevel NVARCHAR(50) NULL, -- EducationalLevelType (simplified as string)
    OptOutEmailCodeItemId UNIQUEIDENTIFIER, -- xs:token (URL or identifier)
    SIF_Metadata NVARCHAR(MAX) NULL, -- SIF_MetadataType (complex type)
    SIF_ExtendedElements NVARCHAR(MAX) NULL, -- SIF_ExtendedElementsType (complex type)
    CONSTRAINT [PK_StudentContactPersonal] PRIMARY KEY (Id),
    CONSTRAINT [BK_StudentContactPersonal] UNIQUE (PersonInfoId, EmployerTypeCodeItemId),
    CONSTRAINT [FK_StudentContactPersonal_Entity] FOREIGN KEY (Id) REFERENCES dbo.Entity(Id),
    CONSTRAINT [FK_StudentContactPersonal_PersonInfo] FOREIGN KEY (PersonInfoId) REFERENCES sif.PersonInfo([Id]),
    CONSTRAINT [FK_StudentContactPersonal_EmployerTypeCodeItem] FOREIGN KEY (EmployerTypeCodeItemId) REFERENCES sif.CodeItem([Id]),
    CONSTRAINT [FK_StudentContactPersonal_OptOutEmailCodeItem] FOREIGN KEY (OptOutEmailCodeItemId) REFERENCES sif.CodeItem([Id]),
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Demographic and other information for each person who might be referenced as a student contact.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentContactPersonal';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The Id (GUID) that uniquely identifies the instance of the object.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentContactPersonal', 
    @level2type = N'COLUMN', @level2name = N'Id';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Reference to the associated PersonInfo record containing common person demographic information.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentContactPersonal', 
    @level2type = N'COLUMN', @level2name = N'PersonInfoId';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Code that defines the employer type.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentContactPersonal', 
    @level2type = N'COLUMN', @level2name = N'EmployerTypeCodeItemId';
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
    @level2type = N'COLUMN', @level2name = N'OptOutEmailCodeItemId';
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