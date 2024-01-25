{{ config(materialized='table') }}

with 
    tb_subscreveu_deposito_prazo as (
        select
            id_campanha,
            id_cliente,
            tipo_contato,
            ultimo_dia_contato,
            ultimo_mes_contato,
            duracao_ultimo_contato,
            quantidade_contatos_campanha,
            quantidade_contatos_anteriores,
            resultado_campanha,
            subscreveu_deposito_prazo,                         
        from {{ ref('stg_bank_full') }} 
    )

select *,
from tb_subscreveu_deposito_prazo