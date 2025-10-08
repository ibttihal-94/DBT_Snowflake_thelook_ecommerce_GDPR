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
  users.country,
  users.traffic_source,
  count(distinct firsts.user_id)        as new_customers
from firsts
join users using (user_id)
group by 1,2,3
order by 1, new_customers desc