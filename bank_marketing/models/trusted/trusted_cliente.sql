with 
    tbcliente as (
        select
            id_cliente,
            idade_cliente,
            credito_em_default,
            emprestimo_imobiliario,
            emprestimo_pessoal,
            tipo_profissao,
            tipo_estadocivil,
            tipo_educacao
        from {{ ref('stg_bank_full') }} 
    ),
    tbcliente_enriquecido as (
        select
            c.id_cliente,
            c.idade_cliente,
            c.credito_em_default,
            c.emprestimo_imobiliario,
            c.emprestimo_pessoal,
            p.id_profissao,
            ec.id_estadocivil,
            ed.id_educacao
        from tbcliente c
        left join {{ ref('trusted_tbtipoprofissao') }} p
        on c.tipo_profissao = p.tipo_profissao
        left join {{ ref('trusted_tbtipoestadocivil') }} ec
        on c.tipo_estadocivil = ec.tipo_estadocivil
        left join {{ ref('trusted_tbtipoeducacao') }} ed
        on c.tipo_educacao = ed.tipo_educacao
    )

select *
from tbcliente_enriquecido
