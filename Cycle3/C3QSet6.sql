CREATE TABLE customer
(cid INT PRIMARY KEY,
cname VARCHAR(40) NOT NULL,
loc VARCHAR(20),
sex VARCHAR(10),
dob DATE
);
DESCRIBE customer;

CREATE TABLE bank_brn
(bcode INT PRIMARY KEY,
bloc VARCHAR(25) NOT NULL,
bstate VARCHAR(25) NOT NULL);

DESCRIBE bank_brn;

CREATE TABLE deposit
(Dacno   INT PRIMARY KEY,
ddate DATE NOT NULL,
damt  INT NOT NULL, 
dtype VARCHAR(25) NOT NULL);

DESCRIBE deposit;

CREATE TABLE loan
(Lacno INT PRIMARY KEY,
ldate DATE NOT NULL,
lamt INT NOT NULL,
ltype VARCHAR(25) NOT NULL);

DESCRIBE loan;

CREATE TABLE accounts_in
(cid INT NOT NULL, 
Bcode INT NOT NULL, 
FOREIGN KEY(Bcode) REFERENCES bank_brn(bcode), FOREIGN KEY(cid) REFERENCES customer(cid));

DESCRIBE accounts_in;

CREATE TABLE depositor
(cid INT NOT NULL,
dacno INT NOT NULL, 
FOREIGN KEY(dacno) REFERENCES deposit(Dacno), FOREIGN KEY(cid) REFERENCES customer(cid));

DESCRIBE depositor;

CREATE TABLE borrower
(cid INT NOT NULL, 
lacno INT NOT NULL, FOREIGN KEY(lacno) REFERENCES loan(Lacno), FOREIGN KEY(cid) REFERENCES customer(cid));

DESCRIBE borrower;

DESCRIBE bank.borrower;

SHOW TABLES;

DROP TABLE customer;
DROP TABLE bank_brn;
DROP TABLE deposit;
DROP TABLE loan;
DROP TABLE borrower;
DROP TABLE accounts_in; 
DROP TABLE depositor;