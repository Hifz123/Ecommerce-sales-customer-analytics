
-- E-COMMERCE SALES & CUSTOMER ANALYTICS
-- SQL DATA ANALYSIS


-- 1. DATASET OVERVIEW
SELECT COUNT(*) AS total_orders
FROM ecommerce_sales;


-- 2. OVERALL BUSINESS PERFORMANCE
SELECT 
    COUNT(*) AS total_orders,
    ROUND(SUM(total_amount), 2) AS total_revenue,
    ROUND(SUM(profit_margin), 2) AS total_profit,
    ROUND(AVG(total_amount), 2) AS average_order_value
FROM ecommerce_sales;


-- 3. CATEGORY PERFORMANCE ANALYSIS
SELECT 
    category,
    COUNT(*) AS total_orders,
    ROUND(SUM(total_amount), 2) AS total_revenue,
    ROUND(SUM(profit_margin), 2) AS total_profit,
    ROUND(AVG(total_amount), 2) AS average_order_value
FROM ecommerce_sales
GROUP BY category
ORDER BY total_revenue DESC;


-- 4. REGIONAL PERFORMANCE ANALYSIS
SELECT 
    region,
    COUNT(*) AS total_orders,
    ROUND(SUM(total_amount), 2) AS total_revenue,
    ROUND(SUM(profit_margin), 2) AS total_profit,
    ROUND(AVG(delivery_time_days), 2) AS avg_delivery_days
FROM ecommerce_sales
GROUP BY region
ORDER BY total_revenue DESC;


-- 5. CUSTOMER GENDER ANALYSIS
SELECT 
    customer_gender,
    COUNT(*) AS total_orders,
    ROUND(SUM(total_amount), 2) AS total_revenue,
    ROUND(AVG(total_amount), 2) AS avg_order_value,
    ROUND(AVG(profit_margin), 2) AS avg_profit
FROM ecommerce_sales
GROUP BY customer_gender
ORDER BY total_revenue DESC;


-- 6. PAYMENT METHOD ANALYSIS
SELECT 
    payment_method,
    COUNT(*) AS total_orders,
    ROUND(SUM(total_amount), 2) AS total_revenue,
    ROUND(AVG(total_amount), 2) AS avg_order_value,
    ROUND(SUM(profit_margin), 2) AS total_profit
FROM ecommerce_sales
GROUP BY payment_method
ORDER BY total_revenue DESC;


-- 7. RETURN ANALYSIS
SELECT 
    returned,
    COUNT(*) AS total_orders,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 
        2
    ) AS percentage_of_orders,
    ROUND(SUM(total_amount), 2) AS total_revenue,
    ROUND(AVG(profit_margin), 2) AS avg_profit
FROM ecommerce_sales
GROUP BY returned
ORDER BY total_orders DESC;


-- 8. MONTHLY SALES TREND
SELECT 
    DATE_TRUNC('month', order_date)::date AS month,
    COUNT(*) AS total_orders,
    ROUND(SUM(total_amount), 2) AS total_revenue,
    ROUND(SUM(profit_margin), 2) AS total_profit
FROM ecommerce_sales
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month;


-- 9. TOP 10 PRODUCTS BY REVENUE
SELECT 
    product_id,
    category,
    COUNT(*) AS total_orders,
    SUM(quantity) AS total_units_sold,
    ROUND(SUM(total_amount), 2) AS total_revenue,
    ROUND(SUM(profit_margin), 2) AS total_profit
FROM ecommerce_sales
GROUP BY product_id, category
ORDER BY total_revenue DESC
LIMIT 10;


-- 10. CATEGORY PROFITABILITY ANALYSIS
SELECT
    category,
    ROUND(SUM(total_amount), 2) AS total_revenue,
    ROUND(SUM(profit_margin), 2) AS total_profit,
    ROUND(
        SUM(profit_margin) / SUM(total_amount) * 100,
        2
    ) AS profit_percentage
FROM ecommerce_sales
GROUP BY category
ORDER BY profit_percentage DESC;


-- 11. CUSTOMER AGE GROUP ANALYSIS
SELECT
    CASE
        WHEN customer_age < 25 THEN 'Under 25'
        WHEN customer_age BETWEEN 25 AND 34 THEN '25-34'
        WHEN customer_age BETWEEN 35 AND 44 THEN '35-44'
        WHEN customer_age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS total_orders,
    ROUND(SUM(total_amount), 2) AS total_revenue,
    ROUND(AVG(total_amount), 2) AS avg_order_value,
    ROUND(AVG(profit_margin), 2) AS avg_profit
FROM ecommerce_sales
GROUP BY age_group
ORDER BY total_revenue DESC;


-- 12. RANK CATEGORIES BY REVENUE
WITH category_sales AS (
    SELECT
        category,
        ROUND(SUM(total_amount), 2) AS total_revenue,
        ROUND(SUM(profit_margin), 2) AS total_profit
    FROM ecommerce_sales
    GROUP BY category
)
SELECT
    category,
    total_revenue,
    total_profit,
    RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM category_sales;