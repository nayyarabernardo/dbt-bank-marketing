-- models/staging/stg_banck_full.sql

{{ config(materialized='table') }}

with source_data as (
    select
        cast(age as INTEGER) as idade,
        cast(job as STRING) as trabalho,
        cast(marital as STRING) as estado_civil,
        cast(education as STRING) as educacao,
        cast(balance as FLOAT64) as saldo_anual,
        cast(housing as STRING) as tem_credito_habitacao,
        cast(loan as STRING) as tem_emprestimo_pessoal,
        cast(contact as STRING) as tipo_contato,
        cast(day as INTEGER) as ultimo_dia_contato,
        cast(month as STRING) as ultimo_mes_contato,
        cast(duration as INTEGER) as duracao_ultimo_contato,
        cast(campaign as INTEGER) as quantidade_contatos_campanha,
        cast(pdays as INTEGER) as dias_ultima_campanha,
        cast(previous as INTEGER) as quantidade_contatos_anteriores,
        cast(poutcome as STRING) as resultado_campanha,
        cast(y as STRING) as subscreveu_deposito_prazo
    from {{ source('bank_marketing', 'bank-full') }}
)

select *
from source_data

