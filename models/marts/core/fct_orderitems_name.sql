
    select oi.order_id
        , oi.product_id
        , p.name
        , oi.quantity
    from {{ ref("stg_sql_server_orderitems") }} oi
    left join {{ source("sql_server_dbo", "products") }} p
    on oi.product_id = p.product_id
