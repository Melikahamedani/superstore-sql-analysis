-- Convert imported text fields into proper data types

ALTER TABLE superstore

ALTER COLUMN discount TYPE NUMERIC(5,2)
USING NULLIF(REPLACE(discount, ',', ''), '')::NUMERIC,

ALTER COLUMN order_date TYPE TIMESTAMP
USING order_date::TIMESTAMP,

ALTER COLUMN profit TYPE NUMERIC(12,2)
USING NULLIF(REPLACE(profit, ',', ''), '')::NUMERIC,

ALTER COLUMN quantity TYPE INT
USING NULLIF(quantity, '')::INT,

ALTER COLUMN row_id TYPE INT
USING NULLIF(row_id, '')::INT,

ALTER COLUMN sales TYPE NUMERIC(12,2)
USING NULLIF(REPLACE(sales, ',', ''), '')::NUMERIC,

ALTER COLUMN ship_date TYPE TIMESTAMP
USING ship_date::TIMESTAMP,

ALTER COLUMN shipping_cost TYPE NUMERIC(12,2)
USING NULLIF(REPLACE(shipping_cost, ',', ''), '')::NUMERIC,

ALTER COLUMN year TYPE INT
USING NULLIF(year, '')::INT,

ALTER COLUMN weeknum TYPE INT
USING NULLIF(weeknum, '')::INT;
