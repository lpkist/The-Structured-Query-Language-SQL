SELECT productid, productname, unitprice 
    FROM products
    WHERE unitprice = ( 
        SELECT MAX(unitprice) 
            FROM products );

SELECT customerid, orderid
    FROM orders
    WHERE orderid IN ( 
        SELECT orderid 
            FROM orderdetails
             WHERE quantity > 100)
ORDER BY customerid;

SELECT productname, (
        SELECT SUM(unitprice * quantity)
            FROM orderdetails
            WHERE orderdetails.productid = 
            products.productid) AS "Total"
    FROM products;

SELECT orderid 
    FROM (  
        SELECT orderid, SUM(quantity) 
            FROM orderdetails 
            GROUP BY orderid 
                HAVING SUM(quantity) < 100)
                 AS detailcount;

-- correlated subquery

SELECT O.employeeid, orderid, shipcity, customerid
    FROM orders O
    WHERE employeeid IN
        (SELECT employeeid 
            FROM employees E -- temporary alias for the table name 
            WHERE E.city = O.shipcity);