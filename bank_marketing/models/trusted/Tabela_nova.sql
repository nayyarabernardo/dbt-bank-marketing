{{ config(materialized='table') }}

with 
    Tabela_nova as (
        select
            tbstgbankfull.id_cliente,
            tbprofissao.id_profissao
        from {{ ref('stg_bank_full') }} as tbstgbankfull
        left join {{ ref('trusted_tbtipoprofissao') }} as tbprofissao
        on tbstgbankfull.tipo_profissao = tbprofissao.tipo_profissao
    )

select *
from Tabela_nova
