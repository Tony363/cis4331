--Murach Ch5 in class practice 
--Part 2

--Continued
--Covered topics: GROUP BY, HAVING, WHERE in summary queries
--Run all queries as user AP

--5.
--Revise Q4 query so that only accounts used in invoices dated in the second quarter 
--of 2014 are printed.

SELECT TABLE_NAME
FROM ALL_TAB_COLUMNS
WHERE COLUMN_NAME = 'ACCOUNT_NUMBER';

select 
    gla.account_description,
    count(ii.account_number) as "line_item_count",
    sum(ii.line_item_amt) as "total_line_item_amount"
from general_ledger_accounts gla
inner join invoice_line_items ii
    on gla.account_number = ii.account_number
inner join invoices i
    on i.invoice_id = ii.invoice_id
where i.INVOICE_DATE BETWEEN '01/03/14' AND '30/06/14'
group by gla.account_description
having count(ii.account_number) > 1
order by sum(ii.line_item_amt) desc


--6.
--For each vendor being paid from at least 2 different general ledger accounts,
--  print its name, and how many different accounts are applied to this vendor's invoices.

select     
    v.vendor_name,
    count(distinct gla.account_number) as "DIFF_ACCT_COUNT"
from general_ledger_accounts gla
inner join invoice_line_items ii
    on gla.account_number = ii.account_number
inner join invoices i
    on i.invoice_id = ii.invoice_id
inner join vendors v
    on i.vendor_id = v.vendor_id
group by v.vendor_name
having count(distinct gla.account_number) > 1


select 
    v.vendor_name,
    count(*) as "DIFF_ACCT_COUNT"
from invoice_line_items il 
inner join invoices i 
    on il.invoice_id = i.invoice_id
inner join vendors v
    on i.vendor_id = v.vendor_id
group by v.vendor_name
having count(*) > 1;
    