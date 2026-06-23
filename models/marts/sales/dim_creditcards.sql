with staging as (
    select * from {{ ref('stg_sales_creditcard') }}
),
final as (
    select
        pk_credit_card as credit_card_id,
        card_type
    from staging
)
select * from final