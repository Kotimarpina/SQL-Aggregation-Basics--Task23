# Task 23 – SQL Aggregation Basics

## About the Project

This project is part of my Data Analytics Internship at Veda Technology. The aim was to practise SQL aggregate functions and understand how they help summarise data stored in a database.

Instead of looking at individual records one by one, aggregate functions make it possible to calculate totals, averages, counts, minimum values, and maximum values. I used the Chinook sample database to practise these functions on invoice, customer, and track data.

## Concepts Practised

- `COUNT()` – Count records and non-NULL values.
- `SUM()` – Calculate the total of numeric values.
- `AVG()` – Calculate the average of numeric values.
- `MIN()` – Find the smallest value.
- `MAX()` – Find the largest value.
- `GROUP BY` – Summarise records separately for each group.
- `NULL` handling – Understand how aggregate functions treat missing values.

## Tools and Dataset

- **Database:** MySQL
- **SQL Editor:** MySQL Workbench
- **Dataset:** Chinook Sample Database

## Example Queries

### 1. Count the total number of invoices

```sql
SELECT COUNT(*) AS total_invoices
FROM Invoice;
```

This query counts all rows in the invoice table.

### 2. Calculate the total invoice value

```sql
SELECT SUM(Total) AS total_invoice_value
FROM Invoice;
```

This query adds the invoice totals to calculate the overall invoice value.

### 3. Find the average invoice value

```sql
SELECT AVG(Total) AS average_invoice_value
FROM Invoice;
```

This query calculates the average invoice total. `AVG()` ignores NULL values.

### 4. Find the lowest and highest invoice totals

```sql
SELECT MIN(Total) AS lowest_invoice_total,
       MAX(Total) AS highest_invoice_total
FROM Invoice;
```

This query returns the minimum and maximum invoice totals in the table.

### 5. Calculate invoice totals by country

```sql
SELECT BillingCountry,
       COUNT(*) AS invoice_count,
       SUM(Total) AS total_sales,
       AVG(Total) AS average_invoice_value
FROM Invoice
GROUP BY BillingCountry
ORDER BY total_sales DESC;
```

This query groups invoices by billing country and compares the number of invoices, total invoice value, and average invoice value for each country.

## How to Run the Queries

1. Install MySQL and open MySQL Workbench.
2. Import the Chinook sample database into your MySQL server.
3. Connect to the server and select the Chinook database.
4. Open the SQL file from this repository.
5. Execute the queries one by one.
6. Review the output and note the results.

**Note:** Table and column names may differ depending on the version of the sample database you use. Check the database schema if a query returns an error.

## What I Learned

This task helped me understand how aggregate functions turn individual records into useful summaries. I also practised grouping data and learned that `COUNT(*)` counts rows, while `COUNT(column)` ignores NULL values in that column. Similarly, `AVG()` calculates an average using non-NULL values.

These concepts are useful for analysing datasets and preparing summaries for reports and dashboards.

## Repository Contents

- `Task_23_SQL_Aggregation_Basics_Veda_Technology.sql` – SQL practice queries for aggregate functions and grouping.

---

**Internship:** Veda Technology  
**Task:** 23 – SQL Aggregation Basics  
**Focus:** SQL aggregate functions and data summarisation
