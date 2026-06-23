with
    sales_order_items as (
        select *
        from {{ ref('int_sales_order_items') }}
    )
select
    -- Primary Key
    sk_sales_order_item,
    -- Foreign and Natural Keys
    fk_sales_order as sales_order_id,
    fk_ship_address as address_id,
    pk_sales_order_detail as sales_order_detail_id,
    fk_customer as customer_id,
    fk_product as product_id,
    fk_credit_card as credit_card_id, -- ADDED FOR BI
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