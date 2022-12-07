{{ config(materialized="table") }}

    select 
            address_id,
            zipcode,
            country,
            address,
            state
    
    from {{ ref("stg_sql_server_addresses") }}
