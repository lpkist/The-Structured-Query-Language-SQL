SELECT customerid, contactname, country
    FROM customers;

SELECT customerid, contactname, country
    FROM customers
        WHERE country = 'Brazil';

SELECT customerid, contactname, country
    FROM customers
    WHERE country <> 'Brazil';

SELECT customerid, contactname, country
    FROM customers
    WHERE country <> 'Brazil'; -- country is not Brazil

SELECT customerid, contactname, country 
    FROM customers
    WHERE country != 'Brazil'; -- country is not Brazil

SELECT customerid, contactname, country
    FROM customers
    WHERE NOT country = 'Brazil'; -- country is not Brazil

SELECT productid, productname, unitprice
    FROM products 
    WHERE unitprice > 60;

-- LIKE
SELECT customerid, contactname, country
    FROM customers
    WHERE contactname LIKE 'M%'; -- name starts with

SELECT customerid, contactname, country
    FROM customers
    WHERE contactname LIKE '%m%'; -- there is an 'm' in the name

SELECT customerid, contactname, country
    FROM customers
    WHERE contactname LIKE '%A%'; -- there is an 'A' in the name

SELECT customerid, contactname, country
    FROM customers
    WHERE contactname LIKE '_a%'; -- the second letters is an 'a'

-- IN
SELECT productid, productname, unitprice, supplierid
    FROM products
    WHERE supplierid IN (2,4,6,8);

SELECT supplierid, companyname, region
    FROM suppliers
    WHERE region IN ('LA', 'MI, OR');

-- BETWEEN is inclusive
SELECT productid, productname, unitprice
    FROM products
    WHERE unitprice BETWEEN 20 AND 30;

SELECT lastname, firstname
    FROM employees
    WHERE lastname BETWEEN 'A' AND 'M';

SELECT productname, supplierid, categoryid,
        unitprice, unitsinstock
    FROM products
    WHERE supplierid = 1 AND categoryid = 2 OR
        categoryid = 3 AND unitprice > 20 OR
        unitsinstock < 12;

SELECT productname, supplierid, categoryid,
        unitprice, unitsinstock
    FROM products
    WHERE supplierid = 1 AND (categoryid = 2 OR
        categoryid = 3 AND unitprice > 20) OR
        unitsinstock < 12;
