SELECT 
    Distribution_ID, 
    Latitude, 
    LONGTITUDE, 
    Name
FROM 
    {{ source('thelook','distribution_centers') }}
