with
    -- 1. Import source data
    source_data as (
        select *
        from {{ source('adventure_works', 'production_product') }}
    ),

    -- 2. Clean, Rename and Cast
    cleansed_data as (
        select
            -- PRIMARY KEY
            cast(productid as int) as pk_product,
            
            -- FOREIGN KEYS
            cast(productsubcategoryid as int) as fk_subcategory,
            cast(productmodelid as int) as fk_model,
            
            -- STRINGS
            cast(name as string) as product_name,
            cast(productnumber as string) as product_number,
            
            -- FLAGS / BOOLEANS
            makeflag as is_manufactured,
            finishedgoodsflag as is_finished_good,
            
            -- ATTRIBUTES & NULL HANDLING
            coalesce(color, 'Not Specified') as color,
            cast(safetystocklevel as int) as safety_stock_level,
            
            -- METRICS
            cast(standardcost as decimal(10,2)) as standard_cost,
            cast(listprice as decimal(10,2)) as list_price,
            
            -- DATES
            cast(sellstartdate as date) as sell_start_date,
            cast(sellenddate as date) as sell_end_date

        from source_data
    )

-- 3. Final select
select *
from cleansed_data