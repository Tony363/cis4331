--Week 3, Murach Ch4
--In Class Practice, Questions & Answers

--INNER JOIN, SELF-JOIN

-- find what data needed
-- identify data source
-- determine join type
-- where condiation? search condition?
-- presentation
-- do incrementally

--1.
--Print the vendor name, invoice number, invoice date, and balance due amount
-- for each vendor and each of its invoices that have a non-zero remaining balance.
-- Display the heading for the remaing balance as REMAINING_BALANCE,
-- Sort the query result in the increasing order of remaining balances.
select 
    vendors.vendor_name, 
    invoices.invoice_number, 
    invoices.invoice_date, 
    (invoices.invoice_total - invoices.payment_total - invoices.credit_total) remaining_balance
from invoices
inner join vendors on invoices.vendor_id = vendors.vendor_id
where (invoices.invoice_total - invoices.payment_total - invoices.credit_total) > 0
order by remaining_balance;


       



--2.
--Print all vendors' names, their invoices' invoice dates and invoice numbers, and 
--  the sequence numbers and item amounts of all items in their invoices.
-- Sort the result first by vendor name, then by invoice date, then by invoice number,
--    then by invoice sequence number. All sorting are in increasing orders.

select v.vendor_name,ia.invoice_date,ia.invoice_number,li.invoice_sequence,li.line_item_amt
from invoices ia 
inner join vendors v on ia.vendor_id = v.vendor_id
inner join invoice_line_items li on li.invoice_id = ia.invoice_id

--3.
--Print the vendor ids, vendor names, vendor contact first and last names of vendors that 
--   share the same contact last names as another vendor.
--Print the vendor contact's first and last name in this format:
--    Steve Jobs
--Print the heading for the vendor contact's first and last name as Contact Name.

select v2.vendor_id, v2.vendor_name, 
    v2.vendor_contact_first_name || ' ' || v2.vendor_contact_last_name as contact_name
from vendors v1 
inner join vendors v2 
on v1.vendor_contact_last_name = v2.vendor_contact_last_name
    and v1.vendor_id <> v2.vendor_id
-- where v1.vendor_contact_last_name = v2.vendor_contact_last_name

   
     
     
