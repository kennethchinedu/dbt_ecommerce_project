{% test timestamp_is_not_present(model, column_name) %}

SELECT * 
FROM {{ model }}
WHERE 
    {{ column_name}} < CURRENT_TIMESTAMP()

{% endtest %}

