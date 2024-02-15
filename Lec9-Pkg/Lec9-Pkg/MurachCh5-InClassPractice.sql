--Week 5, Murach Ch5 in class practice.

--Covered topics: GROUP BY, HAVING, WHERE in summary queries

--Run all queries as user AP

-- SELECT TABLE_NAME
-- FROM ALL_TAB_COLUMNS
-- WHERE COLUMN_NAME = 'VENDOR_ID';


--1.
--For each vendor that has at least one invoice, print its vendor id, 
--   and total invoice amount of all invoices for this vendor.

select 
    i.invoice_id,
    sum(i.invoice_total) as total_invoice_amount
from invoices i
group by i.invoice_id
having count(i.VENDOR_ID) > 0





--2.
--For each vendor that has at least one invoice, print its name, 
--  the total payment amount of all its invoices.
--Sort the result in decreasing order of the total payment amount.
select 
    -- v.vendor_id,
    v.vendor_name,
    sum(i.payment_total) as "total_invoice_amount"
from vendors v
inner join invoices i
    on v.vendor_id = i.vendor_id
group by v.vendor_name
order by sum(i.payment_total) desc


--3.
--For each vendor that has at least one invoice, print its name, 
--   invoice quantity, and total invoice amount of all its invoices.
--Sort the query result so that the vendor with most invoices appear first.
--Display headings INVOICE_COUNT, TOTAL_INVOICE_AMT for invoice quantiy, 
--  and total invoice amount.

select 
    v.vendor_name,
    count(i.invoice_id) as "invoice_count",
    sum(i.payment_total) as "total_invoice_amount"
from vendors v
inner join invoices i
    on v.vendor_id = i.vendor_id
group by v.vendor_name
order by count(i.invoice_id) desc



--4.
--For each general ledger account that is used by at least 2 invoice items, 
--  print its account description, how many invoice items use this account,
--  and the total item amount of all these items.
--Sort the result so that the account with the largest total item amount appears first.
--Display headins LINE_ITEM_COUNT, TOTAL_LINE_ITEM_AMT for invoice item quantity, 
--   and total item amount.


select 
    gla.account_description,
    count(ii.account_number) as "line_item_count",
    sum(ii.line_item_amt) as "total_line_item_amount"
from general_ledger_accounts gla
inner join invoice_line_items ii
    on gla.account_number = ii.account_number
group by gla.account_description
having count(ii.account_number) > 1
order by sum(ii.line_item_amt) desc


