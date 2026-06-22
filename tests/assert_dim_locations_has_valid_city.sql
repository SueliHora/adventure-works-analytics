-- Este teste falha se encontrarmos alguma cidade com nome vazio ou apenas espaços
select
    address_id
from {{ ref('dim_locations') }}
where trim(city) = '' or city is null