with
    source_data as (
        select *
        from {{ source('adventure_works', 'production_productsubcategory') }}
    ),

    cleansed_data as (
        select
            -- PRIMARY KEY
            cast(productsubcategoryid as int) as pk_product_subcategory,
            
            -- FOREIGN KEY
            cast(productcategoryid as int) as fk_product_category,

            -- ATTRIBUTES
            cast(name as string) as product_subcategory_name

        from source_data
    )

select *
from cleansed_data