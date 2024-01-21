{{ config(materialized='table') }}

with source_data as (
    select
        cast(age as INTEGER) as idade,
        cast(job as STRING) as trabalho,
        cast(marital as STRING) as estado_civil,
        cast(education as STRING) as educacao,
        {{source('bank_marketing', 'bank-full')}}
)

select *
from source_data
