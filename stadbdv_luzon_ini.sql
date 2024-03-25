
CREATE TABLE stadvdb_luzon.appointments (
    pxid VARCHAR(32), 
    clinicid VARCHAR(32), 
    doctorid VARCHAR(32), 
    apptid VARCHAR(32) PRIMARY KEY, 
    status VARCHAR(20), 
    TimeQueued DATETIME, 
    QueueDate DATETIME, 
    StartTime DATETIME, 
    EndTime DATETIME, 
    app_type VARCHAR(20), 
    is_Virtual ENUM('TRUE','FALSE','NOTAVAILABLE')
);

CREATE TABLE stadvdb_luzon.clinics (
    clinicid varchar(32) primary key, 
	hospitalname varchar(255), 
	IsHospital enum('TRUE','FALSE','NOTAVAILABLE'),
	City varchar(50),
	Province varchar(50), 
	RegionName varchar(255)
);


INSERT INTO stadvdb_luzon.clinics (clinicid, hospitalname, IsHospital, City, Province, RegionName)
SELECT clinicid, hospitalname, IsHospital, City, Province, RegionName
FROM mco1_stadvdb.clinics
WHERE RegionName IN ('Ilocos Region (I)', 'Cagayan Valley (II)', 'Central Luzon (III)', 'CALABARZON (IV-A)', 'MIMAROPA (IV-B)', 'Bicol Region (V)', 'National Capital Region (NCR)', 'Cordillera Administrative Region (CAR)');


INSERT INTO stadvdb_luzon.appointments (pxid, clinicid, doctorid, apptid, status, TimeQueued, QueueDate, StartTime, EndTime, app_type, is_Virtual)
SELECT a.pxid, a.clinicid, a.doctorid, a.apptid, a.status, a.TimeQueued, a.QueueDate, a.StartTime, a.EndTime, a.app_type, a.is_Virtual
FROM mco1_stadvdb.appointments_2023_present AS a
JOIN mco1_stadvdb.clinics AS c ON a.clinicid = c.clinicid
WHERE c.RegionName IN ('Ilocos Region (I)', 'Cagayan Valley (II)', 'Central Luzon (III)', 'CALABARZON (IV-A)', 'MIMAROPA (IV-B)', 'Bicol Region (V)', 'National Capital Region (NCR)', 'Cordillera Administrative Region (CAR)');


