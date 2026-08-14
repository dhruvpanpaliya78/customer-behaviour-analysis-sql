-- 01_data_quality.sql
-- Basic data-quality and dataset checks

SELECT COUNT(*) AS total_orders
FROM customer_behaviour;

SELECT COUNT(DISTINCT CustomerID) AS unique_customers
FROM customer_behaviour;

SELECT COUNT(DISTINCT Product) AS unique_products
FROM customer_behaviour;

SELECT
    MIN(Date) AS first_order_date,
    MAX(Date) AS last_order_date
FROM customer_behaviour;

-- Check duplicate OrderIDs
SELECT OrderID, COUNT(*) AS duplicate_count
FROM customer_behaviour
GROUP BY OrderID
HAVING COUNT(*) > 1;

-- Check missing values
SELECT
    SUM(OrderID IS NULL) AS missing_order_id,
    SUM(CustomerID IS NULL) AS missing_customer_id,
    SUM(Product IS NULL) AS missing_product,
    SUM(Quantity IS NULL) AS missing_quantity,
    SUM(UnitPrice IS NULL) AS missing_unit_price,
    SUM(TotalPrice IS NULL) AS missing_total_price
FROM customer_behaviour;

-- Check invalid sales values
SELECT *
FROM customer_behaviour
WHERE Quantity <= 0 OR UnitPrice < 0 OR TotalPrice < 0;
