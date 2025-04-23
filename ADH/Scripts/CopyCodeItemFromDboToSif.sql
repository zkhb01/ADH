INSERT INTO [sif].[CodeSet] (
    [Id],
    [Name]
	)
 
select newId(), x.[Name] from (
SELECT Distinct
    [CodeType]  [Name]
FROM [dbo].[CodeSet]
) x
GO

INSERT INTO [sif].[CodeItem] (
    [Id],
    [ParentNumber],
    [CodeSetId],
    [CodeSetName],
    [Code],
    [DisplayValue],
    [Description],
    [UiDisplayOrder],
    [IsVisible],
    [IsModifiable],
    [IsDeletable],
    [CodeOrigin],
    [WhoCreated],
    [WhenCreated],
    [WhoModified],
    [WhenModified],
    [ExcludeFromStateReporting],
    [Number]
)
SELECT 
    NEWID(),                              -- Generate a new uniqueidentifier for [Id]
    [ParentCodeSetId] AS [ParentNumber],  -- Remapped from ParentCodeSetId
    cs.[Id] AS [CodeSetId],
    [CodeType] AS [CodeSetName],          -- Remapped from CodeType
    [Code],
    [DisplayValue],
    [Description],
    [UiDisplayOrder],
    [IsVisible],
    [IsModifiable],
    [IsDeletable],
    [CodeOrigin],
    [WhoCreated],
    [WhenCreated],
    [WhoModified],
    [WhenModified],
    [ExcludeFromStateReporting],
    [CodeSetId] AS [Number]               -- Remapped from CodeSetId
FROM [dbo].[CodeSet] ci
JOIN sif.CodeSet cs on cs.Name = ci.CodeType

go
