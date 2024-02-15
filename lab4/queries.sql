
--Lab 4
--Tony Siu

SELECT TABLE_NAME
FROM ALL_TAB_COLUMNS
WHERE COLUMN_NAME = 'SHIP_STATUS';

--Q1
select  
    pm.CATEGORY_ID,
    cm.CATEGORY_NAME,
    pm.product_id,
    pm.PRODUCT_NAME
from products_mgs pm
inner join categories_mgs cm
on pm.CATEGORY_ID = cm.CATEGORY_ID;

--Q2
select  
    cm.CATEGORY_ID,
    cm.CATEGORY_NAME,
    pm.product_id,
    pm.PRODUCT_NAME
from products_mgs pm
right join categories_mgs cm
on pm.CATEGORY_ID = cm.CATEGORY_ID;


--Q3 

select distinct
    cm.CATEGORY_ID,
    cm.CATEGORY_NAME
    -- pm.product_id,
    -- pm.PRODUCT_NAME
from categories_mgs cm
full outer join products_mgs pm
on pm.CATEGORY_ID = cm.CATEGORY_ID
where pm.product_id is null
    and pm.PRODUCT_NAME is null;

--Q4
(select 
    cm1.customer_id,
    cm1.first_name,
    cm1.last_name
from customers_mgs cm1
where cm1.shipping_address_id = cm1.BILLING_ADDRESS_ID
minus
select 
    cm2.customer_id,
    cm2.first_name,
    cm2.last_name
from customers_mgs cm2
where cm2.shipping_address_id = cm2.BILLING_ADDRESS_ID
and cm2.email_address not like '%gmail.com')
order by customer_id;

--Q5

(select 
    cm1.customer_id,
    cm1.first_name,
    cm1.last_name
from customers_mgs cm1
where cm1.shipping_address_id = cm1.BILLING_ADDRESS_ID
minus
select 
    cm2.customer_id,
    cm2.first_name,
    cm2.last_name
from customers_mgs cm2
where cm2.shipping_address_id = cm2.BILLING_ADDRESS_ID
and cm2.email_address like '%gmail.com')
order by customer_id;

--Q6
(select 
    cm1.customer_id,
    cm1.first_name,
    cm1.last_name
from customers_mgs cm1
where cm1.shipping_address_id = cm1.BILLING_ADDRESS_ID
union
select 
    cm2.customer_id,
    cm2.first_name,
    cm2.last_name
from customers_mgs cm2
where cm2.email_address like '%gmail.com')
order by customer_id;

--Q7

(select 
    om.order_id,
    om.customer_id,
    'shipped' ship_status,
    to_char(om.order_date,'DD-MON-YY') order_date
from orders_mgs om
where om.ship_date is not NULL
union
select 
    om1.order_id,
    om1.customer_id,
    'NOT shipped' ship_status,
    to_char(om1.order_date,'DD-MON-YY') order_date
from orders_mgs om1
where om1.ship_date is NULL)
-- order by om1.order_date 
