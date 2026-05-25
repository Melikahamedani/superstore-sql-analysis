-- 1. Total Sales
SELECT
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore;

-- 2. Total Profit
SELECT
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore;

-- 3. Total Orders
SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM superstore;

-- 4. Sales by Category
SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;

-- 5. Profit by Category
SELECT
    category,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_profit DESC;

-- 6. Revenue by Region
SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;

-- 7. Top 10 Customers by Sales
SELECT
    customer_name,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- 8. Average Order Value
SELECT
    ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS average_order_value
FROM superstore;

-- 9. Monthly Sales Trend
SELECT
    DATE_TRUNC('month', order_date) AS month,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY month
ORDER BY month;

-- 10. Lowest Profit Category
SELECT
    category,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_profit ASC
LIMIT 1;
