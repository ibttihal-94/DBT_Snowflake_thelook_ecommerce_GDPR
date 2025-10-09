with e as (select * from {{ ref('int_order_items_enriched') }})
select
    order_id,
    any_value(user_id) as user_id,
    min(order_created_at) as order_date,
    any_value(order_status) as order_status,
    sum(sale_price) as order_sale_price,
    sum(inventory_cost) as order_cost,
    sum(line_margin) as order_margin,
    count(distinct product_id) as product_count,
    max(is_cancelled) as is_cancelled,
    max(is_returned) as is_returned
from e
group by order_id