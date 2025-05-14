CREATE PROCEDURE [dbo].[StudentUpdate]
(
	@pAppUserId uniqueidentifier,
	@pNonDocumentParams nvarchar(max)
)

AS

BEGIN
DECLARE GuardianCursor CURSOR FOR
	SELECT
		Id,
		GuardianId,
		RelationshipCodeItemId,
		ParentLegalGuardian,
		LivesWith,
		ReceivesMail,
		EmergencyContact,
		ContactSequence,
		RelationshipNote
	FROM
		OPENJSON(@pNonDocumentParams, '$.Guardians') WITH
		(
			Id uniqueidentifier '$.Id',
			GuardianId uniqueidentifier '$.GuardianId',
			RelationshipCodeItemId uniqueidentifier '$.RelationshipCodeItemId',
			ParentLegalGuardian bit '$.ParentLegalGuardian',
			LivesWith bit '$.LivesWith',
			ReceivesMail bit '$.ReceivesMail',
			EmergencyContact bit '$.EmergencyContact',
			ContactSequence int '$.ContactSequence',
			RelationshipNote nvarchar(max) '$.RelationshipNote'
		);
		
BEGIN TRANSACTION STUDENT_UPDATE;
BEGIN TRY
	DECLARE
		@vPersonInfoId uniqueidentifier;
	SELECT @vPersonInfoId = PersonInfoId FROM sif.StudentPersonal WHERE Id = JSON_VALUE(@pNonDocumentParams, '$.Id');
	SET @pNonDocumentParams = JSON_MODIFY(@pNonDocumentParams, '$.PersonInfoId', CAST(@vPersonInfoId AS varchar(48)));
	EXEC dbo.PersonInfoUpdate @pAppUserId, @pNonDocumentParams;

	UPDATE dbo.Entity SET UpdatedOn = CURRENT_TIMESTAMP, UpdatedBy = @pAppUserId WHERE Id = JSON_VALUE(@pNonDocumentParams, '$.Id');
	UPDATE
		sif.StudentPersonal
	SET
		StateAssignedId = dbo.EscCode2Sym(JSON_VALUE(@pNonDocumentParams, '$.StudentNumber'))
	WHERE
		Id = JSON_VALUE(@pNonDocumentParams, '$.Id');

	DECLARE @tbd TABLE
	(
		StudentGuardianRelationshipId uniqueidentifier,
		TBD bit
	);
    INSERT INTO
		@tbd
	(
		StudentGuardianRelationshipId,
        TBD
	)
    SELECT
		Id,
        1
	FROM
		sif.StudentContactRelationship
	WHERE
		StudentPersonalId = JSON_VALUE(@pNonDocumentParams, '$.Id');

	DECLARE
		@vStudentGuardianRelationshipId uniqueidentifier,
		@vGuardianId uniqueidentifier,
		@vRelationshipCodeItemId uniqueidentifier,
		@vParentLegalGuardian bit,
		@vLivesWith bit,
		@vReceivesMail bit,
		@vEmergencyContact bit,
		@vContactSequence int,
		@vRelationshipNote nvarchar(max)
		
	OPEN GuardianCursor
	WHILE NULL IS NULL
	BEGIN
		FETCH NEXT FROM
			GuardianCursor
		INTO
			@vStudentGuardianRelationshipId,
			@vGuardianId,
			@vRelationshipCodeItemId,
			@vParentLegalGuardian,
			@vLivesWith,
			@vReceivesMail,
			@vEmergencyContact,
			@vContactSequence,
			@vRelationshipNote;
		IF @@FETCH_STATUS <> 0
			BREAK;

		IF EXISTS ( SELECT * FROM sif.StudentContactRelationship WHERE Id = @vStudentGuardianRelationshipId )
		BEGIN
			UPDATE @tbd SET TBD = 0 WHERE StudentGuardianRelationshipId = @vStudentGuardianRelationshipId;
			UPDATE
				sif.StudentContactRelationship
			SET
				StudentContactPersonalId = @vGuardianId,
				RelationshipCodeItemId = @vRelationshipCodeItemId,
				ParentLegalGuardian = @vParentLegalGuardian,
				LivesWith = @vLivesWith,
				ReceivesMail = @vReceivesMail,
				EmergencyContact = @vEmergencyContact,
				ContactSequence = @vContactSequence,
				RelationshipNote = dbo.EscCode2Sym(@vRelationshipNote)
			WHERE
				Id = @vStudentGuardianRelationshipId;
		END
		ELSE
		BEGIN
			SET @vStudentGuardianRelationshipId = NEWID();
			INSERT INTO dbo.Entity (Id, SourceKey, CreatedOn, CreatedBy, UpdatedOn, UpdatedBy, Discriminator) VALUES (@vStudentGuardianRelationshipId, 18, CURRENT_TIMESTAMP, @pAppUserId, CURRENT_TIMESTAMP, @pAppUserId, 'sif.StudentContactRelationship');
			INSERT INTO
				sif.StudentContactRelationship
			(
				Id,
				StudentPersonalId,
				StudentContactPersonalId,
				RelationshipCodeItemId,
				ParentLegalGuardian,
				LivesWith,
				ReceivesMail,
				EmergencyContact,
				ContactSequence,
				RelationshipNote
			)
			VALUES
			(
				@vStudentGuardianRelationshipId,
				JSON_VALUE(@pNonDocumentParams, '$.Id'),
				@vGuardianId,
				@vRelationshipCodeItemId,
				@vParentLegalGuardian,
				@vLivesWith,
				@vReceivesMail,
				@vEmergencyContact,
				@vContactSequence,
				dbo.EscCode2Sym(@vRelationshipNote)
			);
		END
	END
	DELETE
		scr
	FROM
		sif.StudentContactRelationship scr,
		@tbd tbd
	WHERE
		tbd.StudentGuardianRelationshipId = scr.Id AND
		tbd.TBD = 1;
	DELETE
		e
	FROM
		dbo.Entity e,
		@tbd tbd
	WHERE
		tbd.StudentGuardianRelationshipId = e.Id AND
		tbd.TBD = 1;

	SELECT CAST(1 AS bit) Success, JSON_OBJECT() ResultSetInJson;

	COMMIT TRANSACTION STUDENT_UPDATE;
END TRY
BEGIN CATCH
	SELECT CAST(0 AS bit) Success, JSON_OBJECT('SqlState': ERROR_STATE(), 'SqlErrorNo': ERROR_NUMBER(), 'ErrorMessage': dbo.Sym2EscCode(ERROR_MESSAGE())) ResultSetInJson;

	ROLLBACK TRANSACTION STUDENT_UPDATE;
END CATCH

IF CURSOR_STATUS('variable','GuardianCursor') = 1
	CLOSE GuardianCursor;
DEALLOCATE GuardianCursor;

END
