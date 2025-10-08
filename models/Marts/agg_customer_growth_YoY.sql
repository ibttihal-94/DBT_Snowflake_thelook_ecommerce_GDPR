{{ config(materialized='table') }}

with base as (
  select year, country, traffic_source, new_customers
  from {{ ref('fact_customer_growth') }}
),
y as (
  select
    year,
    country,
    traffic_source,
    new_customers,
    lag(new_customers) over (partition by country, traffic_source order by year) as prev_new_customers
  from base
)
select
  *,
  round( (new_customers - prev_new_customers)
         / nullif(prev_new_customers,0) * 100, 2) as yoy_growth_pct
from y
