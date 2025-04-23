-- Create the table for Email
CREATE TABLE sif.PersonInfo_Email (
    [Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
    [PersonInfoId] UNIQUEIDENTIFIER NOT NULL,
    [EmailId] UNIQUEIDENTIFIER NOT NULL,
    [TypeCodeItemId] UNIQUEIDENTIFIER NOT NULL,    -- e.g., 'Primary', 'Alternate'
    [PriorityOrder] INT NULL, 
    [IsPrimary] BIT NULL, 
    CONSTRAINT [BK_PersonInfo_Email] UNIQUE (PersonInfoId, EmailId),
	CONSTRAINT [FK_PersonInfo_Email_Entity] FOREIGN KEY (Id) REFERENCES dbo.Entity(Id),
    CONSTRAINT [FK_PersonInfo_Email_PersonInfo] FOREIGN KEY (PersonInfoId) REFERENCES sif.PersonInfo([Id]),
    CONSTRAINT [FK_PersonInfo_Email_Email] FOREIGN KEY (EmailId) REFERENCES sif.Email([Id]),
    CONSTRAINT [FK_PersonInfo_Email_TypeCodeItem] FOREIGN KEY ([TypeCodeItemId]) REFERENCES sif.CodeItem([Id]),
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The person''s e-mail address(es).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_Email';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Links to PersonInfo.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_Email', 
    @level2type=N'COLUMN', @level2name=N'PersonInfoId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Link to email address.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_Email', 
    @level2type=N'COLUMN', @level2name=N'EmailId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The type of the email address (e.g., ''Primary'', ''Alternate'').', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_Email', 
    @level2type=N'COLUMN', @level2name=N'TypeCodeItemId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Comes from PowerSchool and indicated this email is preferred over any of the other emails provided.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_Email', 
    @level2type=N'COLUMN', @level2name=N'IsPrimary';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Comes from PowerSchool and indicated priority order over any of the other emails provided.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'PersonInfo_Email', 
    @level2type=N'COLUMN', @level2name=N'PriorityOrder';
GO

