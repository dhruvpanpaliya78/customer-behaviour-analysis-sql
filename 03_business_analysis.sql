-- 03_business_analysis.sql

-- 1. Product performance
SELECT
    Product,
    SUM(Quantity) AS units_sold,
    COUNT(DISTINCT OrderID) AS orders,
    ROUND(SUM(TotalPrice),2) AS revenue,
    ROUND(AVG(TotalPrice),2) AS average_order_value
FROM customer_behaviour
GROUP BY Product
ORDER BY revenue DESC;

-- 2. Payment-method preference
SELECT
    PaymentMethod,
    COUNT(DISTINCT OrderID) AS orders,
    ROUND(SUM(TotalPrice),2) AS revenue
FROM customer_behaviour
GROUP BY PaymentMethod
ORDER BY orders DESC;

-- 3. Referral-source performance
SELECT
    ReferralSource,
    COUNT(DISTINCT CustomerID) AS customers,
    COUNT(DISTINCT OrderID) AS orders,
    ROUND(SUM(TotalPrice),2) AS revenue
FROM customer_behaviour
GROUP BY ReferralSource
ORDER BY revenue DESC;

-- 4. Coupon usage
SELECT
    CASE
        WHEN CouponCode IS NULL OR CouponCode = '' THEN 'No Coupon'
        ELSE 'Coupon Used'
    END AS coupon_status,
    COUNT(DISTINCT OrderID) AS orders,
    ROUND(AVG(TotalPrice),2) AS average_order_value,
    ROUND(SUM(TotalPrice),2) AS revenue
FROM customer_behaviour
GROUP BY coupon_status;

-- 5. Order status
SELECT
    OrderStatus,
    COUNT(DISTINCT OrderID) AS orders,
    ROUND(SUM(TotalPrice),2) AS revenue
FROM customer_behaviour
GROUP BY OrderStatus
ORDER BY orders DESC;

-- 6. Cart size vs order value
SELECT
    ItemsInCart,
    COUNT(DISTINCT OrderID) AS orders,
    ROUND(AVG(TotalPrice),2) AS average_order_value
FROM customer_behaviour
GROUP BY ItemsInCart
ORDER BY ItemsInCart;

-- 7. Monthly revenue
SELECT
    DATE_FORMAT(Date, '%Y-%m') AS month,
    COUNT(DISTINCT OrderID) AS orders,
    ROUND(SUM(TotalPrice),2) AS revenue
FROM customer_behaviour
GROUP BY DATE_FORMAT(Date, '%Y-%m')
ORDER BY month;
