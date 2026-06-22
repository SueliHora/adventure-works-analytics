with joined as (
    select *
    from {{ ref('int_locations_joined') }}
)

select
    pk_address as address_id,
    city,
    state_province_name,
    country_region_name
from joined