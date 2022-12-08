{{ config(materialized="table") }}

with
stg_products as (select * from {{ ref("stg_sql_server_products") }}),

    dim_products as (
    
    select
        product_id,
        name,
        inventory,
        _fivetran_deleted,
        _fivetran_synced
    
    from stg_products
    )
    select * from dim_products
