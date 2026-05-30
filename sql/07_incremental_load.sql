— Incremental Loading

-- this table always having last load data like table name and timestamp 4

-- CREATE TABLE analytics.etl_watermark (
--     table_name VARCHAR(100),
--     last_load_timestamp TIMESTAMP
-- );

-- INSERT INTO analytics.etl_watermark
-- VALUES
-- (
--     'orders',
--     '2017-01-01'
-- );


-- Load Only New Orders

-- SELECT *
-- FROM staging.stg_orders
-- WHERE order_purchase_timestamp >
-- (
--     SELECT last_load_timestamp
--     FROM analytics.etl_watermark
--     WHERE table_name='orders'
-- );
