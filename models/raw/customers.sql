{{ config(materialized = 'table')}}

WITH customers AS (

    SELECT 
        *
    FROM
        SNOWFLAKE_SAMPLE_DATA.TPCH_SF10.CUSTOMER

)

SELECT * FROM customers