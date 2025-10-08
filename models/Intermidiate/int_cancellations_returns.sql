with e as (select * from {{ ref('int_order_items_enriched') }})
select
    order_id,
    user_id,
    product_id,
    product_name,
    product_category,
    country,
    sale_price,
    inventory_cost,
    is_cancelled,
    is_returned
from e
where is_cancelled = 1 or is_returned = 1
