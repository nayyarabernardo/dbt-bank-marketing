{{ config(materialized='table') }}

with 
    tbcliente as (
        select
            id_cliente,
            idade,
            trabalho,
            estado_civil,
            educacao,
            saldo_anual,
            tem_credito_habitacao,
            tem_emprestimo_pessoal
        from {{ ref('stg_bank_full') }} 
    )

select *,
from tbcliente