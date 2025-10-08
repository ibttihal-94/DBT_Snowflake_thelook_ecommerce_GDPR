With
Orders As (
    select 
     USER_ID,  
    CAST(CREATED_AT AS DATE) AS CREATED_AT

    from {{ ref('stg_orders') }} )

    Select USER_ID, min(CREATED_AT) as FIRST_ORDER_DATE
    from Orders
    Group by USER_ID