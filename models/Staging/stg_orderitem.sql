with order_item AS(
    select * 
    from {{ source('thelook','order_items') }}
)

select 
	ORDER_ITEM_ID ,
	ORDER_ID ,
	 {{ norm_user_id('user_id') }}         as user_id_raw,   -- raw, normalized (staging only)
  {{ pseudonymize_user('user_id') }}    as user_id,  
	PRODUCT_ID ,
	INVENTORY_ITEM_ID ,
	STATUS ,
	CREATED_AT ,
	SHIPPED_AT ,
	DELIVERED_AT ,
	RETURNED_AT ,
	SALE_PRICE 
	FROM
 order_item

