{{ config(materialized="table") }}

select
      oin.*
    , o.shipping_service
    , o.shipping_cost
    , o.user_id
    , o.address_id
    , o.created_at as order_created
    , o.promo_id
    , o.estimated_delivery_at
    , o.order_cost
    , o.order_total
    , o.delivered_at
    , o.tracking_id
    , o.status
     
from {{ source("sql_server_dbo", "orders") }} o
inner join {{ ref("fct_orderitems_name") }} oin
on o.order_id = oin.order_id