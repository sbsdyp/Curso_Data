with
    stg_order_items as (select * from {{ source("sql_server_dbo", "order_items") }}),

    renamed_casted as (

        select
            order_id,
            product_id,
            quantity,
            _fivetran_synced
            
        from stg_order_items
    )
    select * from renamed_casted 