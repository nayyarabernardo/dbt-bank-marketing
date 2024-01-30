with 
    tb_educacao as (
        SELECT DISTINCT
            tipo_educacao
        from {{ ref('stg_bank_full') }} 
    )


select *,
    ROW_NUMBER() OVER () AS id_educacao,
from tb_educacao


