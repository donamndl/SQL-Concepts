USE employee;

-- Experiment 7 --
 -- Q1. Compute the no. of days remaining in this year --
 SELECT DATEDIFF(MAKEDATE(YEAR(CURDATE())+1, 1),
 CURDATE()) AS days_left;
 
 SELECT MAKEDATE(YEAR(CURDATE()), 143);
 
 -- Q2. Find the highest and lowest salaries and the difference between of them --
 SELECT 
 MAX(sal) AS maximum_salary,
 MIN(sal) AS min_minimum,
 MAX(sal) - MIN(sal) AS sal_diff FROM employee;
 
 -- Q3. List employee whose commission is greater than 25% of their salaries --
 SELECT ename, sal, comm FROM employee WHERE comm > sal * 0.25;
 
 -- Q4. Make a query that displays salary in dollar format --
 SELECT CONCAT('$', FORMAT(sal, 2)) FROM employee;
 
 -- Q5. Create a matrix query to display the job, the salary for that job based on department number, and the total salary for that job for all departments, giving each column an appropriate heading --
 SELECT job, 
 SUM(CASE WHEN deptno = 10 THEN sal ELSE 0 END) AS dept10,
 SUM(CASE WHEN deptno = 20 THEN sal ELSE 0 END) AS dept20,
 SUM(CASE WHEN deptno = 30 THEN sal ELSE 0 END) AS dept30,
 SUM(CASE WHEN deptno = 40 THEN sal ELSE 0 END) AS dept40,
 SUM(sal) AS total_payment
 FROM employee 
 GROUP BY job;
 
 -- Q6. Query that will display the total no of employees, and of that total the number who were hired in 1980, 1981, 1982 and 1983. Give appropriate column heading --
 SELECT COUNT(ename) AS total_employee_joined, 
 SUM(CASE WHEN YEAR(hiredate) = 1980 THEN 1 ELSE 0 END) AS year1980,
 SUM(CASE WHEN YEAR(hiredate) = 1981 THEN 1 ELSE 0 END) AS year1981,
 SUM(CASE WHEN YEAR(hiredate) = 1982 THEN 1 ELSE 0 END) AS year1982,
 SUM(CASE WHEN YEAR(hiredate) = 1983 THEN 1 ELSE 0 END) AS year1983
 FROM employee;
 
 -- Q7. Query to get the last Sunday of Any Month --
-- > (last_day function gives the last day of the month)
-- SELECT last_day('2026-05-25');
-- SELECT last_day(curdate());
-- SELECT dayofweek(curdate());
SELECT DATE_SUB(LAST_DAY(CURDATE()),
INTERVAL (DAYOFWEEK(LAST_DAY(CURDATE())) - 1) DAY) AS last_sunday;

 -- Q8. Display department numbers and total number of employees working in each department --
SELECT deptno, COUNT(*) AS total_employees
FROM employee
GROUP BY deptno;

-- Q9. Display the various jobs and total number of employees within each job group --
SELECT job, COUNT(*) AS total_employees
FROM employee
GROUP BY job;

-- Q10. Display the depart numbers and total salary for each department --
SELECT deptno, SUM(sal) AS total_salary
FROM employee
GROUP BY deptno;