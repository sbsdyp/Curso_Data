{{ config(materialized="table") }}

    select 
        oi.order_id,
        oi.product_id,
        p.name,
        oi.quantity
    from {{ ref("stg_sql_server_orderitems") }} oi
    left join {{ ref("stg_sql_server_products") }} p
    on oi.product_id = p.product_id
