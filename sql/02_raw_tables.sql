-- SELECT schema_name
-- FROM information_schema.schemata
-- WHERE schema_name IN ('raw_data','staging','warehouse','analytics');

-- CREATE TABLE raw_data.customers (
--     customer_id TEXT,
--     customer_unique_id TEXT,
--     customer_zip_code_prefix INT,
--     customer_city TEXT,
--     customer_state TEXT
-- );
-- CREATE TABLE raw_data.orders (
--     order_id TEXT,
--     customer_id TEXT,
--     order_status TEXT,
--     order_purchase_timestamp TIMESTAMP,
--     order_approved_at TIMESTAMP,
--     order_delivered_carrier_date TIMESTAMP,
--     order_delivered_customer_date TIMESTAMP,
--     order_estimated_delivery_date TIMESTAMP
-- );
-- CREATE TABLE raw_data.order_items (
--     order_id TEXT,
--     order_item_id INT,
--     product_id TEXT,
--     seller_id TEXT,
--     shipping_limit_date TIMESTAMP,
--     price NUMERIC(10,2),
--     freight_value NUMERIC(10,2)
-- );
-- CREATE TABLE raw_data.payments (
--     order_id TEXT,
--     payment_sequential INT,
--     payment_type TEXT,
--     payment_installments INT,
--     payment_value NUMERIC(10,2)
-- );
-- CREATE TABLE raw_data.products (
--     product_id TEXT,
--     product_category_name TEXT,
--     product_name_lenght INT,
--     product_description_lenght INT,
--     product_photos_qty INT,
--     product_weight_g INT,
--     product_length_cm INT,
--     product_height_cm INT,
--     product_width_cm INT
-- );


-- Loading data 

-- copy raw_data.customers
-- FROM 'D:/Prathmesh/Projects/SQL projects/retail_dw_project/data/customers.csv'
-- DELIMITER ','
-- CSV HEADER;

-- checking data is loaded or not 
-- SELECT COUNT(*) FROM raw_data.customers;

-- -- SELECT COUNT(*) FROM raw_data.orders;

-- -- SELECT COUNT(*) FROM raw_data.order_items;
