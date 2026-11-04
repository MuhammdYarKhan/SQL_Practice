use MyDatabase


--Retrieve All Customer Data
SELECT * FROM customers

--Retrieve All Order Data
SELECT * FROM orders

--Retrieve each customer's name, country and score
SELECT first_name,country,score FROM customers

--SQL Clauses

-- WHERE --

--Retrieve customer with a score not equal to 0
SELECT * FROM customers WHERE score != 0

--Retrieve customer from Germany
SELECT * FROM customers WHERE country = 'Germany'

--Retrieve each customer's name nad country fron Germany
SELECT first_name,country FROM customers WHERE country = 'Germany'

-- ORDER BY --

--Retrieve all customers and sort the result by the highest first
SELECT * FROM customers ORDER BY score DESC

--Retrieve all customers and sort the result by the lowest first
SELECT * FROM customers ORDER BY score ASC

/*Retrieve all customers and sort the result by
the country and then by the highest score*/
SELECT * FROM customers ORDER BY country ASC, score DESC

-- GROUP BY --

--Find the total score for each country
SELECT country,SUM(score) AS Total FROM customers GROUP BY country

--Find the total score and total number of customers for each country
SELECT country,SUM(score) AS Total_Score, COUNT(id) AS Total_customers FROM customers GROUP BY country


-- Having --

/*
Find the average score for each county considering only customers
with score not equal to 0 and return only those countries with
an average score greater then 430
*/

SELECT 
      country,
      AVG(score) AS Avg_src
      FROM customers
      WHERE score != 0
      GROUP BY country
      HAVING AVG(score) > 430

-- DISTINCT is use to remove the dublicates

-- Return Unique list of all countrie
SELECT DISTINCT(country) FROM customers
select * from customers

-- TOP --
SELECT TOP 3 * FROM customers
 
 --Retrieve the top 3 customers with the Highest Score
 SELECT TOP 3 * FROM customers ORDER BY score DESC

 --Retrieve the Lowest 2 Customers based on the Score
 SELECT TOP 2 * FROM customers ORDER BY score ASC

 --Get the Two most Recent Orders
 SELECT * FROM orders

 SELECT TOP 2 * FROM orders ORDER BY order_date DESC

 -- Execution Order VS Coding Order --

 -- Static (Fixed) Values --

 SELECT 123 AS Static_Value
 SELECT id,first_name,'New Customer' AS customer_type FROM customers

 -- Highlight & Execute --

 SELECT * FROM customers WHERE country = 'Germany'

 -- DDL --> Data Defination Language

--> CREATE
--> ALTER
--> DROP

 /*
 Create a new table called persons with columns: id,
 person_name, birth_date and phone
 */

 CREATE TABLE persons(
 id INT NOT NULL,
 person_name VARCHAR(50) NOT NULL,
 birth_date DATE,
 phone VARCHAR(15) NOT NULL,
 CONSTRAINT pk_person PRIMARY KEY (id)
 )

 SELECT * FROM persons

 /*
 SQL Server mein ALTER TABLE command 
 ka use existing table ke structure mein
 changes karne ke liye hota hai.

Yani agar aapne pehle se table create
kar liya hai aur ab usmein koi column add,
delete ya modify karna hai, to aap ALTER TABLE
use karte hain.
 */

 --Add a new column called email to the persons table
    ALTER TABLE persons
    ADD email VARCHAR(50) NOT NULL

    ALTER TABLE persons 
    DROP COLUMN phone


/*
SQL Server mein DROP command
ka use kisi database object ko
completely delete karne ke liye hota hai.

Yani agar aap kisi Table, Database,
View ya Stored Procedure ko permanently
remove karna chahte hain, to DROP command use karte hain.
*/

DROP TABLE persons


-- DML --> Data Manipulation Language
--> INSERT
--> UPDATE
--> DELETE

INSERT INTO customers (id,first_name,country,score) 
VALUES 
      (6, 'Anna', 'USA', NULL),
      (7, 'Sam', NULL, 100)

--Copy data from 'customers' table into 'persons' table
INSERT INTO persons (id, person_name, birth_date, phone)
SELECT
id,
first_name,
NULL,
'Unknown'
FROM customers

select * from persons

-- Change the score of customer 6 to 0

UPDATE customers
SET score = 0
WHERE id = 6

UPDATE customers
SET country = 'UK'
WHERE id = 7

