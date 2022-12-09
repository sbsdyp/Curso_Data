{{ config(materialized="table") }}

with
stg_products as (select * from {{ ref("stg_sql_server_products") }}),

    dim_products as (
    
    select
        product_id,
        name,
        inventory
    
    from stg_products
    )
    select * from dim_products
