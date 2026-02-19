🔎 About SQL for Data Analytics

SQL for Data Analytics is a practical guide focused on using SQL to analyze data efficiently inside relational databases.

It emphasizes:

Writing analytical SQL queries

Aggregations & grouping

Window functions

Data cleaning in SQL

Business reporting queries

This book is widely used by data analysts and BI professionals.

📚 What You’ll Learn

1️⃣ Core SQL for Analytics

SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;


SELECT

WHERE

GROUP BY

HAVING

ORDER BY

2️⃣ Joins (Critical for Analytics)

SELECT o.order_id, c.customer_name
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id;


Types:

INNER JOIN

LEFT JOIN

RIGHT JOIN

FULL JOIN

3️⃣ Aggregations & Metrics

SELECT 
    AVG(salary) AS avg_salary,
    MAX(salary) AS highest_salary
FROM employees;

4️⃣ Window Functions (Advanced Analytics)

SELECT 
    employee_name,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;


Used for:

Ranking

Running totals

Moving averages

Percentiles

5️⃣ Business Intelligence Queries

Examples:

Customer lifetime value

Retention rate

Cohort analysis

Revenue growth

💼 Why SQL Is Essential for Data Analytics

Skill	Importance

SQL	⭐⭐⭐⭐⭐
Python	⭐⭐⭐⭐
Excel	⭐⭐⭐
BI Tools	⭐⭐⭐⭐

Most real company data lives in databases, not CSV files.

💻 Practice Setup

You can practice using:

PostgreSQL

MySQL

SQLite

BigQuery

Snowflake

Install PostgreSQL (Example)

sudo apt install postgresql   # Linux


Or use online platforms:

Mode Analytics

LeetCode SQL

HackerRank SQL

🎯 Who Should Read It?

Data Analysts

Business Intelligence Analysts

Data Scientists

Marketing Analysts

Product Analysts

🆚 SQL vs Python for Data Analysis

SQL	                        Python
Query large databases	    Advanced modeling
Fast aggregations	        Machine learning
Business dashboards	        Data science workflows
Production data pipelines	Automation

Best analysts know both.










Below is a complete practical SQL guide with:

✅ Table creation

✅ Sample data inserts

✅ Analytical queries

✅ Aggregations & grouping

✅ Window functions

✅ Data cleaning in SQL

✅ Business reporting queries

This simulates a real sales analytics database.

🏗️ 1️⃣ Create Tables
Customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    state VARCHAR(50),
    city VARCHAR(50)
);

Products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    model VARCHAR(50),
    category VARCHAR(50),
    base_msrp NUMERIC(10,2)
);

Sales
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    dealership_id INT,
    sale_date DATE,
    sales_amount NUMERIC(10,2)
);

📥 2️⃣ Insert Sample Data (10 rows each for simplicity)
Customers
INSERT INTO customers VALUES
(1,'John','Smith','NY','New York'),
(2,'Emma','Brown','CA','Los Angeles'),
(3,'Liam','Johnson','TX','Houston'),
(4,'Olivia','Davis','FL','Miami'),
(5,'Noah','Wilson','NY','Buffalo'),
(6,'Ava','Taylor','CA','San Diego'),
(7,'James','Anderson','TX','Dallas'),
(8,'Sophia','Thomas','FL','Orlando'),
(9,'William','Moore','NY','Albany'),
(10,'Isabella','Martin','CA','San Jose');

Products
INSERT INTO products VALUES
(1,'Model A','SUV',30000),
(2,'Model B','Sedan',25000),
(3,'Model C','Truck',40000),
(4,'Model D','SUV',35000),
(5,'Model E','Sedan',27000),
(6,'Model F','Truck',45000),
(7,'Model G','SUV',32000),
(8,'Model H','Sedan',23000),
(9,'Model I','Truck',50000),
(10,'Model J','SUV',38000);

Sales
INSERT INTO sales VALUES
(1,1,1,101,'2023-01-10',29500),
(2,2,2,102,'2023-01-15',25000),
(3,3,3,103,'2023-02-01',39000),
(4,4,4,101,'2023-02-05',34000),
(5,5,5,102,'2023-02-10',26000),
(6,6,6,103,'2023-03-01',44000),
(7,7,7,101,'2023-03-10',31000),
(8,8,8,102,'2023-03-15',22000),
(9,9,9,103,'2023-04-01',48000),
(10,10,10,101,'2023-04-10',37000);

