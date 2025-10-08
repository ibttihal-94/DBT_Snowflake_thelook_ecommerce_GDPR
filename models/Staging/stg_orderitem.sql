with order_item AS(
    select * 
    from {{ source('thelook','order_items') }}
)

select 
	ORDER_ITEM_ID ,
	ORDER_ID ,
	USER_ID ,
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

