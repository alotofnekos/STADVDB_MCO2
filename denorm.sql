CREATE TABLE DenormalizedAppointments AS
SELECT 
    a.apptid,
    a.pxid,
    a.doctorid,
    a.clinicid,
    a.app_type,
    a.is_virtual,
    a.status,
    a.QueueDate,
    a.StartTime,
    a.EndTime,
    c.RegionName,
    c.Province
FROM 
    appointments a
JOIN 
    clinics c ON a.clinicid = c.clinicid;
