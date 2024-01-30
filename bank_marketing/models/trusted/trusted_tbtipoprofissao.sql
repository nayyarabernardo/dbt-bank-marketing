
with 
    tb_trabalho as (
        SELECT DISTINCT
            tipo_profissao
        from {{ ref('stg_bank_full') }} 
    )


select *,
    ROW_NUMBER() OVER () AS id_profissao,
from tb_trabalho

