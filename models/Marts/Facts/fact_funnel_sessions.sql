{{ config(materialized='table') }}

select
  event_day                   as date_day,
  visitor_id,
  is_anonymous,
  traffic_source,
  browser,
  city,
  state,
  postal_code,
  viewed,
  added_to_cart,
  purchased,
  canceled_event
from {{ ref('int_event_stage_flags') }}
