CREATE TABLE customer
(
cust_id   INT PRIMARY KEY,
cust_name VARCHAR(20) NOT NULL
);
DESCRIBE customer;

CREATE TABLE item
(
item_id INT PRIMARY KEY, 
item_name VARCHAR(25), 
price INT
);
DESCRIBE item;

CREATE TABLE sale
(
bill_no   INT PRIMARY KEY,
bill_date DATE NOT NULL,
cust_id   INT NOT NULL,
item_id   INT NOT NULL,
qty_sold  NUMERIC(6,3) NOT NULL,
FOREIGN KEY(item_id) 
REFERENCES item(item_id),
FOREIGN KEY (cust_id) 
REFERENCES customer(cust_id)
);
DESCRIBE sale;

  
INSERT INTO customer(cust_id,cust_name)VALUES( 1, 'Rekha'),(2,'Anil'),(3,'John'),(4,'Manu'),(5,'Shyam');
SELECT * FROM customer;
   
INSERT INTO item(item_id,item_name,price) VALUES( 101, 'Rusk', 120),(102,'Fruits',50),(103,'Handwash',60),(104,'Cake',420),(105,'Oil',25);
SELECT * FROM item;

INSERT INTO sale (bill_no,bill_date,cust_id,item_id,qty_sold)VALUES ( 10, '2020-10-01', 1, 101, 3); 
INSERT INTO sale VALUES( 11, '2020-10-01', 1, 103, 2),( 12, '2020-10-01', 1, 105, 7),( 13, '2018-10-01', 4, 104, 1),  
( 14, '2018-10-11', 4, 102, 2),( 15, '2018-09-29', 5, 101, 5),( 16, '2019-12-25', 3, 101, 5),( 17, '1995-06-21', 5, 104, 4),
( 18,'2002-04-01', 4, 105, 5),( 19, '2020-02-12', 1, 102, 1);
SELECT * FROM sale;
  
SELECT *FROM customer,item,sale WHERE price      > 200 AND sale.item_id = item.item_id AND 
sale.cust_id = customer.cust_id;
 
SELECT C.cust_id,cust_name,SC.COUNT,SC.bill_date FROM CUSTOMER C,
(SELECT COUNT(ITEM_ID) AS COUNT,bill_date,cust_id FROM SALE GROUP BY bill_date) SC WHERE C.cust_id=SC.cust_id;

SELECT cust_name,  COUNT(item_id), bill_date  FROM customer c,  sale s WHERE c.cust_id = s.cust_id
GROUP BY cust_name,  bill_date HAVING extract(YEAR FROM bill_date) = 2018;

SELECT item_name FROM item,  sale WHERE sale.item_id = item.item_id AND sale.cust_id   = 5;

SELECT item_name,S.bill_date FROM ITEM I,SALE S WHERE I.item_id=S.item_id AND S.bill_date=CURDATE();

SELECT item_name,qty_sold,   price,(qty_sold * price) AS total_amount  FROM customer,   item,   sale
WHERE cust_name  = 'Rekha' AND sale.item_id = item.item_id AND sale.cust_id = customer.cust_id;