{{ config(materialized="table") }}

with
    dim_users as (select * from {{ ref("stg_sql_server_users") }}),

    renamed_casted as (
        select
            user_id,
            created_at as user_created_at,
            updated_at as user_updated_at,
            address_id,
            last_name,
            first_name,
            email,
            phone_number
        from dim_users
    )
select rc.*, zipcode, country, address, state
from renamed_casted rc
left join {{ ref("stg_sql_server_addresses") }} a on a.address_id = rc.address_id
