with product_source as (
    select distinct product_id, product_description
    from stg_sales
),

final as (
    select product_id, coalesce(product_description, 'Unidentified') product_description
    from product_source
)

select *
from final