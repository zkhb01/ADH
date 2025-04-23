-- Create the table for persons Address
CREATE TABLE sif.Address (
    [Id] UNIQUEIDENTIFIER NOT NULL,
    AddressLine1 NVARCHAR(255) NOT NULL,
    AddressLine2 NVARCHAR(100) NULL,
    AddressLine3 NVARCHAR(100) NULL,
    Complex NVARCHAR(100) NULL,
    StreetPrefix NVARCHAR(100) NULL,
    StreetName NVARCHAR(255) NULL,
    StreetType NVARCHAR(100) NULL,
    Quadrant NVARCHAR(100) NULL,
    ApartmentType NVARCHAR(100) NULL, 
    ApartmentNumber NVARCHAR(100) NULL, 
    ApartmentNumberPrefix NVARCHAR(100) NULL,
    ApartmentNumberSuffix NVARCHAR(100) NULL,
    City NVARCHAR(50) NOT NULL,
    StateProvinceCodeItemId UNIQUEIDENTIFIER NULL, 
    CountryCodeItemId UNIQUEIDENTIFIER NULL, 
    PostalCode NVARCHAR(20) NOT NULL,
    Latitude DECIMAL(9,6) NULL,
    Longitude DECIMAL(10,6) NULL,
    LastValidated DATETIME NULL, 
    [LastValidatedBy] NVARCHAR(100) NULL, 
    CONSTRAINT [PK_Adderss] PRIMARY KEY (Id),
	CONSTRAINT [FK_Address_Entity] FOREIGN KEY (Id) REFERENCES dbo.Entity(Id),
);
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'One of a person''s address(es).', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Address';
GO

-- Add column descriptions
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The first line of the address.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Address', 
    @level2type=N'COLUMN', @level2name=N'AddressLine1';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The second line of the address.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Address', 
    @level2type=N'COLUMN', @level2name=N'AddressLine2';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The third line of the address.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Address', 
    @level2type=N'COLUMN', @level2name=N'AddressLine3';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The Complex of appartments the address is in.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Address', 
    @level2type=N'COLUMN', @level2name=N'Complex';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The compass direction if before the street name.i.e. N Main st. for North.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Address', 
    @level2type=N'COLUMN', @level2name=N'StreetPrefix';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The name of the street for the address.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Address', 
    @level2type=N'COLUMN', @level2name=N'StreetName';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The descriptor that corresponds to the physical and functional characteristics of a raodway. Avenue, Circle...', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Address', 
    @level2type=N'COLUMN', @level2name=N'StreetType';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The quadrant of the city the address is in. matched to sif StreetSuffix.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Address', 
    @level2type=N'COLUMN', @level2name=N'Quadrant';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Type of apartment, for example, Suite.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Address', 
    @level2type=N'COLUMN', @level2name=N'ApartmentType';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Apartment number prefix', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Address', 
    @level2type=N'COLUMN', @level2name=N'ApartmentNumberPrefix';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Type of apartment, for example, Suite.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Address', 
    @level2type=N'COLUMN', @level2name=N'ApartmentNumber';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Apartment number suffix', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Address', 
    @level2type=N'COLUMN', @level2name=N'ApartmentNumberSuffix';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The name of the city in which an address is located.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Address', 
    @level2type=N'COLUMN', @level2name=N'City';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The abbreviation for the state, province or outlying area in which an address is located.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Address', 
    @level2type=N'COLUMN', @level2name=N'StateProvinceCodeItemId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'The unique two character International Organization for Standardization (ISO) code for the country in which an address is located.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Address', 
    @level2type=N'COLUMN', @level2name=N'CountryCodeItemId';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'A number that identifies each postal delivery area in the locale used as a portion of an address.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Address', 
    @level2type=N'COLUMN', @level2name=N'PostalCode';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'KHB - Carry over from PowerSchool, Provides the GeoCode for Latitude.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Address', 
    @level2type=N'COLUMN', @level2name=N'Latitude';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'KHB - Carry over from PowerSchool, Provides the GeoCode for Longitude.', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Address', 
    @level2type=N'COLUMN', @level2name=N'Longitude';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'KHB - The timestamp of the last time this address was validated against an Adress-Validation service', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Address', 
    @level2type=N'COLUMN', @level2name=N'LastValidated';
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'KHB - The signed-in user that validated the address against an Adress-Validation service', 
    @level0type=N'SCHEMA', @level0name=N'sif', 
    @level1type=N'TABLE', @level1name=N'Address', 
    @level2type=N'COLUMN', @level2name=N'LastValidatedBy';
GO