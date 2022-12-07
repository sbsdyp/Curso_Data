{{ config(materialized="table") }}

select
    oin.order_id,
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
    o._fivetran_deleted,
    o._fivetran_synced
     
from {{ ref("stg_sql_server_orders") }} o
inner join {{ ref("int_orderitems_name") }} oin
on o.order_id = oin.order_id