with calendar as (
    select * from {{ ref('stg_calendar') }}
),
hierarchy as (
    select
        date_day,
        extract(day from date_day) as day_of_month,
        extract(month from date_day) as month_number,
        date_format(date_day, 'MMMM') as month_name,
        extract(year from date_day) as calendar_year,
        extract(quarter from date_day) as calendar_quarter,
        dayofweek(date_day) as day_of_week,
        case when dayofweek(date_day) in (1, 7) then true else false end as is_weekend
    from calendar
)
select * from hierarchy