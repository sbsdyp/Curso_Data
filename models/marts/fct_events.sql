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
            _fivetran_deleted,
            _fivetran_synced
            
        from {{ ref("stg_sql_server_events") }}
 
