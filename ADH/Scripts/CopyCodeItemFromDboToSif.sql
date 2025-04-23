BEGIN
    -- Create a temporary table to store the new Entity Ids and CodeSet Names
    DECLARE @EntityCodeSetMapping TABLE (
        EntityId UNIQUEIDENTIFIER,
        CodeSetName NVARCHAR(MAX) -- Adjust the data type to match your CodeSet.Name column
    );

    -- Populate the temp table with new Ids and CodeSet Names
    INSERT INTO @EntityCodeSetMapping (EntityId, CodeSetName)
    SELECT 
        NEWID(), -- Generate a unique Id for each row
        x.[Name]
    FROM (
        SELECT DISTINCT
            [CodeType] AS [Name]
        FROM [dbo].[CodeSet]
    ) x;

    -- Insert into the Entity table for each new Id
    INSERT INTO [dbo].[Entity]
        ([Id]
        ,[SourceKey]
        ,[DeactivatedDate]
        ,[CreatedOn]
        ,[CreatedBy]
        ,[UpdatedOn]
        ,[UpdatedBy]
        ,[DeletedTimestamp]
        ,[TxCount]
        ,[Category]
        ,[SecurityLevel]
		,[Discriminator])
    SELECT 
        EntityId
        ,0
        ,NULL
        ,GETDATE()
        ,'KHB'
        ,GETDATE()
        ,'KHB'
        ,NULL
        ,0
        ,NULL
        ,0
        ,'CodeSet'
    FROM @EntityCodeSetMapping;

    -- Insert into the CodeSet table, using the corresponding Entity Id
    INSERT INTO [sif].[CodeSet] (
        [Id],
        [Name]
    )
    SELECT 
        EntityId,
        CodeSetName
    FROM @EntityCodeSetMapping;
END;
GO

BEGIN
    -- Create a temporary table to store the new Entity Ids and CodeItem data
    DECLARE @EntityCodeItemMapping TABLE (
        EntityId UNIQUEIDENTIFIER,
        ParentNumber NVARCHAR(MAX), -- Adjust data type as needed
        CodeSetId UNIQUEIDENTIFIER,
        CodeSetName NVARCHAR(MAX), -- Adjust data type to match CodeSetName
        Code NVARCHAR(MAX),        -- Adjust data type as needed
        DisplayValue NVARCHAR(MAX),-- Adjust data type as needed
        Description NVARCHAR(MAX), -- Adjust data type as needed
        UiDisplayOrder INT,
        IsVisible BIT,
        IsModifiable BIT,
        IsDeletable BIT,
        CodeOrigin NVARCHAR(MAX),  -- Adjust data type as needed
        WhoCreated NVARCHAR(MAX),  -- Adjust data type as needed
        WhenCreated DATETIME,
        WhoModified NVARCHAR(MAX), -- Adjust data type as needed
        WhenModified DATETIME,
        ExcludeFromStateReporting BIT,
        Number NVARCHAR(MAX)       -- Adjust data type as needed
    );

    -- Populate the temp table with new Ids and CodeItem data
    INSERT INTO @EntityCodeItemMapping (
        EntityId,
        ParentNumber,
        CodeSetId,
        CodeSetName,
        Code,
        DisplayValue,
        Description,
        UiDisplayOrder,
        IsVisible,
        IsModifiable,
        IsDeletable,
        CodeOrigin,
        WhoCreated,
        WhenCreated,
        WhoModified,
        WhenModified,
        ExcludeFromStateReporting,
        Number
    )
    SELECT 
        NEWID(),                              -- Generate a unique Id for each row
        [ParentCodeSetId] AS [ParentNumber],  
        cs.[Id] AS [CodeSetId],
        [CodeType] AS [CodeSetName],          
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
        [CodeSetId] AS [Number]               
    FROM [dbo].[CodeSet] ci
    JOIN [sif].[CodeSet] cs ON cs.[Name] = ci.[CodeType];

    -- Insert into the Entity table for each new Id
    INSERT INTO [dbo].[Entity]
        ([Id]
        ,[SourceKey]
        ,[DeactivatedDate]
        ,[CreatedOn]
        ,[CreatedBy]
        ,[UpdatedOn]
        ,[UpdatedBy]
        ,[DeletedTimestamp]
        ,[TxCount]
        ,[Category]
        ,[SecurityLevel]
		,[Discriminator])
    SELECT 
        EntityId
        ,0
        ,NULL
        ,WhenCreated
        ,WhoCreated
        ,WhenModified
        ,WhoModified
        ,NULL
        ,0
        ,NULL
        ,0
        ,'CodeItem'
    FROM @EntityCodeItemMapping;


    -- Insert into the CodeItem table, using the corresponding Entity Id
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
        [ExcludeFromStateReporting],
        [Number]
    )
    SELECT 
        EntityId,
        ParentNumber,
        CodeSetId,
        CodeSetName,
        Code,
        DisplayValue,
        Description,
        UiDisplayOrder,
        IsVisible,
        IsModifiable,
        IsDeletable,
        CodeOrigin,
        ExcludeFromStateReporting,
        Number
    FROM @EntityCodeItemMapping;
END;
GO

------

-- standard routines to populate disciminator
update e 
set [Discriminator] = 'CodeItem'
from Entity e  
join sif.CodeItem c on c.Id = e.Id