📊 3️⃣ Writing Analytical SQL Queries
Example: Customer Savings Analysis
SELECT 
    s.sale_id,
    c.first_name,
    p.model,
    p.base_msrp,
    s.sales_amount,
    (p.base_msrp - s.sales_amount) AS savings
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id;

📈 4️⃣ Aggregations & Grouping
Total Sales by Category
SELECT 
    p.category,
    COUNT(*) AS total_sales,
    SUM(s.sales_amount) AS revenue,
    AVG(s.sales_amount) AS avg_sale
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

Sales by State
SELECT 
    c.state,
    SUM(s.sales_amount) AS total_revenue
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.state
ORDER BY total_revenue DESC;

🪟 5️⃣ Window Functions (Advanced Analytics)
Rank Sales by Amount
SELECT 
    sale_id,
    sales_amount,
    RANK() OVER (ORDER BY sales_amount DESC) AS sales_rank
FROM sales;

Running Total of Revenue
SELECT 
    sale_date,
    SUM(sales_amount) OVER (ORDER BY sale_date) AS running_total
FROM sales;

Top Sale per Category
SELECT *
FROM (
    SELECT 
        p.category,
        s.sales_amount,
        ROW_NUMBER() OVER (PARTITION BY p.category ORDER BY s.sales_amount DESC) AS rn
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
) t
WHERE rn = 1;

🧹 6️⃣ Data Cleaning in SQL
Remove NULL values
SELECT *
FROM customers
WHERE state IS NOT NULL;

Replace NULL using COALESCE
SELECT 
    COALESCE(city, 'Unknown') AS city
FROM customers;

Remove Duplicates
SELECT DISTINCT state
FROM customers;

Trim and Standardize Text
UPDATE customers
SET first_name = TRIM(first_name);

📊 7️⃣ Business Reporting Queries
Monthly Revenue Report
SELECT 
    DATE_TRUNC('month', sale_date) AS month,
    SUM(sales_amount) AS total_revenue
FROM sales
GROUP BY month
ORDER BY month;

Best Selling Product
SELECT 
    p.model,
    COUNT(*) AS units_sold
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.model
ORDER BY units_sold DESC
LIMIT 1;

High Discount Sales (Business KPI)
SELECT 
    s.sale_id,
    p.model,
    p.base_msrp,
    s.sales_amount,
    (p.base_msrp - s.sales_amount) AS discount
FROM sales s
JOIN products p ON s.product_id = p.product_id
WHERE s.sales_amount < p.base_msrp - 1000;

🎯 What You Practiced

✔ Joins
✔ Analytical calculations
✔ Grouping & aggregation
✔ Window functions
✔ Data cleaning
✔ Business KPI queries
✔ Revenue reporting













1️⃣ Writing Analytical SQL Queries

What:
Analytical SQL queries are queries designed to analyze, summarize, or derive insights from data rather than just retrieve raw records.

Why:

To understand trends in your data.

To answer business questions (e.g., which products sell most, which customers spend the most).

To prepare data for reports or dashboards.

Where:

Business intelligence tools (Power BI, Tableau)

Data analysis pipelines

Reporting and dashboards

Financial, sales, or operations data analysis

How:

Use JOIN to combine tables

Calculate derived columns (e.g., p.base_msrp - s.sales_amount AS savings)

Use filters with WHERE to focus on relevant data

Example:

SELECT 
    c.first_name,
    p.model,
    (p.base_msrp - s.sales_amount) AS savings
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id;


This calculates how much each customer saved on each purchase.

2️⃣ Aggregations & Grouping

What:
Aggregations summarize data. Functions like SUM, AVG, COUNT, MIN, MAX are used. GROUP BY allows summarizing per category, region, or any grouping column.

Why:

Summarize large datasets into meaningful metrics.

Analyze trends by category, time period, or region.

Where:

Sales reporting

Marketing performance analysis

Financial summaries

Operational KPIs

How:

Use GROUP BY to define grouping

Apply aggregation functions

Example:

SELECT 
    p.category,
    COUNT(*) AS total_sales,
    SUM(s.sales_amount) AS revenue,
    AVG(s.sales_amount) AS avg_sale
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;


This shows total sales, revenue, and average sale per product category.

3️⃣ Window Functions

What:
Window functions perform calculations across a set of rows related to the current row without collapsing the result into a single row like GROUP BY. Examples: ROW_NUMBER(), RANK(), SUM() OVER(...).

Why:

Compare a row to other rows in a dataset

Calculate running totals, ranks, or moving averages

