with customer_source as (
    select distinct customer_id
    from {{ ref('stg_sales') }}
),

final as (
    select customer_id, 'Customer ' || cast(customer_id as varchar) customer_name
    from customer_source
    where customer_id is not null
    union  
    select '000000' customer_id, 'Unidentified' customer_name
)

select *
from final