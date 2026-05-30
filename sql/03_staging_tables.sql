 -- Create Staging Tables
-- Staging Customers
-- CREATE TABLE staging.stg_customers AS
-- SELECT DISTINCT customer_id,
--     customer_unique_id,
--     customer_zip_code_prefix,
--     TRIM(customer_city) AS customer_city,
--     UPPER(customer_state) AS customer_state
-- FROM raw_data.customers;

SELECT COUNT(*) FROM staging.stg_customers;

-- Staging Products
-- CREATE TABLE staging.stg_products AS
-- SELECT DISTINCT product_id,
--     product_category_name,
--     product_name_lenght,
--     product_description_lenght,
--     product_photos_qty,
--     product_weight_g,
--     product_length_cm,
--     product_height_cm,
--     product_width_cm
-- FROM raw_data.products;

-- Create Clean Orders Table
-- CREATE TABLE staging.stg_orders AS
-- SELECT
--     order_id,
--     customer_id,
--     order_status,
--     order_purchase_timestamp,
--     order_approved_at,
--     order_delivered_carrier_date,
--     order_delivered_customer_date,
--     order_estimated_delivery_date
-- FROM raw_data.orders;

-- CREATE TABLE staging.stg_order_items AS
-- SELECT
--     order_id,
--     order_item_id,
--     product_id,
--     seller_id,
--     shipping_limit_date,
--     price,
--     freight_value
-- FROM raw_data.order_items;

-- create clean payments 
-- CREATE TABLE staging.stg_payments AS
-- SELECT
--     order_id,
--     payment_type,
--     payment_installments,
--     payment_value
-- FROM raw_data.payments;

-- Add Primary Keys

-- Customers
-- ALTER TABLE staging.stg_customers
-- ADD PRIMARY KEY (customer_id);
-- -- Products
-- ALTER TABLE staging.stg_products
-- ADD PRIMARY KEY (product_id);
-- -- Orders
-- ALTER TABLE staging.stg_orders
-- ADD PRIMARY KEY (order_id);


-- Create an ETL Audit Table

-- CREATE TABLE analytics.etl_audit (
--     load_id SERIAL PRIMARY KEY,
--     table_name VARCHAR(100),
--     row_count INT,
--     load_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );

-- INSERT INTO analytics.etl_audit(table_name,row_count)
-- SELECT 'stg_customers', COUNT(*) FROM staging.stg_customers;
-- INSERT INTO analytics.etl_audit(table_name,row_count)
-- SELECT 'stg_products', COUNT(*) FROM staging.stg_products;
-- INSERT INTO analytics.etl_audit(table_name,row_count)
-- SELECT 'stg_orders', COUNT(*) FROM staging.stg_orders;
-- INSERT INTO analytics.etl_audit(table_name,row_count)
-- SELECT 'stg_order_items', COUNT(*) FROM staging.stg_order_items;
-- INSERT INTO analytics.etl_audit(table_name,row_count)
-- SELECT 'stg_payments', COUNT(*) FROM staging.stg_payments;


-- select * from analytics.etl_audit




