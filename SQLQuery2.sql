use MyDatabase
--Retrieve All Customer Data
SELECT * FROM customers

--Retrieve All Order Data
SELECT * FROM orders

--Retrieve each customer's name, country and score
SELECT first_name,country,score FROM customers

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