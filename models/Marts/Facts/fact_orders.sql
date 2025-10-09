{{ config(materialized='table') }}

select
  order_id,
  user_id,
  order_date                     as date_day,
  order_status,
  order_sale_price,
  order_cost,
  order_margin,
  product_count,
  is_cancelled,
  is_returned
from {{ ref('int_orders_rollup') }}