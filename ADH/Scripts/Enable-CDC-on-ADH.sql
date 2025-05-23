--
USE [Adh]
GO
EXEC sys.sp_cdc_enable_db; -- Enable CDC on the ADH database
--Msg 22830, Level 16, State 1, Procedure sys.sp_cdc_enable_db_internal, Line 283 [Batch Start Line 3]
--Could not update the metadata that indicates database Adh is enabled for Change Data Capture. 
--  The failure occurred when executing the command '(null)'. 
--  The error returned was 33171: 'Only active directory users can impersonate other active directory users.'. 
--  Use the action and error to determine the cause of the failure and resubmit the request.

SELECT IS_MEMBER('db_owner') AS IsDbOwner; -- need db_owner or sysadmin
SELECT DATABASEPROPERTYEX('Adh', 'Edition') AS Edition;
SELECT is_cdc_enabled FROM sys.databases WHERE name = 'Adh';

select * from cdc.captured_columns
select * from cdc.change_tables

EXEC sys.sp_cdc_enable_table @source_schema = 'dbo', @source_name = 'Entity', @role_name = NULL, @supports_net_changes = 1; -- Enable CDC on a table

EXEC sys.sp_cdc_enable_table @source_schema = 'sif', @source_name = 'Student', @role_name = NULL, @supports_net_changes = 1; -- Enable CDC on a table
EXEC sys.sp_cdc_enable_table @source_schema = 'sif', @source_name = 'PersonInfo', @role_name = NULL, @supports_net_changes = 1; -- Enable CDC on a table
EXEC sys.sp_cdc_enable_table @source_schema = 'sif', @source_name = 'PersonInfo', @role_name = NULL, @supports_net_changes = 1; -- Enable CDC on a table
--...

--CDC creates a change table for each tracked table (e.g., cdc.sif_Student_CT).
SELECT * FROM sys.tables WHERE schema_name(schema_id) = 'cdc';