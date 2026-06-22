with
    -- Importing staging models
    products as (
        select *
        from {{ ref('stg_production_product') }}
    )

    , subcategories as (
        select *
        from {{ ref('stg_production_productsubcategory') }}
    )

    , categories as (
        select *
        from {{ ref('stg_production_productcategory') }}
    )

    -- Enchaining joins to enrich product with subcategory and category details
    , enriched_products as (
        select
            p.pk_product
            , p.product_name
            , p.product_number
            , s.product_subcategory_name as product_subcategory
            , c.product_category_name as product_category
            , p.color
            , p.list_price
        from products p
        left join subcategories s on p.fk_subcategory = s.pk_product_subcategory
        left join categories c on s.fk_product_category = c.pk_product_category
    )

select *
from enriched_products