with oi as (
    select
        order_item_id,
        order_id,
        user_id,
        product_id,
        inventory_item_id,
        status,
        created_at,
        shipped_at,
        delivered_at,
        returned_at,
        sale_price
    from {{ ref('stg_orderitem') }}
),
o as (
    select
        order_id,
        user_id,
        status as order_status,
        created_at as order_created_at,
        returned_at,
        shipped_at,
        delivered_at,
        num_of_items
    from {{ ref('stg_orders') }}
),
p as (
    select
        product_id,
        sku as product_sku,
        name as product_name,
        brand as product_brand,
        category as product_category,
        department as product_department,
        retail_price as product_retail_price
    from {{ ref('stg_products') }}
),
inv as (
    select
        inventory_item_id,
        product_id,
        cost as inventory_cost,
        product_distribution_center_id
    from {{ ref('stg_inventory') }}
),
u as (
    select
        user_id,
        country,
        city,
        gender,
        traffic_source,
        created_at as signup_date
    from {{ ref('stg_users') }}
)
select
    oi.order_item_id,
    oi.order_id,
    o.user_id,
    oi.product_id,
    oi.inventory_item_id,

    -- revenue / cost / margin
    oi.sale_price,
    inv.inventory_cost,
    (oi.sale_price - inv.inventory_cost) as line_margin,

    -- product info
    p.product_name,
    p.product_brand,
    p.product_category,
    p.product_department,
    p.product_retail_price,

    -- customer & geo
    u.country,
    u.city,
    u.gender,
    u.traffic_source,

    -- logistics
    o.order_status,
    oi.status as item_status,
    o.order_created_at,
    o.shipped_at,
    o.delivered_at,
    o.returned_at,

    -- quality flags
    iff(lower(o.order_status) in ('cancelled','canceled'),1,0) as is_cancelled,
    iff(lower(o.order_status) in ('returned','refunded'),1,0) as is_returned
from oi
left join o using(order_id)
left join p using(product_id)
left join inv using(product_id)
left join u using(user_id)