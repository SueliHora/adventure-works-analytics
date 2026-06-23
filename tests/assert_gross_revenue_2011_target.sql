/* Gross Revenue Audit Test - Year 2011
   Target requested by the CEO: $12,646,112.16
*/
with audit_2011 as (
    select
        round(sum(gross_revenue), 2) as total_sales_2011
    from {{ ref('fact_sales') }}
    where year(order_date) = 2011
)
select *
from audit_2011
where total_sales_2011 != 12646112.16