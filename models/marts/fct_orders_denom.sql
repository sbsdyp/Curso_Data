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
    o.promo_id,
    o.estimated_delivery_at,
    o.order_cost,
    o.order_total,
    o.delivered_at,
    o.tracking_id,
    o.status
     
from {{ ref("stg_sql_server_orders") }} o
inner join {{ ref("dim_orderitems_name") }} oin
on o.order_id = oin.order_id