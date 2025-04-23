CREATE TABLE sif.StudentContactRelationship (
    RefId UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
    StudentPersonalRefId UNIQUEIDENTIFIER NOT NULL,
    StudentContactPersonalRefId UNIQUEIDENTIFIER NOT NULL,
    RelationshipCode NVARCHAR(50) NOT NULL,
    ContactFlag_ParentLegalGuardian BIT NOT NULL DEFAULT 0,
    ContactFlag_PickupRights BIT NOT NULL DEFAULT 0,
    ContactFlag_EmergencyContact BIT NOT NULL DEFAULT 0,
    ContactSequence INT NULL,
    CreatedDate DATETIME DEFAULT GETDATE(),
    LastModifiedDate DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_StudentContactRelationship_StudentPersonal FOREIGN KEY (StudentPersonalRefId) REFERENCES sif.StudentPersonal(RefId),
    CONSTRAINT FK_StudentContactRelationship_StudentContactPersonal FOREIGN KEY (StudentContactPersonalRefId) REFERENCES sif.StudentContactPersonal(RefId),
    CONSTRAINT CHK_StudentContactRelationship_ContactFlags CHECK (
        ContactFlag_ParentLegalGuardian = 1 OR 
        ContactFlag_PickupRights = 1 OR 
        ContactFlag_EmergencyContact = 1
    )
);
GO
CREATE INDEX IX_StudentContactRelationship_StudentPersonalRefId ON sif.StudentContactRelationship(StudentPersonalRefId);
GO
CREATE INDEX IX_StudentContactRelationship_StudentContactPersonalRefId ON sif.StudentContactRelationship(StudentContactPersonalRefId);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The relationship between a student and a contact person.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentContactRelationship';
GO
-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'A GUID that identifies an instance of this object. This RefId is new for 2.7M and MUST be supported like other objects that have a RefId (i.e. it is the key for the object). The alternate keys MUST continue to be supported.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentContactRelationship', 
    @level2type=N'COLUMN', @level2name=N'RefId';
GO
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'GUID that identifies the student for the relationship.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentContactRelationship', 
    @level2type=N'COLUMN', @level2name=N'StudentPersonalRefId';
GO
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'GUID that identifies the contact person for the relationship.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentContactRelationship', 
    @level2type=N'COLUMN', @level2name=N'StudentContactPersonalRefId';
GO
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The relationship of the contact person to the student (e.g., ''Mother'', ''Father'').', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentContactRelationship', 
    @level2type=N'COLUMN', @level2name=N'RelationshipCode';
GO
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Part of ContactFlags: Indicates if the contact is a parent or legal guardian (Yes = 1, No = 0).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentContactRelationship', 
    @level2type=N'COLUMN', @level2name=N'ContactFlag_ParentLegalGuardian';
GO
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Part of ContactFlags: Indicates if the contact has pickup rights (Yes = 1, No = 0).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentContactRelationship', 
    @level2type=N'COLUMN', @level2name=N'ContactFlag_PickupRights';
GO
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Part of ContactFlags: Indicates if the contact is an emergency contact (Yes = 1, No = 0).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentContactRelationship', 
    @level2type=N'COLUMN', @level2name=N'ContactFlag_EmergencyContact';
GO
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Number indicating the order in which the person should be contacted.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentContactRelationship', 
    @level2type=N'COLUMN', @level2name=N'ContactSequence';
GO
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Audit field: Creation timestamp.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentContactRelationship', 
    @level2type=N'COLUMN', @level2name=N'CreatedDate';
GO
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Audit field: Last modification timestamp.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentContactRelationship', 
    @level2type=N'COLUMN', @level2name=N'LastModifiedDate';
GO