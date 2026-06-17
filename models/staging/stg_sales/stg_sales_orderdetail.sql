with
    source_data as (
        select *
        from {{ source('adventure_works', 'sales_salesorderdetail') }}
    ),

    cleansed_data as (
        select
            -- PRIMARY KEY
            cast(salesorderdetailid as int) as pk_sales_order_detail,

            -- FOREIGN KEYS
            cast(salesorderid as int) as fk_sales_order,
            cast(productid as int) as fk_product,

            -- METRICS
            cast(orderqty as int) as order_quantity,
            cast(unitprice as decimal(18,2)) as unit_price,
            cast(unitpricediscount as decimal(18,2)) as unit_price_discount
            
        from source_data
    )

select *
from cleansed_data