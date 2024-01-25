{{ config(materialized='table') }}

with 
    tb_estado_civil as (
        SELECT DISTINCT
            estado_civil
        from {{ ref('stg_bank_full') }} 
    )


select *,
    ROW_NUMBER() OVER () AS id_estado_civil,
from tb_estado_civil

