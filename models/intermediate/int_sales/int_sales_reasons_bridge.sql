with sales_reason as (
    select * from {{ ref('stg_sales_salesreason') }}
),

sales_order_header_sales_reason as (
    select * from {{ ref('stg_sales_orderheadersalesreason') }}
),

joined as (
    select
        s.fk_sales_order as sales_order_id,
        s.fk_sales_reason as sales_reason_id,
        r.sales_reason_name,
        r.sales_reason_type
    from sales_order_header_sales_reason s
    left join sales_reason r 
        on s.fk_sales_reason = r.pk_sales_reason
)

select * from joined