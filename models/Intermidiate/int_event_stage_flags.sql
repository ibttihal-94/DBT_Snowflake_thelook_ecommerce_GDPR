
with ev as (
    select
        coalesce(cast(user_id as varchar), concat('anon:', cast(session_id as varchar))) as visitor_id,
        user_id,
        session_id,
        to_date(created_at)               as event_day,
        lower(trim(event_type))           as event_type,
        lower(trim(traffic_source))       as traffic_source,
        lower(trim(browser))              as browser,
        lower(trim(city))                 as city,
        lower(trim(state))                as state,
        postal_code,
        ip_address,
        uri
    from {{ ref('stg_events') }}
    where event_type is not null
),

-- Normalize event types into funnel stages
norm as (
    select
        *,
        case
            when event_type in ('home', 'product', 'department') then 'view'
            when event_type = 'cart' then 'cart'
            when event_type = 'purchase' then 'purchase'
            when event_type = 'cancel' then 'cancel'
            else 'other'
        end as funnel_stage
    from ev
)

select
    visitor_id,
    user_id,
    event_day,
    traffic_source,
    browser,
    city,
    state,
    postal_code,
    min(ip_address) as ip_address,
    max(iff(funnel_stage = 'view', 1, 0))     as viewed,
    max(iff(funnel_stage = 'cart', 1, 0))     as added_to_cart,
    max(iff(funnel_stage = 'purchase', 1, 0)) as purchased,
    max(iff(funnel_stage = 'cancel', 1, 0))   as canceled_event,
    iff(user_id is null, 1, 0)                as is_anonymous
from norm
group by visitor_id, user_id, event_day, traffic_source, browser, city, state, postal_code

