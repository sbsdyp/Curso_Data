with
    stg_events as (select * from {{ source("sql_server_dbo", "events") }}),

    renamed_casted as (
        
        select
            event_id,
            product_id,
            session_id,
            page_url,
            order_id,
            user_id,
            event_type,
            created_at,
            _fivetran_deleted,
            _fivetran_synced
            
        from stg_events
    )
    select * from renamed_casted 
