with ejm_events as(
    select * 
    from {{ source('sql_server_dbo', 'events')}}  
),

int_session_events_users as(
    select
        session_id,
        created_at,
        user_id,
        product_id,
        {{colum_values_to_metrics (source('sql_server_dbo', 'events'), 'event_type')}}
    from ejm_events

     {{dbt_utils.group_by(4)}}
)

select * from int_session_events_users