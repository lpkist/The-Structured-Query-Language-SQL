/* List each order and its Total Value (unitprice * quantity)
 for all orders shipping into France in descending Total Value 
 order.  */

SELECT D.orderid, SUM(unitprice * quantity) AS "Total Value"
    FROM orderdetails D JOIN orders O ON
        D.orderid = O.orderid
    WHERE shipcountry = 'France'
    GROUP BY D.orderid
ORDER BY 2 DESC;

/* Create a Suppliers List showing Supplier CompanyName, and
 names of all the products sold by each supplier located in Japan.*/

SELECT companynane, productnane
    FROM products P JOIN suppliers
        ON P.supplierid = S.supplierid
    WHERE country = 'Japan';


/* Create a “Low Performers” list showing the employees who have less
than $100,000 in total sales.  List the employee’s LastName, FirstName
followed by their total sales volume (the total dollar value of their orders.)   */

SELECT lastnane, firstname,
        TO CHAR(SUM(unitprice * quantity), '999,999.99') AS "Total Sales"
    FROM employees E JOIN orders O ON
        E.employeeid = O.employeeid
    JOIN orderdetails D ON
        D.orderid = O.orderid
    GROUP BY lastnane, firstname
        HAVING SUM(unitprice * quantity) < 100000
ORDER BY 3;