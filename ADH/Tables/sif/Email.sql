-- Create the table for Email
CREATE TABLE sif.Email (
    [Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
    [Address] NVARCHAR(255) NOT NULL,
    CONSTRAINT [BK_Email] UNIQUE ([Address]),
	CONSTRAINT [FK_Email_Entity] FOREIGN KEY (Id) REFERENCES dbo.Entity(Id),
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The person''s email address.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Email';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The email address.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Email', 
    @level2type=N'COLUMN', @level2name=N'Address';
GO