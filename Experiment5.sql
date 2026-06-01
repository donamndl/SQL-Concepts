use employee;

-- Experiment 5 --
-- Q1. Display the total number of employee working in the company --
SELECT COUNT(*) AS total_employee 
FROM employee;

-- Q2. Display the total salary being paid to all employees --
SELECT SUM(sal) AS total_salary 
FROM employee;

-- Q3. Display the maximum salary from employee table --
SELECT MAX(sal) AS max_salary 
FROM employee;

-- Q4. Display the minimum salary from employee table --
SELECT MIN(sal) AS min_salary 
FROM employee;

-- Q5. Display the average salary from employee table --
SELECT AVG(sal) AS avg_sal 
FROM employee;

-- Q6. Display the maximum salary being paid to clerk --
SELECT MAX(sal) AS max_salary 
FROM employee 
WHERE job = 'clerk'; 

-- Q7. Display the maximum salary being paid in dept no 20 --
SELECT MAX(sal) AS max_salary 
FROM employee 
WHERE deptno = 20;

-- Q8. Display the minimum salary paid to any salesman --
SELECT MIN(sal) AS min_salary 
FROM employee 
WHERE job = 'salesman';

-- Q9. Display the average salary drawn by managers --
SELECT AVG(sal) AS avg_salary 
FROM employee 
WHERE job = 'manager';

-- Q10. Display the total salary drawn by analyst working in dept no 40 --
SELECT SUM(sal) AS total_salary 
FROM employee 
WHERE job = 'analyst' 
AND deptno = 40;

-- Q11. Display the names of the employee in Uppercase --
SELECT UPPER(ename) AS uppercasename 
FROM employee;

-- Q12. Display the names of the employee in Lowercase --
SELECT LOWER(ename) AS lowercasename 
FROM employee;

/* select right('ABCDEF', 3); --> returns the rightmost three elements only that is DEF */

-- Q13. Display the names of the employee in Proper case --
SELECT CONCAT(
    UPPER(LEFT(ename, 1)), 
    LOWER(SUBSTRING(ename, 2))
) AS propercasename FROM employee;

-- Q14. Display the length of Your name using appropriate function -- 
SELECT LENGTH('Dona') AS lengthofname;  -- (Returns the length of the provided string)

-- Q15. Display the length of all the employee names --
SELECT ename, LENGTH(ename) AS namelength FROM employee;  -- (Returns the length of all employee names)