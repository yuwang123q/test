with order_details as (select * from {{ref('order_detail_fs_stg')}})
select orderkey, SUM(LINEEXTENDEDPRICE)
from order_details
group by orderkey
having SUM(LINEEXTENDEDPRICE)<0