-- Sales order quantities must always be greater than zero
select
    sk_sales_order_item,
    sales_order_id,
    order_quantity
from {{ ref('fact_sales') }}
where order_quantity <= 0