-- This test fails if any city name is empty or consists only of spaces
select
    address_id
from {{ ref('dim_locations') }}
where trim(city) = '' or city is null