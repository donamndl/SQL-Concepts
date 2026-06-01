USE EMPLOYEE; 

-- Experiment 2 --
-- Q1. List all distinct job in Employee --
SELECT DISTINCT job FROM employee;

-- Q2. List all information about employee in Department Number 30 --
SELECT * FROM employee WHERE deptno = 30;

-- Q3. Find all department number with department names greater than 20 --
SELECT deptno, dname FROM department WHERE deptno > 20;

-- Q4. Find all information about all the managers as well as the clerks in department 30 --
SELECT * FROM employee WHERE job IN ('manager', 'clerk') AND deptno = 30;

-- Q5. List the Employee name, Employee numbers and department of all clerks --
SELECT ename, empno, deptno FROM employee WHERE job = 'clerk';

-- Q6. Find all managers not in department 30 --
SELECT * FROM employee WHERE job = 'manager' AND deptno <> 30;

-- Q7. List information about all Employees in department 10 who are not manager or clerks --
SELECT * FROM employee WHERE deptno = 10 AND job NOT IN ('manager','clerk');

-- Q8. Find Employees where job earning is between 1200 and 1400 --
SELECT * FROM employee WHERE sal BETWEEN 1200 AND 1400;

-- Q9. List Name and Department Number of employee who are clerks, analyst or salesman --
SELECT ename, deptno FROM employee WHERE job IN ('clerk', 'analyst', 'salesman');

-- Q10. List Name and Department Number of employee whose names begins with M --
SELECT ename, deptno FROM employee WHERE ename LIKE 'm%';