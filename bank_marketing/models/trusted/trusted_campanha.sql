{{ config(materialized='table') }}

with 
    tbcampanha as (
        select
            id_cliente,
            tipo_contato,
            ultimo_dia_contato,
            ultimo_mes_contato,
            duracao_ultimo_contato,
            quantidade_contatos_campanha,
            dias_ultima_campanha,
            quantidade_contatos_anteriores,
            resultado_campanha
        from {{ ref('stg_bank_full') }} 
    )


select *,
from tbcampanha