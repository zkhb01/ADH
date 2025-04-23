-- Create the table for MedicalAlertMessage
CREATE TABLE sif.StudentPersonal_MedicalAlertMessage (
    Id UNIQUEIDENTIFIER NOT NULL,   -- Unique identifier for each medical alert message.
    StudentPersonalId UNIQUEIDENTIFIER NOT NULL,             -- Links to StudentPersonal.
    MedicalAlertMessage NVARCHAR(255) NOT NULL,                 -- The medical alert message text associated with the student (using TextData from AbstractContentElementType).
    --CreatedDate DATETIME DEFAULT GETDATE(),                     -- Audit field: Creation timestamp.
    --LastModifiedDate DATETIME DEFAULT GETDATE(),                -- Audit field: Last modification timestamp.
    -- Constraints
   CONSTRAINT [PK_StudentPersonal_MedicalAlertMessage] PRIMARY KEY (Id),
   CONSTRAINT [FK_StudentPersonal_MedicalAlertMessage] FOREIGN KEY (Id) REFERENCES dbo.Entity(Id),
   CONSTRAINT FK_StudentPersonal_MedicalAlertMessage_StudentPersonal FOREIGN KEY (StudentPersonalId) REFERENCES sif.StudentPersonal(Id)
);
GO

-- Create index for performance
CREATE INDEX IX_StudentPersonal_MedicalAlertMessage_StudentPersonalId ON sif.StudentPersonal_MedicalAlertMessage(StudentPersonalId);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Container for medical alert messages associated with the student (e.g., allergies, medical conditions).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_MedicalAlertMessage';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Unique identifier for each medical alert message.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_MedicalAlertMessage', 
    @level2type=N'COLUMN', @level2name=N'Id';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to StudentPersonal.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_MedicalAlertMessage', 
    @level2type=N'COLUMN', @level2name=N'StudentPersonalId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Contains arbitrary text, encoded in UTF-8, describing a medical alert associated with the student (e.g., ''Severe peanut allergy'').', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_MedicalAlertMessage', 
    @level2type=N'COLUMN', @level2name=N'MedicalAlertMessage';
GO