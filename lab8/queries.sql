--Tony Siu
--Lab 8

--Q1
INSERT INTO categories_mgs (category_id,category_name) 
VALUES (5,'Percussion');
commit;

--Q2
UPDATE CATEGORIES_MGS
  SET category_name='String'
  WHERE category_id=5;

--Q3
DELETE FROM CATEGORIES_MGS
WHERE category_name = 'String';

--Q4
INSERT INTO products_mgs (
    product_id,
    category_id,
    product_code,
    product_name,
    description,
    list_price,
    discount_percent,
    date_added) 
VALUES (
    11,
    4,
    'YDP162R',
    'Yamaha Arius YDP162R Traditional Console Style Digital Piano',
    'The best keyboard on the market. Offers excellent sound rendering that truly separates it from the rest of the pack',
    1599.99,
    10,
    sysdate
);

-- rollback
commit;

--Q5
DELETE FROM PRODUCTS_MGS
WHERE category_id = 4;
DELETE FROM CATEGORIES_MGS
WHERE category_id = 4;

--Q6
insert into CUSTOMERS_MGS(
  customer_id,
  email_address,
  password,
  first_name,
  last_name
) values(
  9,
  'john@yahoo.com',
  'funny',
  'John',
  'Oliver'
);

--Q7
UPDATE CUSTOMERS_MGS
  SET password='hello';

--Q8
update CUSTOMERS_MGS
  set password='excellent'
  where customer_id in (
    select 
      o.customer_id   
    from orders_mgs o
    inner join customers_mgs c
      on c.customer_id = o.customer_id
    group by o.customer_id 
    having count(o.order_id) > 1
  );

--Q9
rollback;

--Q10


--Q11

CREATE TABLE event (
  event_id   NUMBER PRIMARY KEY not null,
  menu_id    NUMBER not null,
  location   VARCHAR2(10),  
  date_       DATE 
);                       

CREATE TABLE menu (
  menu_id     NUMBER primary key not null,  
  description VARCHAR2(100), 
  type        VARCHAR2(20),    
  constraint fk1
    foreign key(menu_id)
    references event(event_id)
);

--Q12
drop table menu;
drop table event;

--Q13
alter table event add event_date_ix number;

--Q14
CREATE SEQUENCE menu_id_seq;
drop sequence menu_id_seq;

--Q15

insert into event(
  event_id,
  menu_id,
  location,
  date_
) values(
  1,
  1,
  'New York',
  to_date('2020-12-25', 'yyyy-mm-dd')
);

INSERT INTO menu(
  menu.menu_id, 
  menu.DESCRIPTION,
  type
) VALUES (
  menu_id_seq.NEXTVAL, 
  'Menu 1 for vegetarians',
  'Vegetarian'
);