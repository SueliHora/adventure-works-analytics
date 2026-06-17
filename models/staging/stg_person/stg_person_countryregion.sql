with
    source_data as (
        select *
        from {{ source('adventure_works', 'person_countryregion') }}
    ),

    cleansed_data as (
        select
            -- PRIMARY KEY
            cast(countryregioncode as string) as pk_country_region,

            -- ATTRIBUTES
            cast(name as string) as country_region_name

        from source_data
        where countryregioncode is not null
            and trim(countryregioncode) != ''
    )

select *
from cleansed_data