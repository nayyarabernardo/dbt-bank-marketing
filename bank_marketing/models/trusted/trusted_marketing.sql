{{ config(materialized='table') }}

with 
    tbmarketing as (
        select
            id_cliente,
            tipo_contato,
            mes_ultimo_contato,
            dia_semana_ultimo_contato,
            duracao_ultimo_contato,
            numero_contatos_campanha,
            dias_desde_ultimo_contato_anterior,
            numero_contatos_anteriores,
            resultado_campanha_anterior,
            taxa_variacao_emprego,
            indice_precos_consumidor,
            indice_confianca_consumidor,
            taxa_euribor_3meses,
            cliente_subdepositoprazo
        from {{ ref('stg_bank_full') }} 
    )

select *
from tbmarketing
