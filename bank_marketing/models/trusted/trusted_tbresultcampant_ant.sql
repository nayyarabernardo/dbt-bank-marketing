{{ config(materialized='table') }}

with 
    tb_resultadocampanhaanterior as (
        SELECT DISTINCT
            resultado_campanha_anterior
        from {{ ref('stg_bank_full') }} 
    )


select *,
    ROW_NUMBER() OVER () AS id_resultadocampanhaanterior,
from tb_resultadocampanhaanterior

