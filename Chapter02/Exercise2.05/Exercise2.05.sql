CREATE TABLE state_populations (
    state_id INT PRIMARY KEY,
    state_name VARCHAR(50),
    population BIGINT,
    area_sq_km INT,
    region VARCHAR(50)
);

INSERT INTO state_populations VALUES
(1, 'California', 39500000, 423967, 'West'),
(2, 'Texas', 30000000, 695662, 'South'),
(3, 'Florida', 22000000, 170312, 'South'),
(4, 'New York', 19500000, 141297, 'Northeast'),
(5, 'Illinois', 12600000, 149995, 'Midwest'),
(6, 'Pennsylvania', 12800000, 119280, 'Northeast'),
(7, 'Ohio', 11700000, 116098, 'Midwest'),
(8, 'Georgia', 11000000, 153910, 'South'),
(9, 'North Carolina', 10800000, 139391, 'South'),
(10, 'Michigan', 10000000, 250487, 'Midwest');


SELECT * 
FROM state_populations;

DROP TABLE state_populations;



DROP TABLE products_2022;












DROP TABLE state_populations;

SELECT * 
FROM state_populations;

DROP TABLE products_2022;
