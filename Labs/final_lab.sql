-- 1
SELECT DISTINCT city
    FROM offices
    WHERE officecode IS NOT NULL
ORDER BY 1;

-- 2
SELECT employeenumber, lastname, firstname, extension
    FROM employees E
        JOIN offices O ON
            E.officecode = O.officecode
    WHERE city = "Paris";

-- 3
SELECT productcode, productname, productvendor,
        quantityinstock, productline
    FROM products
    WHERE quantityinstock BETWEEN 200 AND 1200;

-- 4
SELECT productcode, productname, productvendor,
        buyprice, msrp
    FROM products
    WHERE msrp = (SELECT MIN(msrp) FROM products);

-- 5.

SELECT productname, (msrp - buyprice) AS "Profit"
    FROM procucts
ORDER BY 2 DESC LIMIT 1;

-- 6.
SELECT DISTINCT country, COUNT(DISTINCT customername) AS "Customers"
    FROM customers
    GROUP BY country
    HAVING COUNT(DISTINCT customername) = 2
ORDER BY 1;

-- 7
SELECT P.productcode, productname, COUNT(DISTINCT ordernumber)
    FROM products P
        JOIN orderdetails O ON
            P.productcode = D.productcode
    GROUP BY P.productcode, productname
        HAVING COUNT(DISTINCT ordernumber) = 25;

--8.
SELECT employeenumber,
        CONCAT (firstname, ' ', lastname) AS "Name"
    FROM employees
    WHERE reportsto IN (
        SELECT employeenumber FROM employees
            WHERE (firstname = 'Diane' AND lastname = 'Murphy')
                OR
                    firstname = 'Gerard' AND lastname = 'Bondur'
    );

-- 9
SELECT employeenumber, lastname, firstname
    FROM employees
    WHERE reportsto IS NULL;

-- 10.
SELECT productname
    FROM products
    WHERE productine = 'Classic Cars' AND
        productname LIKE "195%"
ORDER BY productname;

-- 11
SELECT TO_CHAR(orderdate, 'month'),
        COUNT(DISTINCT D.ordernumber) AS "Orders"
    FROM orders O
        JOIN orderdetails D
            ON O.ordernumber = D.ordernumber
        JOIN products P
            ON D.productcode = P.productcode
    WHERE DATE_PART('year', orderdate) = 2004
    GROUP BY TO_CHAR(orderdate, 'month')
ORDER BY 2 DESC LIMIT 1;

-- 12
SELECT firstname, lastname
    FROM employees
        LEFT OUTER JOIN customers
            ON salesrepemployeenumber = employeenumber
    WHERE jobtitle = "Sales Rep" AND
        customername IS NULL;

-- 13,
SELECT customername
    FROM customers C
        LEFT OUTER JOIN orders O
            ON C.customernumber = O.customernumber
    WHERE country = 'Switzerland'
        AND ordernumber IS NULL;
-- 14
SELECT customername, SUM(quantityordered) AS "Total Quantity"
    FROM customers C
        JOIN orders O
            ON C.customernumber = O.customernumber
        JOIN orderdetails D
            ON O.ordernumber = D.ordernumber
    GROUP BY customername.
        HAVING SUM(quantityordered) > 1650;
-- DML/DDL
-- 1
CREATE TABLE "topcustomers"
(
    customernumber   INT    NOT NULL,
    contactdate      DATE   NOT NULL,
    ordertotal       REAL   NOT NULL,
    CONSTRAINT PKTopCustomers PRIMARY KEY (customernumber)
);

-- 2
INSERT INTO topcustomers
    (SELECT C. customernumber, CURRENT_DATE,
        SUM(priceeach * quantityordered)::real
        FROM customers C, orders O, orderdetails D
        WHERE C.customernumber = O.customernumber
            AND O.ordernumber = D.ordernumber
        GROUP BY C.customernumber, CURRENT_DATE
            HAVING SUM(priceeach + quantityordered) > 140000
    );

-- 3
SELECT *
    FROM topcustomers.
ORDER BY ordertotal DESC;

-- 4
ALTER TABLE topcustomers
    ADD COLUMN ordercount INT;

-- 5.
UPDATE topcustomers
    SET ordercount = RANDONM()*10;
 
-- 6.
SELECT *
    FROM topcustomers
ORDER BY 4 DESC;

-- 7.
DROP TABLE topcustomers;
