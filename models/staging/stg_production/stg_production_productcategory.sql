with
    source_data as (
        select *
        from {{ source('adventure_works', 'production_productcategory') }}
    ),

    cleansed_data as (
        select
            -- PRIMARY KEY
            cast(productcategoryid as int) as pk_product_category,

            -- ATTRIBUTES
            cast(name as string) as product_category_name

        from source_data
    )

select *
from cleansed_data