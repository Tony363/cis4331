--Week 3, Part 2 
--Murach Ch4, In Class Practice

--Covered topics: Self Join, OUTER JOIN

--Continued from Lec 5.


--4
--Print the names of employees in department 30 and the names of their managers. 
--DEPT AMP tables
select e.last_name || ' ' || e.first_name,
from employees e
inner join 
where e.department=30 and e.


--5
--Print all general ledger accounts' numbers, descriptions, the invoice ids of invoices 
--where the accounts were used.
--The query result also includes accounts that were not used in any purchase. 

select gla.account_number,gla.account_description,ili.invoice_id
from general_ledger_accounts gla
inner join invoice_line_items ili on gla.account_number = ili.account_number

SELECT * FROM COLS WHERE COLUMN_NAME = 'MANAGER_ID'

--6.
--Print the account numbers and descriptions of general ledger accounts 
--   that were not used in any purchase


