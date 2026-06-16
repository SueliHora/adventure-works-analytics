with
    -- 1. Importação da fonte bruta
    -- (Dica: ajuste o nome 'sales_orderheader' caso no seu _sources.yml esteja grudado como 'salesorderheader')
    fonte_orderheader as (
        select *
        from {{ source('adventure_works', 'sales_orderheader') }}
    ),

    -- 2. Limpeza, Renomeação (snake_case) e Tipagem (Casting)
    logica_limpeza as (
        select
            -- CHAVE PRIMÁRIA
            cast(salesorderid as int) as pk_pedido,

            -- CHAVES ESTRANGEIRAS (Para os JOINs com Clientes, Cartões e Localização)
            cast(customerid as int) as fk_cliente,
            cast(creditcardid as int) as fk_cartao_credito,
            cast(shipaddressid as int) as fk_endereco_entrega,

            -- DATAS (Essenciais para as séries temporais e filtros de ano/mês)
            cast(orderdate as timestamp) as data_pedido,

            -- ATRIBUTOS
            cast(status as int) as status_pedido,

            -- VALORES FINANCEIROS (Para auditoria e validação cruzada)
            cast(subtotal as decimal(18,2)) as subtotal_pedido,
            cast(taxamt as decimal(18,2)) as imposto_pedido,
            cast(freight as decimal(18,2)) as frete_pedido,
            cast(totaldue as decimal(18,2)) as total_pedido

            -- Deixamos de fora colunas como rowguid e modifieddate da origem
        from fonte_orderheader
    )

-- 3. Select final de entrega
select *
from logica_limpeza