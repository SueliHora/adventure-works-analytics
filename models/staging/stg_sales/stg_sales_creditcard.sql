with
    source_data as (
        select *
        from {{ source('adventure_works', 'sales_creditcard') }}
    ),

    cleansed_data as (
        select
            -- PRIMARY KEY
            cast(creditcardid as int) as pk_credit_card,

            -- ATTRIBUTES
            cast(cardtype as string) as card_type

        from source_data
    )

select *
from cleansed_data