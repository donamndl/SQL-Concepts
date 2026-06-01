USE EMPLOYEE;

-- Experiment 12 --
-- Q1. Display those employees whose salary is less than his manager but more than salary of any other managers --
SELECT E.ENAME, E.JOB
FROM EMPLOYEE E 
INNER JOIN EMPLOYEE M
ON E.MGR = M.EMPNO
WHERE E.SAL < M.SAL
AND E.SAL > ANY (
		SELECT SAL 
        FROM EMPLOYEE 
        WHERE JOB = 'MANAGER'
        );
        
-- Q2. Find out the number of employees whose salary is greater than their manager salary --
SELECT COUNT(*) AS TOTAL_EMPLOYEE
FROM EMPLOYEE E INNER JOIN EMPLOYEE M
ON E.MGR = M.EMPNO
WHERE E.SAL > M.SAL;

-- Q3. Display those managers who are not working under president but they are working under any other manager --
SELECT E.ENAME 
FROM EMPLOYEE E JOIN EMPLOYEE M 
ON E.MGR = M.EMPNO
WHERE E.JOB = 'MANAGER' AND M.JOB <> 'PRESIDENT';

-- Q4. Delete those department where no employee working --
DELETE FROM DEPARTMENT
WHERE DEPTNO NOT IN(
		SELECT DISTINCT DEPTNO FROM EMPLOYEE
        );

-- Q5. Delete those records from emp table whose deptno not available in dept table --
DELETE FROM EMPLOYEE
WHERE DEPTNO NOT IN(
		SELECT DEPTNO FROM DEPARTMENT
        );
        
-- Q6. Display those earners whose salary is out of the grade available in sal grade table --
SELECT ENAME, SAL
FROM EMPLOYEE WHERE SAL NOT BETWEEN
(SELECT MIN(MINPAY) FROM SALGRADE) AND
(SELECT MAX(MAXPAY) FROM SALGRADE);

-- Q7. Display employee name, sal, comm. And whose net pay is greater than any other in the company --
SELECT ENAME, SAL, COMM, (SAL + IFNULL(COMM, 0)) AS NET_PAY
FROM EMPLOYEE 
WHERE (SAL + IFNULL(COMM,0)) >= ANY (
		SELECT SAL
        FROM EMPLOYEE
        );
        
-- Q8. Display those employees who are working in sales or research --
SELECT E.ENAME
FROM EMPLOYEE E 
INNER JOIN DEPARTMENT D
ON E.DEPTNO = D.DEPTNO
WHERE D.DNAME IN('SALES','RESEARCH');

-- Q9. Display the grade of jones --
SELECT E.ENAME, S.GRADE 
FROM EMPLOYEE E
JOIN SALGRADE S ON E.SAL
BETWEEN MINPAY AND MAXPAY
WHERE E.ENAME = 'JONES';

-- Q10. Display the department name the no of characters of which is equal to no of employees in any other department --
SELECT D.DNAME 
FROM DEPARTMENT D
WHERE LENGTH(D.DNAME) IN (
		SELECT COUNT(*) 
        FROM EMPLOYEE 
        GROUP BY DEPTNO
        );