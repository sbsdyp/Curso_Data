{{ config(materialized="table") }}

select
     od.*
    , a.zipcode as order_zipcode
    , a.country as order_country
    , a.address as order_address
    , a.state as order_state
     
from {{ ref("fct_orders_denom") }} od
left join {{ source("sql_server_dbo", "addresses") }} a
on od.address_id = a.address_id