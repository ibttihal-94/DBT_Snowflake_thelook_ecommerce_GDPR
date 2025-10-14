with o AS(
    select * 
    from {{ source('thelook','orders') }}
)

select 
ORDER_ID,
 {{ norm_user_id('user_id') }}         as user_id_raw,   -- raw, normalized (staging only)
  {{ pseudonymize_user('user_id') }}    as user_id,  
STATUS,
GENDER,
CREATED_AT,
RETURNED_AT,
SHIPPED_AT,
DELIVERED_AT,
NUM_OF_ITEMS
from o