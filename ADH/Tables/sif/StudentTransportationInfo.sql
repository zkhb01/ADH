CREATE TABLE sif.StudentTransportationInfo (
    Id UNIQUEIDENTIFIER NOT NULL,
    StudentPersonalId UNIQUEIDENTIFIER NOT NULL,
    [Type] NVARCHAR(50) NOT NULL,
    TypeCodeset NVARCHAR(255) NULL,
    DayOfWeek NVARCHAR(50) NOT NULL,
    DayOfWeekCodeset NVARCHAR(255) NULL,
    SchoolId UNIQUEIDENTIFIER NOT NULL,
    Eligibility NVARCHAR(50) NULL,
    EligibilityCodeset NVARCHAR(255) NULL,
    HomeToSchoolDistance DECIMAL(10,2) NULL,
    WalkToStopDistance DECIMAL(10,2) NULL,
    StopToSchoolDistance DECIMAL(10,2) NULL,
    OriginPoint NVARCHAR(MAX) NULL,
    HomeBusRouteDetail UNIQUEIDENTIFIER NULL,
    HomeBusRouteDetail_SIF_RefObject NVARCHAR(50) NULL,
    TransferPoints NVARCHAR(MAX) NULL,
    SchoolBusRouteDetail NVARCHAR(MAX) NULL,
    DestinationPoint NVARCHAR(MAX) NULL,
    StateAidQualification NVARCHAR(MAX) NULL,
    TransportationStatus NVARCHAR(MAX) NULL,
    PublicExpense NVARCHAR(MAX) NULL,
    CONSTRAINT [PK_StudentTransportationInfo] PRIMARY KEY (Id),
    CONSTRAINT [BK_StudentTransportationInfo] UNIQUE (StudentPersonalId, SchoolId, [Type], [DayOfWeek]),
    CONSTRAINT [FK_StudentTransportationInfo_Entity] FOREIGN KEY (Id) REFERENCES dbo.Entity(Id),
    CONSTRAINT [FK_StudentTransportationInfo_StudentPersonal] FOREIGN KEY (StudentPersonalId) REFERENCES sif.StudentPersonal(Id),

);
GO

-- Add extended properties for table description
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'This object contains transportation information about a student. Students should have at least two StudentTransportInfo objects associated with them: one for inbound information (getting to school) and one for outbound information (leaving school). If their transportation changes based on the day of the week, then a student will have more than two StudentTransportInfo objects.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentTransportationInfo';
GO

-- Add extended properties for column descriptions
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'GUID that identifies this object.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentTransportationInfo', 
    @level2type = N'COLUMN', @level2name = N'Id';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'GUID that identifies the student that this object refers to.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentTransportationInfo', 
    @level2type = N'COLUMN', @level2name = N'StudentPersonalId';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'The direction of transportation that this object refers to.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentTransportationInfo', 
    @level2type = N'COLUMN', @level2name = N'Type';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentTransportationInfo', 
    @level2type = N'COLUMN', @level2name = N'TypeCodeset';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'This attribute indicates the day(s) of the week to which this object refers.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentTransportationInfo', 
    @level2type = N'COLUMN', @level2name = N'DayOfWeek';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentTransportationInfo', 
    @level2type = N'COLUMN', @level2name = N'DayOfWeekCodeset';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'GUID referring to the school that the student attends on these day(s) of the week.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentTransportationInfo', 
    @level2type = N'COLUMN', @level2name = N'SchoolId';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Eligibility status of student for district transportation for this trip. Note: this element has been deprecated—use TransportationStatus and PublicExpense.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentTransportationInfo', 
    @level2type = N'COLUMN', @level2name = N'Eligibility';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'A unique indicator (usually a URL) that points to the codeset used.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentTransportationInfo', 
    @level2type = N'COLUMN', @level2name = N'EligibilityCodeset';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Distance between the student’s home address and the school.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentTransportationInfo', 
    @level2type = N'COLUMN', @level2name = N'HomeToSchoolDistance';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Distance between the student’s address and the bus stop where they are picked up or dropped off.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentTransportationInfo', 
    @level2type = N'COLUMN', @level2name = N'WalkToStopDistance';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Distance between the bus stop where a student is picked up or dropped off and the school.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentTransportationInfo', 
    @level2type = N'COLUMN', @level2name = N'StopToSchoolDistance';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Origin point for the transportation.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentTransportationInfo', 
    @level2type = N'COLUMN', @level2name = N'OriginPoint';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'GUID referring to a BusRouteDetail object that identifies the origin bus stop for an inbound route or the destination bus stop for an outbound route. If the HomeBusRouteDetail element does not exist, then the student does not ride a bus to/from school. Note: this element has been deprecated—use OriginPoint and DestinationPoint.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentTransportationInfo', 
    @level2type = N'COLUMN', @level2name = N'HomeBusRouteDetail';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Value indicating the referenced object type (e.g., BusRouteDetail).', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentTransportationInfo', 
    @level2type = N'COLUMN', @level2name = N'HomeBusRouteDetail_SIF_RefObject';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'List of transfer points for the transportation.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentTransportationInfo', 
    @level2type = N'COLUMN', @level2name = N'TransferPoints';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Details about the school bus route.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentTransportationInfo', 
    @level2type = N'COLUMN', @level2name = N'SchoolBusRouteDetail';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Destination point for the transportation.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentTransportationInfo', 
    @level2type = N'COLUMN', @level2name = N'DestinationPoint';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'State aid qualification information for the transportation.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentTransportationInfo', 
    @level2type = N'COLUMN', @level2name = N'StateAidQualification';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Transportation status of the student.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentTransportationInfo', 
    @level2type = N'COLUMN', @level2name = N'TransportationStatus';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Public expense information for the transportation.', 
    @level0type = N'SCHEMA', @level0name = N'sif', 
    @level1type = N'TABLE', @level1name = N'StudentTransportationInfo', 
    @level2type = N'COLUMN', @level2name = N'PublicExpense';