Perform complex analytics without losing detail rows

Where:

Leaderboards

Trend analysis

Time series analysis

Cumulative reporting

How:

Use OVER() to define the window

PARTITION BY to reset the window for groups

ORDER BY to define calculation order

Example:

SELECT 
    sale_id,
    sales_amount,
    RANK() OVER (ORDER BY sales_amount DESC) AS sales_rank
FROM sales;


This ranks sales from highest to lowest, keeping all rows.

4️⃣ Data Cleaning in SQL

What:
Data cleaning ensures accuracy, consistency, and completeness in your database.

Why:

Dirty data leads to wrong insights.

Missing, duplicate, or inconsistent data affects analysis.

Where:

ETL pipelines (Extract → Transform → Load)

Analytics and reporting

Machine learning datasets

How:

Remove NULLs or replace them: COALESCE

Remove duplicates: DISTINCT

Standardize text: TRIM(), UPPER(), LOWER()

Filter invalid values with WHERE

Example:

-- Replace missing city with 'Unknown'
SELECT COALESCE(city, 'Unknown') AS city
FROM customers;

-- Remove duplicates
SELECT DISTINCT state FROM customers;

5️⃣ Business Reporting Queries

What:
SQL queries designed to generate KPIs, dashboards, or summaries that inform business decisions.

Why:

Supports decision-making

Identifies trends, top customers/products, revenue streams

Generates reports automatically

Where:

Management dashboards

Sales and marketing reports

Financial and operational reporting

How:

Combine aggregation, filtering, and sorting

Use GROUP BY, ORDER BY, LIMIT to focus on important data

Calculate derived metrics (discounts, savings, growth)

Example:

-- Monthly revenue report
SELECT 
    DATE_TRUNC('month', sale_date) AS month,
    SUM(sales_amount) AS total_revenue
FROM sales
GROUP BY month
ORDER BY month;

-- High discount sales
SELECT 
    s.sale_id,
    p.model,
    p.base_msrp,
    s.sales_amount,
    (p.base_msrp - s.sales_amount) AS discount
FROM sales s
JOIN products p ON s.product_id = p.product_id
WHERE s.sales_amount < p.base_msrp - 1000;

✅ Summary Table

Topic	What	Why	Where	How
Analytical SQL	Queries to analyze data	Understand trends, metrics	Reports, BI dashboards	JOINs, derived columns, filters
Aggregations & Grouping	Summarize data	Summarize large datasets	Sales, financial, marketing analysis	GROUP BY, SUM, COUNT, AVG
Window Functions	Row-wise calculations across a set	Rank, running totals, moving averages	Leaderboards, time-series analysis	OVER(), PARTITION BY, ORDER BY
Data Cleaning	Ensure accuracy & consistency	Prevent incorrect insights	ETL, ML, analytics	COALESCE, DISTINCT, TRIM(), WHERE
Business Reporting	Generate KPIs & dashboards	Support decision-making	Management dashboards, reports	Aggregations, filters, derived metrics, sorting










“Business Analytics with SQL”

Step 0 – Setup: Drop existing tables

DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS dealerships;

Step 1 – Create Tables

1️⃣ Dealerships

CREATE TABLE dealerships (
    dealership_id INT PRIMARY KEY,
    dealership_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50)
);

2️⃣ Customers

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50)
);

3️⃣ Products

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    model VARCHAR(50),
    category VARCHAR(50),
    base_msrp DECIMAL(10,2),
    year INT
);

4️⃣ Sales

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    dealership_id INT,
    sale_date DATE,
    sales_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id)
);

Step 2 – Insert Sample Data (20 rows each)

Dealerships

INSERT INTO dealerships VALUES
(1,'AutoWorld NYC','New York','NY'),
(2,'Sunshine Motors','Miami','FL'),
(3,'Texas Auto Hub','Dallas','TX'),
(4,'Golden State Cars','Los Angeles','CA'),
(5,'Windy City Motors','Chicago','IL'),
(6,'Desert Drive','Phoenix','AZ'),
(7,'Rocky Mountain Auto','Denver','CO'),
(8,'Lone Star Cars','Houston','TX'),
(9,'Atlantic Auto','Boston','MA'),
(10,'Capital Cars','Washington','DC'),
(11,'Lakeview Motors','Cleveland','OH'),
(12,'Midwest Auto','Detroit','MI'),
(13,'Southern Wheels','Atlanta','GA'),
(14,'Bay Area Autos','San Francisco','CA'),
(15,'NorthStar Cars','Minneapolis','MN'),
(16,'Ocean Drive Motors','San Diego','CA'),
(17,'Empire Autos','Albany','NY'),
(18,'Mountain Peak Motors','Salt Lake City','UT'),
(19,'Riverfront Auto','St. Louis','MO'),
(20,'Palm Coast Cars','Orlando','FL');

