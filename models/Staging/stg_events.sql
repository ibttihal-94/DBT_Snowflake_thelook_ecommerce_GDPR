SELECT
    EVENTS_ID,
    SESSION_ID,
    SEQUENCE_NUMBER,
    CREATED_AT,
    BROWSER,
    IP_ADDRESS,
    CITY,
    STATE,
    POSTAL_CODE,
    TRAFFIC_SOURCE,
    URI,
    EVENT_TYPE,
    USER_ID
FROM
 {{ source('thelook','events') }}