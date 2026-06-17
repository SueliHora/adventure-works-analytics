with
    header as (
        select * 
        from {{ ref('stg_sales_orderheader') }}
    ),
    
    detail as (
        select * 
        from {{ ref('stg_sales_orderdetail') }}
    ),
    
    joined_items as (
        select
            -- Fan-out Prevention (Grain Control): Surrogate Key via MD5
            md5(cast(concat(
                coalesce(cast(detail.fk_sales_order as string), ''), 
                '-', 
                coalesce(cast(detail.pk_sales_order_detail as string), '')
            ) as string)) as sk_sales_order_item,
            
            -- Foreign and Natural Keys
            detail.fk_sales_order as sales_order_id,
            detail.pk_sales_order_detail as sales_order_detail_id,
            header.fk_customer as customer_id, -- Adjusted to match your fk_ pattern
            detail.fk_product as product_id,
            
            -- Context Attributes
            header.order_date,
            header.order_status,
            detail.order_quantity,
            detail.unit_price,
            detail.unit_price_discount,
            
            -- Business Logic (Financial Metrics)
            (detail.order_quantity * detail.unit_price) as gross_revenue,
            (detail.order_quantity * detail.unit_price * detail.unit_price_discount) as discount_amount,
            ((detail.order_quantity * detail.unit_price) - (detail.order_quantity * detail.unit_price * detail.unit_price_discount)) as net_revenue
            
        from detail
        inner join header on detail.fk_sales_order = header.pk_sales_order
    )

select * 
from joined_items