with bridge as (
    select * from {{ ref('int_sales_reasons_bridge') }}
)

select
    sales_order_id,
    sales_reason_id
from bridge