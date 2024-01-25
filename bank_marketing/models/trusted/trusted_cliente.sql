{{ config(materialized='table') }}


with 
    tbcliente as (
        select
            idade,
            id_trabalho,
            id_estadocivil,
            id_educacao,
            saldo_anual,
            tem_credito_habitacao,
            tem_emprestimo_pessoal
        from {{ ref('stg_bank_full') }} 
    ),
    tbcliente_com_profissao as (
        select
            tc.*,
            ttp.profissao 
        from tbcliente tc
        left join {{ ref('trusted_tipo_profissao') }} ttp
        on tc.id_profissao = ttp.id_profissao
    ),
    tbcliente_com_estadocivil as (
        select
            tcpp.*,
            tte.estado_civil 
        from tbcliente_com_profissao tcpp
        left join {{ ref('trusted_tipo_estadocivil') }} tte
        on tcpp.id_estadocivil = tte.id_estadocivil
    ),
    tbcliente_final as (
        select
            tce.*,
            ttei.tipo_educacao 
        from tbcliente_com_estadocivil tce
        left join {{ ref('trusted_tipo_educacao') }} ttei
        on tce.id_educacao = ttei.id_educacao
    )



select 
    tbcliente_final.*,
    SUBSTR(CAST(GENERATE_UUID() AS STRING), 1, 4) as id_cliente
from tbcliente_final