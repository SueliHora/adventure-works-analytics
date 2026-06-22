with
    sales_order_items as (
        select *
        from {{ ref('int_sales_order_items') }}
    )

select
    -- Primary Key
    sk_sales_order_item,

    -- Foreign and Natural Keys
    sales_order_id,
    address_id,
    sales_order_detail_id,
    customer_id,
    product_id,
    order_date,

    -- Attributes
    order_status,

    -- Measures (Quantities and Consolidated Financial Values)
    order_quantity,
    unit_price,
    unit_price_discount,
    gross_revenue,
    discount_amount,
    net_revenue

from sales_order_items