{{ config(materialized="table") }}

with
    dim_users as (select * from {{ ref("stg_sql_server_users") }}),

    renamed_casted as (
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
    zipcode,
    country,
    address,
    state
from renamed_casted rc
left join {{ ref("stg_sql_server_addresses") }} a on a.address_id = rc.address_id
