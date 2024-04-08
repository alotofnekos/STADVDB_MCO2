
CREATE TABLE stadvdb_vismin.dappointments (
    pxid VARCHAR(32), 
    clinicid VARCHAR(32), 
    doctorid VARCHAR(32), 
    apptid VARCHAR(32) PRIMARY KEY, 
    status VARCHAR(20), 
    is_Virtual ENUM('TRUE','FALSE','NOTAVAILABLE'),
    QueueDate DATETIME, 
    StartTime DATETIME, 
    EndTime DATETIME, 
    app_type VARCHAR(20), 
    RegionName VARCHAR(32),
    Province VARCHAR(32),
);


CREATE TABLE stadvdb_vismin.clinics (
    clinicid varchar(32) primary key, 
	hospitalname varchar(255), 
	IsHospital enum('TRUE','FALSE','NOTAVAILABLE'),
	City varchar(50),
	Province varchar(50), 
	RegionName varchar(255)
);


INSERT INTO stadvdb_vismin.clinics (clinicid, hospitalname, IsHospital, City, Province, RegionName)
SELECT clinicid, hospitalname, IsHospital, City, Province, RegionName
FROM mco1_stadvdb.clinics
WHERE RegionName IN ('Western Visayas (VI)', 'Central Visayas (VII)', 'Eastern Visayas (VIII)',
                      'Bangsamoro Autonomous Region in Muslim Mindanao (BARMM)', 'Zamboanga Peninsula (IX)',
                      'Northern Mindanao (X)', 'Davao Region (XI)', 'SOCCSKSARGEN (Cotabato Region) (XII)',
                      'Caraga (XIII)');


INSERT INTO stadvdb_vismin.dappointments (pxid, clinicid, doctorid, apptid, app_type, is_Virtual, status, TimeQueued, QueueDate, StartTime, EndTime, RegionName, Province)
SELECT pxid, clinicid, doctorid, apptid, app_type, is_Virtual, status, TimeQueued, QueueDate, StartTime, EndTime, RegionName, Province
FROM mco1_stadvdb.DenormalizedAppointments
WHERE RegionName IN ('Western Visayas (VI)', 'Central Visayas (VII)', 'Eastern Visayas (VIII)',
                      'Bangsamoro Autonomous Region in Muslim Mindanao (BARMM)', 'Zamboanga Peninsula (IX)',
                      'Northern Mindanao (X)', 'Davao Region (XI)', 'SOCCSKSARGEN (Cotabato Region) (XII)',
                      'Caraga (XIII)');
                      

