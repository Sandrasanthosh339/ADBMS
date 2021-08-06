CREATE TABLE employee
(ssn INT,
ename VARCHAR(40) NOT NULL,
desig VARCHAR(20),
dno INT,
doj DATE,
salary INT,
PRIMARY KEY (ssn));
drop table employee;

CREATE TABLE department
(dnumber INT,
dname VARCHAR(20),
loc VARCHAR(40),
mgrssn INT REFERENCES employee(ssn),
PRIMARY KEY(dnumber)
);
drop table department;

CREATE TABLE Project
(pnumber INT,
pname VARCHAR(15),
dnum INT,
FOREIGN KEY(dnum) REFERENCES department(dnumber),
PRIMARY KEY(pnumber)
);
drop table Project;

CREATE TABLE Works_in
(essn INT,
pno INT,
hours INT,
FOREIGN KEY (essn)
REFERENCES employee(ssn),
FOREIGN KEY (pno) REFERENCES Project(pnumber),
FOREIGN KEY (hours) REFERENCES department(dnumber)
);
drop table Works_in;
desc Works_in;

INSERT INTO employee(ssn,ename,desig,dno,doj,salary)VALUES(1,'Abhi','HR',2,'2009-04-12',70000 );
INSERT INTO employee VALUES(2,'Sandeep','Finance',1,'2013-01-19',49000 ),
(3,'Bhama','Admin',3,'2008-03-10',75000 ),
(4,'Anu','Sales',5,'2011-06-23',35000 ),
(5,'Rahul','Production',5,'2011-10-12',35000 ),
(6,'Sandra','HR',4,'2015-05-15',65000 ),
(7,'Kiran','Finance',2,'2010-07-26',49000 ),
(8,'Chriz','Production',4,'2015-08-15',32000 );
SELECT * FROM employee;

INSERT INTO department(dnumber,dname,loc)VALUES(1,'Admin','Chennai');
INSERT INTO department (dnumber,dname,loc)VALUES(2,'HR','Banglore');
INSERT INTO department (dnumber,dname,loc)VALUES(3,'Sales','Kochi');
INSERT INTO department (dnumber,dname,loc)VALUES(4,'Finance','Delhi');
INSERT INTO department (dnumber,dname,loc)VALUES(5,'Production','Trivandrum');
SELECT * FROM department;

UPDATE department SET mgrssn=2 WHERE dnumber=1;
UPDATE department SET mgrssn=1 WHERE dnumber=2; 
UPDATE department SET mgrssn=3 WHERE dnumber=3; 
UPDATE department SET mgrssn=6 WHERE dnumber=4; 
UPDATE department SET mgrssn=7 WHERE dnumber=2;
UPDATE department SET mgrssn=4 WHERE dnumber=5; 
UPDATE department SET mgrssn=5 WHERE dnumber=5;  

truncate Project;

INSERT INTO Project(pnumber,pname,dnum)VALUES(11,'Bancs',3),
(12,'Nielesan',5),(13,'WorldBank',1),(14,'Airlines',2),(15,'Amex',4);
SELECT * FROM Project;

INSERT INTO Works_in(essn,pno,hours)VALUES(1,14,NULL),(4,13,NULL),(8,12,NULL),
(6,15,NULL),(2,11,NULL),(3,13,NULL);
SELECT * FROM Works_in;
truncate Works_in;

SELECT e.ename FROM employee e LEFT OUTER JOIN department d on d.dnumber=e.dno
WHERE e.salary BETWEEN 30000 AND 40000 AND d.dnumber=5;

SELECT e.ename,d.dname FROM employee e LEFT OUTER JOIN department d on e.dno=d.dnumber
ORDER BY d.dname ASC,e.ename ASC;

SELECT p.pnumber,p.pname,count(e.SSN) FROM Works_in w LEFT OUTER JOIN Project p on
w.pno=p.pnumber LEFT OUTER JOIN employee e on w.essn=e.ssn GROUP BY
p.pname,p.pnumber;

SELECT p.pnumber,p.pname,count(e.ssn) FROM Works_in w LEFT OUTER JOIN Project p on
w.pno=p.pnumber LEFT OUTER JOIN employee e on w.essn=e.ssn GROUP BY
p.pname,p.pnumber HAVING count(e.ssn) > 2;

SELECT p.pnumber,p.pname,d.dnumber,count(e.ssn) FROM Project p LEFT OUTER JOIN
department d on d.dnumber=p.DNUM LEFT OUTER JOIN employee e on e.dno=p.DNUM
GROUP BY p.pname,p.pnumber,d.dnumber HAVING d.dnumber=5;

SELECT d.dname,d.dnumber,e.ssn,e.ename,e.desig,e.doj,e.salary FROM department
d,employee e WHERE (SELECT COUNT(*) FROM employee e WHERE e.dno = d.dnumber
AND e.salary> 40000) > 4 AND
e.dno=d.dnumber GROUP BY d.dname,d.dnumber,e.ssn,e.ename,e.desig,e.doj,e.salary;

CREATE VIEW emp_dept_view AS SELECT * FROM employee NATURAL JOIN department;
CREATE SYNONYM emp_dept FOR employe_dept_view;
SELECT * FROM emp_dept;

SELECT * FROM  employee e,department d WHERE e.dno=d.dnumber;

SELECT * FROM employee e,department d WHERE NOT(e.dno=d.dnumber);

SELECT * FROM employee e LEFT OUTER JOIN department d ON e.dno=d.dnumber;

SELECT * FROM employee e RIGHT OUTER JOIN department d ON e.dno=d.dnumber;

SELECT * FROM employee e INNER JOIN department d ON e.dno=d.dnumber;
