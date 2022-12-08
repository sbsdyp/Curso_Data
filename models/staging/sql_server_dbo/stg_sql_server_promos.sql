with
    stg_promos as (select * from {{ source("sql_server_dbo", "promos") }}),

    renamed_casted as (

        select
           promo_id,
           status,
           discount,
           _fivetran_deleted,
           _fivetran_synced 
        from stg_promos
    )
    select * from renamed_casted 


    

