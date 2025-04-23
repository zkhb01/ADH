-- Create the table for RaceList (from Demographics)
CREATE TABLE sif.PersonInfo_RaceList (
    PersonInfoRefId UNIQUEIDENTIFIER NOT NULL,
    Race NVARCHAR(50) NOT NULL,
    RaceCodesetId UNIQUEIDENTIFIER NULL,
    CONSTRAINT PK_PersonInfo_RaceList PRIMARY KEY (PersonInfoRefId, Race),
    CONSTRAINT FK_PersonInfo_RaceList_PersonInfo FOREIGN KEY (PersonInfoRefId) REFERENCES sif.PersonInfo(RefId),
    CONSTRAINT FK_PersonInfo_RaceList_CodeSet FOREIGN KEY (RaceCodesetId) REFERENCES sif.CodeSet(Id)
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'List of races associated with the person.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_RaceList';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to PersonInfo.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_RaceList', 
    @level2type=N'COLUMN', @level2name=N'PersonInfoRefId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The race of the person (e.g., ''White'', ''Black'').', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_RaceList', 
    @level2type=N'COLUMN', @level2name=N'Race';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'A unique indicator (usually a URL) that points to the codeset used for Race, referencing dbo.CodeSet.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_RaceList', 
    @level2type=N'COLUMN', @level2name=N'RaceCodesetId';
GO