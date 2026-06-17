with
    source_data as (
        select *
        from {{ source('adventure_works', 'person_address') }}
    ),

    cleansed_data as (
        select
            -- PRIMARY KEY
            cast(addressid as int) as pk_address,

            -- FOREIGN KEYS
            cast(stateprovinceid as int) as fk_state_province,

            -- ATTRIBUTES
            cast(addressline1 as string) as address_line_1,
            cast(addressline2 as string) as address_line_2,
            cast(city as string) as city,
            cast(postalcode as string) as postal_code

        from source_data
    )

select *
from cleansed_data