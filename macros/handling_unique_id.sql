{% macro generate_unique_key(column1, column2, column3, column4) %}
    md5({{ column1 }} || {{ column2 }} || {{ column3 }} || {{ column4 }})
{% endmacro %}
