USE employee;

-- Experiment 4 --
-- Q1. Display the list of employees who have joined the company before 30th June 80 or after 31st Dec 81 --
SELECT * 
FROM employee 
WHERE hiredate < '1980-06-30'
OR hiredate > '1981-12-31';

-- Q2. Display the names of employees whose names have second alphabet A in their names --
SELECT ename 
FROM employee 
WHERE ename LIKE '_a%';

-- Q3. Display the names of employees whose name is exactly five characters in length --
SELECT ename 
FROM employee 
WHERE ename LIKE '_____';

-- Q5. Display the names of employees who are not working as salesman or clerk or analyst --
SELECT ename 
FROM employee 
WHERE job NOT IN ('salesman', 'clerk', 'analyst');

-- Q6. Display the name of the employee along with their annual salary (sal*12). The name of the employee earning highest salary should appear first --
SELECT ename, sal * 12  
FROM employee 
ORDER BY sal DESC;

-- Q7. Display name, sal, hra, pf, da, totalsal for each employee. The output should be in the order of total sal, hra 15% of sal, da 10% of sal, pf 5% of sal --
SELECT ename, sal, 
       (sal * 0.15) AS HRA, 
       (sal * 0.10) AS DA, 
       (sal * 0.05) AS PF, 
       (sal + (sal * 0.15) + (sal * 0.10)) - (sal * 0.05) AS total_sal 
FROM employee 
ORDER BY total_sal;

-- Q8. Update the salary of each employee by 10% increment who are not eligible for commission --
UPDATE employee
SET sal = sal * 1.10 
WHERE comm IS NULL OR comm = 0;

-- Q9. Display those employees whose salary is more than 3000 after giving 20% increment --
SELECT * FROM EMPLOYEE 
WHERE (SAL * 1.20) > 3000;

-- Q10. Display those employees whose salary contains atleast 3 digits --
SELECT * FROM EMPLOYEE 
WHERE SAL >= 100;