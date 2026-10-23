-- Task 23: SQL Aggregation Basics
-- Internship: Veda Technology
-- Purpose: Practise COUNT, SUM, AVG, MIN, MAX and GROUP BY.
-- Dataset: Chinook (primary examples); Northwind alternatives at the end.
-- Target: MySQL 8+. Select the database you imported before running queries.

-- SETUP: inspect available databases and tables
SHOW DATABASES;
-- USE chinook;
-- SHOW TABLES;
-- DESCRIBE Invoice;
-- DESCRIBE InvoiceLine;
-- DESCRIBE Customer;
-- DESCRIBE Track;

-- 1. COUNT: count all invoices
SELECT COUNT(*) AS total_invoices
FROM Invoice;

-- 2. COUNT(column) ignores NULL values: customers with a company listed
SELECT COUNT(Company) AS customers_with_company
FROM Customer;

-- 3. Count distinct billing countries
SELECT COUNT(DISTINCT BillingCountry) AS distinct_billing_countries
FROM Invoice;

-- 4. SUM: total invoice value
SELECT SUM(Total) AS total_invoice_value
FROM Invoice;

-- 5. SUM: total quantity of items across invoice lines
SELECT SUM(Quantity) AS total_items_sold
FROM InvoiceLine;

-- 6. AVG: average invoice value (NULL values are ignored)
SELECT AVG(Total) AS average_invoice_value
FROM Invoice;

-- 7. AVG: average track duration in milliseconds
SELECT AVG(Milliseconds) AS average_track_duration_ms
FROM Track;

-- 8. MIN and MAX: lowest and highest invoice totals
SELECT MIN(Total) AS lowest_invoice_total,
       MAX(Total) AS highest_invoice_total
FROM Invoice;

-- 9. MIN and MAX: earliest and latest invoice dates
SELECT MIN(InvoiceDate) AS earliest_invoice_date,
       MAX(InvoiceDate) AS latest_invoice_date
FROM Invoice;

-- 10. GROUP BY: invoice count, total sales and average invoice by country
SELECT BillingCountry,
       COUNT(*) AS invoice_count,
       SUM(Total) AS total_sales,
       AVG(Total) AS average_invoice_value
FROM Invoice
GROUP BY BillingCountry
ORDER BY total_sales DESC;

-- EXTRA PRACTICE: customer count by country
SELECT Country,
       COUNT(*) AS customer_count
FROM Customer
GROUP BY Country
ORDER BY customer_count DESC;

-- EXTRA PRACTICE: average track duration by media type
SELECT mt.Name AS media_type,
       COUNT(*) AS track_count,
       AVG(t.Milliseconds) AS average_duration_ms
FROM Track AS t
JOIN MediaType AS mt
  ON mt.MediaTypeId = t.MediaTypeId
GROUP BY mt.Name
ORDER BY average_duration_ms DESC;

-- NORTHWIND ALTERNATIVES (run only if your Northwind schema matches)
-- Count products:
-- SELECT COUNT(*) AS total_products FROM Products;
--
-- Average product price by category:
-- SELECT CategoryID, AVG(UnitPrice) AS average_unit_price
-- FROM Products
-- GROUP BY CategoryID
-- ORDER BY average_unit_price DESC;

-- INTERVIEW QUESTIONS
-- Q1. Why use GROUP BY?
-- GROUP BY creates a result row for each group so aggregate functions
-- such as COUNT, SUM and AVG can be calculated separately per group.
--
-- Q2. How does AVG handle NULL values?
-- AVG ignores NULL values and averages only non-NULL values.
-- COUNT(column) also ignores NULLs, whereas COUNT(*) counts rows.
--
-- NOTES
-- Most aggregate functions ignore NULL values. SUM and AVG return NULL
-- when there are no non-NULL input values. Without GROUP BY, an aggregate
-- usually returns one summary row for the selected set of records.
