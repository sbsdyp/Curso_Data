{{ config(materialized="table") }}

with
    fct_events as (select * from {{ source("sql_server_dbo", "events") }})

    select fe.event_id
        ,fe.page_url
        ,fe.event_type
        ,fe.product_id
        ,fe.session_id
        ,fe.created_at as event_created_at
        ,fe.order_id
        , a.*

    from fct_events fe
    left join {{ ref("dim_users_addresses") }} a
    on fe.user_id = a.user_id