with
    customers as (
        select *
        from {{ ref('stg_sales_customer') }}
    ),

    stores as (
        select *
        from {{ ref('stg_sales_store') }}
    ),

    persons as (
        select *
        from {{ ref('stg_person_person') }}
    ),

    compiled_customers as (
        select
            -- PRIMARY KEY (O Grão)
            c.pk_customer as customer_id,

            -- FOREIGN KEYS
            c.fk_person as person_id,
            c.fk_store as store_id,
            c.fk_territory as territory_id,

            -- ATTRIBUTES (Conditional Business Rules)
            case
                when c.fk_person is not null then concat_ws(' ', p.first_name, p.middle_name, p.last_name)
                when c.fk_store is not null then s.store_name
                else 'Unknown'
            end as customer_name,

            case
                when c.fk_person is not null then 'Individual'
                when c.fk_store is not null then 'Store'
                else 'Unknown'
            end as customer_type

        from customers c
        left join persons p on c.fk_person = p.pk_person
        left join stores s on c.fk_store = s.pk_store
    )

select *
from compiled_customers