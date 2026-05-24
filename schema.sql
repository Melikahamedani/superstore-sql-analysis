-- Create relational tables from the cleaned superstore table

DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS order_details;

-- Create customer table 

CREATE TABLE customers AS
SELECT DISTINCT
    customer_id,
    customer_name,
    segment,
    region,
    market
FROM superstore;

-- Create products table

CREATE TABLE products AS
SELECT DISTINCT
    product_id,
    product_name,
    category,
    sub_category
FROM superstore;

-- Create order_details table

CREATE TABLE order_details AS
SELECT
    order_id,
    order_date,
    ship_date,
    customer_id,
    product_id,
    sales,
    profit,
    quantity,
    discount,
    shipping_cost,
    ship_mode,
    order_priority
FROM superstore;
