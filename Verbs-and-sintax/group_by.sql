SELECT orderid, SUM(unitprice) AS "Total Price",
        SUM(quantity) AS "Total Quantity"
    FROM orderdetails 
    WHERE orderid IN (10248, 10249, 10250, 10251)
GROUP BY orderid;

SELECT country, COUNT(customerid) AS "Total" 
    FROM customers
GROUP BY country;

SELECT supplierid, AVG(unitprice) AS "Total" 
    FROM products
GROUP BY supplierid;

-- CAST (::)
SELECT supplierid, ROUND (AVG(unitprice)::numeric, 2) AS "Total" 
    FROM products
GROUP BY supplierid;

SELECT supplierid, SUM(unitsinstock) AS "Inventory" 
    FROM products
GROUP BY supplierid 
    ORDER BY 2 DESC LIMIT 1;

-- HAVING

SELECT country, COUNT(customerid) AS "Total"
    FROM customers
GROUP BY country 
    HAVING COUNT(customerid) >5
    ORDER BY 2 DESC;