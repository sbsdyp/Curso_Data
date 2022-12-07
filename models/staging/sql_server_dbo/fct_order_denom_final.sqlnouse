{{ config(materialized="table") }}

select
      oad.*
    , ua.user_created_at
    , ua.user_updated_at
    , ua.last_name
    , ua.first_name
    , ua.email
    , ua.phone_number 

from {{ ref("fct_order_address_denom") }} oad
left join {{ ref("dim_users_addresses") }} ua
on oad.user_id = ua.user_id