Customers

INSERT INTO customers VALUES
(1,'John','Smith','john@email.com','New York','NY'),
(2,'Emma','Brown','emma@email.com','Los Angeles','CA'),
(3,'Liam','Johnson','liam@email.com','Houston','TX'),
(4,'Olivia','Davis','olivia@email.com','Miami','FL'),
(5,'Noah','Wilson','noah@email.com','Buffalo','NY'),
(6,'Ava','Taylor','ava@email.com','San Diego','CA'),
(7,'James','Anderson','james@email.com','Dallas','TX'),
(8,'Sophia','Thomas','sophia@email.com','Orlando','FL'),
(9,'William','Moore','william@email.com','Albany','NY'),
(10,'Isabella','Martin','isabella@email.com','San Jose','CA'),
(11,'Mason','Lee','mason@email.com','Denver','CO'),
(12,'Mia','Garcia','mia@email.com','Phoenix','AZ'),
(13,'Ethan','Martinez','ethan@email.com','Chicago','IL'),
(14,'Charlotte','Robinson','charlotte@email.com','Atlanta','GA'),
(15,'Henry','Clark','henry@email.com','Boston','MA'),
(16,'Amelia','Walker','amelia@email.com','Washington','DC'),
(17,'Lucas','Hall','lucas@email.com','Minneapolis','MN'),
(18,'Harper','Allen','harper@email.com','Cleveland','OH'),
(19,'Alexander','Young','alexander@email.com','St. Louis','MO'),
(20,'Evelyn','King','evelyn@email.com','Orlando','FL');

Products

INSERT INTO products VALUES
(1,'Model A','SUV',30000,2022),
(2,'Model B','Sedan',25000,2022),
(3,'Model C','Truck',40000,2022),
(4,'Model D','SUV',35000,2022),
(5,'Model E','Sedan',27000,2022),
(6,'Model F','Truck',45000,2023),
(7,'Model G','SUV',32000,2023),
(8,'Model H','Sedan',23000,2023),
(9,'Model I','Truck',50000,2023),
(10,'Model J','SUV',38000,2023),
(11,'Model K','SUV',31000,2021),
(12,'Model L','Sedan',26000,2021),
(13,'Model M','Truck',42000,2021),
(14,'Model N','SUV',34000,2021),
(15,'Model O','Sedan',28000,2021),
(16,'Model P','Truck',46000,2020),
(17,'Model Q','SUV',33000,2020),
(18,'Model R','Sedan',24000,2020),
(19,'Model S','Truck',48000,2020),
(20,'Model T','SUV',39000,2020);

Sales

INSERT INTO sales VALUES
(1,1,1,1,'2023-01-10',29500),
(2,2,2,2,'2023-01-15',25000),
(3,3,3,3,'2023-02-01',39000),
(4,4,4,4,'2023-02-05',34000),
(5,5,5,5,'2023-02-10',26000),
(6,6,6,6,'2023-03-01',44000),
(7,7,7,7,'2023-03-10',31000),
(8,8,8,8,'2023-03-15',22000),
(9,9,9,9,'2023-04-01',48000),
(10,10,10,10,'2023-04-10',37000),
(11,11,11,11,'2023-01-12',31500),
(12,12,12,12,'2023-01-18',26000),
(13,13,13,13,'2023-02-03',41000),
(14,14,14,14,'2023-02-07',35000),
(15,15,15,15,'2023-02-11',28000),
(16,16,16,16,'2023-03-03',46500),
(17,17,17,17,'2023-03-12',33500),
(18,18,18,18,'2023-03-17',24500),
(19,19,19,19,'2023-04-02',48500),
(20,20,20,20,'2023-04-11',39500);

Step 3 – Queries (50+ Exercises)

I’ve grouped the queries by topic:

A. Analytical Queries (10)

-- 1. Calculate savings per sale
SELECT s.sale_id, c.first_name, p.model, p.base_msrp, s.sales_amount,
       (p.base_msrp - s.sales_amount) AS savings
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id;

-- 2. Customers who purchased SUVs

