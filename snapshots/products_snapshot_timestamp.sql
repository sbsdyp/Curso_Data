{% snapshot products_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='product_id',
      strategy='timestamp',
      updated_at='_fivetran_synced',
    )
}}

select 
  product_id,
  name,
  inventory,
  _fivetran_deleted,
  _fivetran_synced
from {{ ref("stg_sql_server_products") }}

{% endsnapshot %}