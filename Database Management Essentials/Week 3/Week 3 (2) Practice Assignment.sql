/*
Question 1: List the event number, date held, 
customer number, customer name, facility number, 
and facility name of 2013 events placed by 
Boulder customers.
*/

SELECT ER.EventNo, ER.DateHeld, ER.CustNo, 
	C.CustName, F.FacNo, F.FacName
FROM EventRequest ER INNER JOIN Customer C
	ON C.CustNo = ER.CustNo
    INNER JOIN Facility F ON ER.FacNo = F.FacNo
WHERE ER.DateReq LIKE '%2013%' 
		AND C.City = 'Boulder';


/*
Question 2: List the customer number, 
customer name, event number, date held, 
facility number, facility name, and 
estimated audience cost per 
person (EstCost / EstAudience) for events 
held on 2013, in which the estimated 
cost per person is less than $0.2
*/

SELECT C.CustNo, C.CustName, ER.EventNo,
	ER.DateHeld, F.FacName, EstCost/EstAudience AS CostPerPerson 
    
FROM EventRequest ER INNER JOIN Customer C
	ON ER.CustNo = C.CustNo INNER JOIN Facility F ON F.FacNo = ER.FacNo
WHERE ER.DateHeld LIKE '%2013%'
	AND EstCost/EstAudience < 0.2;
    
/*
Question 3:	List the customer number, 
customer name, and total estimated 
costs for Approved events.
The total amount of events is 
the sum of the estimated cost 
for each event. 
Group the results by customer 
number and customer name.
*/

SELECT C.CustNo, C.CustName, SUM(EstCost) AS TotalAmount
FROM EventRequest INNER JOIN Customer C
ON EventRequest.CustNo = C.CustNo
WHERE Status = 'Approved'
GROUP BY C.CustNo, C.CustName;

/*
Question 4: Insert yourself as a new row in the Customer table.
*/

INSERT INTO Customer
	VALUES ('C117', 'XYZ', 'ABC', 'Y', 'Myself', '816803245', 'Delhi', 'DL', 110018);
    
SELECT * FROM Customer;

/*
Question 5: Increase the rate by 10 percent of nurse resource in the resource table.
*/


SET sql_safe_updates = 0;
UPDATE ResourceTbl
SET Rate = Rate * 1.1
WHERE ResName = 'Nurse';

SELECT * FROM ResourceTbl;

/*
Question 6: Delete the new row added to the Customer table.
*/
DELETE FROM Customer
WHERE CustNo = 'C117';

SELECT * FROM Customer;