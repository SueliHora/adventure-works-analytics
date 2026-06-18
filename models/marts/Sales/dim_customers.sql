with
    intermediate_customers as (
        select *
        from {{ ref('int_customers_compiled') }}
    ),

    final_dimension as (
        select
            -- PRIMARY KEY
            customer_id,

            -- ATTRIBUTES
            customer_name,
            customer_type
            
        from intermediate_customers
    )

select *
from final_dimension