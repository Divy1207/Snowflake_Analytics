-- models/orders_with_customers.sql

{{ config(
    materialized = 'incremental',
    unique_key = 'o_orderkey'
) }}

SELECT
    o.o_orderkey,
    o.o_custkey,
    c.c_name,
    o.o_orderstatus,
    o.o_totalprice,
    o.o_orderdate,
    o.o_orderpriority
FROM
    {{ source('analytics', 'orders') }} AS o
JOIN
    {{ source('analytics', 'customers') }} AS c
ON
    o.o_custkey = c.c_custkey

{% if is_incremental() %}
-- Only include new or updated records
WHERE o.o_orderdate > (SELECT MAX(o_orderdate) FROM {{ this }})
{% endif %}
