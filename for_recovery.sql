-- for recovery in clinics
ALTER TABLE mco1_stadvdb.clinics
ADD COLUMN added_on DATETIME DEFAULT CURRENT_TIMESTAMP;

UPDATE mco1_stadvdb.clinics
SET added_on = CURRENT_TIMESTAMP;

ALTER TABLE stadvdb_luzon.clinics
ADD COLUMN added_on DATETIME DEFAULT CURRENT_TIMESTAMP;

UPDATE stadvdb_luzon.clinics
SET added_on = CURRENT_TIMESTAMP;

ALTER TABLE stadvdb_vismin.clinics
ADD COLUMN added_on DATETIME DEFAULT CURRENT_TIMESTAMP;

UPDATE stadvdb_vismin.clinics
SET added_on = CURRENT_TIMESTAMP;

-- for recovery in appointments
ALTER TABLE mco1_stadvdb.appointments
ADD COLUMN updated_on DATETIME DEFAULT CURRENT_TIMESTAMP;

UPDATE mco1_stadvdb.appointments
SET updated_on = CURRENT_TIMESTAMP;

ALTER TABLE stadvdb_luzon.appointments
ADD COLUMN updated_on DATETIME DEFAULT CURRENT_TIMESTAMP;

UPDATE stadvdb_luzon.appointments
SET updated_on = CURRENT_TIMESTAMP;

ALTER TABLE stadvdb_vismin.appointments
ADD COLUMN updated_on DATETIME DEFAULT CURRENT_TIMESTAMP;

UPDATE stadvdb_vismin.appointments
SET updated_on = CURRENT_TIMESTAMP;
