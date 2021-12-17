WITH CUST AS (SELECT C_CUSTKEY, C_NAME, C_PHONE, C_NATIONKEY FROM {{ source('stg_view', 'CUSTOMER') }}),
NATION AS (SELECT N_NATIONKEY, N_NAME FROM {{ source('stg_view', 'NATION') }})
SELECT C_CUSTKEY AS CUSTOMER_KEY, C_NAME AS CUST_NAME, N_NAME AS NATION_NAME, C_PHONE AS CUST_PHONE
FROM CUST LEFT JOIN NATION ON CUST.C_NATIONKEY = NATION.N_NATIONKEY