select * from customers
     

  INSERT INTO customers (id,first_name,country,score)
  VALUES (8,'Sahra',NULL,NULL)

  INSERT INTO customers (id,first_name,country,score)
  VALUES (9,'Ben','USA',NULL)

  INSERT INTO customers (id,first_name,country,score)
  VALUES (10,'Vill Jacks','Germany',NULL)

  UPDATE customers
  SET score = 0,
      country = 'UK'
  WHERE id = 8


  UPDATE customers
  SET score = 0
  WHERE score IS NULL

  --Delete all customers with an ID greater then 5.
  DELETE FROM customers WHERE id > 5

  select * from persons

  select * from customers where id > 5

  /*
  TRUNCATE: TRUNCATE SQL Server mein ek
  DDL (Data Definition Language) command 
  hai jo kisi table ke andar mojood tamam 
  records ko ek saath delete kar deti hai, 
  lekin table ka structure, columns, data types 
  aur constraints delete nahi karti. Is command 
  mein WHERE condition use nahi hoti, kyun ke ye 
  specific records ke bajaye poori table ka data 
  remove karti hai. TRUNCATE execute karne ke baad 
  table empty ho jati hai aur agar table mein IDENTITY 
  column ho to uska counter bhi reset ho jata hai.
  Is command ka use tab kiya jata hai jab humein kisi
  table ka existing data completely remove karna ho,
  lekin table ko future use ke liye maintain rakhna ho
  */

  TRUNCATE TABLE persons

  select * from persons

  -- CHAPTER 5 --
  -- FILTERING DATA --

  -- The WHERE operators are

  --> Comparsion operator => =, <>, !=, >, >=, <, <=
  --> Logical Operators   => AND, OR, NOT
  --> Range Operators     => BETWEEN
  --> Membership Operator => IN, NOT IN
  --> Search Operator     => LIKE


  --> Comparsion operator
  --Retrieve all the customers from Germany
  SELECT * FROM customers WHERE country = 'Germany'

  --Retrieve all the customers who are not from Germany
  SELECT * FROM customers WHERE country != 'Germany'
  SELECT * FROM customers WHERE country <> 'Germany'

--Retireve all customerss with a score greater then 500
SELECT * FROM customers WHERE score > 500

--Retireve all customerss with a score of 500 or more
SELECT * FROM customers WHERE score >= 500

--Retrieve all the customers with a score less then 500
SELECT * FROM customers WHERE score < 500

--Retrieve all the customers with a score of 500 or less
SELECT * FROM customers WHERE score <= 500 ORDER BY score DESC


 --> Logical Operators
  
--Retrieve all the customers who are from the USA AND have a score greater then 500
 SELECT * FROM customers WHERE country = 'USA' AND score > 500

--Retrieve all the customers who are either from USA OR have a score greater then 500
 SELECT * FROM customers WHERE country = 'USA' OR score > 500

 /*
 NOT Operator: SQL Server mein NOT
 ek logical operator hai jo kisi condition
 ke result ko reverse (opposite) kar deta hai.
 Agar condition TRUE ho to NOT usay FALSE kar deta 
 hai aur agar condition FALSE ho to TRUE kar deta hai.
 Iska use tab hota hai jab humein kisi specific condition ke opposite 
 records retrieve karne hon. For example, agar humein Students table mein 
 un students ka data chahiye jo Karachi se belong nahi karte, 
 to hum WHERE NOT City = 'Karachi' use kar sakte hain.
 */

 SELECT * FROM customers WHERE NOT country = 'USA'

 --Retrieve all the customers with a score NOT less the 500
 SELECT * FROM customers WHERE NOT score < 500


 --> Range Operators
 SELECT * FROM customers WHERE score BETWEEN 500 AND 900

 --Retrieve all the customers whose score falls in the range between 100 and 599
 SELECT * FROM customers WHERE score BETWEEN 100 AND 500

 SELECT * FROM customers WHERE score >= 100 AND score <= 500

--> Membership Operator
--Retrieve all customers from either Germany OR USA
SELECT * FROM customers WHERE country = 'Germany' OR country = 'USA'

SELECT * FROM customers WHERE country IN ('Germany','USA')


--> Search Operator
--Find all customers whose first name starts with 'M'
SELECT * FROM customers WHERE first_name LIKE 'M%'

--Find all customers whose first name ends with 'n'
SELECT * FROM customers WHERE first_name LIKE '%n'

--Find all customers whose first name contains 'r'
SELECT * FROM customers WHERE first_name LIKE '%r%'

--Find all customers whose first name has 'r' in the thired position
SELECT * FROM customers WHERE first_name LIKE '__r%'

SELECT * FROM customers WHERE first_name LIKE '%i_'