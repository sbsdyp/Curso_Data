
with
    stg_users as (select * from {{ source("sql_server_dbo", "users") }}),

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
            
        from stg_users
    )
    select * from renamed_casted 