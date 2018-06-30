-- Example1

SELECT OfferNo, Offering.CourseNo, CrsUnits, OffDays, OffLocation, OffTime
FROM Faculty INNER JOIN Offering ON Offering.FacNo = Faculty.FacNo
INNER JOIN Course ON Course.CourseNo = Offering.CourseNo
WHERE OffYear = 2012 AND OffTerm = 'FALL'
AND FacFirstName = 'Leonard'
AND FacLastName = 'Vince';

-- Example2

SELECT Offering.OfferNo, Offering.CourseNo, OffDays, OffLocation, OffTime, FacFirstName, FacLastName
FROM Faculty INNER JOIN Offering ON Faculty.FacNo = Offering.FacNo
INNER JOIN Enrollment ON Offering.OfferNo = Enrollment.OfferNo
INNER JOIN Student ON Student.StdNo = Enrollment.StdNo
WHERE OffYear = 2013 AND OffTerm = 'SPRING'
AND StdFirstName = 'BOB'
AND StdLastName = 'NORBERT';

-- Example3

SELECT Offering.OfferNo, Offering.CourseNo, OffDays, OffLocation, OffTime, CrsUnits, FacFirstName, FacLastName
FROM Faculty INNER JOIN Offering ON Faculty.FacNo = Offering.FacNo
INNER JOIN Enrollment ON Offering.OfferNo = Enrollment.OfferNo
INNER JOIN Student ON Student.StdNo = Enrollment.StdNo
INNER JOIN Course ON Offering.CourseNo = Course.CourseNo
WHERE OffYear = 2013 AND OffTerm = 'SPRING'
AND StdFirstName = 'BOB'
AND StdLastName = 'NORBERT';

