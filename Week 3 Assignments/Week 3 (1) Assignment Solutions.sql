/*
Question 1: List the city, state, 
and zip codes in the customer table.  
Your result should not have duplicates. 
(Hint: The DISTINCT keyword eliminates duplicates.)
*/

SELECT DISTINCT CITY, STATE, ZIP
FROM CUSTOMER;

/*
Question 2: List the name, department, phone number, 
and email address of employees with a phone number 
beginning with “3-”.
*/

SELECT EMPNAME, DEPARTMENT, PHONE, EMAIL
FROM EMPLOYEE
WHERE PHONE LIKE '3-%';

/*
Question 3: List all columns of the resource table 
with a rate between $10 and $20. Sort the result by rate.
*/
SELECT *
FROM RESOURCETBL
WHERE RATE BETWEEN '10' AND '20'
ORDER BY RATE;

/*
Question 4: List the event requests with a status of “Approved” 
	or “Denied” and an authorized date in July 2013. 
    Include the event number, authorization date, and status 
    in the output. 
    (Hint: see the examples in Module 4 for date constants in 
    Oracle and MySQL.)
*/

SELECT EVENTNO, DATEAUTH, STATUS
FROM EVENTREQUEST
WHERE (DATEAUTH BETWEEN '2013-07-01' AND '2013-07-31') 
	AND (STATUS IN ('Approved', 'Pending'));
    
/*
Question 5: List the location number and name of locations that 
are part of the “Basketball arena”.  
Your WHERE clause should not have a condition involving the 
facility number compared to a constant (“F101”). 
Instead, you should use a condition on the FacName column 
for the value of “Basketball arena”.
*/
SELECT L.LOCNO, L.LOCNAME, F.FACNAME
FROM LOCATION AS L INNER JOIN FACILITY AS F
ON L.FACNO = F.FACNO
WHERE F.FACNAME = 'Basketball arena';

/*
Question 6: For each event plan, list the plan number, 
count of the event plan lines, and sum of the number of 
resources assigned.  For example, plan number “P100” has 
4 lines and 7 resources assigned.  
You only need to consider event plans that have at least 
one line.
*/

SELECT PLANNO, COUNT(*) as NumEventLines, SUM(NUMBERFLD) as Resources_assigned
FROM EVENTPLANLINE
GROUP BY PLANNO HAVING COUNT(*) > 1;