{{ config(materialized='table') }}

with source_data as (
    select
        idade,
        trabalho,
        estado_civil,
        educacao,
        saldo_anual,
        tem_credito_habitacao,
        tem_emprestimo_pessoal
    from {{ source('bank_marketing', 'raw_banck_full') }}
)

select *,
       LPAD(CAST(row_number() over () AS STRING), 4, '0') as id_cliente
from source_data