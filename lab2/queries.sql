--Lab 2
--Tony Siu

--Q1
select product_id,product_name,DISCOUNT_PERCENT
from PRODUCTS_MGS
order by DISCOUNT_PERCENT ASC, product_id DESC;

--Q2
SELECT last_name || ', ' || first_name as "customer_name"
from customers_MGS
-- where FIRST_NAME  LIKE '[A-B]%';
WHERE last_name >= 'B%' AND first_name <= 'T%'
order by first_name ASC;

--Q3
select product_code,DISCOUNT_PERCENT,date_added
from PRODUCTS_MGS
where DISCOUNT_PERCENT > 20 and DISCOUNT_PERCENT <= 30
order by date_added DESC;

--Q4
select product_name || ' was $' || list_price || ', now is ' || '$' || list_price*(DISCOUNT_PERCENT/100) as "actual_price"
from PRODUCTS_MGS
where rownum <= 3
order by "actual_price" DESC;

--Q5 TODO wtf
select item_id,item_price, discount_amount,
from order_items_mgs


--Q6
select order_id,customer_id,order_date,ship_amount
from orders_mgs
where ship_date is null;

--Q7
select 'Hello! Today is '|| TO_CHAR(SYSDATE,'Mon-dd-yyyy') AS "GREETINGS"
from DUAL;

--Q8
/*
Given an ipad at $799.99 with a tax rate of 8%,print the price before tax, the tax amount, and the price after tax.
Your query must use the computer to calculate the tax amount and the price after tax.
*/
select 799.99 as price_before_tax, 
    0.08 as tax_rate, 
    799.99*0.08 as tax_amount, 
    799.99+(799.99*0.08) as price_after_tax
from dual;

--Q9
select DISTINCT product_id,item_price,discount_amount
from order_items_mgs
order by item_price DESC;
