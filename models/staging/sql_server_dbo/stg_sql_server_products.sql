with
    stg_ptoducts as (select * from {{ source("sql_server_dbo", "products") }}),

    renamed_casted as (
        select
            product_id,
            name,
            inventory,
            _fivetran_deleted,
            _fivetran_synced
            
        from stg_ptoducts
    )
select *
from renamed_casted 

