-- Create the table for RaceList
CREATE TABLE sif.StudentPersonal_RaceList (
    StudentPersonalRefId UNIQUEIDENTIFIER NOT NULL,
    Race NVARCHAR(50) NOT NULL,
    RaceCodesetId UNIQUEIDENTIFIER NULL,                        -- References the codeset used for Race, links to dbo.CodeSet.
    CONSTRAINT PK_StudentPersonal_RaceList PRIMARY KEY (StudentPersonalRefId, Race),
    CONSTRAINT FK_StudentPersonal_RaceList_StudentPersonal FOREIGN KEY (StudentPersonalRefId) REFERENCES sif.StudentPersonal(RefId),
    CONSTRAINT FK_StudentPersonal_RaceList_CodeSet FOREIGN KEY (RaceCodesetId) REFERENCES sif.CodeSet(Id)
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'List of races associated with the student.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_RaceList';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to StudentPersonal.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_RaceList', 
    @level2type=N'COLUMN', @level2name=N'StudentPersonalRefId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The race of the student (e.g., ''White'', ''Black'').', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_RaceList', 
    @level2type=N'COLUMN', @level2name=N'Race';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'A unique indicator (usually a URL) that points to the codeset used for Race, referencing dbo.CodeSet.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'StudentPersonal_RaceList', 
    @level2type=N'COLUMN', @level2name=N'RaceCodesetId';
GO