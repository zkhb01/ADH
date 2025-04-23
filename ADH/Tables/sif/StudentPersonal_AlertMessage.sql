-- Create the table for AlertMessage
CREATE TABLE sif.StudentPersonal_AlertMessage (
    Id UNIQUEIDENTIFIER NOT NULL,   -- Unique identifier for each alert message.
    StudentPersonalId UNIQUEIDENTIFIER NOT NULL,             -- Links to StudentPersonal.
    AlertMessage NVARCHAR(255) NOT NULL,                        -- The alert message text associated with the student.
    TypeCodeItemId UNIQUEIDENTIFIER NOT NULL,                                 -- Specifies what type of alert message this is (mandatory).
    CONSTRAINT [PK_StudentPersonal_AlertMessage] PRIMARY KEY (Id),
    CONSTRAINT [FK_StudentPersonal_AlertMessage] FOREIGN KEY (Id) REFERENCES dbo.Entity(Id),
    CONSTRAINT [FK_StudentPersonal_AlertMessage_StudentPersonal] FOREIGN KEY (StudentPersonalId) REFERENCES sif.StudentPersonal(Id),
    CONSTRAINT [FK_StudentPersonal_AlertMessage_TypeCodeItem] FOREIGN KEY (TypeCodeItemId) REFERENCES sif.CodeItem(Id)
);
GO

-- Create index for performance
CREATE INDEX IX_StudentPersonal_AlertMessage_StudentPersonalId ON sif.StudentPersonal_AlertMessage(StudentPersonalId);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Container for alert messages associated with the student.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_AlertMessage';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Unique identifier for each alert message.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_AlertMessage', 
    @level2type=N'COLUMN', @level2name=N'Id';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to StudentPersonal.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_AlertMessage', 
    @level2type=N'COLUMN', @level2name=N'StudentPersonalId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'This is an alert message that is associated with the student.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_AlertMessage', 
    @level2type=N'COLUMN', @level2name=N'AlertMessage';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'This attribute specifies what type of alert message this is.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_AlertMessage', 
    @level2type=N'COLUMN', @level2name=N'TypeCodeItemId';
GO