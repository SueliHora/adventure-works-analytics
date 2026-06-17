with
    source_data as (
        select *
        from {{ source('adventure_works', 'sales_salesorderheadersalesreason') }}
    ),

    cleansed_data as (
        select
            -- SURROGATE PRIMARY KEY (Combined keys for testing purposes)
            cast(salesorderid as string) || '-' || cast(salesreasonid as string) as pk_sales_order_sales_reason,

            -- FOREIGN KEYS
            cast(salesorderid as int) as fk_sales_order,
            cast(salesreasonid as int) as fk_sales_reason
            
        from source_data
    )

select *
from cleansed_data