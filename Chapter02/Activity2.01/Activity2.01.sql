CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(100),
    state VARCHAR(50),
    date_added DATE
);


INSERT INTO customers VALUES
(1, 'John', 'Smith', 'john.smith@email.com', '123-456-7890', 'Miami', 'FL', '2024-01-10'),
(2, 'Emily', 'Johnson', 'emily.j@email.com', NULL, 'Orlando', 'FL', '2024-01-15'),
(3, 'Michael', 'Brown', 'michael.b@email.com', '222-333-4444', 'New York City', 'NY', '2024-02-01'),
(4, 'Sarah', 'Davis', 'sarah.d@email.com', NULL, 'New York City', 'NY', '2024-02-10'),
(5, 'David', 'Wilson', 'david.w@email.com', '555-666-7777', 'Buffalo', 'NY', '2024-02-15'),
(6, 'Jessica', 'Taylor', 'jessica.t@email.com', '888-999-0000', 'Tampa', 'FL', '2024-03-01'),
(7, 'Daniel', 'Anderson', 'daniel.a@email.com', NULL, 'Albany', 'NY', '2024-03-05'),
(8, 'Laura', 'Thomas', 'laura.t@email.com', '111-222-3333', 'Jacksonville', 'FL', '2024-03-12'),
(9, 'James', 'Moore', 'james.m@email.com', NULL, 'New York City', 'NY', '2024-03-20'),
(10, 'Olivia', 'Martin', 'olivia.m@email.com', '444-555-6666', 'Fort Lauderdale', 'FL', '2024-03-25');



SELECT email 
FROM customers 
WHERE state='FL' 
ORDER BY email;

SELECT first_name, last_name, email
FROM customers 
WHERE city='New York City' AND state='NY'
ORDER BY last_name, first_name;

SELECT * 
FROM customers 
WHERE phone IS NOT NULL 
ORDER BY date_added;

