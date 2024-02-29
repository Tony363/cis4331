-- Tony Siu 
-- Lab5

-- SELECT TABLE_NAME
-- FROM ALL_TAB_COLUMNS
-- WHERE COLUMN_NAME = 'CATEGORY_NAME';

--Q1
select 
    count(*) order_count,
    sum(om.TAX_AMOUNT) total_tax
from orders_mgs om

--Q2

select 
    count(*) visa_order_count,
    sum(om.tax_amount) visa_total_tax
from orders_mgs om
where om.card_type = 'Visa'

--Q3
select 
    om.card_type,
    count(*) card_order_count,
    sum(om.tax_amount) card_total_tax
from orders_mgs om
group by om.card_type

--Q4
select 
    cm.category_name,
    count(*) product_count,
    max(pm.list_price) highest_listing_price,
    min(pm.list_price) lowest_listing_price
from products_mgs pm
inner join categories_mgs cm
    on pm.category_id = cm.category_id
group by cm.category_name

--Q5
select 
    cm.category_name,
    count(*) "product_count_over$400",
    max(pm.list_price) "highest_listing_price_over$400",
    min(pm.list_price) "lowest_listing_price_over$400"
from products_mgs pm
inner join categories_mgs cm
    on pm.category_id = cm.category_id
where pm.list_price > 400
group by cm.category_name

--Q6
select 
    om.card_type,
    count(*) card_order_count,
    sum(om.tax_amount) card_total_tax
from orders_mgs om
group by om.card_type
having count(om.card_type) > 1

--Q7
select 
    cm.category_name,
    count(*) product_count,
    max(pm.list_price) highest_listing_price,
    min(pm.list_price) lowest_listing_price
from products_mgs pm
inner join categories_mgs cm
    on pm.category_id = cm.category_id
group by cm.category_name
having count(cm.category_name) > 2

--Q8
select 
    om.card_type,
    count(*) hot_card_order_count,
    sum(om.tax_amount) hot_card_total_tax
from orders_mgs om
where om.order_date > '30-MAR-12'
group by om.card_type
having count(om.card_type) > 1