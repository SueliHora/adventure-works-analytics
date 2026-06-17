with
    source_data as (
        select *
        from {{ source('adventure_works', 'sales_store') }}
    ),

    cleansed_data as (
        select
            -- PRIMARY KEY
            cast(businessentityid as int) as pk_store,

            -- ATTRIBUTES
            cast(name as string) as store_name

        from source_data
    )

select *
from cleansed_data