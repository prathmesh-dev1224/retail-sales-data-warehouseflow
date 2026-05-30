-- Implement SCD Type 2
-- CREATE TABLE warehouse.dim_customer_scd (
--     customer_key SERIAL PRIMARY KEY,
--     customer_id VARCHAR(100),

--     customer_unique_id VARCHAR(100),
--     customer_city VARCHAR(100),
--     customer_state VARCHAR(10),

--     effective_date DATE,
--     end_date DATE,

--     is_current CHAR(1)
-- );
-- -- Initial Load
-- INSERT INTO warehouse.dim_customer_scd
-- (
--     customer_id,
--     customer_unique_id,
--     customer_city,
--     customer_state,
--     effective_date,
--     end_date,
--     is_current
-- )
-- SELECT
--     customer_id,
--     customer_unique_id,
--     customer_city,
--     customer_state,
--     CURRENT_DATE,
--     NULL,
--     'Y'
-- FROM staging.stg_customers;

-- SELECT *
-- FROM warehouse.dim_customer_scd
-- WHERE customer_id = '00012a2ce6f8dcda20d059ce98491703'
-- LIMIT 1;

-- UPDATE warehouse.dim_customer_scd
-- SET
--     end_date = CURRENT_DATE,
--     is_current = 'N'
-- WHERE customer_id = '00012a2ce6f8dcda20d059ce98491703'
-- AND is_current = 'Y';

-- INSERT INTO warehouse.dim_customer_scd
-- (
--     customer_id,
--     customer_unique_id,
--     customer_city,
--     customer_state,
--     effective_date,
--     end_date,
--     is_current
-- )
-- VALUES
-- (
--     '00012a2ce6f8dcda20d059ce98491703',
--     '248ffe10d632bebe4f7267f1f44844c9',
--     'PUNE',
--     'MH',
--     CURRENT_DATE,
--     NULL,
--     'Y'
-- );

