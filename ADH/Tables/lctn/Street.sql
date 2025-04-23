CREATE TABLE [lctn].[Street](
	[Id] [uniqueidentifier] NOT NULL,
	[Number] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AppartmentNumber] [varchar](50) NULL,
	[Quadrant] [varchar](50) NULL,
 [Type] VARCHAR(50) NULL, 
    CONSTRAINT [PK_Street] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [lctn].[Street]  WITH CHECK ADD  CONSTRAINT [FK_Street_Address] FOREIGN KEY([Id])
REFERENCES [lctn].[Address] ([Id])
GO

ALTER TABLE [lctn].[Street] CHECK CONSTRAINT [FK_Street_Address]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Type, as in Street, Avenue, Cresent etc.' , @level0type=N'SCHEMA',@level0name=N'lctn', @level1type=N'TABLE',@level1name=N'Street', @level2type=N'COLUMN',@level2name=N'Type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Compass directions as in N., or S.E.' , @level0type=N'SCHEMA',@level0name=N'lctn', @level1type=N'TABLE',@level1name=N'Street', @level2type=N'COLUMN',@level2name=N'Quadrant'
GO
