{{ config(materialized="table") }}

with
stg_budget as (select * from {{ ref("stg_google_sheets") }}),

    fct_budget as (

    select
        budget_id,
        _row,
        product_id,
        quantity,
        year(month)*10000+month(month)*100+day(month) as month_id,
        date_load
           
    from stg_budget
    )
    select * from fct_budget