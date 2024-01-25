{{ config(materialized='table') }}

with 
    tb_educacao as (
        SELECT DISTINCT
            educacao
        from {{ ref('stg_bank_full') }} 
    )


select *,
    ROW_NUMBER() OVER () AS id_educacao,
from tb_educacao

