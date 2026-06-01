USE employee;

-- Experiment 6 --
-- Q1. Display empno, ename, deptno from employee table. Instead of display department numbers display the related department name  --
SELECT E.empno, E.ename,
CASE E.deptno
WHEN 10 THEN 'Research'
WHEN 20 THEN 'Accounting'
WHEN 30 THEN 'Sales'
WHEN 40 THEN 'Operations'
END AS department_name
FROM employee E;

-- Q2. Display your age in days --
SELECT CURDATE() AS currentdate;  -- > returns today's date
SELECT DATEDIFF(CURDATE() , '2005-07-01') AS totaldays;

-- Q3. Display your age in months --
SELECT TIMESTAMPDIFF(MONTH, '2005-07-01', CURDATE()) AS totalmonth;

-- Q4. Display the current date as 15th August Friday Nineteen Ninety-Seven --
SELECT DATE_FORMAT('1997-08-15', '%D %M %Y') AS formatted_date;

-- Q5 & 6. Display the following output for each row from employee table: Scott has joined the company on Wednesday 13th August Nineteen Ninety--
SELECT CONCAT(
    ename, ' has joined the company on ',
    DATE_FORMAT(hiredate,  '%D %M %Y')
) AS output FROM employee;

-- Q7. Find the date for nearest Saturday after current date --
SELECT CURDATE();
SELECT DAYOFWEEK(CURDATE());
SELECT DATE_ADD('2026-05-25', INTERVAL(7 - DAYOFWEEK('2026-05-25')) DAY) AS next_saturday;

-- Q8. Display current time --
SELECT CURTIME() AS currentime;

-- Q9. Display the date three months Before the current date --
SELECT DATE_SUB(CURDATE(), INTERVAL 3 MONTH) AS threemonthsago;

-- Q10. Display those employees who joined in the company in the month of Dec --
SELECT ename, hiredate 
FROM employee 
WHERE MONTH(hiredate) = 12;

-- Q11. Display those employees whose first 2 characters from hire date -last 2 characters of salary --
SELECT  * 
FROM employee 
WHERE LEFT(YEAR(hiredate), 2) = RIGHT(sal, 2);

-- Q12 & 13 skip --

-- Q14. Display those employees who has joined before 15th of the month -- 
SELECT ename, hiredate 
FROM employee
WHERE DAY(hiredate) < 15;

-- Q15. Display those employees whose joining DATE is available in deptno --
SELECT * FROM EMPLOYEE 
WHERE DAY(HIREDATE) = DEPTNO;