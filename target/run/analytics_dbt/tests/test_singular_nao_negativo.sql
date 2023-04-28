select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      -- testar se existe calores menores que 0 (negativos)

select *
    from tb_10_compradores
    where vendas_totais < 0
      
    ) dbt_internal_test