with 
    tb_tipocontato as (
        SELECT DISTINCT
            tipo_contato
        from {{ ref('stg_bank_full') }} 
    )


select *,
    ROW_NUMBER() OVER () AS id_tipocontato,
from tb_tipocontato

 