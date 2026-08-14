-- 04_advanced_analysis.sql

-- 1. Rank customers by total spending
WITH customer_spend AS (
    SELECT
        CustomerID,
        COUNT(DISTINCT OrderID) AS orders,
        SUM(TotalPrice) AS total_spend
    FROM customer_behaviour
    GROUP BY CustomerID
)
SELECT
    CustomerID,
    orders,
    ROUND(total_spend,2) AS total_spend,
    DENSE_RANK() OVER (ORDER BY total_spend DESC) AS spending_rank
FROM customer_spend
ORDER BY spending_rank;

-- 2. Rank products by revenue
WITH product_sales AS (
    SELECT
        Product,
        SUM(TotalPrice) AS revenue
    FROM customer_behaviour
    GROUP BY Product
)
SELECT
    Product,
    ROUND(revenue,2) AS revenue,
    RANK() OVER (ORDER BY revenue DESC) AS product_rank
FROM product_sales
ORDER BY product_rank;

-- 3. Customer segmentation
WITH customer_metrics AS (
    SELECT
        CustomerID,
        COUNT(DISTINCT OrderID) AS order_count,
        SUM(TotalPrice) AS total_spend
    FROM customer_behaviour
    GROUP BY CustomerID
)
SELECT
    CustomerID,
    order_count,
    ROUND(total_spend,2) AS total_spend,
    CASE
        WHEN order_count >= 3 AND total_spend >= 10000 THEN 'High Value'
        WHEN order_count >= 2 OR total_spend >= 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customer_metrics
ORDER BY total_spend DESC;

-- 4. Running monthly revenue
WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(Date, '%Y-%m') AS month,
        SUM(TotalPrice) AS revenue
    FROM customer_behaviour
    GROUP BY DATE_FORMAT(Date, '%Y-%m')
)
SELECT
    month,
    ROUND(revenue,2) AS revenue,
    ROUND(SUM(revenue) OVER (ORDER BY month),2) AS cumulative_revenue
FROM monthly_sales
ORDER BY month;

-- 5. Top customer for each product
WITH customer_product_sales AS (
    SELECT
        Product,
        CustomerID,
        SUM(TotalPrice) AS revenue
    FROM customer_behaviour
    GROUP BY Product, CustomerID
),
ranked AS (
    SELECT
        Product,
        CustomerID,
        revenue,
        ROW_NUMBER() OVER (
            PARTITION BY Product
            ORDER BY revenue DESC
        ) AS product_rank
    FROM customer_product_sales
)
SELECT
    Product,
    CustomerID,
    ROUND(revenue,2) AS revenue
FROM ranked
WHERE product_rank = 1
ORDER BY Product;
