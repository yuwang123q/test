
/*select
year(orderdate),
count(distinct case when orderstatus = 'O' then orderkey end) as ORDER_COUNT_O,
count(distinct case when orderstatus = 'P' then orderkey end) as ORDER_COUNT_P,
count(distinct case when orderstatus = 'F' then orderkey end) as ORDER_COUNT_F,
COUNT(DISTINCT orderkey) as total_ORDER_COUNT
from {{ ref('order_detail_f_bidw') }}
group by 1


{% set orderstatus = ["O", "P", "F"] %}
select
year(orderdate),
{% for orderstatus in orderstatus %}
COUNT(DISTINCT case when orderstatus = '{{orderstatus}}' then orderkey end) as ORDER_COUNT_{{orderstatus}}
{% if not loop.last %},{% endif %}
{% endfor %}
--COUNT(DISTINCT orderkey) as total_ORDER_COUNT
from {{ ref('order_detail_f_bidw') }}
group by 1
*/


{%- set orderstatus = get_orderstatus() -%}

select year(orderdate) AS ORDER_YEAR,
{%- for orderstatus in orderstatus %}
count(distinct case when orderstatus = '{{orderstatus}}' then orderkey end) as ORDER_COUNT_{{orderstatus}}
{%- if not loop.last %},{% endif -%}
{% endfor %}
--count(distinct orderkey) as ORDER_COUNT_TOTAL
from {{ ref('order_detail_f_bidw') }}
group by 1

