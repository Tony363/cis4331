-- search system queries
-- SELECT TABLE_NAME
-- FROM ALL_TAB_COLUMNS
-- WHERE COLUMN_NAME = 'BILLING_ADDRESS_ID';



--Q1
select 
    am.CUSTOMER_ID, 
    am.LINE1, 
    am.LINE2,
    am.city,
    am.state
from addresses_mgs am
where am.LINE1 like '%wood%'
order by am.state,am.city;

--Q2

select 
    cm.first_name,
    cm.last_name,
    cm.email_address
from customers_mgs cm
where cm.first_name like '__r%'
order by cm.first_name

--Q3
select
    pm.product_name,
    pm.list_price,
    cm.category_name
from products_mgs pm
inner join categories_mgs cm on pm.category_id = cm.category_id
order by cm.category_name,pm.product_name

--Q4
select
    cm.first_name,
    cm.last_name, 
    am.LINE1,
    am.LINE2,
    am.city,
    am.state,
    am.zip_code
from addresses_mgs am
inner join customers_mgs cm on am.customer_id = cm.customer_id
where cm.email_address = 'heatheresway@mac.com'

--Q5 TODO WTF

select
    cm.first_name,
    cm.last_name,
    am.LINE1,
    am.line2,
    am.city,
    am.state,
    am.zip_code
from addresses_mgs am 
inner join customers_mgs cm
    on cm.customer_id = am.customer_id 
    AND cm.billing_address_id = am.address_id
order by am.state,am.city

--Q6
select 
    cm.first_name,
    cm.last_name,
    to_char(om.order_date,'DD/MM//YYYY'),
    to_char(om.ship_date,'DD/MM//YYYY')
from customers_mgs cm
inner join orders_mgs om 
on cm.customer_id = om.customer_id

--Q7 

select
    cm.email_address,
    om.ship_date,
    oim.product_id,
    (oim.item_price-oim.discount_amount)*oim.quantity actual_price
from orders_mgs om
inner join order_items_mgs oim
    on om.order_id = oim.order_id
inner join customers_mgs cm
    on cm.customer_id = om.customer_id

--Q8 TODO WTF why need self join?
select distinct
    p1.product_code,
    p1.product_name,
    p1.discount_percent
from products_mgs p1
inner join products_mgs p2
    on p1.discount_percent = p2.discount_percent
    and p1.product_code <> p2.product_code
    and p1.product_name <> p2.product_name
order by p1.product_code


-- INIT database
CREATE TABLE store (
    store_id varchar(255),
    store_name varchar(255),
    store_zip int,
    region_id varchar(255),
    PRIMARY KEY (store_id)
); 

INSERT INTO store(
  store_id, 
  store_name,
  store_zip,
  region_id
) VALUES ('S1', 'Mozarts Music Store',19122,'R1');

INSERT INTO store(
  store_id, 
  store_name,
  store_zip,
  region_id
) VALUES ('S2', 'Adams guitar store',33172,'R2');

INSERT INTO store(
  store_id, 
  store_name,
  store_zip,
  region_id
) VALUES ('S3', 'Liz piano store',10023,'R1');

-- QUERY database
SELECT * FROM store;

SELECT s1.store_id s, s2.store_id ss
FROM   store s1 
inner JOIN store s2
          ON s1.region_id = s2.region_id;

drop table store