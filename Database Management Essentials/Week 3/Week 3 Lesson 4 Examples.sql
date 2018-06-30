-- Example 1
-- Using the Union operator

SELECT FacNo AS PerNo, FacFirstName AS FirstName, FacLastName AS LastName, FacCity AS City, FacState AS State
FROM Faculty

UNION

SELECT StdNo AS PerNo, StdFirstname AS Firstname, StdLastName AS LastName, StdCity AS City, StdState AS State
FROM Student;

-- Example 2
-- Using the Intersect operator (Oracle only)

SELECT FacNo AS PerNo, FacFirstName AS FirstName, FacLastName AS LastName, FacCity AS City, FacState AS State
FROM Faculty

UNION ALL

SELECT StdNo AS PerNo, StdFirstname AS Firstname, StdLastName AS LastName, StdCity AS City, StdState AS State
FROM Student;

-- Example 3
-- Using the Minus operator (Oracle only)

SELECT FacNo AS PerNo, FacFirstName AS FirstName, FacLastName AS LastName, FacCity AS City, FacState AS State
FROM Faculty

MINUS

SELECT StdNo AS PerNo, StdFirstname AS Firstname, StdLastName AS LastName, StdCity AS City, StdState AS State
FROM Student;

-- For MySQL use NOT IN
SELECT FacNo AS PerNo, FacFirstName AS 
       FirstName, FacLastName AS LastName, 
       FacCity AS City, FacState AS State
 FROM Faculty
   WHERE (FacNO, FacFirstName, FacLastName,
	FacCity, FacState) NOT IN
(
SELECT StdNo AS PerNo, StdFirstName AS
       FirstName, StdLastName AS LastName, 
       StdCity AS City, StdState AS State
 FROM Student);