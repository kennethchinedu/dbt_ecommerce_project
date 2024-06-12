
-- This extract months from date columns
{% macro extract_month(column) %}
 
    CASE 
        WHEN EXTRACT(MONTH FROM {{ column }}) = 1 THEN 'January'
        WHEN EXTRACT(MONTH FROM {{ column }}) = 2 THEN 'February'
        WHEN EXTRACT(MONTH FROM {{ column }}) = 3 THEN 'March'
        WHEN EXTRACT(MONTH FROM {{ column }}) = 4 THEN 'April'
        WHEN EXTRACT(MONTH FROM {{ column }}) = 5 THEN 'May'
        WHEN EXTRACT(MONTH FROM {{ column }}) = 6 THEN 'June'
        WHEN EXTRACT(MONTH FROM {{ column }}) = 7 THEN 'July'
        WHEN EXTRACT(MONTH FROM {{ column }}) = 8 THEN 'August'
        WHEN EXTRACT(MONTH FROM {{ column }}) = 9 THEN 'September'
        WHEN EXTRACT(MONTH FROM {{ column }}) = 10 THEN 'October'
        WHEN EXTRACT(MONTH FROM {{ column }}) = 11 THEN 'November'
        WHEN EXTRACT(MONTH FROM {{ column }}) = 12 THEN 'December'
    END 

{% endmacro %}
