with
    stg_promos as (select * from {{ source("sql_server_dbo", "promos") }}),

    renamed_casted as (

        select
           md5((TRIM(promo_id)) as promo_sub_id,
           promo_id,
           status,
           discount,
           _fivetran_deleted,
           _fivetran_synced 
        from stg_promos
    )
    select * from renamed_casted 


    

