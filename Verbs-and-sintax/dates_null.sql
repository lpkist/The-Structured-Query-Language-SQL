-- DATES

SELECT NOW(); -- current date and time as timestamp with timezone

SELECT lastname, firstname, birthdate, hiredate 
    FROM employees;

SELECT employeeid, lastname, firstname, AGE (hiredate, birthdate) AS hire_age -- difference of time
    FROM employees; 

SELECT lastname, firstname, AGE(current_date, hiredate)::text -- show as text value 
    FROM employees;

SELECT employeeid, lastname, firstname, EXTRACT(YEAR FROM hiredate)
    FROM employees;

SELECT employeeid, lastname, firstname, DATE_PART('year', hiredate) 
    FROM employees;

SELECT TO_DATE('20221231', 'YYYYMMDD');

-- Nulls

SELECT productid, productname, discontinued 
    FROM products 
    WHERE discontinued = '0';

UPDATE products
        SET discontinued = NULL 
        WHERE discontinued = '0';

SELECT productid, productname, discontinued 
    FROM products 
    WHERE discontinued IS NULL;

SELECT productid, productname, discontinued 
    FROM products 
    WHERE discontinued IS NOT NULL;

UPDATE products
        SET discontinued = '0' 
        WHERE discontinued = NULL;