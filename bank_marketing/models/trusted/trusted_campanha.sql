{{ config(materialized='table') }}

with source_data as (
    select
        tipo_contato,
        ultimo_dia_contato,
        ultimo_mes_contato,
        duracao_ultimo_contato,
        quantidade_contatos_campanha,
        dias_ultima_campanha,
        quantidade_contatos_anteriores,
        resultado_campanha
    from {{ source('bank_marketing', 'raw_banck_full') }}
)


select *,
       row_number() over () as id_campanha
from source_data