CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    title VARCHAR(10),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(100),
    state VARCHAR(50),
    postal_code VARCHAR(10),
    date_added DATE
);


INSERT INTO customers VALUES
(1, 'Mr.', 'John', 'Smith', 'john.smith@email.com', '123-456-7890', 'New York City', 'NY', '10014', '2024-01-10'),
(2, 'Ms.', 'Emily', 'Johnson', 'emily.j@email.com', NULL, 'New York City', 'NY', '10001', '2024-01-15'),
(3, 'Mr.', 'Michael', 'Brown', 'michael.b@email.com', '222-333-4444', 'Miami', 'FL', '33101', '2024-02-01'),
(4, 'Mrs.', 'Sarah', 'Davis', 'sarah.d@email.com', NULL, 'New York City', 'NY', '10014', '2024-02-10'),
(5, 'Mr.', 'David', 'Wilson', 'david.w@email.com', '555-666-7777', 'Buffalo', 'NY', '14201', '2024-02-15'),
(6, 'Ms.', 'Jessica', 'Taylor', 'jessica.t@email.com', '888-999-0000', 'Orlando', 'FL', '32801', '2024-03-01'),
(7, 'Mr.', 'Daniel', 'Anderson', 'daniel.a@email.com', NULL, 'New York City', 'NY', '10003', '2024-03-05'),
(8, 'Ms.', 'Laura', 'Thomas', 'laura.t@email.com', '111-222-3333', 'Chicago', 'IL', '60601', '2024-03-12'),
(9, 'Mr.', 'James', 'Moore', 'james.m@email.com', NULL, 'New York City', 'NY', '10011', '2024-03-20'),
(10, 'Mrs.', 'Olivia', 'Martin', 'olivia.m@email.com', '444-555-6666', 'Tampa', 'FL', '33602', '2024-03-25');



CREATE TABLE customers_nyc AS ( 
SELECT * 
FROM customers 
WHERE city='New York City' 
AND state='NY'
);

SELECT * FROM customers_nyc;

DELETE FROM customers_nyc 
WHERE postal_code='10014';

ALTER TABLE customers_nyc 
ADD COLUMN event text;

UPDATE customers_nyc SET
event = 'thank-you party';

SELECT customer_id, title, first_name, last_name, event
FROM customers_nyc;

DROP TABLE customers_nyc;
