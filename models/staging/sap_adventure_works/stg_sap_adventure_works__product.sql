with

source as (

    select * from {{ source('sap_adventure_works', 'production_product') }}

),

renamed as (

    select
        productid
        -- depois vamos trazer e tratar as outras colunas de produtos aqui!

    from source

)

select * from renamed