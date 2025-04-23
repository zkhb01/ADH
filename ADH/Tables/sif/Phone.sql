-- Create the table
CREATE TABLE sif.Phone (
    [Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(), -- The GUID of this person (implied for SIF objects).
    [Number] NVARCHAR(20) NOT NULL,
    [Extension] NVARCHAR(20) NULL, 
    [TypeCodeItemId] UNIQUEIDENTIFIER NOT NULL, -- e.g., 'Home', 'Mobile'
    [ListedStatus] BIT NULL,
    [IsSMS] BIT NULL, 
    CONSTRAINT [BK_Phone] UNIQUE (Number, Extension),
    CONSTRAINT [FK_Phone_Entity] FOREIGN KEY (Id) REFERENCES dbo.Entity(Id),
    CONSTRAINT [FK_Phone_TypeCodeItem] FOREIGN KEY ([TypeCodeItemId]) REFERENCES sif.CodeItem([Id]),
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Information that describes a generic person''s Phone.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Phone';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The GUID of this phone.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Phone', 
    @level2type=N'COLUMN', @level2name='Id';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The phone number.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Phone', 
    @level2type=N'COLUMN', @level2name=N'Number';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The type of the phone number (e.g., ''Home'', ''Mobile'').', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Phone', 
    @level2type=N'COLUMN', @level2name=N'TypeCodeItemId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Indicates whether or not the phone number is available to the public.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Phone', 
    @level2type=N'COLUMN', @level2name=N'ListedStatus';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Comes from PowerSchool and indicated if the Phone supports SMS text msgs. ', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Phone', 
    @level2type=N'COLUMN', @level2name=N'IsSMS';
GO