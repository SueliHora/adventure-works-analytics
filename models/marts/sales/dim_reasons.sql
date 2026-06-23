with staging as (
    select * from {{ ref('stg_sales_salesreason') }}
),
final as (
    select
        pk_sales_reason as sales_reason_id, -- Renamed for BI consumption
        sales_reason_name,
        sales_reason_type
    from staging
)
select * from final