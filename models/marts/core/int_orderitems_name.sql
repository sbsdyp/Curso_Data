{{ config(materialized="table") }}

with

stg_orderitems as (select * from {{ ref("stg_sql_server_orderitems") }} ),
stg_products as (select * from {{ ref("stg_sql_server_products") }} ),

    int_orderitems_name as (

    select 
        oi.order_id,
        oi.product_id,
        p.name,
        oi.quantity
    from stg_orderitems oi
         left join stg_products p
         on oi.product_id = p.product_id
    )

    select * from int_orderitems_name

