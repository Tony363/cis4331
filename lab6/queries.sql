--Tony Siu 
--Lab 6

SELECT TABLE_NAME
FROM ALL_TAB_COLUMNS
WHERE COLUMN_NAME = 'CUSTOMER_ID';


--Q1
select distinct 
    c.category_name
from categories_mgs c
inner join (
    select * from products_mgs
) p
on p.category_id = c.category_id
order by c.category_name

--Q2
select 
    p.product_name,
    (p.list_price - p.list_price*(p.discount_percent/100)) "actual_price"
from products_mgs p
where (p.list_price - p.list_price*(p.discount_percent/100)) > (
    select 
        avg((p.list_price - p.list_price*(p.discount_percent/100))) 
    from products_mgs p
)
order by (p.list_price - p.list_price*(p.discount_percent/100)) desc

--Q3
select 
    c.category_id,
    c.category_name
from categories_mgs c
where c.category_id not in (
    select 
        p.category_id
    from products_mgs p
)

--Q4

select --oracle can't display subquery deliberately
    *
from (
    select 
        p.product_id,
        p.product_code,
        p.product_name,
        (p.list_price - p.list_price*(p.discount_percent/100)) "actual_price"
    from products_mgs p
    order by (p.list_price - p.list_price*(p.discount_percent/100)) desc
) p1
where rownum < 4;

--Q5
select --oracle can't display subquery deliberately
    *
from (
    select 
        p.product_id,
        p.product_code,
        p.product_name,
        c.category_name,
        (p.list_price - p.list_price*(p.discount_percent/100)) "actual_price"
    from products_mgs p
    inner join categories_mgs c
    on p.category_id = c.category_id
    order by (p.list_price - p.list_price*(p.discount_percent/100)) desc
) p1
where rownum < 4;

--Q6
select --oracle can't display subquery deliberately
    *
from (
    select 
        c.category_id,
        count(*) "product_count"
    from products_mgs p
    inner join categories_mgs c
    on p.category_id = c.category_id
    group by c.category_id
) p1
where rownum < 4

--Q7

select
    product_name,
    discount_percent
from products_mgs 
where discount_percent in (
    select 
        p.discount_percent
    from products_mgs p
    group by p.discount_percent
    having count(p.discount_percent) = 1
)
order by product_name

--Q8a
select  
    c.EMAIL_ADDRESS,
    o.order_id,
    sum(
        (
            oi.item_price - oi.discount_amount
        )*oi.quantity
    ) order_total
from customers_mgs c
inner join orders_mgs o
    on c.customer_id = o.customer_id
inner join order_items_mgs oi
    on o.order_id = oi.order_id
group by c.EMAIL_ADDRESS,o.order_id


--Q8b

select 
    su.EMAIL_ADDRESS,
    max(su.order_total) "max_order_total"
from (
    select  
        c.EMAIL_ADDRESS,
        o.order_id,
        sum(
            (
                oi.item_price - oi.discount_amount
            )*oi.quantity
        ) order_total
    from customers_mgs c
    inner join orders_mgs o
        on c.customer_id = o.customer_id
    inner join order_items_mgs oi
        on o.order_id = oi.order_id
    group by c.EMAIL_ADDRESS,o.order_id
) su
group by su.EMAIL_ADDRESS
order by su.EMAIL_ADDRESS