SELECT DISTINCT c.first_name, c.last_name
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
WHERE p.category='SUV';

-- 3. Total sales per customer

SELECT c.customer_id, c.first_name, SUM(s.sales_amount) AS total_spent
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name;

-- 4. Most expensive sale per dealership

SELECT s.dealership_id, MAX(s.sales_amount) AS max_sale
FROM sales s
GROUP BY s.dealership_id;

-- 5. Sales per product model

SELECT p.model, COUNT(*) AS units_sold
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.model;

-- 6. Average discount per sale

SELECT AVG(p.base_msrp - s.sales_amount) AS avg_discount
FROM sales s
JOIN products p ON s.product_id = p.product_id;

-- 7. Top 5 high savings sales

SELECT s.sale_id, c.first_name, p.model, (p.base_msrp - s.sales_amount) AS savings
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
ORDER BY savings DESC
LIMIT 5;

-- 8. Sales with > $5k discount

SELECT *
FROM sales s
JOIN products p ON s.product_id = p.product_id
WHERE (p.base_msrp - s.sales_amount) > 5000;

-- 9. Total revenue

SELECT SUM(sales_amount) AS total_revenue FROM sales;

-- 10. Revenue per state

SELECT c.state, SUM(s.sales_amount) AS revenue
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.state;

B. Aggregations & Grouping (10)

-- 11. Total sales per category

SELECT p.category, COUNT(*) AS total_sales, SUM(s.sales_amount) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category;

-- 12. Avg sale per dealership

SELECT dealership_id, AVG(sales_amount) AS avg_sale
FROM sales
GROUP BY dealership_id;

-- 13. Count of sales per month

SELECT DATE_TRUNC('month', sale_date) AS month, COUNT(*) AS sales_count
FROM sales
GROUP BY month
ORDER BY month;

-- 14. Total revenue per product

SELECT p.model, SUM(s.sales_amount) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.model;

-- 15. Max and min sale per category

SELECT p.category, MAX(s.sales_amount) AS max_sale, MIN(s.sales_amount) AS min_sale
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category;

-- 16. Total units sold per state

SELECT c.state, COUNT(*) AS units_sold
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.state;

-- 17. Avg savings per customer

SELECT c.customer_id, AVG(p.base_msrp - s.sales_amount) AS avg_savings
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.customer_id;

-- 18. Sales per year

SELECT EXTRACT(YEAR FROM sale_date) AS year, SUM(sales_amount) AS revenue
FROM sales
GROUP BY year;

-- 19. Revenue per city

SELECT c.city, SUM(s.sales_amount) AS revenue
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.city;

-- 20. Units sold per dealership

SELECT dealership_id, COUNT(*) AS units_sold
FROM sales
GROUP BY dealership_id;

C. Window Functions (10)

-- 21. Rank sales by amount

SELECT sale_id, sales_amount,
       RANK() OVER (ORDER BY sales_amount DESC) AS sale_rank
FROM sales;

-- 22. Running total of revenue

SELECT sale_date, SUM(sales_amount) OVER (ORDER BY sale_date) AS running_total
FROM sales;

-- 23. Sales rank per dealership

SELECT dealership_id, sale_id, sales_amount,
       RANK() OVER (PARTITION BY dealership_id ORDER BY sales_amount DESC) AS rank_by_dealer
FROM sales;

-- 24. Average sale per product over time

SELECT sale_id, product_id, sales_amount,
       AVG(sales_amount) OVER (PARTITION BY product_id ORDER BY sale_date) AS avg_sale_running
FROM sales;

-- 25. Cumulative sales per customer

SELECT customer_id, sale_id, sales_amount,
       SUM(sales_amount) OVER (PARTITION BY customer_id ORDER BY sale_date) AS cum_sales
FROM sales;

-- 26. Highest sale per product
SELECT *
FROM (
    SELECT p.model, s.sales_amount,
           ROW_NUMBER() OVER (PARTITION BY p.model ORDER BY s.sales_amount DESC) AS rn
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
) t
WHERE rn = 1;

-- 27. Percent rank of sales

SELECT sale_id, sales_amount,
       PERCENT_RANK() OVER (ORDER BY sales_amount DESC) AS percent_rank
FROM sales;

-- 28. Dense rank for categories

SELECT sale_id, p.category, sales_amount,
       DENSE_RANK() OVER (PARTITION BY p.category ORDER BY sales_amount DESC) AS category_rank
FROM sales s
JOIN products p ON s.product_id = p.product_id;

