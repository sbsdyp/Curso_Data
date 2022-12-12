{{ config(materialized="incremental") }}

with

stg_server as ( select * from {{ ref('stg_sql_server_orders') }}),
int_orderitems as ( select * from {{ ref('int_orderitems_name') }}),


    fct_orders_denom as (
    
    select
    o.order_id,
    oin.product_id,
    oin.name,
    oin.quantity,
    o.shipping_service,
    o.shipping_cost,
    o.user_id,
    o.address_id,
    o.created_at as order_created,
    year(o.created_at)*10000+month(o.created_at)*100+day(o.created_at) as created_at_id,
    o.promo_id,
    o.estimated_delivery_at,
    o.order_cost,
    o.order_total,
    o.delivered_at,
    o.tracking_id,
    o.status,
    o._fivetran_synced

    from stg_server o
        inner join int_orderitems oin 
         on o.order_id = oin.order_id
    )

    select * from fct_orders_denom

{% if is_incremental() %}

  where _fivetran_synced > (select max(_fivetran_synced) from {{ this }})

{% endif %}