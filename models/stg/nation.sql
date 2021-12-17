--use schema test;
SELECT N_NATIONKEY, N_NAME FROM {{ source('stg_view', 'NATION') }}