{{ config(materialized='table') }}

with 
    tb_trabalho as (
        SELECT DISTINCT
            trabalho
        from {{ ref('stg_bank_full') }} 
    )


select *,
    ROW_NUMBER() OVER () AS id_trabalho,
from tb_trabalho

