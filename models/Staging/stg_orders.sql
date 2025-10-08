with o AS(
    select * 
    from {{ source('thelook','orders') }}
)

select 
ORDER_ID,
USER_ID,
STATUS,
GENDER,
CREATED_AT,
RETURNED_AT,
SHIPPED_AT,
DELIVERED_AT,
NUM_OF_ITEMS
from o