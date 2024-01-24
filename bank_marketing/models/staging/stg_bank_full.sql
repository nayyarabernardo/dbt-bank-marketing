{{ config(materialized='table') }}


with 
    bank_full as (
        select
            age as idade,
            job as trabalho,
            marital as estado_civil,
            education as educacao,
            balance as saldo_anual,
            housing as tem_credito_habitacao,
            loan as tem_emprestimo_pessoal,
            contact as tipo_contato,
            day as ultimo_dia_contato,
            month as ultimo_mes_contato,
            duration as duracao_ultimo_contato,
            campaign as quantidade_contatos_campanha,
            pdays as dias_ultima_campanha,
            previous as quantidade_contatos_anteriores,
            poutcome as resultado_campanha,
            y as subscreveu_deposito_prazo
        from {{ source('bank_marketing', 'bank-full') }}
    )


select *,
    LPAD(CAST(row_number() over () AS STRING), 4, '0') as id_cliente
from bank_full
