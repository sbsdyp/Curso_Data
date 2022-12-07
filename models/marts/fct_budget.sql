{{ config(materialized="table") }}

        select
            _row,
            product_id,
            quantity,
            month,
            date_load
            
        from {{ ref("stg_sql_server_events") }}