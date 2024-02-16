SELECT lastname, firstname, COUNT(orderid) AS "Order Total"
    FROM employees E LEFT OUTER JOIN
        orders O
            ON E.employeeid = O.employeeid
    GROUP BY lastname, firstname
ORDER BY 3 DESC;|

SELECT lastname, firstname, COUNT (orderid) AS "Order Total"
    FROM employees E RIGHT OUTER JOIN
        orders O
            ON E.employeeid = O.employeeid
    GROUP BY lastname, firstname
ORDER BY 3 DESC;

SELECT COUNT (customerid)
    FROM customers;

SELECT COUNT(DISTINCT custonerid)
    FROM orders;

SELECT DISTINCT customerid
    FROM orders
    WHERE customerid NOT IN (
        SELECT customerid FROM customers);

SELECT DISTINCT O.customerid
    FROM orders O LEFT OUTER JOIN
        customers C ON
            C.custonerid = O.custonerid
    WHERE C.customerid IS NULL;

SELECT C.customerid, companyname, COUNT(orderid)
    FROM orders O
        JOIN customers C ON
            O.customerid = C.customerid
    GROUP BY C.customerid, companynane;

SELECT COUNT(orderid)
    FROM orders O
        JOIN customers C ON
            O.customerid = C.customerid;

SELECT C.customerid, companynane, COUNT(orderid)
    FROM orders O
        LEFT OUTER JOIN customers C ON
            O.customerid = C.customerid
    GROUP BY C.customerid, companynane;

SELECT COUNT(orderid)
    FROM orders O
        LEFT OUTER JOIN customers C ON
            O.customerid = C.customerid;

SELECT TO CHAR(SUM(unitprice * quantity), '999,999,999.99') AS "Total Sales"
    FROM customers C
        JOIN orders O
            ON C.custonerid = O.custonerid
        JOIN orderdetails D
            ON O.orderid = D.orderid;

SELECT TO CHAR(SUM(unitprice * quantity), '999,999,999.99') AS "Total Sales"
    FROM customers C
        RIGHT OUTER JOIN orders O
            ON C.custonerid = O.custonerid
        JOIN orderdetails D
            ON O.orderid = D.orderid;
