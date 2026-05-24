# Superstore SQL Analysis Project

## Project Overview

This project analyzes retail sales data using PostgreSQL.

The original Superstore dataset was transformed into a relational database structure consisting of:

- customers
- products
- order_details

The project focuses on business analytics, KPI reporting, customer segmentation, profitability analysis, and time-series analysis using advanced SQL techniques.

---

## Tools Used

- PostgreSQL
- pgAdmin 4
- GitHub

---

## SQL Skills Demonstrated

- JOINs
- CTEs
- Window Functions
- RANK()
- PARTITION BY
- CASE WHEN
- Aggregations
- KPI Calculations
- DATE_TRUNC
- LAG()
- Running Totals
- Customer Segmentation
- Time-Series Analysis

---

## Database Structure

### customers
Contains customer information:
- customer_id
- customer_name
- segment
- region
- market

### products
Contains product information:
- product_id
- product_name
- category
- sub_category

### order_details
Contains transactional sales data:
- order_id
- order_date
- customer_id
- product_id
- sales
- profit
- quantity
- shipping_cost
- ship_mode

---

## Business Questions Solved

### Customer Analysis
- Top customers by sales
- Customer lifetime value (CLV)
- Favorite shipping method per customer

### Product Analysis
- Top products by profit
- Most profitable product per category
- Products never ordered

### Sales Analysis
- Month-over-month sales trends
- Running monthly sales totals
- Regional profit margins

### Advanced SQL Analysis
- Top 3 products in each category
- Best month for each category
- Ranking customers by sales

---

## Key Learnings

This project improved my understanding of:
- relational databases
- SQL analytics
- business KPI reporting
- advanced SQL window functions
- multi-table JOIN analysis
