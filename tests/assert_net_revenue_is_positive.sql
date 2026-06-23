-- Net revenue cannot be negative
-- This ensures that the applied discount never exceeded the gross revenue of the item

select
    sk_sales_order_item,
    sales_order_id,
    gross_revenue,
    net_revenue
from {{ ref('fact_sales') }}
where net_revenue < 0