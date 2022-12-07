{{ config(materialized="table") }}

        select
            budget_id,
            _row,
            product_id,
            quantity,
            year(month)*10000+month(month)*100+day(month) as month_id,
            month,
            date_load
            
        from {{ ref("stg_google_sheets") }}