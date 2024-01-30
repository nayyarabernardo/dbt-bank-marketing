with 
    bank_full as (
        select
            age as idade_cliente,
            job as tipo_profissao,
            marital as tipo_estadocivil,
            education as tipo_educacao,
            defaulti as credito_em_default,
            housing as emprestimo_imobiliario,
            loan as emprestimo_pessoal,
            contact as tipo_contato,
            month as mes_ultimo_contato,
            day_of_week as dia_semana_ultimo_contato,
            duration as duracao_ultimo_contato,
            campaign as numero_contatos_campanha,
            pdays as dias_desde_ultimo_contato_anterior,
            previous as numero_contatos_anteriores,
            poutcome as resultado_campanha_anterior,
            emp_var_rate as taxa_variacao_emprego,
            cons_price_idx as indice_precos_consumidor,
            cons_conf_idx as indice_confianca_consumidor,
            euribor3m as taxa_euribor_3meses,
            y as cliente_subdepositoprazo
        from {{ source('bank_marketing', 'bank-additional-full') }}
    )


select *,
    LPAD(CAST(row_number() over () AS STRING), 4, '0') as id_cliente
from bank_full
