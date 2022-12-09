{{ config(materialized="table") }}

with
stg_budget as (select * from {{ ref("stg_google_sheets") }}),

    fct_budget as (

    select
        budget_id,
        product_id,
        quantity,
        year(month)*100+month(month)+day(month) as id_anio_mes
           
    from stg_budget
    )
    select * from fct_budget