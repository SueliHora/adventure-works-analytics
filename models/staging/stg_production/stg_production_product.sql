with
    -- 1. Importação da fonte bruta
    fonte_produtos as (
        select *
        from {{ source('adventure_works', 'production_product') }}
    ),

    -- 2. Limpeza, Renomeação e Tipagem
    logica_limpeza as (
        select
            -- CHAVE PRIMÁRIA (Identificada com pk_)
            cast(productid as int) as pk_produto,
            
            -- CHAVES ESTRANGEIROS (Identificadas com fk_)
            -- Exemplo de chaves comuns na tabela de produtos para categorização
            cast(productsubcategoryid as int) as fk_subcategoria,
            cast(productmodelid as int) as fk_modelo,
            
            -- Strings padronizadas e limpas
            cast(name as string) as nome_produto,
            cast(productnumber as string) as codigo_produto,
            
            -- Flags/Booleanos
            makeflag as is_produto_fabricado,
            finishedgoodsflag as is_produto_finalizado,
            
            -- Tratamento de nulos básico
            coalesce(color, 'Não Informado') as cor_produto,
            cast(safetystocklevel as int) as nivel_estoque_seguranca,
            
            -- Valores numéricos/decimais
            cast(standardcost as decimal(10,2)) as custo_padrao,
            cast(listprice as decimal(10,2)) as preco_listado,
            
            -- Datas
            cast(sellstartdate as date) as data_inicio_venda,
            cast(sellenddate as date) as data_fim_venda

        from fonte_produtos
    )

-- 3. Select final de entrega
select *
from logica_limpeza