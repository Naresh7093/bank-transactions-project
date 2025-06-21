# 💳 Bank Transactions SQL Project

This project demonstrates the design, normalization, and querying of a **banking database** in MySQL. It includes realistic tables such as `customers`, `accounts`, `transactions`, and `loans`, along with sample data and advanced SQL queries that simulate real-world business scenarios.

---

## 📁 Tables

- `customers`: Stores customer personal and contact information.
- `accounts`: Stores account details, linked to customers.
- `transactions`: Stores debit/credit records for each account.
- `loans`: Stores loan details for customers.

---

## 🛠️ Normalization

The database schema is normalized up to **Third Normal Form (3NF)**:
- No repeating groups (1NF)
- No partial dependencies (2NF)
- No transitive dependencies (3NF)

---

## 📊 SQL Queries Practiced

### 1. List all customers with their account details
```sql
SELECT c.customer_id, c.full_name, a.account_id, a.account_type, a.balance
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id;
```
### 2. Find total transaction amount per customer
```sql
SELECT c.customer_id, c.full_name, SUM(t.amount) AS total_transaction_amount
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
JOIN transactions t ON a.account_id = t.account_id
GROUP BY c.customer_id, c.full_name
ORDER BY total_transaction_amount DESC
LIMIT 3;
```
### 3. Find customers who joined in 2023 and made transactions
```sql
SELECT DISTINCT c.customer_id, c.full_name
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
JOIN transactions t ON a.account_id = t.account_id
WHERE YEAR(c.join_date) = 2023;
```