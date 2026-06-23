with addresses as (
    select * 
    from {{ ref('stg_person_address') }}
),
stateprovince as (
    select * 
    from {{ ref('stg_person_stateprovince') }}
),
countryregion as (
    select * 
    from {{ ref('stg_person_countryregion') }}
),
joined as (
    select
        a.pk_address,
        a.address_line_1,
        a.address_line_2,
        a.city,
        a.postal_code,
        s.state_province_name,
        c.country_region_name
    from addresses a
    left join stateprovince s on a.fk_state_province = s.pk_state_province
    left join countryregion c on s.fk_country_region = c.pk_country_region 
) 
select *
from joined