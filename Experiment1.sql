USE employee;

-- Experiment 1 --
-- Q1. Create Employee_master table with data using Employee table --
CREATE TABLE employee_master AS 
SELECT * FROM employee;

SHOW TABLES;
SELECT * FROM employee_master;

-- Q2. Delete all record into Employee_master whose DeptNo is 10 --
DELETE FROM employee_master
WHERE deptno = 10;

SELECT * FROM employee_master;

-- Q3. Update 10% in his salary of DEPTNO 20 into Employee_Master --
UPDATE employee_master SET sal = sal + (sal * 0.10)
WHERE deptno = 20;

SELECT * FROM employee_master;

-- Q4. Alter SAL with size (10,2) in Employee_Master --
ALTER TABLE employee_master MODIFY sal DECIMAL(10, 2);

DESC employee_master; 
SELECT * FROM employee_master;

-- Q5. Drop Employee master Table --
DROP TABLE employee_master;