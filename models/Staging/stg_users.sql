-- stg_users.sql
-- Staging table for users

SELECT
 {{ norm_user_id('id') }}              as user_id_raw,   -- raw, normalized (staging only)
  {{ pseudonymize_user('id') }}         as user_id,  
    first_name,
    last_name,
    email,
    age,
    gender,
    state,
    street_address,
    postal_code,
    city,
    country,
    latitude,
    longtitude,
    traffic_source,
    created_at
FROM
    {{ source('thelook','users') }}
