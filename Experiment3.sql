USE employee;

-- Experiment 3 --
-- Q1. List all employees and jobs in Department 30 in descending order by salary --
SELECT ename, job, sal 
FROM employee 
WHERE deptno = 30 
ORDER BY sal DESC;

-- Q2. List job and Department Number of employees whose name are five letters long begin with "A" and end with "N" --
SELECT ename, job, deptno 
FROM employee 
WHERE ename LIKE 'a___n';

-- Q3. Display the name of employees whose name start with alphabet S --
SELECT ename 
FROM employee 
WHERE ename LIKE 's%';

-- Q4. Display the names of employees whose name ends with alphabet S --
SELECT ename 
FROM employee 
WHERE ename LIKE '%s';

-- Q5. Display the names of employees working in department number 10 or 20 or 40 or employees working as clerks, salesman or analyst. --
SELECT * 
FROM employee 
WHERE deptno IN(10, 20, 40) 
OR job IN('clerk', 'salesman', 'analyst');

-- Q6. Display employee number and names for employees who earn commission --
SELECT empno, ename 
FROM employee 
WHERE comm IS NOT NULL 
AND comm > 0;

-- Q7. Display employee number and total salary for each employee --
SELECT empno, (sal + IFNULL(comm, 0)) 
FROM employee;

-- Q8. Display employee number and annual salary for each employee --
SELECT empno, sal * 12 AS annual_salary 
FROM employee;

-- Q9. Display the names of all employees working as clerks and drawing a salary more than 3,000 --
SELECT * 
FROM employee 
WHERE job = 'clerk' 
AND sal > 3000;

-- Q10. Display the names of employees who are working as clerk, salesman or analyst and drawing a salary more than 3,000 --
SELECT * 
FROM employee 
WHERE job IN ('clerk', 'salesman', 'analyst') 
AND sal > 3000;