with 
    tbmkt as (
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
    ),
    tbmkt_enriquecido as (
        select
            c.id_cliente,
            c.mes_ultimo_contato,
            c.dia_semana_ultimo_contato,
            c.duracao_ultimo_contato,
            c.numero_contatos_campanha,
            c.dias_desde_ultimo_contato_anterior,
            c.numero_contatos_anteriores,
            c.resultado_campanha_anterior,
            c.taxa_variacao_emprego,
            c.indice_precos_consumidor,
            c.indice_confianca_consumidor,
            c.taxa_euribor_3meses,
            c.cliente_subdepositoprazo,
            p.id_tipocontato
        from tbmkt c
        left join {{ ref('trusted_tbtipocontato') }} p
        on c.tipo_contato = p.tipo_contato
    )

select *
from tbmkt_enriquecido
