CREATE TABLE LOAN_ACCOUNTS
(
ACCNO CHAR(4),
CUST_NAME VARCHAR(15),
LOAN_AMOUNT DECIMAL(10,2),
INSTALLMENT INT,
INT_RATE DECIMAL(10,2),
START_DATE DATE,
INTEREST DECIMAL(10,2)
);
truncate table LOAN_ACCOUNTS;

ALTER TABLE LOAN_ACCOUNTS ADD COLUMN CATEGORY VARCHAR(15);
DESCRIBE LOAN_ACCOUNTS;

DROP TABLE LOAN_ACCOUNTS;
INSERT INTO LOAN_ACCOUNTS(ACCNO,CUST_NAME,LOAN_AMOUNT,INSTALLMENT,INT_RATE,START_DATE)VALUES
(1001,'R.K GUPTA',300000.00,36,12.00,'2009-07-19');
INSERT INTO LOAN_ACCOUNTS(ACCNO,CUST_NAME,LOAN_AMOUNT,INSTALLMENT,INT_RATE,START_DATE)VALUES
(1002,'S.P SHARMA',500000.00,48,10.00,'2008-03-22'),
(1003,'K.P JAIN',300000.00,36,NULL,'2007-08-03'),
(1004,'M.P YADAV',800000.00,60,10.00,'2008-06-12'),
(1005,'S.P SINHA',200000.00,36,12.50,'2010-03-01'),
(1006,'P SHARMA',700000.00,60,12.50,'2008-05-06'),
(1007,'K.S DHALL',500000.00,48,NULL,'2008-05-03');

UPDATE LOAN_ACCOUNTS SET INT_RATE=11.50 WHERE INT_RATE  IS NULL;
UPDATE Loan_Accounts SET INT_RATE=INT_RATE + 0.5 WHERE LOAN_AMOUNT > 400000;
UPDATE LOAN_ACCOUNTS SET INTEREST=(LOAN_AMOUNT * INT_RATE * INSTALLMENT)/(12*100);
SELECT * FROM LOAN_ACCOUNTS;
DELETE FROM LOAN_ACCOUNTS WHERE START_DATE < '2008-01-01';
SELECT * FROM LOAN_ACCOUNTS;
DELETE FROM LOAN_ACCOUNTS WHERE CUST_NAME LIKE 'K%';
SELECT * FROM LOAN_ACCOUNTS;

SELECT * FROM LOAN_ACCOUNTS WHERE INSTALLMENT < 40;
SELECT ACCNO, LOAN_AMOUNT,START_DATE FROM LOAN_ACCOUNTS WHERE START_DATE < '2009-04-01'; 
SELECT CUST_NAME,INT_RATE,START_DATE FROM LOAN_ACCOUNTS WHERE START_DATE > '2009-04-01'; 
SELECT ACCNO,CUST_NAME, LOAN_AMOUNT FROM LOAN_ACCOUNTS WHERE CUST_NAME LIKE '%SHARMA';
SELECT CUST_NAME, LOAN_AMOUNT FROM LOAN_ACCOUNTS WHERE CUST_NAME LIKE '%a'; 


SELECT ACCNO, CUST_NAME, LOAN_AMOUNT FROM LOAN_ACCOUNTS WHERE CUST_NAME LIKE '%a%';
SELECT ACCNO, CUST_NAME, LOAN_AMOUNT FROM LOAN_ACCOUNTS WHERE NOT(CUST_NAME LIKE '%P%');
DESCRIBE LOAN_ACCOUNTS;
SELECT * FROM LOAN_ACCOUNTS ORDER BY  LOAN_AMOUNT ASC;
SELECT * FROM LOAN_ACCOUNTS ORDER BY  START_DATE DESC;

SELECT * FROM LOAN_ACCOUNTS ORDER BY LOAN_AMOUNT, START_DATE DESC;
SELECT ACCNO, CUST_NAME, LOAN_AMOUNT FROM LOAN_ACCOUNTS WHERE CUST_NAME LIKE 'K%';
SELECT * FROM LOAN_ACCOUNTS WHERE INT_RATE IS NULL;
SELECT * FROM LOAN_ACCOUNTS WHERE INT_RATE IS NOT NULL;
SELECT DISTINCT LOAN_AMOUNT FROM LOAN_ACCOUNTS ;

SELECT * FROM LOAN_ACCOUNTS WHERE START_DATE >'2008-12-31' AND INSTALLMENT >36;
SELECT CUST_NAME,LOAN_AMOUNT FROM LOAN_ACCOUNTS WHERE LOAN_AMOUNT <500000 OR  INT_RATE >12;
SELECT * FROM LOAN_ACCOUNTS WHERE YEAR(START_DATE)='2009';
SELECT * FROM LOAN_ACCOUNTS WHERE LOAN_AMOUNT BETWEEN 400000 AND  500000;
SELECT CUST_NAME,LOAN_AMOUNT,INSTALLMENT FROM LOAN_ACCOUNTS WHERE INSTALLMENT IN(26,36,48);

SELECT CUST_NAME,LOAN_AMOUNT,INT_RATE,
 CASE WHEN INT_RATE  IS NULL THEN '0' ELSE INT_RATE END FROM LOAN_ACCOUNTS;
 
SELECT CUST_NAME,LOAN_AMOUNT,INT_RATE,
 CASE WHEN INT_RATE  IS NULL THEN 'No Interest' ELSE INT_RATE END FROM LOAN_ACCOUNTS;

INSERT INTO LOAN_ACCOUNTS(ACCNO,CUST_NAME,LOAN_AMOUNT,INSTALLMENT,START_DATE)VALUES
(1008,'S.P AAAABD',900000.00,50,'2008-03-22');

UPDATE LOAN_ACCOUNTS SET CUST_NAME='ADAMS' WHERE ACCNO=1008;
SELECT * FROM LOAN_ACCOUNTS;
