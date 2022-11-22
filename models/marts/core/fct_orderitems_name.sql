{{ config(materialized="table") }}


    select oi.order_id
        , oi.product_id
        , p.name
        , oi.quantity
    from {{ source("sql_server_dbo", "order_items") }} oi
    left join {{ source("sql_server_dbo", "products") }} p
    on oi.product_id = p.product_id
