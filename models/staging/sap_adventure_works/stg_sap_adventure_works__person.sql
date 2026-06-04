with

source as (

    select * from {{ source('sap_adventure_works', 'person_person') }}

),

renamed as (

    select
        businessentityid as person_id
        -- depois vamos trazer e tratar as outras colunas aqui!

    from source

)

select * from renamed