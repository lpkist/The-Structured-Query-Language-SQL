SELECT * -- every columns
    FROM employees;

SELECT employeeid, lastnames, firstName
    FROM employees;

SELECT lastname, firstname, hiredate, current_date, -- today's date
        date_part('month', hiredate) -- select the month from hiredate
    FROM employees;

SELECT orderid, unitprice, quantity, unitprice * quantity
    FROM orderdetails;

SELECT orderid, unitprice, quantity, 
        unitprice * quantity AS TOTAL
    FROM orderdetails;

SELECT orderid, unitprice, quantity, 
        unitprice * quantity AS "Total Value"
    FROM orderdetails;    
 
 SELECT lastname, firstname,
        to_char(hiredate, 'month') -- converts the month to character
    FROM employees;

-- Concatenate character columns
SELECT CONCAT(firstname, ' ', lastname) AS "Name"
    FROM employees;

SELECT firstname || ' ' || lastname AS "Name"
    FROM employees;