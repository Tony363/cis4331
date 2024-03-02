--Week 3, Part 2 
--Murach Ch4, In Class Practice

--Covered topics: Self Join, OUTER JOIN

--Continued from Lec 5.

SELECT TABLE_NAME
FROM ALL_TAB_COLUMNS
WHERE COLUMN_NAME = 'DEPARTMENT';

--4
--Print the names of employees in department 30 and the names of their managers. 
--DEPT AMP tables TODO


SELECT e.ename, m.ename
FROM  emp e INNER JOIN emp m 
       ON (e.mgr = m.empno)
WHERE e.deptno = 30;


--4-5 print the names of employees and the names of their manageers

select 
    e.ename as "employee",
    m.ename as "manager"
from emp e
left join emp m
    on e.mgr = m.empno;


--5
--Print all general ledger accounts' numbers, descriptions, the invoice ids of invoices 
--where the accounts were used.
--The query result also includes accounts that were not used in any purchase. 

select gla.account_number,gla.account_description,ili.invoice_id
from general_ledger_accounts gla
inner join invoice_line_items ili on gla.account_number = ili.account_number


--6.
--Print the account numbers and descriptions of general ledger accounts 
--   that were not used in any purchase


select 
    gla.account_number, 
    account_description
    -- invoice_id
from general_ledger_accounts gla 
left outer join invoice_line_items il
    on (gla.account_number = il.account_number)
where il.account_number is null;