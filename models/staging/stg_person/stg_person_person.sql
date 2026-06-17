with
    source_data as (
        select *
        from {{ source('adventure_works', 'person_person') }}
    ),

    cleansed_data as (
        select
            -- PRIMARY KEY
            cast(businessentityid as int) as pk_person,

            -- ATTRIBUTES
            cast(persontype as string) as person_type,
            cast(firstname as string) as first_name,
            cast(middlename as string) as middle_name,
            cast(lastname as string) as last_name

        from source_data
    )

select *
from cleansed_data