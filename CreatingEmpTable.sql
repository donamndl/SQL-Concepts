USE employee;

-- CREATING EMPLOYEE TABLE --
CREATE TABLE employee(
empno INT PRIMARY KEY,
ename VARCHAR(255),
job VARCHAR(255),
mgr INT,
hiredate DATE,
sal INT,
comm INT,
deptno INT);

SHOW TABLES;