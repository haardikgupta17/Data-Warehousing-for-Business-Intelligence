-- Example 1

SELECT Offering.OfferNo, COUNT(*) AS NumSTudents, AVG(StdGPA) AS AvgGPA
FROM Offering INNER JOIN Enrollment ON Enrollment.OfferNo = Offering.OfferNo
INNER JOIN Student ON Enrollment.StdNo = Student.StdNo
WHERE OffYear = 2013 
GROUP BY Offering.OfferNo
HAVING AVG(StdGPA) > 3.3;

-- Example 2

SELECT CourseNo, Enrollment.OfferNo, COUNT(*) AS NumStudents
FROM Offering INNER JOIN Enrollment
ON Offering.OfferNo = Enrollment.OfferNo
WHERE OffYear = 2013 AND OffTerm = 'SPRING'
GROUP BY Enrollment.OfferNo, CourseNo;

-- Example 3

SELECT Enrollment.OfferNo, CourseNo, FacFirstName, FacLastName, AVG(StdGPA) AS AvgGPA
FROM 
	Offering INNER JOIN Enrollment ON Offering.OfferNo = Enrollment.OfferNo
    INNER JOIN Faculty ON Offering.FacNo = Faculty.FacNo
    INNER JOIN Student ON Student.StdNo = Enrollment.StdNo
WHERE OffYear = 2012 AND OffTerm = 'FALL'
GROUP BY Enrollment.OfferNo, CourseNo, FacFirstName, FacLastName
HAVING AVG(StdGPA) > 3.0;