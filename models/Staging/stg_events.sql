SELECT
    EVENTS_ID,
    SESSION_ID,
  {{ norm_user_id('user_id') }}         as user_id_raw,   -- raw, normalized (staging only)
  {{ pseudonymize_user('user_id') }}    as user_id,  
    SEQUENCE_NUMBER,
    CREATED_AT,
    BROWSER,
    IP_ADDRESS,
    CITY,
    STATE,
    POSTAL_CODE,
    TRAFFIC_SOURCE,
    URI,
    EVENT_TYPE
FROM
 {{ source('thelook','events') }}