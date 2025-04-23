-- ElectronicIdList table (1-to-many with StudentPersonal)
CREATE TABLE sif.StudentElectronicIds (
    [Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
    ElectronicId INT IDENTITY(1,1) NOT NULL,
    StudentId UNIQUEIDENTIFIER NOT NULL,
    ElectronicIdentifier NVARCHAR(50) NOT NULL, -- Simplified representation of ElectronicIdListType
    CONSTRAINT FK_StudentElectronicIds_StudentPersonal FOREIGN KEY (StudentId) 
        REFERENCES sif.StudentPersonal(Id) ON DELETE CASCADE
);
GO