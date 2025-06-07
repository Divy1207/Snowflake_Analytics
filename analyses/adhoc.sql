SELECT *
FROM {{ ref('purchases') }}
LIMIT 10
