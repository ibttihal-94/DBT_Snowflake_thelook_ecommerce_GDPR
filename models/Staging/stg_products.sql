SELECT
    PRODUCT_ID,
    COST,
    CATEGORY,
    NAME,
    BRAND,
    RETAIL_PRICE,
    DEPARTMENT,
    SKU,
    DISTRIBUTION_CENTER_ID
FROM
     {{ source('thelook','products') }}
