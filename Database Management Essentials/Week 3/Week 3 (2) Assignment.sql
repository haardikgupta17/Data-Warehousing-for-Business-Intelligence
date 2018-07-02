-- SELECT STATEMENTS

/*
Question 1: For event requests, list the event number, 
event date (eventrequest.dateheld), and count of the event plans.  
Only include event requests in the result if the event 
request has more than one related event plan with a work 
date in December 2013.
*/

SELECT ER.EventNo, DateHeld, COUNT(EP.PlanNo) AS NUM_EVENT_PLANS
FROM EventRequest ER INNER JOIN EventPlan EP 
ON ER.EventNo = EP.EventNo
WHERE DateHeld BETWEEN '1-Dec-2013' AND '31-Dec-2013'
GROUP BY ER.EventNo, DateHeld
HAVING COUNT(EP.PlanNo) > 1;

/*
Question 2: List the plan number, event number, work date, 
and activity of event plans meeting the 
following two conditions: (1) the work date is in December 2013 and 
(2) the event is held in the “Basketball arena”.  
Your query must not use the facility number (“F101”) of the 
basketball arena in the WHERE clause. 
Instead, you should use a condition on the FacName 
column for the value of “Basketball arena”.
*/

SELECT EP.PlanNo, EP.EventNo, EP.Activity, EP.Workdate
FROM EventPlan EP INNER JOIN EventRequest ER ON ER.EventNo = EP.EventNo
	INNER JOIN Facility F ON F.FacNo = ER.FacNo
WHERE Workdate BETWEEN '2013-12-01' AND '2013-12-31'
	AND FacName = 'BasketBall Arena';
    
    
/*
Question 3: List the event number, event date, status, 
and estimated cost of events where there is an event 
plan managed by Mary Manager and the event is held 
in the basketball arena in the 
period October 1 to December 31, 2013.  
Your query must not use the 
facility number (“F101”) of the basketball arena 
or the employee number (“E101”) of “Mary Manager” 
in the WHERE clause. 
Thus, the WHERE clause should not have conditions 
involving the facility number or employee number 
compared to constant values.
*/

SELECT EP.EventNo, ER.DateHeld, ER.Status, ER.EstCost
FROM EventRequest ER INNER JOIN EventPlan EP ON ER.EventNo = EP.EventNo
	INNER JOIN Employee E ON E.EmpNo = EP.EmpNo INNER JOIN Facility F
		ON F.FacNo = ER.FacNo
WHERE E.EmpName = 'Mary Manager'
	AND ER.DateHeld BETWEEN '2013-10-01' AND '2013-12-31'
    AND F.FacName = 'BasketBall Arena';
    
/*
Question 4: List the plan number, line number, resource name, 
number of resources (eventplanline.number), location name, 
time start, and time end where the event is held at the 
basketball arena, the event plan has activity of 
activity of “Operation”, and the event plan has a work date 
in the period October 1 to December 31, 2013.  
Your query must not use the facility number (“F101”) 
of the basketball arena in the WHERE clause. 
Instead, you should use a condition on the 
FacName column for the value of “Basketball arena”.
*/

SELECT EP.PlanNo, EPL.LineNo, R.ResName, EPL.NumberFld, L.LocName,
	EPL.TimeStart, EPL.TimeEnd
FROM EventPlan EP INNER JOIN EventPlanLine EPL ON EP.PlanNo = EPL.PlanNo
	INNER JOIN ResourceTbl R ON R.ResNo = EPL.ResNo 
		INNER JOIN Location L ON EPL.LocNo = L.LocNo
        INNER JOIN Facility F ON F.FacNo = L.FacNo
WHERE F.FacName = 'BasketBall Arena'
	AND EP.Activity = 'Operation'
    AND EP. WorkDate BETWEEN '2013-10-01' AND '2013-12-31';

-- Database Modification

-- Q1: Insert a new row into the Facility table with facility name “Swimming Pool”.

SELECT *
FROM Facility;

INSERT INTO Facility
    (FacNo, FacName)
VALUES ('F104', 'Swimming Pool');

SELECT *
FROM Facility;

/*
Question 2: Insert a new row in the Location table related 
to the Facility row in modification problem 1. 
The new row should have “Door” for the location name.
*/

SELECT *
FROM Location;

INSERT INTO Location
	(LocNo, FacNo, LocName)
    VALUES ('L107', 'F104', 'Door');
    
SELECT *
FROM Location;

/*
Question 3: Insert a new row in the Location table 
related to the Facility row in modification problem 1. 
The new row should have “Locker Room” for the location name.
*/
SELECT *
FROM Location;

INSERT INTO Location
	(LocNo, FacNo, LocName)
    VALUES ('L108', 'F104', 'Locker Room');
    
SELECT *
FROM Location;

/*
Question 4: Change the location name of “Door” 
to “Gate” for the row inserted in 
modification problem 2.
*/
SELECT *
FROM Location;

SET sql_safe_updates = 0;
UPDATE Location 
SET LocName = 'Gate'
	WHERE LocName = 'Door';

SELECT *
FROM Location;

/*
Question 5: Delete the row inserted in 
modification problem 3
*/

SELECT *
FROM Location;

DELETE FROM Location
WHERE LocNo = 'L108'
	AND LocName = 'Locker Room';
    
SELECT *
FROM Location;