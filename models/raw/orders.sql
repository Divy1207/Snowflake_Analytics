{{ config(materialized = 'table')}}
WITH orders AS (
    SELECT
        *
    FROM
        SNOWFLAKE_SAMPLE_DATA.TPCH_SF10.ORDERS
)

SELECT * FROM {{ source('analytics', 'orders') }}
