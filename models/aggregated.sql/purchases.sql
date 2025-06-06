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