-- 29. Lag / lead: previous and next sale

SELECT sale_id, sales_amount,
       LAG(sales_amount,1) OVER (ORDER BY sale_date) AS prev_sale,
       LEAD(sales_amount,1) OVER (ORDER BY sale_date) AS next_sale
FROM sales;

-- 30. Running average

SELECT sale_date, sales_amount,
       AVG(sales_amount) OVER (ORDER BY sale_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS running_avg_3
FROM sales;

D. Data Cleaning (5)

-- 31. Remove NULLs

SELECT * FROM customers WHERE state IS NOT NULL;

-- 32. Replace NULL with default

SELECT COALESCE(city,'Unknown') AS city FROM customers;

-- 33. Remove duplicates

SELECT DISTINCT state FROM customers;

-- 34. Trim spaces in names
UPDATE customers SET first_name = TRIM(first_name);

-- 35. Correct negative sales amounts
UPDATE sales SET sales_amount = ABS(sales_amount) WHERE sales_amount < 0;

E. Business Reporting Queries (10)

-- 36. Monthly revenue report
SELECT DATE_TRUNC('month', sale_date) AS month, SUM(sales_amount) AS revenue
FROM sales
GROUP BY month
ORDER BY month;

-- 37. Top 5 best-selling products

SELECT p.model, COUNT(*) AS units_sold
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.model
ORDER BY units_sold DESC
LIMIT 5;

-- 38. High discount sales (> $1k)

SELECT s.sale_id, p.model, (p.base_msrp - s.sales_amount) AS discount
FROM sales s
JOIN products p ON s.product_id = p.product_id
WHERE (p.base_msrp - s.sales_amount) > 1000;

-- 39. Revenue per dealership

SELECT dealership_id, SUM(sales_amount) AS revenue
FROM sales
GROUP BY dealership_id
ORDER BY revenue DESC;

-- 40. Avg sale per category

SELECT p.category, AVG(s.sales_amount) AS avg_sale
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category;

-- 41. Top customer by revenue

SELECT c.customer_id, c.first_name, SUM(s.sales_amount) AS total_spent
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name
ORDER BY total_spent DESC
LIMIT 1;

-- 42. Revenue by state

SELECT c.state, SUM(s.sales_amount) AS revenue
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.state
ORDER BY revenue DESC;

-- 43. Sales per product per state

SELECT c.state, p.model, SUM(s.sales_amount) AS revenue
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.state, p.model
ORDER BY revenue DESC;

-- 44. Total units sold by month

SELECT DATE_TRUNC('month', sale_date) AS month, COUNT(*) AS units_sold
FROM sales
GROUP BY month
ORDER BY month;

-- 45. Best dealership by total revenue

SELECT dealership_id, SUM(sales_amount) AS revenue
FROM sales
GROUP BY dealership_id
ORDER BY revenue DESC
LIMIT 1;

F. Advanced Exercises / Joins / Case / COALESCE (5)

-- 46. Flag high savings

SELECT s.sale_id, c.first_name, p.model,
       CASE WHEN s.sales_amount < p.base_msrp - 500 THEN 1 ELSE 0 END AS high_savings
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id;

-- 47. Join sales, customers, products, dealerships

SELECT COALESCE(s.dealership_id,-1) AS sales_dealership,
       CASE WHEN s.sales_amount < p.base_msrp - 500 THEN 1 ELSE 0 END AS high_savings,
       c.first_name, c.last_name, p.model, s.sales_amount
FROM sales s
LEFT JOIN dealerships d ON d.dealership_id = s.dealership_id
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id;

-- 48. Total revenue per category and state

SELECT c.state, p.category, SUM(s.sales_amount) AS revenue
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.state, p.category;

-- 49. Top 3 sales per dealership

SELECT *
FROM (
    SELECT s.sale_id, s.dealership_id, s.sales_amount,
           ROW_NUMBER() OVER (PARTITION BY s.dealership_id ORDER BY s.sales_amount DESC) AS rn
    FROM sales s
) t
WHERE rn <= 3;

-- 50. Cumulative revenue per product

SELECT product_id, sale_date,
       SUM(sales_amount) OVER (PARTITION BY product_id ORDER BY sale_date) AS cum_revenue
FROM sales;

✅ This Workbook Covers:

Analytical SQL

Aggregations & Grouping

Window Functions

Data Cleaning

Business Reporting

Practical exercises: 50+ queries

Joins, CASE, COALESCE, RANK, ROW_NUMBER, running totals
