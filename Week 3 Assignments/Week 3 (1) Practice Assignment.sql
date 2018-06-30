/*
Question 1: List the customer number, the name, 
the phone number, and the city of customers.
*/
SELECT CUSTNO, CUSTNAME, PHONE, CITY
FROM CUSTOMER;

/*
Question 2: List the customer number, the name, 
the phone number, and the city of customers 
who reside in Colorado (State is CO).
*/

SELECT CUSTNO, CUSTNAME, PHONE, CITY
FROM CUSTOMER
WHERE STATE = 'CO';

/*
Question 3: List all columns of the EventRequest table 
for events costing more than $4000.  
Order the result by the event date (DateHeld).
*/

SELECT * 
FROM EVENTREQUEST
WHERE ESTCOST > '$4000'
ORDER BY DATEHELD;

/* 
Question 4: List the event number, the event date (DateHeld),
and the estimated audience number with approved status and 
audience greater than 9000 or with pending status and audience 
greater than 7000.
*/

SELECT EVENTNO, DATEHELD, ESTAUDIENCE, STATUS
FROM EVENTREQUEST
WHERE (STATUS = 'Approved' AND ESTAUDIENCE > 9000) 
	OR (STATUS = 'Pending' AND ESTAUDIENCE > 7000);
    
/* 
Question 5: List the event number, event date (DateHeld), 
customer number and customer name of events placed in 
January 2013 by customers from Boulder.
*/

SELECT E.EVENTNO, E.DATEHELD, E.CUSTNO, C.CUSTNAME, E.DATEREQ, C.CITY
FROM EVENTREQUEST as E INNER JOIN CUSTOMER as C
ON E.CUSTNO = C.CUSTNO
WHERE (C.CITY = 'Boulder') AND (E.DATEREQ LIKE '%2013%'); 

-- Change date in the in the Where clause


/*
Question 6: List the average number of resources 
used (NumberFld) by plan number. 
Include only location number L100.
*/

SELECT AVG(NUMBERFLD) AS RESOURCES_USED, LOCNO, PLANNO
FROM EVENTPLANLINE
WHERE LOCNO = 'L100'
GROUP BY PLANNO;

/*
Question 7: List the average number of resources 
used (NumberFld) by plan number. 
Only include location number L100. 
Eliminate plans with less than two event lines 
containing location number L100.
*/

SELECT AVG(NUMBERFLD) AS RESOURCES_USED, LOCNO, PLANNO, LINENO, COUNT(*) AS NumEVENTLINES
FROM EVENTPLANLINE
WHERE LOCNO = 'L100'
GROUP BY PLANNO HAVING COUNT(*)>1;


