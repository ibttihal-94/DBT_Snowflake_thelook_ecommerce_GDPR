{{ config(materialized='table') }}

select
  user_id,
  lower(gender)                as gender,
  country,
  city,
  state,
  postal_code,
  lower(traffic_source)        as traffic_source,
  to_date(created_at)          as signup_date
from {{ ref('stg_users') }}
