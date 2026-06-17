with
    date_series as (
        select explode(sequence(to_date('2011-01-01'), to_date('2015-12-31'), interval 1 day)) as date_day
    ),

    cleansed_data as (
        select
            -- PRIMARY KEY
            cast(date_day as date) as date_day
        from date_series
    )

select *
from cleansed_data