SELECT
    {{- case_order_status('o_orderstatus') -}} AS order_statues,
    COUNT(*) as total_count
FROM
    {{ source('analytics', 'orders') }}
GROUP BY
    1
ORDER BY
    2 DESC
