{{ config(materialized="table") }}

with fct_events as (select * from {{ source("sql_server_dbo", "events") }})
    

select
    fe.event_id,
    fe.page_url,
    fe.event_type,
    fe.product_id,
    fe.session_id,
    fe.created_at as event_created_at,
    fe.order_id,
    a.user_id,
    a.created_at as user_created_at,
    a.updated_at as user_updated_at,
    a.address_id,
    a.last_name,
    a.first_name,
    a.email,
    a.phone_number

from fct_events fe
left join {{ ref("dim_users_addresses") }} a on fe.user_id = a.user_id
