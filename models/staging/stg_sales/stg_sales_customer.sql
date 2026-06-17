with
    source_data as (
        select *
        from {{ source('adventure_works', 'sales_customer') }}
    ),

    cleansed_data as (
        select
            -- PRIMARY KEY
            cast(customerid as int) as pk_customer,

            -- FOREIGN KEYS
            cast(personid as int) as fk_person,
            cast(storeid as int) as fk_store,
            cast(territoryid as int) as fk_territory
            
        from source_data
    )

select *
from cleansed_data