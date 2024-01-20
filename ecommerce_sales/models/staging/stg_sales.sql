with sales_source as (
    select *
    from {{ source('duckdb_sample_db', 'sales_invoice') }}
),

initial_transform as (
    select 
        Id as sales_id,
        InvoiceNo as invoice_no,
        Description as product_description,
        cast(dense_rank() over (order by product_description) as varchar) product_id,
        Quantity as quantity,
        UnitPrice as unit_price,
        cast(InvoiceDate as date) as invoice_date,
        cast(InvoiceDate as time) as invoice_time,
        CustomerId as customer_id,
        Country as country
    from sales_source
),

final as (
    select *
    from initial_transform
)

select *
from final