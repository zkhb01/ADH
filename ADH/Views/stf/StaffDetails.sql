CREATE VIEW [stf].[StaffDetail]
AS
SELECT
 s.LastName + ', ' + s.FirstName + ISNULL(s.MiddleName, '') + ' (' + s.EmployeeId + ')' AS Employee
, s.StartDate
, e.DeactivatedDate AS EndDate
, j.Title AS Position
, a.Name AS AssignmentType
, l.Code AS [Location]
, CASE WHEN m.Id IS NULL THEN NULL ELSE m.LastName + ', ' + m.FirstName + isnull(m.MiddleName, '') + ' (' + m.EmployeeId + ')' END AS Supervisor
FROM stf.Staff AS s 
JOIN stf.StaffJob AS sj ON sj.StaffId = s.Id 
JOIN dbo.Entity AS e ON e.Id = sj.Id 
LEFT JOIN stf.Job AS j ON j.Id = sj.JobId 
LEFT JOIN stf.JobCategory AS jc ON jc.Id = j.JobCategoryId 
LEFT JOIN stf.JobType AS jt ON jt.Id = j.JobTypeId
LEFT JOIN stf.Job AS sp ON sp.Id = j.SupervisorJobId
LEFT JOIN stf.Staff AS m ON m.Id = sj.ManagerId 
LEFT JOIN lctn.[Location] AS l ON l.Id = sj.LocationId
LEFT JOIN stf.AssignmentType AS a ON a.Id = sj.AssignmentTypeId
GO

