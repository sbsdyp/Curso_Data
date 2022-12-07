with
    stg_orders as (select * from {{ source("sql_server_dbo", "orders") }}),

    renamed_casted as (
        select
            order_id,
            order_cost,
            shipping_cost,
            order_total,
            user_id,
            delivered_at,
            status,
            promo_id,
            address_id,
            tracking_id,
            shipping_service,
            created_at,
            estimated_delivery_at,
            _fivetran_deleted,
            _fivetran_synced
            
        from stg_orders
    )
select *
from renamed_casted 




 
 
  