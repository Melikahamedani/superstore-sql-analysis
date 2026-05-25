-- 1. Customer Segmentation
SELECT
    customer_name,
    ROUND(SUM(sales), 2) AS total_sales,
    CASE
        WHEN SUM(sales) >= 20000 THEN 'VIP'
        WHEN SUM(sales) >= 5000 THEN 'Regular'
        ELSE 'Small'
    END AS customer_type
FROM superstore
GROUP BY customer_name
ORDER BY total_sales DESC;

-- 2. Regional Profit Margin
SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM superstore
GROUP BY region
ORDER BY profit_margin_pct DESC;

-- 3. Top Products by Profit
SELECT
    product_name,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;

-- 4. Running Monthly Sales Total
WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', order_date) AS month,
        ROUND(SUM(sales), 2) AS total_sales
    FROM superstore
    GROUP BY month
)
SELECT
    month,
    total_sales,
    SUM(total_sales) OVER (ORDER BY month) AS running_total
FROM monthly_sales
ORDER BY month;

-- 5. Rank Customers by Total Sales
SELECT
    customer_name,
    ROUND(SUM(sales), 2) AS total_sales,
    RANK() OVER (
        ORDER BY SUM(sales) DESC
    ) AS customer_rank
FROM superstore
GROUP BY customer_name
ORDER BY total_sales DESC;

-- 6. Top Customer in Each Segment
WITH top_customer AS (
    SELECT
        c.customer_name,
        c.segment,
        ROUND(SUM(o.sales), 2) AS total_sales,
        RANK() OVER (
            PARTITION BY c.segment
            ORDER BY SUM(o.sales) DESC
        ) AS ranked_customer
    FROM customers AS c
    JOIN order_details AS o
        ON c.customer_id = o.customer_id
    GROUP BY
        c.customer_name,
        c.segment
)
SELECT *
FROM top_customer
WHERE ranked_customer = 1;

-- 7. Most Profitable Product in Each Category
WITH product_category AS (
    SELECT
        p.product_name,
        p.category,
        ROUND(SUM(o.profit), 2) AS total_profit
    FROM products AS p
    JOIN order_details AS o
        ON p.product_id = o.product_id
    GROUP BY
        p.product_name,
        p.category
),
ranking_products AS (
    SELECT
        product_name,
        category,
        total_profit,
        RANK() OVER (
            PARTITION BY category
            ORDER BY total_profit DESC
        ) AS ranked_product
    FROM product_category
)
SELECT *
FROM ranking_products
WHERE ranked_product = 1;

-- 8. Favorite Shipping Method per Customer
WITH customer_shipping AS (
    SELECT
        c.customer_name,
        o.ship_mode,
        COUNT(DISTINCT o.order_id) AS total_orders
    FROM customers AS c
    JOIN order_details AS o
        ON c.customer_id = o.customer_id
    GROUP BY
        c.customer_name,
        o.ship_mode
),
prefer_shipping_method AS (
    SELECT
        customer_name,
        ship_mode,
        total_orders,
        RANK() OVER (
            PARTITION BY customer_name
            ORDER BY total_orders DESC
        ) AS ranked_ship
    FROM customer_shipping
)
SELECT *
FROM prefer_shipping_method
WHERE ranked_ship = 1;

-- 9. Products Never Ordered
SELECT
    p.product_name
FROM products AS p
LEFT JOIN order_details AS o
    ON p.product_id = o.product_id
WHERE o.product_id IS NULL;

-- 10. Month-over-Month Sales Comparison
WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', order_date) AS month,
        ROUND(SUM(sales), 2) AS total_sales
    FROM superstore
    GROUP BY month
)
SELECT
    month,
    total_sales,
    LAG(total_sales) OVER (
        ORDER BY month
    ) AS previous_month_sales
FROM monthly_sales
ORDER BY month;
