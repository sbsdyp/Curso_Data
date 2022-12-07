with
    stg_addresses as (select * from {{ source("sql_server_dbo", "addresses") }}),

    renamed_casted as (
        
        select
            address_id,
            zipcode,
            country,
            address,
            state
        from stg_addresses
    )
    select * from renamed_casted