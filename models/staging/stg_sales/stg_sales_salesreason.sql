with
    source_data as (
        select *
        from {{ source('adventure_works', 'sales_salesreason') }}
    ),

    cleansed_data as (
        select
            -- PRIMARY KEY
            cast(salesreasonid as int) as pk_sales_reason,

            -- ATTRIBUTES
            cast(name as string) as sales_reason_name,
            cast(reasontype as string) as sales_reason_type
            
        from source_data
    )

select *
from cleansed_data