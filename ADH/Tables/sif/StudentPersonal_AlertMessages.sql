-- Create the table for AlertMessages
CREATE TABLE sif.StudentPersonal_AlertMessages (
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),   -- Unique identifier for each alert message.
    StudentPersonalRefId UNIQUEIDENTIFIER NOT NULL,             -- Links to StudentPersonal.
    AlertMessage NVARCHAR(255) NOT NULL,                        -- The alert message text associated with the student.
    Type NVARCHAR(50) NOT NULL,                                 -- Specifies what type of alert message this is (mandatory).
    TypeCodesetId UNIQUEIDENTIFIER NULL,                        -- References the codeset used for Type (optional link to dbo.CodeSet).

    -- Constraints
    CONSTRAINT FK_StudentPersonal_AlertMessages_StudentPersonal FOREIGN KEY (StudentPersonalRefId) REFERENCES sif.StudentPersonal(RefId),
    CONSTRAINT FK_StudentPersonal_AlertMessages_CodeSet FOREIGN KEY (TypeCodesetId) REFERENCES sif.CodeSet(Id)
);
GO

-- Create index for performance
CREATE INDEX IX_StudentPersonal_AlertMessages_StudentPersonalRefId ON sif.StudentPersonal_AlertMessages(StudentPersonalRefId);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Container for alert messages associated with the student.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_AlertMessages';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Unique identifier for each alert message.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_AlertMessages', 
    @level2type=N'COLUMN', @level2name=N'Id';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to StudentPersonal.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_AlertMessages', 
    @level2type=N'COLUMN', @level2name=N'StudentPersonalRefId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'This is an alert message that is associated with the student.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_AlertMessages', 
    @level2type=N'COLUMN', @level2name=N'AlertMessage';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'This attribute specifies what type of alert message this is.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_AlertMessages', 
    @level2type=N'COLUMN', @level2name=N'Type';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'A unique indicator (usually a URL) that points to the codeset used, referencing dbo.CodeSet.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_AlertMessages', 
    @level2type=N'COLUMN', @level2name=N'TypeCodesetId';
GO