-- creating database
CREATE DATABASE bank_transactions_project;

-- using data base
use bank_transactions_project;

-- creating table
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  full_name VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(20),
  city VARCHAR(50),
  join_date DATE
);

-- inserting  values to customers
INSERT INTO customers (
  customer_id, full_name, email, phone, city, join_date
) VALUES
(1, 'Rahul Sharma', 'rahul.sharma@example.com', '9876543210', 'Delhi', '2020-01-15'),
(2, 'Anjali Mehra', 'anjali.mehra@example.com', '8765432109', 'Mumbai', '2020-03-10'),
(3, 'Vikram Singh', 'vikram.singh@example.com', '7654321098', 'Bangalore', '2020-06-25'),
(4, 'Priya Verma', 'priya.verma@example.com', '6543210987', 'Chennai', '2021-01-05'),
(5, 'Ramesh Kumar', 'ramesh.kumar@example.com', '5432109876', 'Hyderabad', '2021-02-20'),
(6, 'Amit Rao', 'amit.rao@example.com', '9112233445', 'Lucknow', '2021-11-18'),
(7, 'Neha Sharma', 'neha.sharma@example.com', '9223344556', 'Bhopal', '2022-01-10'),
(8, 'Kiran Patel', 'kiran.patel@example.com', '9334455667', 'Ahmedabad', '2022-03-12'),
(9, 'Ravi Mehta', 'ravi.mehta@example.com', '9445566778', 'Jaipur', '2022-05-03'),
(10, 'Divya Menon', 'divya.menon@example.com', '9556677889', 'Kochi', '2022-09-27');


-- create the accounts table


