USE EMPLOYEE;

-- Experiment 11 --
-- Q1. Delete those employees who joined the company before 31-dec-82 while there dept location is 'new york' or 'chicago --
DELETE E
FROM EMPLOYEE E
INNER JOIN DEPARTMENT D ON E.DEPTNO = D.DEPTNO
WHERE HIREDATE < '1982-12-31'
AND D.LOCATION IN ('NEW YORK', 'CHICAGO');

 -- SELECT COUNT(*) FROM EMPLOYEE;  -> TO CHECK WHETHER THE 6 ROWS BASED ON ABOVE WERE DELETED OR NOT
 
 -- Q2. Display employee name, job, deptname, location for all who are working as managers --
 SELECT E.JOB, E.ENAME,
 D.DNAME, D.LOCATION
 FROM EMPLOYEE E 
 INNER JOIN DEPARTMENT D ON E.DEPTNO = D.DEPTNO
 WHERE E.JOB = 'MANAGER';
 
 -- Q3 SKIP --
 
 -- Q4. 4. Find out the top 5 earner of company --
 SELECT ENAME, SAL
 FROM EMPLOYEE
 ORDER BY SAL DESC LIMIT 5;
 
 -- Q5. Display the name of those employees who are getting highest salary --
 SELECT ENAME, SAL 
 FROM EMPLOYEE 
 WHERE SAL = (
      SELECT MAX(SAL) FROM EMPLOYEE
      );
      
-- Q6. Display those employees whose salary is equal to average of maximum and minimum --
SELECT ENAME, SAL 
FROM EMPLOYEE 
WHERE SAL = (
		(SELECT MAX(SAL) FROM EMPLOYEE) +
        (SELECT MIN(SAL) FROM EMPLOYEE)) / 2;
        
-- Q7. Display dname where at least 3 are working and display only dname --
SELECT D.DNAME
FROM EMPLOYEE E 
INNER JOIN DEPARTMENT D ON E.DEPTNO = D.DEPTNO
GROUP BY D.DNAME
HAVING COUNT(*) >= 3;
 
-- Q8. Display name of those managers names whose salary is more than average salary of company --
SELECT ENAME, SAL
FROM EMPLOYEE 
WHERE JOB = 'MANAGER'
AND SAL > (
		SELECT AVG(SAL)
        FROM EMPLOYEE
        );
        
-- Q9. Display those managers name whose salary is more than an average salary of his employees --
SELECT M.ENAME 
FROM EMPLOYEE E 
INNER JOIN EMPLOYEE M
WHERE M.JOB = 'MANAGER'
AND M.SAL > (
		SELECT AVG(SAL) 
        FROM EMPLOYEE 
        WHERE E.MGR = M.EMPNO
        ); 
	
-- Q10. Display employee name, sal, comm and net pay for those employees whose net pay are greater than or equal to any other employee salary of the company --
SELECT ENAME, SAL, IFNULL(COMM, 'NO COMMISSION') AS EMPLOYEE_COMM, (SAL + IFNULL(COMM, 0)) AS NET_PAY
FROM EMPLOYEE
WHERE (
		SAL + IFNULL(COMM, 0) >= ANY (
						SELECT SAL FROM EMPLOYEE
                        ));
        