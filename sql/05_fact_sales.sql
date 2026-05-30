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
