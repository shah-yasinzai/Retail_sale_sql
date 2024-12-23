CREATE DATABASE SQL_Project_p1;
use SQL_Project_p1;
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(15),
    quantiy INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);

SELECT 
    *
FROM
    retail_sales;

SELECT 
    *
FROM
    retail_sales
LIMIT 10;

SELECT 
    COUNT(*)
FROM
    retail_sales
LIMIT 10;

-- find null value 
SELECT 
    *
FROM
    retail_sales
WHERE
    transactions_id IS NULL;

SELECT 
    *
FROM
    retail_sales
WHERE
    sale_date IS NULL;

SELECT 
    *
FROM
    retail_sales
WHERE
    sale_time IS NULL;

-- or condition
SELECT 
    *
FROM
    retail_sales
WHERE
    transactions_id IS NULL
        OR sale_date IS NULL
        OR sale_time IS NULL
        OR customer_id IS NULL
        OR gender IS NULL
        OR age IS NULL
        OR category IS NULL
        OR quantiy IS NULL
        OR price_per_unit IS NULL
        OR cogs IS NULL
        OR total_sale IS NULL;

-- ---------------------------

DELETE FROM retail_sales 
WHERE
    transactions_id IS NULL
    OR sale_date IS NULL
    OR sale_time IS NULL
    OR customer_id IS NULL
    OR gender IS NULL
    OR age IS NULL
    OR category IS NULL
    OR quantiy IS NULL
    OR price_per_unit IS NULL
    OR cogs IS NULL
    OR total_sale IS NULL;

SELECT 
    COUNT(*)
FROM
    retail_sales;

-- DATA EXPLORATION 
-- HOW MANY SALES WE HAVE?
SELECT 
    COUNT(*) AS total_sale
FROM
    retail_sales;

-- how many customers we have
SELECT 
    COUNT(customer_id) AS total_sale
FROM
    retail_sales;

-- how many unique customer we have
SELECT 
    COUNT(DISTINCT customer_id) AS total_sale
FROM
    retail_sales;

SELECT 
    COUNT(DISTINCT category) AS total_sale
FROM
    retail_sales;

SELECT 
    COUNT(*) IS NULL
FROM
    retail_sales;

-- DATA ANALYSIS AND BUSINESS KEY PROBLEMS
-- Q.1 WRITE ALL QUERY TO RETRIVE ALL COLUMNS FOR SALE MADE on '2022-11-05'

SELECT 
    *
FROM
    retail_sales
WHERE
    sale_date = '2022-11-05';

SELECT 
    COUNT(*)
FROM
    retail_sales
WHERE
    sale_date IS NULL;
SELECT 
    *
FROM
    retail_sales;
-- Q.2 WRITE A SQL QUERY TO RETRIEVE ALL TRANSACTION WHERE THE CATEGORY IS 'CLOTHING'
-- AND THE QUANTITY SOLD IS MORE THAN 10 IN THE MONTH OF 'NOV-2022'

SELECT 
    *
FROM
    retail_sales
WHERE
    category = 'Clothing'
        AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
        AND quantiy >= 4;

-- Q3 WRITE A SQL QUERY TO CALCULATE THE TOTAL SALE(TOTAL_SALE) FOR EACH CATEGORY 
SELECT 
    total_sale AS net_sale
FROM
    retail_sales
WHERE
    category = 'clothing'
GROUP BY 1
;
SELECT 
    *
FROM
    retail_sales;
 
 
SELECT 
    category, SUM(total_sale) AS net_sale
FROM
    retail_sales
GROUP BY category;

-- Q3 write a sql query to calculate the total sales (total_sales) for each category

SELECT 
    category,
    SUM(total_sale) AS Net_sale,
    COUNT(*) AS total_order
FROM
    retail_sales
GROUP BY category
;

SELECT 
    category,
    SUM(total_sale) AS Net_sale,
    COUNT(*) AS Total_orders
FROM
    retail_sales
GROUP BY 1;
 
 
-- write a SQL query to find the average age of the customers who purchased item from 
-- the 'beauty' catretail_salesegory

SELECT 
    AVG(age) AS avg_age
FROM
    retail_sales
WHERE
    category = 'Beauty';
 
 -- Q.5 write a query to find all transaction where the total_sale is greater then 1000
SELECT 
    transactions_id
FROM
    retail_sales
WHERE
    total_sale > 1000;
 ;
SELECT 
    *
FROM
    retail_sales
WHERE
    total_sale > 1000;
 
 -- Q.6 Write a SQL query to find the total number of transaction (transaction_id) made by
SELECT 
    gender,
    category,
    COUNT(transactions_id) AS total_transaction
FROM
    retail_sales
GROUP BY gender , category
ORDER BY gender , category;
 
 -- write a sql query to calculate the average sale for each month, find out best selling 
SELECT 
    EXTRACT(YEAR FROM sale_date) AS YEAR,
    EXTRACT(MONTH FROM sale_date) AS month,
    SUM(total_sale) AS total_sale
FROM
    retail_sales
GROUP BY EXTRACT(YEAR FROM sale_date) , EXTRACT(MONTH FROM sale_date)
 
;
 
SELECT 
    EXTRACT(YEAR FROM sale_date) AS YEAR,
    EXTRACT(MONTH FROM sale_date) AS month,
    AVG(total_sale) AS avg_sale
FROM
    retail_sales
GROUP BY 1 , 2
ORDER BY 1 , 2 , 3 DESC


;
SELECT 
    *
FROM
    retail_sales;
-- write a sql query to find the top5 customers based on the highest total sales

 SELECT 
 customer_id,
 sum(total_sale)as TOTAL_SALE
 FROM retail_sales
 group by 1
 order by 2 desc
 limit 5;
  
  -- WRITE A SQK QUERY TO FIND THE NUMBER OF UNIQUE CUSTOMER WHO PURCHASED ITEMS FROM EACH CATEGORY 
  SELECT 
    category, 
    COUNT(DISTINCT customer_id) AS unique_customer
FROM
    retail_sales
group BY category
;