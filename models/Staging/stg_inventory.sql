with inventory_items AS(
    select * 
    from {{ source('thelook','inventory_items') }}
)

select
INVENTORY_ITEM_ID,
PRODUCT_ID,
CREATED_AT,
SOLD_AT,
COST,
PRODUCT_CATEGORY,

PRODUCT_NAME,
PRODUCT_BRAND,

PRODUCT_RETAIL_PRICE,
PRODUCT_DEPARTMENT,
PRODUCT_SKU,
PRODUCT_DISTRIBUTION_CENTER_ID
from inventory_items
