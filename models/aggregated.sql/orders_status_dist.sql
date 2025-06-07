SELECT
    CASE
        WHEN o_orderstatus = 'P' THEN 'Pending'
        WHEN o_orderstatus = 'O' THEN 'Completed'
        WHEN o_orderstatus = 'F' THEN 'Failed'
    END as order_status,
    COUNT(*) as total_count
FROM
    {{ source('analytics', 'orders') }}
GROUP BY
    1
ORDER BY
    2 DESC
