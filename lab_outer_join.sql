-- Are there any Northwinds employees that have no orders?  

SELECT COUNT(DISTINCT E.employeeid)
    FROM employees E LEFT OUTER JOIN orders O
        ON E.employeeia = O.employeeid
    WHERE orderid IS NULL;

-- Are there any Northwinds customers that have no orders?  

SELECT COUNT(DISTINCT C.customerid)
    FROM customers C LEFT OUTER JOIN orders O ON
        C.customerid = O.customerid
    WHERE orderid IS NULL;

-- Are there any Northwinds orders that have bad (not on file) customer numbers? 

SELECT COUNT(orderid)
    FROM orders O LEFT OUTER JOIN customers C ON
        O.customerid = C.customerid
    WHERE city IS NULL;

-- Are there any Shippers that have shipped no Northwinds orders? 

SELECT COUNT(companyname)
    FROM shippers S LEFT OUTER JOIN orders O ON
        S.shipperid = O.shipvia
    WHERE orderid IS NULL;