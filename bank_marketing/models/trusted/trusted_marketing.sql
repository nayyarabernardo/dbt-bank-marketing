
with 
    tbmarketing as (
        select
            tc.id_cliente,
            tipo_contato,
            ultimo_dia_contato,
            ultimo_mes_contato,
            duracao_ultimo_contato,
            quantidade_contatos_campanha,
            dias_ultima_campanha,
            quantidade_contatos_anteriores,
            taxa_variacao_emprego,
            indice_precos_consumidor,
            indice_confianca_consumidor,
            taxa_euribor_3meses,
            cliente_subscreveu_deposito_prazo
        from {{ ref('stg_bank_full') }} ts
        left join {{ ref('trusted_cliente') }} tc
        on ts.id_cliente = tc.id_cliente
    )

select 
    tbmarketing.*,
    tc.id_cliente
from tbmarketing
