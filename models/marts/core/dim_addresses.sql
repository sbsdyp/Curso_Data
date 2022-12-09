{{ config(materialized="table") }}

with
stg_addresses as (select * from {{ ref("stg_sql_server_addresses") }}),

    dim_addresses as (
    
    select
            address_id,
            zipcode,
            country,
            address,
            state
    
    from stg_addresses
    )
    select * from dim_addresses
