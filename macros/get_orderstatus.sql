{% macro get_orderstatus() %}

{% set orderstatus_query %}
select distinct
orderstatus
from {{ ref('order_detail_f_bidw') }}
order by 1
{% endset %}
{% set results = run_query(orderstatus_query) %}
{% if execute %} --if return the first column
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}
{{ return(results_list) }}
{% endmacro %}