CREATE TABLE [lctn].[Address](
	[Id] [uniqueidentifier] NOT NULL,
	[Latitude] [decimal](9, 7) NULL,
	[Longitude] [decimal](10, 7) NULL,
	[Street] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[Community] [varchar](255) NULL,
	[StateProvince] [varchar](255) NULL,
	[Country] [varchar](255) NULL,
	[PostalCode] [varchar](255) NULL,
	[TypeCodeSetId] [uniqueidentifier] NULL,
	[TypeId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A number that identies each postal delivery area in a country used as a portion of an address' , @level0type=N'SCHEMA',@level0name=N'lctn', @level1type=N'TABLE',@level1name=N'Address', @level2type=N'COLUMN',@level2name=N'PostalCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique indicator (usually links to a URL) that points to the codeset used.' , @level0type=N'SCHEMA',@level0name=N'lctn', @level1type=N'TABLE',@level1name=N'Address', @level2type=N'COLUMN',@level2name=N'TypeCodeSetId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Link to the type or category of this address. For example, mailing, physical, permanent, etc.' , @level0type=N'SCHEMA',@level0name=N'lctn', @level1type=N'TABLE',@level1name=N'Address', @level2type=N'COLUMN',@level2name=N'TypeId'
GO

