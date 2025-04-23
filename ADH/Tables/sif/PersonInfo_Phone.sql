-- Create the table for Phone
CREATE TABLE sif.PersonInfo_Phone (
    [Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
    [PersonInfoId] UNIQUEIDENTIFIER NOT NULL,
    [PhoneId] UNIQUEIDENTIFIER NOT NULL,
    [IsPreferred] BIT NULL, 
    [PriorityOrder] INT NULL, 
    CONSTRAINT [BK_PersonInfo_Phone] UNIQUE (PersonInfoId, PhoneId),
	CONSTRAINT [FK_PersonInfo_Phone_Entity] FOREIGN KEY (Id) REFERENCES dbo.Entity(Id),
    CONSTRAINT [FK_PersonInfo_Phone_PersonInfo] FOREIGN KEY (PersonInfoId) REFERENCES sif.PersonInfo([Id]),
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The person''s phone number(s).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_Phone';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to PersonInfo.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_Phone', 
    @level2type=N'COLUMN', @level2name=N'PersonInfoId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to Phone.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_Phone', 
    @level2type=N'COLUMN', @level2name=N'PhoneId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Comes from PowerSchool and indicated this phonenumber is preferred over any of the other phone numbers provided.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_Phone', 
    @level2type=N'COLUMN', @level2name=N'IsPreferred';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Comes from PowerSchool and indicated priority order over any of the other phone numbers provided.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_Phone', 
    @level2type=N'COLUMN', @level2name=N'PriorityOrder';
GO