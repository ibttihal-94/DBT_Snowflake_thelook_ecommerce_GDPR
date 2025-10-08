{{ config(materialized='table') }}

with f as (
  select * from {{ ref('int_event_stage_flags') }}
  where is_anonymous = 0
),
u as (
  select user_id, country, city, gender, traffic_source as signup_source
  from {{ ref('dim_customers') }}
)

select
  f.event_day                    as date_day,
  f.user_id,
  u.country,
  u.city,
  u.gender,
  f.traffic_source               as event_source,
  u.signup_source,
  f.viewed,
  f.added_to_cart,
  f.purchased,
  f.canceled_event
from f
left join u using (user_id)