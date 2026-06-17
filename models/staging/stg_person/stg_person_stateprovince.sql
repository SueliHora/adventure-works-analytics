with
    source_data as (
        select *
        from {{ source('adventure_works', 'person_stateprovince') }}
    ),

    cleansed_data as (
        select
            -- PRIMARY KEY
            cast(stateprovinceid as int) as pk_state_province,

            -- FOREIGN KEYS
            cast(territoryid as int) as fk_territory,

            -- ATTRIBUTES
            cast(stateprovincecode as string) as state_province_code,
            cast(countryregioncode as string) as country_region_code,
            cast(name as string) as state_province_name

        from source_data
    )

select *
from cleansed_data