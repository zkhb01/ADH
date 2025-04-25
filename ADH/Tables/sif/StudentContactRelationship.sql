CREATE TABLE sif.StudentContactRelationship (
    Id UNIQUEIDENTIFIER NOT NULL,
    StudentPersonalId UNIQUEIDENTIFIER NOT NULL,
    StudentContactPersonalId UNIQUEIDENTIFIER NOT NULL,
    RelationshipCodeItemId UNIQUEIDENTIFIER NOT NULL,
    ContactSequence INT NULL,
    ParentLegalGuardian BIT NOT NULL DEFAULT 0,
    HasCustody BIT NOT NULL DEFAULT 0,
    PickupRight BIT NOT NULL DEFAULT 0,
    ReceivesMail BIT NOT NULL DEFAULT 0,
    LivesWith BIT NOT NULL DEFAULT 0,
    EmergencyContact BIT NOT NULL DEFAULT 0,
    KeepContactInfoPrivate_Other BIT NOT NULL DEFAULT 0,
    RelationshipNote NVARCHAR(4000) NULL,
    CONSTRAINT [PK_StudentContactRelationship] PRIMARY KEY (Id),
    CONSTRAINT [BK_StudentContactRelationship] UNIQUE (StudentPersonalId, StudentContactPersonalId),
    CONSTRAINT [FK_StudentContactRelationship_Entity] FOREIGN KEY (Id) REFERENCES dbo.Entity(Id),
    CONSTRAINT [FK_StudentContactRelationship_StudentPersonal] FOREIGN KEY (StudentPersonalId) REFERENCES sif.StudentPersonal(Id),
    CONSTRAINT [FK_StudentContactRelationship_RelationshipCodeItem] FOREIGN KEY (RelationshipCodeItemId) REFERENCES sif.CodeItem(Id),
    CONSTRAINT [FK_StudentContactRelationship_StudentContactPersonal] FOREIGN KEY (StudentContactPersonalId) REFERENCES sif.StudentContactPersonal(Id),
    CONSTRAINT [CHK_StudentContactRelationship_ContactFlags] CHECK (
        ParentLegalGuardian = 1 OR 
        HasCustody = 1 OR 
        PickupRight = 1 OR 
        ReceivesMail = 1 OR
        LivesWith = 1 OR
        EmergencyContact = 1 OR
        KeepContactInfoPrivate_Other = 1
    )
);
GO
CREATE INDEX IX_StudentContactRelationship_StudentPersonalId ON sif.StudentContactRelationship(StudentPersonalId);
GO
CREATE INDEX IX_StudentContactRelationship_StudentContactPersonalId ON sif.StudentContactRelationship(StudentContactPersonalId);
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
    @value=N'A GUID that identifies an instance of this object. This Id is new for 2.7M and MUST be supported like other objects that have a Id (i.e. it is the key for the object). The alternate keys MUST continue to be supported.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentContactRelationship', 
    @level2type=N'COLUMN', @level2name=N'Id';
GO
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'GUID that identifies the student for the relationship.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentContactRelationship', 
    @level2type=N'COLUMN', @level2name=N'StudentPersonalId';
GO
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'GUID that identifies the contact person for the relationship.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentContactRelationship', 
    @level2type=N'COLUMN', @level2name=N'StudentContactPersonalId';
GO
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The relationship of the contact person to the student (e.g., ''Mother'', ''Father'').', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentContactRelationship', 
    @level2type=N'COLUMN', @level2name=N'RelationshipCodeItemId';
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
    @value=N'Part of ContactFlags: Indicates if the contact is a parent or legal guardian (Yes = 1, No = 0).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentContactRelationship', 
    @level2type=N'COLUMN', @level2name=N'ParentLegalGuardian';
GO
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Part of ContactFlags: Indicates if the contact has legal custody rights for the student (Yes = 1, No = 0).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentContactRelationship', 
    @level2type=N'COLUMN', @level2name=N'HasCustody';
GO
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Part of ContactFlags: Indicates if the contact has pickup rights (Yes = 1, No = 0).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentContactRelationship', 
    @level2type=N'COLUMN', @level2name='PickupRight';
GO
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Comes from PowerSchool and indicated this Contact Person receives mail related to the student from the school (Yes = 1, No = 0).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentContactRelationship', 
    @level2type=N'COLUMN', @level2name=N'ReceivesMail';
GO
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Comes from PowerSchool and indicated Student lives with this Contact Person (Yes = 1, No = 0)..', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentContactRelationship', 
    @level2type=N'COLUMN', @level2name=N'LivesWith';
GO
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Part of ContactFlags: Indicates if the contact is an emergency contact (Yes = 1, No = 0).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentContactRelationship', 
    @level2type=N'COLUMN', @level2name=N'EmergencyContact';
GO
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Part of ContactFlags (Other): Indicates if the contact wants their contact info kept private (not shared with other guardians) (Yes = 1, No = 0).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentContactRelationship', 
    @level2type=N'COLUMN', @level2name=N'KeepContactInfoPrivate_Other';
GO
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Comes from PowerSchool and provides note relating to this relationship.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentContactRelationship', 
    @level2type=N'COLUMN', @level2name='RelationshipNote';
GO