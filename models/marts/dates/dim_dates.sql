with dates as (
    select * from {{ ref('int_dates_hierarchy') }}
)
select
    -- PRIMARY KEY (Date type for BI Time Intelligence)
    date_day as date_id,
    -- ATTRIBUTES
    day_of_month,
    month_number,
    month_name,
    calendar_year,
    calendar_quarter,
    day_of_week,
    is_weekend
from dates