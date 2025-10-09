{{ config(materialized='table') }}

with e as (select * from {{ ref('int_order_items_enriched') }}),

joined as (
  select
    e.order_item_id,
    e.order_id,
    e.user_id,
    e.product_id,
    e.order_created_at::date       as date_day,

    -- measures
    e.sale_price                   as unit_sale_price,
    e.inventory_cost               as unit_cost,
    (e.sale_price)                 as sale_price,         -- per item
    (e.inventory_cost)             as line_cost,
    (e.line_margin)                as line_margin,          -- already computed

    -- flags / statuses
    e.order_status,
    e.is_cancelled,
    e.is_returned
  from e
)

select * from joined