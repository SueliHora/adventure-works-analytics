with
    enriched_products as (
        select *
        from {{ ref('int_products_enriched') }}
    )
    , final_dimension as (
        select
            -- PRIMARY KEY
            pk_product as product_id,
            -- ATTRIBUTES
            product_name,
            product_number,
            product_subcategory,
            product_category,
            color,
            cast(list_price as decimal(19,4)) as list_price
        from enriched_products
    )
select *
from final_dimension