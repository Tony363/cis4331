--Wk2
--In Class Practice for Murach-Ch3

--Covered topics:
----WHERE, ORDER BY clauses
----Basic comparison, logical operators
----ROWNUM, ||, column alias
----LIKE, wildcard characters
----Dual table, scalar function

--Run the statements using user AP unless otherwise indicated.

--1.
--print names, dept numbers of employees supervised by manager with id 7839
--  in the increasing order of employee names

SELECT ename, deptno
FROM   emp
WHERE  mgr = 7839
ORDER BY  ename;

--2.
--For the above query, limit the query result to be at most 2 rows

SELECT ename, deptno
FROM   emp
WHERE  mgr = 7839 and ROWNUM < 3
ORDER BY  ename ;

--3.
--print all employees' work information and 
--display the heading of the query result to be Work Info
--Sample Output:
---- Work Info
---- KING works in Dept 10
---- BLAKE works in Dept 30

SELECT ename || ' works in Dept ' || deptno AS  "Work Info"
FROM  emp;

--4.
--use the tables in user EX
--print the first names, last names of customers whose first name start with Jo
SELECT CUSTOMER_FIRST_NAME, CUSTOMER_LAST_NAME
from CUSTOMERS_EX
where CUSTOMER_FIRST_NAME like 'Jo%'
order by CUSTOMER_FIRST_NAME;


--5.
--car loan: 
-- Simplified and do not consider compound interest
-- loan amount: $20000,  loan interest rate: 6%, 
-- Print the car loan principal amount, total interest amount, 
--      the total amount you would pay after the principal is paid off,
--      and the current date in the default date format.
-- Display the headings of query result like this:
-- Principal    Interest Amount      Total Payment    Today
--   20000        1200                 21200          29-JAN-19

SELECT 20000 AS "Principal",
    20000 * 0.06 AS "Interest Amount", 
    20000 * 1.06 AS "Total Payment", 
    SYSDATE AS "Today"
FROM DUAL;


--6. 
-- Print the date and time when the query is executed.
-- Print the date and time in the format below ( time in 24 hour notation)
-- Display the heading for the query result as System Date
---Sample Output
-----System Date
-----28-jan-2020 13:46:05
--FORMAT(CURRENT_TIMESTAMP, 'yyyy-MM-dd hh:mm:ss tt')
-- ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY HH24:MI:SS';
select TO_CHAR(SYSDATE,'DD-mon-YYYY hh12:mm:ss') AS "System Date"
from DUAL;



-- PAY ATTENTION TO NULLs!!!
select comm, NVL(comm,0),NVL(TO_CHAR(MGR),'NO MGR')
from emp;