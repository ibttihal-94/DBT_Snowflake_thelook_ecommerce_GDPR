{{ config(materialized='table') }}

select
  product_id,
  sku                       as product_sku,
  name                      as product_name,
  brand                     as product_brand,
  lower(category)           as product_category,
  lower(department)         as product_department,
  retail_price              as product_retail_price
from {{ ref('stg_products') }}