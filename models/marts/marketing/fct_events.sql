{{ config(materialized="table") }}

        select
            event_id,
            product_id,
            session_id,
            page_url,
            order_id,
            user_id,
            event_type,
            created_at,
            year(created_at)*10000+month(created_at)*100+day(created_at) as created_at_id,
            _fivetran_deleted,
            _fivetran_synced
            
        from {{ ref("stg_sql_server_events") }}
 
