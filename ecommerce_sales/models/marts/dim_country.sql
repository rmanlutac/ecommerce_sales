with country_source as (
    select *
    from {{ ref('stg_country') }}
)

select *
from country_source