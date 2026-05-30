-- Create Customer Dimension
-- CREATE TABLE warehouse.dim_customer (
--     customer_key SERIAL PRIMARY KEY,
--     customer_id VARCHAR(100) UNIQUE,
--     customer_unique_id VARCHAR(100),
--     customer_city VARCHAR(100),
--     customer_state VARCHAR(10)
-- );
-- INSERT INTO warehouse.dim_customer
-- (
--     customer_id,
--     customer_unique_id,
--     customer_city,
--     customer_state
-- )
-- SELECT
--     customer_id,
--     customer_unique_id,
--     customer_city,
--     customer_state
-- FROM staging.stg_customers;

-- SELECT COUNT(*)
-- FROM warehouse.dim_customer;

-- Create Product Dimension
-- CREATE TABLE warehouse.dim_product (
--     product_key SERIAL PRIMARY KEY,
--     product_id VARCHAR(100) UNIQUE,
--     product_category_name VARCHAR(255),
--     product_weight_g INT,
--     product_length_cm INT,
--     product_height_cm INT,
--     product_width_cm INT
-- );

-- INSERT INTO warehouse.dim_product
-- (
--     product_id,
--     product_category_name,
--     product_weight_g,
--     product_length_cm,
--     product_height_cm,
--     product_width_cm
-- )
-- SELECT
--     product_id,
--     product_category_name,
--     product_weight_g,
--     product_length_cm,
--     product_height_cm,
--     product_width_cm
-- FROM staging.stg_products;

-- -- Create Date Dimension
-- CREATE TABLE warehouse.dim_date (
--     date_key INT PRIMARY KEY,
--     full_date DATE,
--     day_num INT,
--     month_num INT,
--     year_num INT,
--     quarter_num INT
-- );
-- INSERT INTO warehouse.dim_date
-- (
--     date_key,
--     full_date,
--     day_num,
--     month_num,
--     year_num,
--     quarter_num
-- )
-- SELECT DISTINCT
--     TO_CHAR(order_purchase_timestamp,'YYYYMMDD')::INT,
--     DATE(order_purchase_timestamp),
--     EXTRACT(DAY FROM order_purchase_timestamp),
--     EXTRACT(MONTH FROM order_purchase_timestamp),
--     EXTRACT(YEAR FROM order_purchase_timestamp),
--     EXTRACT(QUARTER FROM order_purchase_timestamp)
-- FROM staging.stg_orders;

-- SELECT *
-- FROM warehouse.dim_date
-- LIMIT 10;

-- Create Fact Table
-- CREATE TABLE warehouse.fact_sales (
--     sales_key BIGSERIAL PRIMARY KEY,
--     order_id VARCHAR(100),

--     customer_key INT,
--     product_key INT,
--     date_key INT,

--     quantity INT,
--     sales_amount NUMERIC(12,2),
--     freight_amount NUMERIC(12,2),

--     FOREIGN KEY (customer_key)
--         REFERENCES warehouse.dim_customer(customer_key),

--     FOREIGN KEY (product_key)
--         REFERENCES warehouse.dim_product(product_key),

--     FOREIGN KEY (date_key)
--         REFERENCES warehouse.dim_date(date_key)
-- );

-- INSERT INTO warehouse.fact_sales
-- (
--     order_id,
--     customer_key,
--     product_key,
--     date_key,
--     quantity,
--     sales_amount,
--     freight_amount
-- )
-- SELECT
--     oi.order_id,
--     dc.customer_key,
--     dp.product_key,
--     TO_CHAR(o.order_purchase_timestamp,'YYYYMMDD')::INT,
--     1,
--     oi.price,
--     oi.freight_value
-- FROM staging.stg_order_items oi
-- JOIN staging.stg_orders o
-- ON oi.order_id = o.order_id

-- JOIN warehouse.dim_customer dc
-- ON o.customer_id = dc.customer_id

-- JOIN warehouse.dim_product dp
-- ON oi.product_id = dp.product_id;

SELECT *
FROM warehouse.fact_sales;
SELECT *
FROM warehouse.dim_date;

-- -- Create Indexes IMP
-- CREATE INDEX idx_fact_customer
-- ON warehouse.fact_sales(customer_key);

-- CREATE INDEX idx_fact_product
-- ON warehouse.fact_sales(product_key);

-- CREATE INDEX idx_fact_date
-- ON warehouse.fact_sales(date_key);



-- Test the Warehouse
-- Total Revenue
-- select sum(sales_amount) AS revenue from warehouse.fact_sales;


-- -- Revenue by State
-- SELECT
-- dc.customer_state,
-- ROUND(SUM(fs.sales_amount),2) revenue
-- FROM warehouse.fact_sales fs
-- JOIN warehouse.dim_customer dc
-- ON fs.customer_key = dc.customer_key
-- GROUP BY dc.customer_state
-- ORDER BY revenue DESC;


-- -- Monthly Sales
-- select month_num ,sum(sales_amount) as sales
-- from warehouse.fact_sales f
-- join warehouse.dim_date d
-- on f.date_key = d.date_key
-- group by d.month_num
-- order by 1

-- -- OR

-- SELECT
-- dd.year_num,
-- dd.month_num,
-- ROUND(SUM(fs.sales_amount),2) revenue
-- FROM warehouse.fact_sales fs
-- JOIN warehouse.dim_date dd
-- ON fs.date_key = dd.date_key
-- GROUP BY
-- dd.year_num,
-- dd.month_num
-- ORDER BY
-- dd.year_num,
-- dd.month_num;



