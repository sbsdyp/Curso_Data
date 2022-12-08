{{ config(materialized="table") }}

with
stg_promos as (select * from {{ ref("stg_sql_server_promos") }}),

    dim_promos as (
    
    select
           promo_id,
           status,
           discount,
           _fivetran_deleted,
           _fivetran_synced 
    
    from stg_promos
    )
    select * from dim_promos
