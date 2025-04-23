CREATE TABLE [sif].[CodeItem](
	[Id] [uniqueidentifier] NOT NULL,
	[Number] [int] NOT NULL,
	[ParentNumber] [int] NULL,
	[CodeSetId] [uniqueidentifier] NULL,
	[CodeSetName] [varchar](255) NOT NULL,
	[Code] [varchar](255) NULL,
	[DisplayValue] [varchar](255) NULL,
	[Description] [varchar](255) NULL,
	[UiDisplayOrder] [int] NOT NULL,
	[IsVisible] [bit] NOT NULL,
	[IsModifiable] [bit] NOT NULL,
	[IsDeletable] [bit] NOT NULL,
	[CodeOrigin] [varchar](255) NOT NULL,
	[WhoCreated] [varchar](255) NOT NULL,
	[WhenCreated] [datetime2](7) NOT NULL,
	[WhoModified] [varchar](255) NOT NULL,
	[WhenModified] [datetime2](7) NOT NULL,
	[ExcludeFromStateReporting] [bit] NOT NULL,
 CONSTRAINT [PK_CodeItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO