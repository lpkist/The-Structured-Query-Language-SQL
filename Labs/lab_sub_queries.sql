/* List the productid, productname, unitprice of the lowest
 priced product Northwinds sells. */

SELECT productID, productname, unitprice 
    FROM products 
    WHERE UnitPrice = ( 
		SELECT MIN(UnitPrice)  
		    FROM products ); 
/* How many orders in the orders table have a bad customerID
 (either missing or not on file in the customers table.) */

SELECT count(orderid) 
    FROM orders 
    WHERE customerid NOT IN ( 
		SELECT customerID FROM customers); 

-- Use a subquery in a SELECT to list something interesting.  

SELECT firstname,
    SELECT(COUNT(orderid)
        FROM orders O
        WHERE E.employeeid = O.employeeid
    )
    FROM employees E;

-- Use a subquery in a FROM to list something interesting. 

SELECT productid
    FROM (SELECT productid, SUM(unitprice * quantity)
            FROM orderdetails
            GROUP BY productid
         ORDER BY 2 DESC LIMIT 5
    ) A;