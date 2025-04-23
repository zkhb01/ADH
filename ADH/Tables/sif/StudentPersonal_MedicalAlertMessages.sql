-- Create the table for MedicalAlertMessages
CREATE TABLE sif.StudentPersonal_MedicalAlertMessages (
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),   -- Unique identifier for each medical alert message.
    StudentPersonalRefId UNIQUEIDENTIFIER NOT NULL,             -- Links to StudentPersonal.
    MedicalAlertMessage NVARCHAR(255) NOT NULL,                 -- The medical alert message text associated with the student (using TextData from AbstractContentElementType).
    CreatedDate DATETIME DEFAULT GETDATE(),                     -- Audit field: Creation timestamp.
    LastModifiedDate DATETIME DEFAULT GETDATE(),                -- Audit field: Last modification timestamp.

    -- Constraints
    CONSTRAINT FK_StudentPersonal_MedicalAlertMessages_StudentPersonal FOREIGN KEY (StudentPersonalRefId) REFERENCES sif.StudentPersonal(RefId)
);
GO

-- Create index for performance
CREATE INDEX IX_StudentPersonal_MedicalAlertMessages_StudentPersonalRefId ON sif.StudentPersonal_MedicalAlertMessages(StudentPersonalRefId);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Container for medical alert messages associated with the student (e.g., allergies, medical conditions).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_MedicalAlertMessages';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Unique identifier for each medical alert message.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_MedicalAlertMessages', 
    @level2type=N'COLUMN', @level2name=N'Id';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to StudentPersonal.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_MedicalAlertMessages', 
    @level2type=N'COLUMN', @level2name=N'StudentPersonalRefId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Contains arbitrary text, encoded in UTF-8, describing a medical alert associated with the student (e.g., ''Severe peanut allergy'').', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_MedicalAlertMessages', 
    @level2type=N'COLUMN', @level2name=N'MedicalAlertMessage';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Audit field: Creation timestamp.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_MedicalAlertMessages', 
    @level2type=N'COLUMN', @level2name=N'CreatedDate';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Audit field: Last modification timestamp.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_MedicalAlertMessages', 
    @level2type=N'COLUMN', @level2name=N'LastModifiedDate';
GO