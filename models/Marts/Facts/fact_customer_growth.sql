{{ config(materialized='table') }}


with firsts as ( select * from {{ ref('int_first_order_per_custoner') }} ),
users as (
  select
    user_id,
    country,
    traffic_source
  from {{ ref('stg_users') }}
)
select
  year(firsts.first_order_date)         as year,
  DATE_FROM_PARTS(year, 1, 1) AS date_key,
  users.country,
  users.traffic_source,
  count(distinct firsts.user_id)        as new_customers
from firsts
join users using (user_id)
group by 1,3,4
order by 1, new_customers desc