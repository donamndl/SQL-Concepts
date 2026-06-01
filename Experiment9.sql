USE EMPLOYEE;

-- Experiment 9 (SUB-QUERY CONCEPT) --
-- Q1. Display the name of emp name who earns highest salary --
SELECT * 
FROM EMPLOYEE 
WHERE SAL = (
      SELECT MAX(SAL) 
      FROM EMPLOYEE);
      
-- Q2. Display the employee number and name of employee working as clerk and earning highest salary among clerks --
SELECT EMPNO, ENAME 
FROM EMPLOYEE
WHERE JOB = 'CLERK' 
AND SAL = (
     SELECT MAX(SAL) 
     FROM EMPLOYEE 
     WHERE JOB = 'CLERK');
     
-- Q3. Display the names of the salesman who earns a salary more than the highest salary of any clerk --
SELECT ENAME 
FROM EMPLOYEE 
WHERE JOB = 'SALESMAN' 
AND SAL > (
      SELECT MAX(SAL) 
      FROM EMPLOYEE 
      WHERE JOB = 'CLERK');
      
-- Q4. Display the names of clerks who earn salary more than that of james of that of sal lesser than that of scott --
SELECT ENAME, JOB, SAL 
FROM EMPLOYEE 
WHERE JOB = 'CLERK' 
AND SAL > (
       SELECT SAL 
       FROM EMPLOYEE 
       WHERE ENAME = 'JAMES')
AND SAL < (
      SELECT SAL 
      FROM EMPLOYEE
      WHERE ENAME = 'SCOTT');
      
-- Q5. Display the names of employees who earn a sal more than that of james or that of salary greater than that of scott. --
SELECT ENAME, JOB, SAL 
FROM EMPLOYEE 
WHERE SAL > (
       SELECT SAL 
       FROM EMPLOYEE 
       WHERE ENAME = 'JAMES')
OR SAL < (
      SELECT SAL 
      FROM EMPLOYEE
      WHERE ENAME = 'SCOTT');
      
-- Q6. Display the names of the employees who earn highest salary in their respective departments --
SELECT ENAME, DEPTNO, SAL 
FROM EMPLOYEE E
WHERE SAL = (
      SELECT MAX(SAL) 
      FROM EMPLOYEE
      WHERE DEPTNO = E.DEPTNO);
      
-- Q7. Display the names of employees who earn highest salaries in their respective job groups --
SELECT ENAME, JOB, SAL 
FROM EMPLOYEE E
WHERE SAL = (
      SELECT MAX(SAL) 
      FROM EMPLOYEE
      WHERE JOB = E.JOB);
      
-- Q8. Display the employee names who are working in accounting dept --
SELECT ENAME, JOB 
FROM EMPLOYEE
WHERE DEPTNO = (
      SELECT DEPTNO 
      FROM DEPARTMENT 
      WHERE DNAME = 'ACCOUNTING');
      
-- Q9. Display the employee names who are working in chicago --
SELECT ENAME
FROM EMPLOYEE 
WHERE DEPTNO = (
      SELECT DEPTNO 
      FROM DEPARTMENT 
      WHERE LOCATION ='CHICAGO');
      
-- Q10. Display the job groups having total salary greater than the maximum salary for managers --
SELECT JOB, MAX(SAL) AS TOTAL_SAL
FROM EMPLOYEE 
GROUP BY JOB
HAVING SUM(SAL) > (
       SELECT MAX(SAL) 
       FROM EMPLOYEE 
       WHERE JOB = 'MANAGER');