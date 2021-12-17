SELECT stg.*, BIDW.CUST_NAME FROM {{ ref('order_detail_fs_stg') }} stg
LEFT JOIN {{ ref('cust_detail_d_bidw') }} bidw ON stg.cust_key = bidw.CUSTOMER_KEY