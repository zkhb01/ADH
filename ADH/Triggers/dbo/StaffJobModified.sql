CREATE TRIGGER [dbo].[StaffJobModified]
ON [dbo].[StaffJob] -- Replace with actual table name when deploying
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @tableName NVARCHAR(128);
    SET @tableName = OBJECT_NAME(OBJECT_ID(QUOTENAME(PARSENAME(OBJECT_NAME(@@PROCID), 1))));
    DECLARE @ids TABLE (Id UNIQUEIDENTIFIER, IsDeleted BIT);
    INSERT INTO @ids (Id, IsDeleted)
    SELECT Id, 0 FROM inserted
    UNION
    SELECT Id, 1 FROM deleted WHERE Id NOT IN (SELECT Id FROM inserted);

    DECLARE @currentId UNIQUEIDENTIFIER, @isDeleted BIT;
    DECLARE id_cursor CURSOR FOR SELECT Id, IsDeleted FROM @ids;
    OPEN id_cursor;
    FETCH NEXT FROM id_cursor INTO @currentId, @isDeleted;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @serializedEntityBefore = NULL;
        SET @serializedEntityAfter = NULL;
        SET @eventType = NULL;

        IF @isDeleted = 1
        BEGIN
            SET @eventType = 'Delete';
            SELECT @serializedEntityBefore = (
                SELECT * FROM deleted WHERE Id = @currentId
                FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
            );
        END
        ELSE
        BEGIN
            SET @eventType = CASE WHEN EXISTS (SELECT * FROM deleted WHERE Id = @currentId) THEN 'Update' 
                                  ELSE 'Insert' END;
            SELECT @serializedEntityAfter = (
                SELECT * FROM inserted WHERE Id = @currentId
                FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
            );
            IF @eventType = 'Update'
            BEGIN
                SELECT @serializedEntityBefore = (
                    SELECT * FROM deleted WHERE Id = @currentId
                    FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
                );
            END
        END

        INSERT INTO [dbo].[ChangeEvent] (
            Id, EntityId, EntityName, EventType, 
            SerializedEntityBefore, SerializedEntityAfter, [TimeStamp]
        )
        VALUES (
            NEWID(), @currentId, @tableName, @eventType, 
            @serializedEntityBefore, @serializedEntityAfter, GETDATE()
        );

        FETCH NEXT FROM id_cursor INTO @currentId, @isDeleted;
    END;

    CLOSE id_cursor;
    DEALLOCATE id_cursor;

END;