CREATE TABLE accounts(
account_id INT PRIMARY KEY,
customer_id INT,
account_type VARCHAR(20),
balance DECIMAL(12,2),
status VARCHAR(10),
opened_date DATE,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

drop table account;
-- inserting values
INSERT INTO accounts (account_id, customer_id, account_type, balance, status, opened_date)
VALUES
(101, 1, 'Savings', 45000.00, 'Active', '2021-01-16'),
(102, 2, 'Savings', 120000.50, 'Active', '2021-03-23'),
(103, 3, 'Current', 98000.75, 'Active', '2021-06-11'),
(104, 4, 'Savings', 1500.00, 'Active', '2022-01-06'),
(105, 5, 'Current', 35000.00, 'Active', '2022-02-18'),
(106, 1, 'Current', 75000.00, 'Active', '2022-08-22'),
(107, 6, 'Savings', 22000.00, 'Active', '2023-01-20'),
(108, 7, 'Savings', 55000.00, 'Active', '2023-02-01'),
(109, 8, 'Current', 82000.00, 'Active', '2023-03-10'),
(110, 9, 'Savings', 19000.00, 'Closed', '2020-07-14'),
(111, 10, 'Current', 103000.00, 'Active', '2022-11-30'),
(112, 5, 'Savings', 12000.00, 'Active', '2023-04-21'),
(113, 3, 'Savings', 6500.00, 'Active', '2023-05-15'),
(114, 2, 'Current', 48000.00, 'Active', '2023-06-02'),
(115, 6, 'Current', 39000.00, 'Active', '2023-06-22');


CREATE TABLE transactions (
  transaction_id INT PRIMARY KEY,
  account_id INT,
  transaction_type VARCHAR(20),
  amount DECIMAL(12, 2),
  transaction_date DATE,
  FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);
INSERT INTO transactions (transaction_id, account_id, transaction_type, amount, transaction_date)
VALUES
  (1, 101, 'Deposit', 5000.00, '2024-05-01'),
  (2, 101, 'Withdrawal', 1500.00, '2024-05-05'),
  (3, 102, 'Deposit', 20000.00, '2024-04-28'),
  (4, 103, 'Withdrawal', 10000.00, '2024-05-10'),
  (5, 104, 'Deposit', 3000.00, '2024-04-20'),
  (6, 105, 'Withdrawal', 500.00, '2024-03-15'),
  (7, 106, 'Deposit', 10000.00, '2024-02-28'),
  (8, 107, 'Deposit', 7000.00, '2024-05-12'),
  (9, 108, 'Withdrawal', 4000.00, '2024-04-10'),
  (10, 109, 'Withdrawal', 6000.00, '2024-03-01');


CREATE TABLE loans (
  loan_id INT PRIMARY KEY,
  customer_id INT,
  loan_type VARCHAR(50),
  amount DECIMAL(12,2),
  interest_rate DECIMAL(5,2),
  start_date DATE,
  duration_months INT,
  status VARCHAR(20),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO loans (loan_id, customer_id, loan_type, amount, interest_rate, start_date, duration_months, status)
VALUES
(201, 1, 'Home', 2500000.00, 7.5, '2021-05-20', 240, 'Active'),
(202, 3, 'Personal', 150000.00, 11.2, '2022-01-10', 60, 'Active'),
(203, 2, 'Auto', 600000.00, 9.0, '2020-11-01', 84, 'Closed'),
(204, 4, 'Education', 400000.00, 8.5, '2021-07-15', 48, 'Active'),
(205, 5, 'Personal', 120000.00, 10.5, '2023-03-28', 36, 'Defaulted'),
(206, 6, 'Home', 1800000.00, 7.2, '2019-09-30', 180, 'Closed'),
(207, 7, 'Auto', 500000.00, 9.3, '2023-01-12', 60, 'Active'),
(208, 8, 'Education', 350000.00, 8.0, '2022-06-18', 36, 'Active'),
(209, 9, 'Personal', 100000.00, 10.0, '2023-08-01', 24, 'Active'),
(210, 10, 'Home', 3200000.00, 7.8, '2020-12-05', 240, 'Closed'),
(211, 1, 'Auto', 700000.00, 8.9, '2021-03-20', 60, 'Active'),
(212, 2, 'Personal', 90000.00, 11.0, '2023-02-14', 24, 'Defaulted'),
(213, 3, 'Education', 275000.00, 8.2, '2022-09-01', 36, 'Active'),
(214, 4, 'Home', 1500000.00, 7.6, '2020-05-20', 180, 'Closed'),
(215, 5, 'Auto', 480000.00, 9.1, '2021-08-25', 48, 'Active'),
(216, 6, 'Personal', 110000.00, 10.8, '2023-04-10', 30, 'Active'),
(217, 7, 'Home', 2700000.00, 7.4, '2021-11-11', 240, 'Active'),
(218, 8, 'Education', 390000.00, 8.3, '2022-12-20', 48, 'Active'),
(219, 9, 'Auto', 650000.00, 9.5, '2023-05-15', 60, 'Active'),
(220, 10, 'Personal', 95000.00, 10.2, '2023-06-30', 18, 'Active'),
(221, 3, 'Home', 2100000.00, 7.7, '2020-02-20', 240, 'Closed'),
(222, 4, 'Auto', 560000.00, 9.0, '2023-01-05', 48, 'Active'),
(223, 5, 'Education', 310000.00, 8.1, '2021-10-10', 36, 'Closed'),
(224, 6, 'Home', 2900000.00, 7.3, '2022-08-18', 240, 'Active'),
(225, 7, 'Personal', 105000.00, 10.7, '2023-07-22', 30, 'Active');


select * from transactions;

-- beginner queries
--  List all customers from Chennai:
SELECT * FROM customers
WHERE city = 'Chennai';


-- Show accounts with balance greater than ₹50,000:
SELECT * FROM accounts
WHERE balance > 50000;

-- Count how many transactions are Deposits:

SELECT COUNT(*) AS total_deposits
FROM transactions
WHERE transaction_type = 'Deposit';


--  List all transactions for account ID = 101:
SELECT * FROM transactions
WHERE account_id = 101;

-- Total balance per account type:

SELECT account_type, SUM(balance) AS total_balance
FROM accounts
GROUP BY account_type;

-- LEVEL 2: Intermediate Queries (Joins & Aggregations)

-- Join: Show each customer with their account details
SELECT
	c.customer_id,
    c.full_name,
    c.city,
    a.account_id,
    a.account_type,
    a.balance,
    a.status
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id;

-- Show total balance per customer (use GROUP BY)

SELECT 
	c.customer_id,
    c.full_name,
    SUM(a.balance) AS total_balance
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.full_name;



-- Transaction history per customer
 SELECT 
	c.full_name,
    t.account_id,
    t.transaction_type,
    t.amount,
    t.transaction_date
 FROM customers c
 JOIN accounts a on c.customer_id= a.customer_id
 JOIN transactions t ON a.account_id = t.account_id
 ORDER BY t.transaction_date desc;


-- customers who have more than one account
SELECT
	customer_id,
    count(account_id) AS num_accounts
FROM accounts
GROUP BY customer_id
HAVING COUNT(account_id)>1;

-- Find customers who have joined in 2023 and made atleast one transaction

SELECT DISTINCT c.customer_id, c.full_name, a.account_id
FROM customers c
JOIN accounts a ON c.customer_id=a.customer_id
JOIN transactions t ON a.account_id = t.account_id
WHERE YEAR(t.transaction_date) > 2023;

select * from transactions;


SELECT * FROM customers WHERE YEAR(join_date) = 2023;

-- List all the customers who have made a transaction over 50000
select c.customer_id, c.full_name, t.amount
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
JOIN transactions t ON a.account_id = t.account_id
WHERE t.amount> 5000;

select * from transactions;

-- show each customer's total transaction amount
SELECT c.customer_id, c.full_name, SUM(t.amount) AS total_transaction_amount
FROM customers c
JOIN accounts a ON c.customer_id =  a.customer_id
JOIN transactions t ON a.account_id = t.account_id
GROUP BY c.customer_id, c.full_name
ORDER BY total_transaction_amount DESC;


-- List the top 3 customers who have made the highest total transaction amounts across all their accounts.
SELECT c.customer_id, c.full_name, SUM(t.amount) AS total_transaction_amount
FROM customers c
JOIN accounts a ON c.customer_id =  a.customer_id
JOIN transactions t ON a.account_id = t.account_id
GROUP BY c.customer_id, c.full_name
ORDER BY total_transaction_amount DESC
LIMIT 3;

SELECT c.customer_id,a.account_id, c.full_name, c.email
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
LEFT JOIN transactions t ON a.account_id = t.account_id
where t.transaction_id IS NULL;



select * from transactions;

-- Average Transaction Amount by Account Type (with at least 3 transactions)
SELECT 
  a.account_type,
  ROUND(AVG(t.amount), 2) AS avg_transaction_amount,
  COUNT(*) AS total_transactions
FROM 
  accounts a
JOIN 
  transactions t ON a.account_id = t.account_id
GROUP BY 
  a.account_type
HAVING  
  COUNT(*) >= 3;

