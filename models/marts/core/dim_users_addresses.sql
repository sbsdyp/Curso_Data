{{ config(materialized='table') }}

with
    dim_users as (select * from {{ ref('stg_sql_server_users') }}),
    stg_addresses as (select * from {{ ref('stg_sql_server_addresses') }}),

    dim_users_addresses as (
        select
            user_id,
            user_created_at,
            user_updated_at,
            address_id,
            last_name,
            first_name,
            email,
            phone_number
            
                                 
        from dim_users 
    )


    select 
    rc.user_id,
    rc.user_created_at,
    rc.user_updated_at,
    rc.address_id,
    rc.last_name,
    rc.first_name,
    rc.email,
    rc.phone_number,
    a.zipcode,
    a.country,
    a.address,
    a.state

    
    from dim_users_addresses rc
        left join stg_addresses a 
        on a.address_id = rc.address_id

