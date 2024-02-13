--Week 4, Murach Ch4, In Class Practice

--Covered topics: OUTER JOIN, Set operators in SQL

--continued from Lec 6
  

--RUN all queries in 7, 8, 9 as user uv

--7.
--Print ids, names of students who took CS-101 or CS-190.
--Must use a SQL set operator.

select 
    s.id, s.name
from student s
join takes t
    on s.id = t.id
where t.course_id = 'CS-101' 
union
select 
    s.id,s.name
from student s
join takes t
    on s.id = t.id
where  t.course_id = 'CS-190'


--8.
--Print ids, names of students who took both CS-101 and CS-190.
--Must use a SQL set operator.
  
select 
    s.id, s.name
from student s
join takes t
    on s.id = t.id
where t.course_id = 'CS-101' 
intersect
select 
    s.id,s.name
from student s
join takes t
    on s.id = t.id
where  t.course_id = 'CS-190'
  
--9.
--print ids, names of students who took CS-101 but not CS-190.
--Must use a SQL set operator.

 
select 
    s.id, s.name
from student s
join takes t
    on s.id = t.id
where t.course_id = 'CS-101' 
minus
select 
    s.id,s.name
from student s
join takes t
    on s.id = t.id
where  t.course_id = 'CS-190'
  
--10.
--Use a SQL set operator to print names and states of all vendors.
--Print the state name of vendors not in California as Outside CA.
--Sorted in increasing order of vendor states.
--
--VENDOR_NAME                   VENDOR_STATE
-------------------------------------------------
--ASC Signs	                CA
--AT&T	Outside                 CA
--Abbey Office Furnishings	CA
--American Booksellers Assoc	Outside CA
--COSTCO FL                     Outside CA
--......


select 
    v.vendor_name,
    v.vendor_state
from vendors v
where v.vendor_state = 'CA'
union
select 
    v1.vendor_name,
    'Outside CA'vendor_state
from vendors v1
where v1.vendor_state != 'CA'
order by vendor_state

--11.
--Rewrite the outer join in Question 6 using a SQL set operator.


-- all gla accounts
-- only gla accounts use d in any accounts
select 
    gla.account_number, 
    -- account_description
from general_ledger_accounts gla 
union
select 
    il.account_number
from invoice_line_items il
where il.account_number is null;
-- left outer join invoice_line_items il
--     on (gla.account_number = il.account_number)
-- where il.account_number is null;
