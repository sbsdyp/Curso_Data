

WITH 
src_budget_products AS (SELECT * FROM {{ source('google_sheets', 'budget') }}),

    renamed_casted AS (

    SELECT
        md5(CONCAT(_row,product_id)) as budget_id,
        TRIM(_row) as _row,
        product_id,
        quantity,
        month,
        _fivetran_synced
    FROM src_budget_products
    )

    SELECT * FROM renamed_casted