-- seed initial data (idempotent via MERGE)
MERGE INTO users_apprentice (ID, COACHID, NAME, OTJWEEKLY_RATE, COURSE_START_DATE, COURSEID) KEY(ID) VALUES (1, 1, 'Yara Soler', 6, DATE '2025-01-01', 1);
MERGE INTO users_apprentice (ID, COACHID, NAME, OTJWEEKLY_RATE, COURSE_START_DATE, COURSEID) KEY(ID) VALUES (2, 1, 'Alex Data', 6, DATE '2025-02-01', 1);

-- categories: exact list requested (only these)
MERGE INTO category (ID, CATEGORY) KEY(ID) VALUES (1, 'Workshops & Training');
MERGE INTO category (ID, CATEGORY) KEY(ID) VALUES (2, 'Online Learning');
MERGE INTO category (ID, CATEGORY) KEY(ID) VALUES (3, 'Mentoring & Shadowing');
MERGE INTO category (ID, CATEGORY) KEY(ID) VALUES (4, 'Practical/Workplace Learning');
MERGE INTO category (ID, CATEGORY) KEY(ID) VALUES (5, 'Group Learning');
MERGE INTO category (ID, CATEGORY) KEY(ID) VALUES (6, 'Learning Support');
MERGE INTO category (ID, CATEGORY) KEY(ID) VALUES (7, 'OTHER');

MERGE INTO users_coach (ID, NAME) KEY(ID) VALUES (1, 'Sam Osborne');

MERGE INTO course (ID, COURSE, IS_OFF_THE_JOB, TOTALOTJHOURS) KEY(ID) VALUES (1, 'Software Development', FALSE, 396);

-- Holidays: Yara existing, Alex with holidayMode = true to test behavior
MERGE INTO holiday (ID, APPRENTICEID, HOLIDAY_DAYS, HOLIDAY_MODE) KEY(ID) VALUES (1, 1, 5, FALSE);
MERGE INTO holiday (ID, APPRENTICEID, HOLIDAY_DAYS, HOLIDAY_MODE) KEY(ID) VALUES (2, 2, 2, TRUE);

-- Journal entries

-- KSBs
MERGE INTO ksbs (ID, TYPE, NAME, DESCRIPTION) KEY(ID) VALUES (1, 'K', 'Cloud fundamentals', 'Understanding core cloud concepts: regions, compute, storage, networking.');
MERGE INTO ksbs (ID, TYPE, NAME, DESCRIPTION) KEY(ID) VALUES (2, 'S', 'Cloud security', 'Basic cloud security best-practices: IAM, least privilege, encryption.');
MERGE INTO ksbs (ID, TYPE, NAME, DESCRIPTION) KEY(ID) VALUES (3, 'B', 'Cost optimisation', 'Understanding cost drivers and simple optimisation strategies.');

-- journal_entry_ksbs

-- Timesheets

-- Reset sequences to avoid primary key conflicts when inserting new records
ALTER TABLE journal_entries ALTER COLUMN id RESTART WITH 1;
ALTER TABLE timesheets ALTER COLUMN id RESTART WITH 1;
ALTER TABLE journal_entry_ksbs ALTER COLUMN id RESTART WITH 1;
ALTER TABLE ksbs ALTER COLUMN id RESTART WITH 4;
ALTER TABLE category ALTER COLUMN id RESTART WITH 2;
ALTER TABLE users_apprentice ALTER COLUMN id RESTART WITH 3;
ALTER TABLE users_coach ALTER COLUMN id RESTART WITH 2;
ALTER TABLE course ALTER COLUMN id RESTART WITH 2;
ALTER TABLE holiday ALTER COLUMN id RESTART WITH 3;
