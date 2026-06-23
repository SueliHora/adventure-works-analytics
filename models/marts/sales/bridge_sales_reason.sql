with bridge as (
    select * from {{ ref('int_sales_reasons_bridge') }}
)
select
    fk_sales_order as sales_order_id,
    fk_sales_reason as sales_reason_id
from bridge