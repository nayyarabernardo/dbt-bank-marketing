{{ config(materialized='table') }}

with 
    tbcliente as (
        select
            id_cliente,
            idade_cliente,
            credito_em_default,
            emprestimo_imobiliario,
            emprestimo_pessoal
        from {{ ref('stg_bank_full') }} 
    ),
    tbcliente_com_profissao as (
        select
            tc.*,
            ttp.profissao 
        from tbcliente tc
        left join {{ ref('trusted_tbtipoprofissao') }} ttp
        on tc.id_profissao = ttp.id_profissao
    ),
    tbcliente_com_estadocivil as (
        select
            tcpp.*,
            tte.estado_civil 
        from tbcliente_com_profissao tcpp
        left join {{ ref('trusted_tbtipoestadocivil') }} tte
        on tcpp.id_estadocivil = tte.id_estadocivil
    ),
    tbcliente_final as (
        select
            tce.*,
            ttei.tipo_educacao 
        from tbcliente_com_estadocivil tce
        left join {{ ref('trusted_tbtipoeducacao') }} ttei
        on tce.id_educacao = ttei.id_educacao
    )

-- Seleção final
select *
from tbcliente_final