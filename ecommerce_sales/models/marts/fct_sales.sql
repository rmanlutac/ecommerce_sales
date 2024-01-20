with sales_source as (
    select *
    from {{ ref('stg_sales') }}
),

country as (
    select country_code, country_name
    from {{ ref('stg_country') }}
),

sales_transform as (
    select 
        sales_id,
        invoice_no,
        product_id,
        quantity,
        unit_price,
        coalesce(quantity, 0) * coalesce(unit_price, 0) total_sales,
        invoice_date,
        invoice_time,
        coalesce(customer_id, '000000') customer_id,
        case Country
            when 'EIRE' then 'Ireland'
            when 'USA' then 'United States'
            when 'Channel Islands' then 'France'
            when 'RSA' then 'South Africa'
            when 'Unspecified' then 'Unidentified'
            when 'European Community' then 'Unidentified'
            else coalesce(Country, 'Unidentified')
        end country
    from sales_source
),

final as (
    select 
        s.sales_id,
        s.invoice_no,
        s.product_id,
        s.quantity,
        s.unit_price,
        s.total_sales,
        s.invoice_date,
        s.invoice_time,
        s.customer_id,
        c.country_code
    from sales_transform s
    left join country c
        on s.country = c.country_name
)

select *
from final