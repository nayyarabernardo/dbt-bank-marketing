
with 
    tb_estado_civil as (
        SELECT DISTINCT
            tipo_estadocivil
        from {{ ref('stg_bank_full') }} 
    )


select *,
    ROW_NUMBER() OVER () AS id_estadocivil,
from tb_estado_civil

