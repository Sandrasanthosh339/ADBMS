CREATE TABLE EMP
(
empno INT,
ename VARCHAR(25),
job VARCHAR(25),
salary INT(10),
commission INT(7),
deptno INT
);

DESCRIBE TABLE EMP;
INSERT INTO EMP (empno,ename,job,salary,deptno) VALUES (7369,'SMITH','CLERK',800,20);
SELECT * FROM EMP;
INSERT INTO EMP VALUES(7499,'ALLEN','SALESMAN',1600,300,30);
INSERT INTO EMP VALUES(7521,'WARD','SALESMAN',1250,500,30);
INSERT INTO EMP VALUES(7566,'JONES','MANAGER',2975,20);
INSERT INTO EMP (empno,ename,job,salary,deptno) VALUES (7566,'JONES','MANAGER',2975,20);
INSERT INTO EMP VALUES(7654,'MARTIN','SALESMAN',1250,1400,30);
INSERT INTO EMP (empno,ename,job,salary,deptno) VALUES (7698,'BLAKE','MANAGER',2850,30);
INSERT INTO EMP (empno,ename,job,salary,deptno) VALUES (7782,'CLARK','MANAGER',2450,10);
INSERT INTO EMP (empno,ename,job,salary,deptno) VALUES (7788,'SCOTT','ANALYST',3000,20);
INSERT INTO EMP (empno,ename,job,salary,deptno) VALUES (7839,'KING','PRESIDENT',5000,10);
INSERT INTO EMP (empno,ename,job,salary,deptno) VALUES (7844,'TURNER','SALESMAN',1500,30);
INSERT INTO EMP (empno,ename,job,salary,deptno) VALUES (7876,'ADAMS','CLERK',1100,20);
INSERT INTO EMP (empno,ename,job,salary,deptno) VALUES (7900,'JAMES','NULL',950,30);
INSERT INTO EMP (empno,ename,job,salary,deptno) VALUES (7902,'FORD','ANALYST',3000,20);
INSERT INTO EMP (empno,ename,job,salary,deptno) VALUES (7934,'MILLER','CLERK',1300,10);

ALTER TABLE EMP  
ADD COLUMN date_join varchar(50); 

UPDATE EMP
SET date_join='17-DEC-80' WHERE empno= '7369';
UPDATE EMP 
SET DATE_JOIN='1981-02-20' WHERE EMPNO='7499';
UPDATE EMP 
SET DATE_JOIN='1981-02-22' WHERE EMPNO='7521';
UPDATE EMP 
SET DATE_JOIN='1981-04-02' WHERE EMPNO='7566';
UPDATE EMP 
SET DATE_JOIN='1981-09-28' WHERE EMPNO='7654';
UPDATE EMP 
SET DATE_JOIN='1981-05-01' WHERE EMPNO='7698';
UPDATE EMP 
SET DATE_JOIN='1981-06-09' WHERE EMPNO='7782';
UPDATE EMP 
SET DATE_JOIN='1987-04-19' WHERE EMPNO='7788';
UPDATE EMP 
SET DATE_JOIN='1981-11-17' WHERE EMPNO='7839';
UPDATE EMP 
SET DATE_JOIN='1981-09-08' WHERE EMPNO='7844';
UPDATE EMP 
SET DATE_JOIN='1987-05-23' WHERE EMPNO='7876';
UPDATE EMP 
SET DATE_JOIN='1981-12-03' WHERE EMPNO='7900';
UPDATE EMP 
SET DATE_JOIN='1981-12-03' WHERE EMPNO='7902';
UPDATE EMP
SET date_join='23-JAN-82' WHERE empno= '7934';

UPDATE EMP
SET job='CLERK' WHERE job='NULL';
SELECT * FROM EMP;
SELECT DISTINCT job from EMP;
SELECT ename,deptno FROM EMP WHERE deptno IN (20,30);
SELECT ename,salary+commission AS Total_Salary FROM EMP;

SELECT ENAME,SALARY*12 AS ANNUAL_SALARY FROM EMP;
SELECT ename,(salary + IFNULL(commission, 0))  AS total_salary FROM EMP;
SELECT ename,date_join FROM EMP WHERE date_join='03-DEC-81';
SELECT ename,(salary + IFNULL(commission, 0)) AS Total_Salary FROM EMP WHERE ename='MILLER';
DELETE FROM EMP WHERE ename='MILLER';
SELECT ename,deptno FROM EMP;
ALTER TABLE EMP ADD COLUMN total_salary numeric;
UPDATE EMP SET total_salary=(salary + IFNULL(commission, 0)) ;
ALTER TABLE EMP DROP COLUMN commission;
SELECT E.empno,E.salary FROM EMP E INNER JOIN  EMP B ON E.salary = B.salary AND E.empno <> B.empno;

SELECT E.ename,E.salary FROM EMP E INNER JOIN EMP B ON E.salary= B.salary AND E.ename <> B.ename;
SELECT ename AS 'name',empno AS 'emp_id' FROM EMP ;
ALTER TABLE EMP RENAME TO EMPLOYEE;
SELECT * FROM EMPLOYEE;
SELECT ename AS 'name',empno AS 'emp_id' FROM EMPLOYEE;

CREATE TABLE EMP_TAB AS SELECT * FROM EMPLOYEE;
DESCRIBE EMP_TAB;

SELECT DISTINCT * FROM EMP_TAB FULL JOIN EMPLOYEE;
SELECT * FROM EMP_TAB FULL JOIN EMPLOYEE;
SELECT DISTINCT e.empno,e.ename,e.job,e.salary,e.deptno,e.date_join,e.total_salary,
b.empno,b.ename,b.job,b.salary,b.deptno,b.date_join,b.total_salary FROM EMP_TAB e  JOIN 
EMPLOYEE b WHERE e.empno=b.empno;

TRUNCATE TABLE EMPLOYEE;
SELECT * FROM EMPLOYEE;

DROP TABLE EMPLOYEE;