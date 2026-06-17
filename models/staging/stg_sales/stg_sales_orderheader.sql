with
    source_data as (
        select *
        from {{ source('adventure_works', 'sales_salesorderheader') }}
    ),

    cleansed_data as (
        select
            -- PRIMARY KEY
            cast(salesorderid as int) as pk_sales_order,

            -- FOREIGN KEYS
            cast(customerid as int) as fk_customer,
            cast(creditcardid as int) as fk_credit_card,
            cast(shiptoaddressid as int) as fk_ship_address, -- Corrigido para corresponder ao banco

            -- DATES
            cast(orderdate as timestamp) as order_date,

            -- ATTRIBUTES
            cast(status as int) as order_status,

            -- METRICS
            cast(subtotal as decimal(18,2)) as subtotal,
            cast(taxamt as decimal(18,2)) as tax_amount,
            cast(freight as decimal(18,2)) as freight,
            cast(totaldue as decimal(18,2)) as total_due

        from source_data
    )

select *
from cleansed_data