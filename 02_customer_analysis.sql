-- 02_customer_analysis.sql

-- 1. Customer-level summary
SELECT
    CustomerID,
    COUNT(DISTINCT OrderID) AS total_orders,
    SUM(Quantity) AS total_items,
    ROUND(SUM(TotalPrice),2) AS total_spend,
    ROUND(AVG(TotalPrice),2) AS average_order_value
FROM customer_behaviour
GROUP BY CustomerID
ORDER BY total_spend DESC;

-- 2. Top 10 customers by revenue
SELECT
    CustomerID,
    COUNT(DISTINCT OrderID) AS total_orders,
    ROUND(SUM(TotalPrice),2) AS total_spend
FROM customer_behaviour
GROUP BY CustomerID
ORDER BY total_spend DESC
LIMIT 10;

-- 3. Repeat vs one-time customers
SELECT
    CASE
        WHEN order_count = 1 THEN 'One-time Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(*) AS number_of_customers
FROM (
    SELECT CustomerID, COUNT(DISTINCT OrderID) AS order_count
    FROM customer_behaviour
    GROUP BY CustomerID
) AS customer_orders
GROUP BY customer_type;

-- 4. Customers with more than one order
SELECT
    CustomerID,
    COUNT(DISTINCT OrderID) AS order_count,
    ROUND(SUM(TotalPrice),2) AS total_spend
FROM customer_behaviour
GROUP BY CustomerID
HAVING COUNT(DISTINCT OrderID) > 1
ORDER BY total_spend DESC;

-- 5. Average order value
SELECT ROUND(AVG(TotalPrice),2) AS average_order_value
FROM customer_behaviour;
