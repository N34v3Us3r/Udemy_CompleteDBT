{% macro imp_to_metric_temp(x) %}

    ({{x}} - 32) * 5/9 

{% endmacro %}