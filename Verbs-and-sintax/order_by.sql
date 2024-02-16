-- DISTINCT and COUNT 1
SELECT COUNT(*)  -- count() counts rows or non null values within a column in the answer ser
    FROM customers;

SELECT COUNT(country)
    FROM customers;

SELECT DISTINCT country
    FROM customers;

SELECT COUNT(DISTINCT country)
    FROM customers;

-- ORDER BY
SELECT productname, unitprice
    FROM products
ORDER BY productname; -- default: ascending order

SELECT productname, unitprice
    FROM products
ORDER BY unitprice DESC; -- descending order

SELECT productname, unitprice
    FROM products
ORDER BY 2 DESC; -- order by the 2nd column

-- LIMIT
SELECT productname, unitprice
    FROM products
ORDER BY 2 DESC LIMIT 5;
