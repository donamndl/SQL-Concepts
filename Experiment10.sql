USE EMPLOYEE;

-- Experiment 10 (ADVANCE JOINS CONCEPT) --
-- Q1. Display the names of employees from department number 10 with salary greater than that of any employee working in other departments --
SELECT ENAME 
FROM EMPLOYEE 
WHERE DEPTNO = 10
AND SAL > ANY (
      SELECT SAL FROM EMPLOYEE WHERE DEPTNO <> 10);
      
-- Q2. Display the names of employee from department number 10 with salary greater than that of all employee working in other departments --
SELECT ENAME
FROM EMPLOYEE
WHERE DEPTNO = 10
AND SAL > ALL ( -- TO REMOVE RESTRICTIONS OF RETURNING MULTIPLE ROWS IN SUBQUERY
      SELECT SAL FROM EMPLOYEE WHERE DEPTNO <> 10);

-- Q3. Display the details of employees who are in sales dept and grade is 3 --
SELECT E.* 
FROM EMPLOYEE E 
INNER JOIN DEPARTMENT D ON E.DEPTNO = D.DEPTNO
JOIN SALGRADE SG ON E.SAL BETWEEN MINPAY AND MAXPAY
WHERE D.DNAME = 'SALES' 
AND SG.GRADE = 3;

-- Q4. Display those who are not managers and who are managers anyone --
SELECT ENAME, EMPNO, JOB
FROM EMPLOYEE
WHERE JOB <> 'MANAGER';

-- Q5. Display those employees whose manager name is jones --
SELECT E.ENAME AS EMPLOYEE_NAME,
MG.ENAME AS MANAGAER_NAME
FROM EMPLOYEE E
INNER JOIN EMPLOYEE MG
ON E.MGR = MG.EMPNO
WHERE MG.ENAME = 'JONES';

-- Q6. Display ename who are working in sales dept --
SELECT E.ENAME AS EMPLOYEE_NAME,
D.DNAME AS DEPARTMENT_NAME
FROM EMPLOYEE E
INNER JOIN DEPARTMENT D 
ON E.DEPTNO = D.DEPTNO
WHERE DNAME = 'SALES';

-- Q7. Display employee name, deptname, salary and comm. For those sal in between 2000 to 5000 while location is chicago  --
SELECT E.ENAME AS EMPLOYEE_NAME, D.DNAME AS DEPARTMENT_NAME, 
E.SAL AS EMPLOYEE_SAL, IFNULL(E.COMM, 'NOT ALLOTTED') AS EMPLOYEE_COMM, D.LOCATION AS POSTING_PLACE
FROM EMPLOYEE E
INNER JOIN DEPARTMENT D 
ON E.DEPTNO = D.DEPTNO
WHERE E.SAL BETWEEN 2000 AND 5000
AND D.LOCATION = 'CHICAGO';

-- Q8. Display those employees whose salary greater than his manager salary -- 
SELECT E.ENAME, E.SAL 
FROM EMPLOYEE E 
INNER JOIN EMPLOYEE MG ON E.MGR = MG.EMPNO
AND E.SAL > MG.SAL; 

-- Q9. Display those employees who are working in the same dept where his manager is working --
SELECT E.ENAME, E.DEPTNO 
FROM EMPLOYEE E 
INNER JOIN EMPLOYEE MG ON E.MGR = MG.EMPNO
WHERE E.DEPTNO = MG.DEPTNO;

-- Q10. Display grade and employees name for the dept no 10 or 30 but grade is not 4, while joined the company before 31-dec-82 --
SELECT E.ENAME, E.JOB, E.SAL, SG.GRADE
FROM EMPLOYEE E 
JOIN SALGRADE SG ON E.SAL BETWEEN MINPAY AND MAXPAY
WHERE E.DEPTNO IN (10, 30)
AND SG.GRADE <> 4 
AND E.HIREDATE < '1982-12-31';