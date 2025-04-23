CREATE TABLE [dbo].[CodeSet](
	[ParentCodeSetId] [int] NULL,
	[CodeType] [varchar](50) NOT NULL,
	[Code] [varchar](255) NULL,
	[DisplayValue] [varchar](100) NULL,
	[Description] [varchar](255) NULL,
	[UiDisplayOrder] [int] NOT NULL,
	[IsVisible] [bit] NOT NULL,
	[IsModifiable] [bit] NOT NULL,
	[IsDeletable] [bit] NOT NULL,
	[CodeOrigin] [varchar](50) NOT NULL,
	[WhoCreated] [varchar](50) NOT NULL,
	[WhenCreated] [datetime2](7) NOT NULL,
	[EFFECTIVESTARTDATE]  [datetime2](7) NULL,
	[EFFECTIVEEndDATE]  [datetime2](7) NULL,
	REPORTEDVALUE varchar(255) null, 
	[WhoModified] [varchar](50) NOT NULL,
	[WhenModified] [datetime2](7) NOT NULL,
	[ExcludeFromStateReporting] [bit] NOT NULL,
	[CodeSetId] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CodeSet] ADD  DEFAULT ((0)) FOR [CodeSetId]
GO

-- Add table description
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Copy of the Powerschool CodeSet table. User to do initial load of the sif.CodeSet and sif.CodeItem tables', 
    @level0type=N'SCHEMA', @level0name=N'dbo', 
    @level1type=N'TABLE', @level1name=N'CodeSet';
GO