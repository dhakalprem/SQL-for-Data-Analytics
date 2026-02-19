CREATE TABLE salespeople (
    salesperson_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dealership_id INT,
    hire_date DATE,
    termination_date DATE,
    salary DECIMAL(10,2)
);


INSERT INTO salespeople VALUES
(1, 'Nick', 'Anderson', 17, '2020-06-15', NULL, 55000.00),
(2, 'Nicole', 'Brown', 17, '2021-02-10', NULL, 60000.00),
(3, 'Michael', 'Clark', 12, '2019-03-20', '2022-05-01', 50000.00),
(4, 'Nicolas', 'Davis', 17, '2021-07-01', NULL, 58000.00),
(5, 'Sarah', 'Evans', 17, '2022-01-05', NULL, 62000.00),
(6, 'John', 'Foster', 15, '2021-11-11', NULL, 52000.00),
(7, 'Nicola', 'Green', 17, '2021-03-25', '2023-01-01', 57000.00),
(8, 'David', 'Harris', 17, '2018-09-17', NULL, 54000.00),
(9, 'Emily', 'Irwin', 12, '2021-05-30', NULL, 51000.00),
(10, 'Nickolas', 'Johnson', 17, '2021-12-15', NULL, 59000.00);



SELECT * 
FROM salespeople 
WHERE dealership_id = 17 
ORDER BY hire_date 
LIMIT 10;

SELECT * 
FROM salespeople 
WHERE hire_date >= '2021-01-01' 
AND termination_date IS NULL 
ORDER BY hire_date DESC; 

SELECT * 
FROM salespeople 
WHERE first_name LIKE 'Nic%' 
AND hire_date >= '2021-01-01' 
AND hire_date <= '2021-12-31'

