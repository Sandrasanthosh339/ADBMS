CREATE TABLE STUDENT_INFO
(
Sid INT UNIQUE,
Stud_name VARCHAR(20) NOT NULL,
stude_score NUMERIC(5,2) DEFAULT 20
);
DESCRIBE STUDENT_INFO;
ALTER TABLE STUDENT_INFO ADD PRIMARY KEY(Sid);
DESCRIBE STUDENT_INFO;
INSERT INTO STUDENT_INFO (Sid,Stude_name,stude_score) VALUES(101,'Sandra',180);
INSERT INTO STUDENT_INFO VALUES(102,'Athira',148);
INSERT INTO STUDENT_INFO VALUES(103,'Anu',161);
INSERT INTO STUDENT_INFO VALUES(104,'Amrutha',171);
INSERT INTO STUDENT_INFO VALUES(105,'Arathy',135);
UPDATE STUDENT_INFO SET stude_score = stude_score + 5 WHERE stude_score > 150;
SELECT * FROM STUDENT_INFO;

CREATE TABLE worker
(
Worker_Id INT PRIMARY KEY,
first_name VARCHAR(15),
last_name VARCHAR(15),
salary NUMERIC(8),
Joining_date DATE,
department VARCHAR(15)
);
DESCRIBE worker;

CREATE TABLE bonus
(
Worker_Id INT,
bonus_date DATE,
bonus_amount NUMERIC(6)
);
DESCRIBE bonus;
ALTER TABLE bonus ADD CONSTRAINT fk_cod_csd FOREIGN KEY(Worker_ID) 
REFERENCES worker(Worker_ID) ON DELETE CASCADE ;

INSERT INTO worker(Worker_Id,first_name,last_name,salary,Joining_date,department) VALUES(1,'Monika','Arora',100000,'2014-02-20','HR');
INSERT INTO worker VALUES(2,'Niharika','Verma',80000,'2014-06-11','Admin'),
(3,'Vishal','Singhal',300000,'2014-02-20','HR'),
(4,'Amitabh','Singh',500000,'2014-02-20','Admin'),
(5,'Vivek','Bhati',500000,'2014-06-11','Admin'),
(6,'Vipul','Diwan',200000,'2014-06-11','Account'),
(7,'Satish','Kumar',75000,'2014-01-20','Account'),
(8,'Geetika','Chauhan',90000,'2014-04-11','Admin');
SELECT * FROM worker;

INSERT INTO bonus (Worker_Id,bonus_date,bonus_amount)VALUES(1,'2016-02-20',5000);
INSERT INTO bonus VALUES(2,'2016-06-11',3000),
(3,'2016-02-20',4000),
(1,'2016-02-20',4500),
(2,'2016-06-11',3500); 
SELECT * FROM bonus;

SELECT first_name AS WORKER_NAME FROM WORKER ;
SELECT * FROM worker ORDER BY trim(first_name) ASC ;
SELECT * FROM worker WHERE trim(first_name) !='Vipul' AND trim(first_name) !='Satish';
SELECT * FROM worker WHERE department='Admin';
SELECT * FROM worker WHERE salary BETWEEN 100000 AND 500000;
SELECT UPPER(first_name) FROM worker;
SELECT DISTINCT department FROM worker;
SELECT SUBSTR(first_name,1,3) AS name From worker;
SELECT rtrim(first_name) FROM worker;
SELECT ltrim(department) FROM worker;
SELECT  DISTINCT department,LENGTH(department) FROM worker;
SELECT REPLACE(first_name, 'a', 'A') AS fname FROM worker;
SELECT first_name,last_name,department,salary,bonus_amount  FROM worker w,bonus b 
WHERE w.worker_id = b.worker_id AND bonus_amount  > 4000 ;
DELETE FROM worker WHERE worker_id=7;
SELECT * FROM worker;

ALTER TABLE bonus DROP CONSTRAINT fk_cod_csd;
ALTER TABLE bonus ADD CONSTRAINT fk_cod_na FOREIGN KEY(Worker_Id) 
REFERENCES worker(Worker_Id) ON DELETE NO ACTION;

DELETE from worker WHERE worker_id=8;
SELECT * FROM worker;