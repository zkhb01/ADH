-- Create the table for Email
CREATE TABLE sif.Email (
    [Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
    [Address] NVARCHAR(255) NOT NULL,
    [ValidatedOn] DATETIME NULL, 
    [ValidatedBy] NVARCHAR(100) NULL, 
    [ValidationServiceUsed] NVARCHAR(255) NULL, 
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
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'KHB - The timestamp of the last time this address was validated against an Adress-Validation service', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Email', 
    @level2type=N'COLUMN', @level2name=N'ValidatedOn';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'KHB - The signed-in user that validated the address against an Adress-Validation service', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Email', 
    @level2type=N'COLUMN', @level2name=N'ValidatedBy';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'KHB - The service used to validated the address', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Email', 
    @level2type=N'COLUMN', @level2name=N'ValidationServiceUsed';
GO