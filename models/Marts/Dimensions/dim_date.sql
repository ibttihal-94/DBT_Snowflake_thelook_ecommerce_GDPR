{{ config(materialized='table') }}

with d as (
  select dateadd(day, seq4(), to_date('2018-01-01')) as date_day
  from table(generator(rowcount => 3650)) -- 10 years of dates
)
select
  date_day,
  year(date_day)                    as year,
  month(date_day)                   as month,
  to_char(date_day, 'YYYY-MM')      as year_month,
  dayofweek(date_day)               as weekday_num,
  to_char(date_day, 'DY')           as weekday_name,
  quarter(date_day)                 as quarter
from d
