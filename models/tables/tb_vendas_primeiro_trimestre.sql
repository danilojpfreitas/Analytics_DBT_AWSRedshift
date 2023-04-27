{% set meses =("JAN","FEB","MAR") %}
{% set ano = 2008 %}

with source_date as (
    select dateid as id_date,
    month as mes,
    year as ano
    from date
),
sales_date as (
    select source_date.mes,
        sum(quantidade_vendida)
    from {{ ref('vw_sales') }} sales
    inner join source_date
    on sales.id_date = source_date.id_date
    where source_date.mes in {{meses}}
    and source_date.ano = '{{ano}}'
    group by source_date.mes
)
select * from sales_date