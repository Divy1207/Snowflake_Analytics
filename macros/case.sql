{% macro case_order_status(column_name) %}
    CASE
        WHEN {{ column_name }} = 'P' THEN 'Pending'
        WHEN {{ column_name }} = 'O' THEN 'Completed'
        WHEN {{ column_name }} = 'F' THEN 'Failed'
        ELSE 'Unknown'
    END
{% endmacro %}
