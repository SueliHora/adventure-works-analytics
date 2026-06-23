with
    header as (
        select * from {{ ref('stg_sales_orderheader') }}
    ),
    
    detail as (
        select * from {{ ref('stg_sales_orderdetail') }}
    ),
    
    joined_items as (
        select
            -- Fan-out Prevention (Grain Control): Surrogate Key via MD5
            md5(cast(concat(
                coalesce(cast(detail.fk_sales_order as string), ''), 
                '-', 
                coalesce(cast(detail.pk_sales_order_detail as string), '')
            ) as string)) as sk_sales_order_item,
            
            -- Foreign and Natural Keys (Keeping staging names)
            detail.fk_sales_order,
            detail.pk_sales_order_detail,
            header.fk_customer,
            detail.fk_product,
            header.fk_ship_address,
            header.fk_credit_card, -- ADDED FOR BI CONSUMPTION
            
            -- Context Attributes
            header.order_date,
            header.order_status,
            detail.order_quantity,
            detail.unit_price,
            detail.unit_price_discount,
            
            -- Business Logic (Financial Metrics with forced precision)
            cast((detail.order_quantity * detail.unit_price) as decimal(18,4)) as gross_revenue,
            cast((detail.order_quantity * detail.unit_price * detail.unit_price_discount) as decimal(18,4)) as discount_amount,
            cast(((detail.order_quantity * detail.unit_price) - (detail.order_quantity * detail.unit_price * detail.unit_price_discount)) as decimal(18,4)) as net_revenue
            
        from detail
        inner join header on detail.fk_sales_order = header.pk_sales_order
    )
select * from joined_items