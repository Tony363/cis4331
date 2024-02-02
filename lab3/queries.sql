SELECT TABLE_NAME
FROM ALL_TAB_COLUMNS
WHERE COLUMN_NAME = 'CATEGORY_ID'



--Q1
select 
    am.CUSTOMER_ID, 
    am.LINE1, 
    am.LINE2,
    am.city,
    am.state
from addresses_mgs am
where am.LINE1 like '%wood%'
order by am.state,am.city

--Q2

select 
    cm.first_name,
    cm.last_name,
    cm.email_address
from customers_mgs cm
where cm.first_name like '__r%'
order by cm.first_name

--Q3
select * from products_mgs
select
    pm.product_name,
    pm.list_price,
    cm.category_name
from products_mgs pm
inner join categories_mgs cm on pm.category_id = cm.category_id
order by cm.category_name,pm.product_name

--Q4
