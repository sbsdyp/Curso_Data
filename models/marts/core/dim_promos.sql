{{ config(materialized="incremental") }}

with
stg_promos as (select * from {{ ref("stg_sql_server_promos") }}),

    dim_promos as (
    
    select
           promo_id,
           status,
           discount,
           _fivetran_synced
    
    from stg_promos
    )
    select * from dim_promos

{% if is_incremental() %}

  where _fivetran_synced > (select max(_fivetran_synced) from {{ this }})

{% endif %}
