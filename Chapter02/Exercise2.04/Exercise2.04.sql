
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    model VARCHAR(50),
    year INT,
    base_msrp DECIMAL(10,2),
    color VARCHAR(30)
);


INSERT INTO products VALUES
(1,'Model Alpha',2021,25000,'Red'),
(2,'Model Beta',2021,27000,'Blue'),
(3,'Model Chi',2021,30000,'Black'),
(4,'Model Delta',2021,28000,'White'),
(5,'Model Echo',2021,32000,'Silver'),

(6,'Model Alpha',2022,26000,'Red'),
(7,'Model Beta',2022,28000,'Blue'),
(8,'Model Chi',2022,31000,'Black'),
(9,'Model Delta',2022,29000,'White'),
(10,'Model Echo',2022,33000,'Silver'),
(11,'Model Zeta',2022,34000,'Gray'),
(12,'Model Theta',2022,36000,'Red'),
(13,'Model Iota',2022,37000,'Blue'),
(14,'Model Kappa',2022,38000,'Black'),
(15,'Model Lambda',2022,39000,'White'),

(16,'Model Alpha',2023,27000,'Red'),
(17,'Model Beta',2023,29000,'Blue'),
(18,'Model Chi',2023,32000,'Black'),
(19,'Model Delta',2023,30000,'White'),
(20,'Model Echo',2023,34000,'Silver');




CREATE TABLE products_2022 AS
SELECT *
FROM products
WHERE year = 2022;



UPDATE products_2022
SET base_msrp = base_msrp * 1.10
WHERE model = 'Model Chi'
AND year = 2022;



SELECT *
FROM products_2022
WHERE model = 'Model Chi'
AND year = 2022;




CREATE TABLE products_2022 AS ( 
SELECT * 
FROM products 
WHERE year=2022
);

UPDATE Products_2022 SET  
    base_msrp = base_msrp*1.10 
WHERE model='Model Chi' 
AND year=2022;

SELECT * 
FROM products_2022 
WHERE model='Model Chi' 
AND year=2022;