SELECT TABLE_NAME
FROM ALL_TAB_COLUMNS
WHERE COLUMN_NAME = 'DESCRIPTION';

SELECT table_name
FROM user_tables
WHERE table_name LIKE '%_MGS';

ALTER TABLE old_table_name RENAME TO new_table_name;

--Q1
select 
    i.id || ' ' || i.name "biology_instructors"
    -- i.dept_name
from instructor i
where i.dept_name Like 'Bio%'


--Q2
select 
    c.title "3-Credit CS Courses"
    -- c.credits
from course c
where c.course_id like 'CS%'
    and c.credits = 3

--Q3
select 
    -- t.id,
    c.course_id,
    c.title
from course c
inner join takes t
    on (c.course_id = t.course_id)
where t.id = 12345

--Q4

select 
    -- t.id,
    sum(c.credits) credits    
from course c
inner join takes t
    on (c.course_id = t.course_id)
where t.id = 12345
-- group by t.id
-- having t.id = 12345

--Q5
select 
    t.id,
    sum(c.credits) credits    
from course c
inner join takes t    
    on (c.course_id = t.course_id)
group by t.id

--Q6
select 
    -- t.id,
    distinct s.name
    -- c.dept_name
FROM   takes t
JOIN student s 
    ON (t.id = s.id)
JOIN course c 
    ON (t.course_id = c.course_id)
WHERE  c.dept_name = 'Comp. Sci.';

--Q7 
select 
    i.id, 
    i.name,
    t.course_id
from instructor i 
left join teaches t on (i.id = t.id) 
where i.dept_name like 'Physics'

--Q8
select 
    i.id, 
    i.name
    -- i.dept_name,
    -- t.course_id
from instructor i 
left join teaches t on (i.id = t.id) 
where t.course_id is null

(select 
    i.id, 
    i.name
    -- i.dept_name,
    -- t.course_id
from instructor i 
left join teaches t on (i.id = t.id) )
minus
(select 
    i.id, 
    i.name
    -- i.dept_name,
    -- t.course_id
from instructor i 
left join teaches t on (i.id = t.id)
where t.course_id is not null)

--Q9 
select 
    -- i.name,
    count(t.course_id) "num_courses"
from instructor i 
inner join teaches t 
    on (i.id = t.id) 
group by i.name
having count(t.course_id) > 0
order by name

--Q10
select 
    i.name,
    count(t.course_id) "num_courses"
from instructor i 
inner join teaches t 
    on (i.id = t.id) 
group by i.name
having count(t.course_id) > 1
order by name

--Q11
select
    gla.account_number,
    gla.account_description
from general_ledger_accounts gla
where gla.account_description like '%Advertising'
order by gla.account_number


----Use the tables in AP account in the course database

/*For each vendor whose city name starts with the upper case letter A, print its name, city, and total invoice amount (in terms of money). Prin all vendors. If a vendor has no invoices, then report the invoice information as null. Use the heading TOTAL_INVOICE_AMOUNT in the result. Sort the result in the increasing order of the vendors' cities.

--Your answer is required to use a join.*/
select * from invoices

select 
    v.vendor_name,
    v.vendor_city,
    sum(i.invoice_total) "TOTAL_INVOICE_AMOUNT"
from vendors v
left join invoices i
    on (v.vendor_id = i.vendor_id)
where v.vendor_city like 'A%'
group by v.vendor_name,v.vendor_city
order by v.vendor_city

select * from invoices
select * from invoice_line_items
select * from general_ledger_accounts

select ili.line_item_description 
    || ' , Cost: ' 
    || ili.line_item_amt
    || ',  Paid From Account: '
    || gla.account_number
from invoice_line_items ili
inner join general_ledger_accounts gla
    on (ili.account_number = gla.account_number)
where ili.invoice_id = 100