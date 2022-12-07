{% snapshot promos_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='product_id',
      strategy='timestamp',
      updated_at='_fivetran_synced',
    )
}}

select 
  promo_id,
  status,
  discount,
  _fivetran_deleted,
  _fivetran_synced 

from {{ ref("stg_sql_server_promos") }}

{% endsnapshot %}