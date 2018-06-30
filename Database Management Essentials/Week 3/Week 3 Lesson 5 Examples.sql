-- Example 1:

INSERT INTO Student 
	(StdNo, StdFirstName, StdLastName, StdCity, StdState, StdZip, StdClass, StdMajor, StdGPA)
    VALUES ('99-99-9999', 'JOE', 'STUDENT', 'SEATAC', 'WA', '98042-1121', 'FR', 'IS', 0.0);

SELECT * 
FROM Student
WHERE StdNo = '99-99-9999';

-- Example 2

SET sql_safe_updates = 0;
UPDATE Student
SET StdMajor = 'ACCT',
	StdClass = 'SO'
	WHERE StdFirstName = 'JOE'
	AND StdLastName = 'STUDENT';
    
SELECT * 
FROM Student
WHERE StdNo = '99-99-9999';

-- Example 3

DELETE FROM Student
WHERE StdFirstName = 'JOE'
	AND StdLastName = 'STUDENT';
    
SELECT *
FROM Student;