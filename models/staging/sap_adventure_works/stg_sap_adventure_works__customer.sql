with

source as (

    select * from {{ source('sap_adventure_works', 'sales_customer') }}

),

renamed as (

    select
        customerid
        -- depois vamos trazer e tratar as outras colunas aqui!

    from source

)

select * from renamed