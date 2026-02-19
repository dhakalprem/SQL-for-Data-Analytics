CREATE TABLE dealerships (
    dealership_id INT PRIMARY KEY,
    dealership_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    model VARCHAR(50),
    base_msrp DECIMAL(10,2),
    year INT
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    dealership_id INT,
    customer_id INT,
    product_id INT,
    sales_amount DECIMAL(10,2),
    sale_date DATE,
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);







INSERT INTO dealerships VALUES
(1,'AutoWorld NYC','New York City','NY'),
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




INSERT INTO customers VALUES
(1,'John','Smith','john@email.com','New York City','NY'),
(2,'Sarah','Brown','sarah@email.com','Miami','FL'),
(3,'David','Wilson','david@email.com','Dallas','TX'),
(4,'Emily','Clark','emily@email.com','Chicago','IL'),
(5,'Michael','Davis','michael@email.com','Los Angeles','CA'),
(6,'Olivia','Miller','olivia@email.com','Houston','TX'),
(7,'James','Taylor','james@email.com','Denver','CO'),
(8,'Sophia','Anderson','sophia@email.com','Boston','MA'),
(9,'Daniel','Thomas','daniel@email.com','Atlanta','GA'),
(10,'Emma','Moore','emma@email.com','Detroit','MI'),
(11,'Liam','Jackson','liam@email.com','Orlando','FL'),
(12,'Ava','White','ava@email.com','Phoenix','AZ'),
(13,'Noah','Harris','noah@email.com','San Diego','CA'),
(14,'Isabella','Martin','bella@email.com','San Francisco','CA'),
(15,'Ethan','Thompson','ethan@email.com','Cleveland','OH'),
(16,'Mia','Garcia','mia@email.com','Albany','NY'),
(17,'Lucas','Martinez','lucas@email.com','Salt Lake City','UT'),
(18,'Charlotte','Robinson','char@email.com','St. Louis','MO'),
(19,'Henry','Lee','henry@email.com','Minneapolis','MN'),
(20,'Amelia','Walker','amelia@email.com','Washington','DC');




INSERT INTO products VALUES
(1,'Model Alpha',25000,2022),
(2,'Model Beta',27000,2022),
(3,'Model Chi',30000,2022),
(4,'Model Delta',28000,2022),
(5,'Model Echo',32000,2022),
(6,'Model Zeta',34000,2023),
(7,'Model Theta',36000,2023),
(8,'Model Iota',37000,2023),
(9,'Model Kappa',38000,2023),
(10,'Model Lambda',39000,2023),
(11,'Model Mu',26000,2021),
(12,'Model Nu',27500,2021),
(13,'Model Xi',29500,2021),
(14,'Model Omicron',31000,2021),
(15,'Model Pi',33000,2021),
(16,'Model Rho',35000,2020),
(17,'Model Sigma',36500,2020),
(18,'Model Tau',38500,2020),
(19,'Model Upsilon',40000,2020),
(20,'Model Phi',42000,2020);






INSERT INTO sales VALUES
(1,1,1,1,24000,'2023-01-01'),
(2,2,2,2,26000,'2023-01-02'),
(3,3,3,3,29500,'2023-01-03'),
(4,4,4,4,27000,'2023-01-04'),
(5,5,5,5,31500,'2023-01-05'),
(6,6,6,6,33000,'2023-01-06'),
(7,7,7,7,35500,'2023-01-07'),
(8,8,8,8,36000,'2023-01-08'),
(9,9,9,9,37000,'2023-01-09'),
(10,10,10,10,38000,'2023-01-10'),
(11,11,11,11,25500,'2023-01-11'),
(12,12,12,12,27000,'2023-01-12'),
(13,13,13,13,29000,'2023-01-13'),
(14,14,14,14,30000,'2023-01-14'),
(15,15,15,15,32500,'2023-01-15'),
(16,16,16,16,34000,'2023-01-16'),
(17,17,17,17,35000,'2023-01-17'),
(18,18,18,18,37500,'2023-01-18'),
(19,19,19,19,39000,'2023-01-19'),
(20,20,20,20,41000,'2023-01-20');




SELECT 
    COALESCE(s.dealership_id, -1) AS sales_dealership, 
    CASE 
        WHEN sales_amount < base_msrp - 500 THEN 1 
        ELSE 0 
    END AS high_savings,
    c.*, 
    p.*
FROM sales s
LEFT JOIN dealerships d
    ON d.dealership_id = s.dealership_id
JOIN customers c
    ON s.customer_id = c.customer_id
JOIN products p
    ON s.product_id = p.product_id;








SELECT 
	COALESCE(s.dealership_id, -1) sales_dealership, 
	CASE WHEN sales_amount < base_msrp - 500 THEN 1 ELSE 0 END high_savings,
	c.*, p.*
FROM sales s
LEFT JOIN dealerships d
  ON d.dealership_id = s.dealership_id
JOIN customers c
  ON s.customer_id = c.customer_id
JOIN products p
  ON s.product_id = p.product_id;








-- What This Query Does

-- COALESCE → replaces NULL dealership with -1

-- CASE → flags high savings deals

-- LEFT JOIN → keeps all sales

-- INNER JOIN → attaches customer + product data

-- Returns enriched sales analytics dataset

