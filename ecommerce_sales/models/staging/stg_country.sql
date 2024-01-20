with country_source as (
    select *
    from {{ source('duckdb_sample_db', 'country') }}
),

final as (
    select 
        country as country_code,
        latitude,
        longitude,
        name as country_name
    from country_source
    union
    select '00' country_code, null latitude, null longitude, 'Unidentified' country_name --For records with unidentified country
)

select *
from final